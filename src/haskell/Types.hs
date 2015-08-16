module Types where

import           EmbeddedLootLanguage (BlockType, Category, Style)

-- abstract Syntax Tree

type CatName = String
type StyleName = String

type Source = String

newtype AST = AST [Expr]

data Expr = ImportExpr FilePath AST
          | CatExpr CatName IntCat
          | StyleExpr StyleName IntStyle
          | RuleExpr BlockType CatName StyleName

-- intermnameiate representations

data IntCat = IdCat CatName | PropCat Category | OpCat Op IntCat IntCat

data Op = Or | And
        deriving (Eq, Show)

data IntStyle = IdStyle StyleName | PropStyle Style | CombStyle IntStyle IntStyle

-- Show instances
instance Show AST where
    show (AST xs) = "AST: \n\n" ++ unlines (map show xs)

instance Show Expr where
    show (CatExpr name x) = pPrint ["Set", name, "=", indentBelowLine 1 (show x) (length name + 8)]
    show (StyleExpr name x) = pPrint ["Style", name, "=", show x, "\n"]
    show (RuleExpr t x y) = pPrint [show t, x, y,"\n"]
    show (ImportExpr x _) = pPrint ["Import", show x ,"\n"]

instance Show IntStyle where
    show (IdStyle name) = name
    show (PropStyle x) = show x
    show (CombStyle x y) = pPrint [show x, "+", show y]

instance Show IntCat where
    show = showCat

showCat :: IntCat -> String
showCat (IdCat name) = name
showCat (PropCat x) = show x
showCat (OpCat op x y) = combineShows (show op) (showCat x) (showCat y)

combineShows :: String -> String -> String -> String
combineShows op xs ys = unlines $
    [topFront ++ x']
    ++ [midFront ++ x | x <- xs']
    ++ [botFront ++ y']
    ++ [restFront ++ y | y <- ys']
    where (x':xs') = lines xs
          (y':ys') = lines ys
          topFront = op ++ "--"
          midFront =      "|  " ++ blanks
          botFront =      "|--"
          restFront =     "   "
          blanks = map (const ' ') [1..length op]

-- pretty print a list of strings
pPrint :: [String] -> String
pPrint (x:xs) = concat $ x:map (' ':) xs
pPrint _ = ""

-- indent a block of text
indent :: String -> Int -> String
indent = indentBelowLine 0

indentBelowLine :: Int -> String -> Int -> String
indentBelowLine i xs n = unlines $
    take i (lines xs)
    ++ [ blanks ++ xss | xss <- drop i $ lines xs]
    where blanks = map (const ' ') [1..n]
