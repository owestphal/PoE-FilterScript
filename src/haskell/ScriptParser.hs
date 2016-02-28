module ScriptParser (
  parseSource,
  preProcessor
  ) where

import           Data.Either                   (lefts, rights)
import           Data.List                     (isPrefixOf)

import           Text.Parsec.Expr
import           Text.Parsec.Language          (emptyDef)
import qualified Text.Parsec.Token             as P
import           Text.ParserCombinators.Parsec

import           Control.Monad                 (liftM)

import           EmbeddedLootLanguage
import           Types

parseSource :: SourceName-> Source -> Either ParseError AST
parseSource = parse sourceFile

-- ------------
-- preproccesor
-- ------------
-- the preproccesor includes imported files
-- so that the parser can read them

preProcessor :: Source -> IO (Either String Source)
preProcessor xs = do
    ys <- mapM includeImport $ lines xs -- ys :: [Either ParseError Source]
    return $ case lefts ys of
               [] -> Right $ unlines $ rights ys
               (x:_) -> Left $ show x

includeImport :: String -> IO (Either String Source)
includeImport xs | "Import" `isPrefixOf` xs && (not.null) ys = replaceImport path
                 |  otherwise = return $ Right xs
    where (_:ys) = words xs
          (y:_) = ys
          path = filter (/= '\"') y

replaceImport :: FilePath -> IO (Either String Source)
replaceImport path = do
    source <- readFile path
    ppSource <- preProcessor source
    return $ either
             (Left . show)
             (Right . addHeader . removeNewlines)
             $ checkSource path ppSource
    where addHeader xs = "Import " ++ pathLiteral
                         ++ xs
                         ++ " EndImport " ++ pathLiteral
          pathLiteral = "\"" ++ path ++ "\" "

removeNewlines :: String -> String
removeNewlines = filter (not.isLfOrCr) . seperateLines
    where isLfOrCr x =  x == '\n' || x == '\r'
          seperateLines = tail.tail.unlines.map (" ;"++).lines

checkSource :: SourceName -> Either String Source -> Either String Source
checkSource _ (Left x) = Left x
checkSource path (Right source) = either
                                  (Left . show)
                                  Right
                                  $ parse (sourceFile >> return source) path source

-- ------
-- parser
-- ------

sourceFile :: Parser AST --[Expr]
sourceFile = do
    whiteSpace
    xs <- many expr
    eof
    return $ AST xs

expr :: Parser Expr
expr = try (liftM Def def)
    <|> generalRuleExpr

def = try importExpr
    <|> try setExpr
    <|> styleExpr

-- imports
importExpr = do
    reserved "Import"
    path <- stringLiteral
    exprs <- expr `sepBy` semi
    reserved "EndImport"
    _ <- symbol $ "\"" ++ path ++ "\""
    return $ ImportExpr path $ AST exprs

-- categories
setExpr = do
    reserved "Set"
    name <- identifier
    operator "="
    d <- setDef
    return $ CatExpr name d

setDef :: Parser IntCat
setDef = lexeme $ buildExpressionParser opTable (parens setDef <|> propCat <|> idCat)

opTable = [[Infix intersectOp AssocLeft]
          ,[Infix unionOp AssocLeft]]

unionOp = do
    operator "+"
    return (OpCat Or)

intersectOp = do
    operator "&"
    return (OpCat And)

idCat = do
  name <- identifier
  return $ IdCat name

propCat = do
  x <- lexeme $ choice catParsers
  return $ PropCat x
  where catParsers = [ keywordParameterConstructor "ItemLevel"      ordInt (uncurry itemLevel),
                       keywordParameterConstructor "DropLevel"      ordInt (uncurry dropLevel),
                       keywordParameterConstructor "Quality"        ordInt (uncurry quality),
                       keywordParameterConstructor "Sockets"        ordInt (uncurry sockets),
                       keywordParameterConstructor "LinkedSockets"  ordInt (uncurry linkedSockets),
                       keywordParameterConstructor "SocketGroup"    colorList socketGroup,
                       keywordParameterConstructor "Rarity"         ordRar (uncurry rarity),
                       keywordParameterConstructor "ItemClass"      iClass itemClass,
                       keywordParameterConstructor "BaseType"       (try $ many stringLiteral) baseTypes,
                       keywordParameterConstructor "Width"          ordInt (uncurry width),
                       keywordParameterConstructor "Heigth"         ordInt (uncurry height)]

-- styles
styleExpr = do
    reserved "Style"
    name <- identifier
    operator "="
    d <- styleDef
    return $ StyleExpr name d

styleDef = lexeme $ buildExpressionParser table (propStyle <|> idStyle)
    where table = [[Infix (operator "+" >> return CombStyle) AssocLeft]]

idStyle = do
    name <- identifier
    return $ IdStyle name

propStyle = do
    x <- lexeme $ choice styleParsers
    return $ PropStyle x
    where styleParsers = [ keywordParameterConstructor "BackgroundColor"    rgbaColor backgroundColor
                         , keywordParameterConstructor "BorderColor"        rgbaColor borderColor
                         , keywordParameterConstructor "TextColor"          rgbaColor textColor
                         , keywordParameterConstructor "FontSize"           int fontSize
                         , keywordParameterConstructor "AlertSound"         soundParam alertSound ]

-- rules
generalRuleExpr = liftM GeneralRuleExpr ruleExpr

ruleExpr :: Parser RuleExpr
ruleExpr = try globalRuleExpr
          <|> simpleRuleExpr

globalRuleExpr = do
  reserved "Global"
  globalRules <- many1 idPair
  rules <- braces (many ruleExpr)
  return $ GlobalRuleExpr globalRules rules

simpleRuleExpr = do
    block <- blockType
    (setId,styleId) <- idPair
    return $ SimpleRuleExpr block setId styleId

idPair = do
  id1 <- identifier
  id2 <- identifier
  return (id1,id2)

blockType = header "Show"
    <|> header "Hide"

header xs = do
    reserved xs
    return $ case xs of
                "Show" -> Show
                "Hide" -> Hide
                _ -> undefined

-- parameters
keywordParameterConstructor :: String -> Parser a -> (a -> b) -> Parser b
keywordParameterConstructor keyword parameters g = do
  reserved keyword
  p <- lexeme parameters
  return $ g p

ordInt :: Parser (Ordering, Int)
ordInt = do
    op <- ord
    i <- int
    return $ case op of
        "<"  -> (LT,i)
        "<=" -> (LT,i+1)
        "="  -> (EQ,i)
        ">=" -> (GT,i-1)
        ">"  -> (GT,i)
        _ -> undefined

color :: String -> SocketColor -> Parser SocketColor
color x c = do
  _ <- symbol x
  return c

colors :: [Parser SocketColor]
colors = zipWith color ["R","G","B","W"] [Red,Green,Blue,White]

colorList = do
  xs <- many1 $ choice colors
  return $ ColorList xs

ordRar = do
    op <- ord
    x <- choice $ map symbol ["Normal", "Magic", "Rare", "Unique"]
    let rar = read x
        in return $ case op of
            "<"  -> (LT,pred rar)
            "<=" -> (LT,rar)
            "="  -> (EQ,rar)
            ">=" -> (GT,succ rar)
            ">"  -> (GT,rar)
            _ -> undefined

iClass  = do
  x <- choice $ map (symbol.show) [ActiveSkillGems .. Wands]
  return $ read x

rgbaColor :: Parser (Int,Int,Int,Int)
rgbaColor = do
    (r:g:b:t) <- try (count 4 int)
             <|> try (count 3 int)
             <?> "RGB or RGBA color"
    let a = if null t then defaultAlpha else head t
        in return (r,g,b,a)

soundParam :: Parser (Int,Int)
soundParam = do
    (i:v) <- try (count 2 int) <|> try (count 1 int)
    let volume = if null v then defaultVol else head v
        in return (i,volume)

ord :: Parser String
ord = choice $ map (try.symbol) ["<=",">=",">","<","="]

int = do
 n <- natural
 return $ fromInteger n

defaultAlpha = 255
defaultVol = 100
-- -----
-- lexer
-- -----
lexer = P.makeTokenParser languageDef

identifier = P.identifier lexer
operator = P.reservedOp lexer
reserved = P.reserved lexer

stringLiteral = P.stringLiteral lexer
natural = P.natural lexer
symbol = P.symbol lexer

parens = P.parens lexer
braces = P.braces lexer
semi = P.semi lexer
whiteSpace = P.whiteSpace lexer

lexeme = P.lexeme lexer

-- -------------------
-- language definition
-- -------------------
languageDef :: P.LanguageDef ()
languageDef = emptyDef
                    { P.commentLine = "#"
                    , P.identStart = letter
                    , P.identLetter = alphaNum <|> char '_'
                    , P.reservedNames = keywords
                    , P.reservedOpNames = ["+","&","=","<","<=",">=",">"]
                    , P.caseSensitive = True
                    }

keywords = ["Import"
           ,"EndImport"
           ,"Set"
           ,"Style"
           ,"Show"
           ,"Hide"
           ,"Global"
           ,"ItemLevel"
           ,"DropLevel"
           ,"Quality"
           ,"Sockets"
           ,"LinkedSockets"
           ,"SocketGroup"
           ,"Rarity"
           ,"ItemClass"
           ,"BaseType"
           ,"BackgroundColor"
           ,"BorderColor"
           ,"TextColor"
           ,"FontSize"
           ,"AlertSound"]
