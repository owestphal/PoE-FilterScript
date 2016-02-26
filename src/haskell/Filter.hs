module Filter (
  Filter,
  Rule,
  SimpleRule,
  BlockType (..),
  makeFilter,
  rule,
  globalRule
  ) where

import           BasicCategories
import           Category
import           Style
data Rule = Simple SimpleRule
          | Global [(Category, Style)] [Rule]

type SimpleRule = (BlockType, Category, Style)

data BlockType = Show | Hide
  deriving (Show, Eq)

data Filter = Filter String

instance Show Filter where
  show (Filter s) = s

emptyFilter = Filter ""

rule :: BlockType -> Category -> Style -> Rule
rule t c s = Simple (t, c, s)

globalRule :: [(Category, Style)] -> [Rule] -> Rule
globalRule = Global

toSimples :: [Rule] -> [SimpleRule]
toSimples = concatMap toSimple

-- TODO: test nesting behaviour
toSimple :: Rule -> [SimpleRule]
toSimple (Simple r) = [r]
toSimple (Global gRs rs) = addGlobalContext <$> toSimples rs <*> gRs ++ [(everything,defaultStyle)]
                                                                    --  ^- this is to keep the unchanged rule
  where addGlobalContext :: SimpleRule -> (Category, Style) -> SimpleRule
        addGlobalContext (t,c,s) (gC,gS) = (t,c `intersect` gC, s <+ gS)

makeFilter :: [Rule] -> Filter
makeFilter xs = foldl chainFilter emptyFilter (map implementRule (toSimples xs))

implementRule :: SimpleRule -> Filter
implementRule (t, c, s) = let blockHeader = show t ++ newline
                          in Filter $ concat $
                                      zipWith3
                                      (\header xs ys -> header ++ xs ++ ys)
                                      (repeat blockHeader)
                                      (implementCategory (optimize c))
                                      (repeat $ implementStyle s ++ newline)

chainFilter :: Filter -> Filter -> Filter
chainFilter (Filter x) (Filter y) = Filter $ x ++ y

newline = "\n"

-- examples
simples = [rule Show (boots `union` helmets) (borderColor (0,0,0,0)), rule Show rings defaultStyle]
global = globalRule [(baseType "Coral",borderColor (255,0,0,0)),(currency, alertSound (9, 100))] simples
