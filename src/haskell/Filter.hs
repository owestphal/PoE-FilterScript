module Filter (
  Filter,
  Rule,
  BlockType (..),
  makeFilter,
  rule
  ) where

import Category
import Style

type Rule = (BlockType, Category, Style)

data BlockType = Show | Hide
    deriving Show

data Filter = Filter String

instance Show Filter where
  show (Filter s) = s

emptyFilter = Filter ""

rule :: BlockType -> Category -> Style -> Rule
rule = (,,)

makeFilter :: [Rule] -> Filter
makeFilter xs = foldl chainFilter emptyFilter (map implementRule xs)

implementRule :: Rule -> Filter
implementRule (t, c, s) = Filter $ concat $
                        zipWith3
                        (\header xs ys -> header ++ xs ++ ys)
                        (repeat blockHeader)
                        (implementCategory c)
                        (repeat $ implementStyle s ++ newline )
    where blockHeader = show t ++ newline

chainFilter :: Filter -> Filter -> Filter
chainFilter (Filter x) (Filter y) = Filter $ x ++ y

newline = "\n"
