module LootScriptLanguage (
  translateProgram,
  preProcessor
  ) where

import           Control.Monad.State
import           Control.Monad.Trans.Except

import           Data.Functor.Identity

import           Types

import           EmbeddedLootLanguage
import           ScriptParser

import           BuildInCategories

translateProgram :: FilePath -> String -> Either String Filter
translateProgram path s = evalLLM resultM minEnv
    where resultM = either
                    (throwE.show)
                    compile
                    (parseSource path s)

type CatDef = (CatName, IntCat)
type StyleDef = (StyleName, IntStyle)

type CatDefTable = [CatDef]
type StyleDefTable = [StyleDef]

type Env = (CatDefTable,StyleDefTable)

-- minimal enviroment whith build-in definitions
minEnv = (buildInCats, buildInStyles)
buildInStyles = [("defaultStyle",PropStyle defaultStyle)]

-- ---------------
-- code generation
-- ---------------

-- loot language monad
type LLM = ExceptT String (StateT Env Identity)

runLLM :: LLM a -> Env -> (Either String a, Env)
runLLM m s = runIdentity $ runStateT (runExceptT m) s

evalLLM :: LLM a -> Env -> Either String a
evalLLM m s = fst $ runLLM m s

execLLM :: LLM a -> Env -> Env
execLLM m s = snd $ runLLM m s

-- compilation
compile :: AST -> LLM Filter
compile ast = let (defs, rules) = partitionAST ast
              in liftM makeFilter $ indexDefs defs >> makeRules rules

-- seperate definitions from rules
partitionAST :: AST -> ([Definition],[RuleExpr])
partitionAST (AST es) = go es ([],[])
  where go [] (ds,rs) = (reverse ds, reverse rs)
        go (Def d : es') (ds,rs) = go es' (d:ds,rs)
        go (GeneralRuleExpr r : es') (ds,rs) = go es' (ds,r:rs)
-- add definitions to the enviroment
indexDefs :: [Definition] -> LLM ()
indexDefs = mapM_ addDef

addDef :: Definition -> LLM ()
addDef (ImportExpr _ ast) = indexDefs $ fst $ partitionAST ast
addDef (CatExpr name def) = addCatDef (name,def)
addDef (StyleExpr name def) = addStyleDef (name,def)

addCatDef :: CatDef -> LLM ()
addCatDef (name,def) = do
    (xs,ys) <- get
    case insertOrClash (name,def) xs of
        Just xs' -> put (xs',ys)
        Nothing -> nameClash name

addStyleDef :: StyleDef -> LLM ()
addStyleDef (name,def) = do
    (xs,ys) <- get
    case insertOrClash (name,def) ys of
        Just ys' -> put (xs,ys')
        Nothing -> nameClash name

nameClash name = throwE $ "duplicate name: " ++ name

-- evaluate enviroment
makeRules :: [RuleExpr] -> LLM [Rule]
makeRules = mapM makeRule

makeRule :: RuleExpr -> LLM Rule
makeRule (SimpleRuleExpr header x y) = do
    cat <- evalCat x
    st <- evalStyle y
    return $ rule header cat st
makeRule (GlobalRuleExpr grs rs) = do
  outerRules <- mapM evalPair grs
  innerRules <- makeRules rs
  return $ globalRule outerRules innerRules

evalPair :: (CatName,StyleName) -> LLM (Category,Style)
evalPair (catName,styleName) = do
  catDef <- evalCat catName
  styleDef <- evalStyle styleName
  return (catDef,styleDef)

evalCat :: CatName -> LLM Category
evalCat name = do
    (xs,_) <- get
    def <- lookupDef name xs
    evalCat' def
    where evalCat' :: IntCat -> LLM Category
          evalCat' (PropCat x) = return x
          evalCat' (IdCat x) = evalCat x
          evalCat' (OpCat op x y) = do
              c1 <- evalCat' x
              c2 <- evalCat' y
              return $ (if op == Or then union else intersect) c1 c2

evalStyle :: StyleName -> LLM Style
evalStyle name = do
    (_,xs) <- get
    def <- lookupDef name xs
    evalStyle' def
    where evalStyle' :: IntStyle -> LLM Style
          evalStyle' (PropStyle x) = return x
          evalStyle' (IdStyle x) = evalStyle x
          evalStyle' (CombStyle x y) = do
              s1 <- evalStyle' x
              s2 <- evalStyle' y
              return $ s1 <+ s2

lookupDef :: String -> [(String,a)] -> LLM a
lookupDef name xs = case lookup name xs of
                     Just x -> return x
                     Nothing -> throwE $ "identifier '" ++ name ++ "' does not exsist"
-- -----
-- utils
-- -----

-- insert a key-value pair into a list iff the key
-- is not yet present in the list
insertOrClash :: Eq a => (a,b) -> [(a,b)] -> Maybe [(a,b)]
insertOrClash (n,d) xs = if n `elem` map fst xs
                         then Nothing
                         else Just $ (n,d):xs
