module Category (
  Category,
  union,
  unionAll,
  intersect,
  implementCategory,
  --
  RarityLevel (..),
  SocketColor (..),
  ColorList (..),
  ItemClass (..),
  --
  nothing,
  everything,
  itemLevel,
  dropLevel,
  quality,
  rarity,
  itemClass,
  baseType,
  sockets,
  linkedSockets,
  socketGroup,
  width,
  height
  ) where

import           Text.ParserCombinators.ReadP as ReadP
import           Text.Read                    as Read

-- primitive categories
data PrimCat = ItemLevel Ordering Int
             | DropLevel Ordering Int
             | Quality Ordering Int
             | Rarity Ordering RarityLevel
             | Class ItemClass
             | BaseType String
             | Sockets Ordering Int
             | LinkedSockets Ordering Int
             | SocketGroup ColorList
             | Height Ordering Int
             | Width Ordering Int
             deriving (Eq, Show)

-- TODO: check for valid values

data RarityLevel = Normal | Magic | Rare | Unique
                 deriving (Eq,Show,Read,Enum)



data SocketColor = Red | Green | Blue | White
                 deriving (Eq,Enum)

instance Show SocketColor where
  show Red = "R"
  show Green = "G"
  show Blue = "B"
  show White = "W"

newtype ColorList = ColorList [SocketColor]
                  deriving Eq

instance Show ColorList where
  show (ColorList xs) = concatMap show xs

data ItemClass = ActiveSkillGems
               | Amulets
               | Belts
               | BodyArmour
               | Boots
               | Bows
               | Claws
               | Daggers
               | DivinationCard
               | FishingRods
               | Gloves
               | Helmets
               | HybridFlasks
               | Jewel
               | LifeFlasks
               | ManaFlasks
               | MapFragments
               | Maps
               | OneHandAxes
               | OneHandMaces
               | OneHandSwords
               | QuestItems
               | Quivers
               | Rings
               | Sceptres
               | Shields
               | StackableCurrency
               | Staves
               | SupportSkillGems
               | ThrustingOneHandSwords
               | TwoHandAxes
               | TwoHandMaces
               | TwoHandSwords
               | UtilityFlasks
               | Wands
               deriving (Eq, Enum)

instance Show ItemClass where
  show ActiveSkillGems = "Active Skill Gems"
  show Amulets = "Amulets"
  show Belts = "Belts"
  show BodyArmour = "Body Armour"
  show Boots = "Boots"
  show Bows = "Bows"
  show Claws = "Claws"
  show Daggers = "Daggers"
  show DivinationCard = "Divination Card"
  show FishingRods = "Fishing Rods"
  show Gloves = "Gloves"
  show Helmets = "Helmets"
  show HybridFlasks = "Hybrid Flasks"
  show Jewel = "Jewel"
  show LifeFlasks = "Life Flasks"
  show ManaFlasks = "Mana Flasks"
  show MapFragments = "Map Fragments"
  show Maps = "Maps"
  show OneHandAxes = "One Hand Axes"
  show OneHandMaces = "One Hand Maces"
  show OneHandSwords = "One Hand Sword"
  show QuestItems = "Quest Items"
  show Quivers = "Quivers"
  show Rings = "Rings"
  show Sceptres = "Sceptres"
  show Shields = "Shields"
  show StackableCurrency = "Currency"
  show Staves = "Staves"
  show SupportSkillGems = "Support Skill Gems"
  show ThrustingOneHandSwords = "Thrusting One Hand Swords"
  show TwoHandAxes = "Two Hand Axes"
  show TwoHandMaces = "Two Hand Maces"
  show TwoHandSwords = "Two Hand Swords"
  show UtilityFlasks = "Utility Flasks"
  show Wands = "Wands"

instance Read ItemClass where
  readPrec = Read.choice $ map (read'.show) [ActiveSkillGems .. Wands]

read' :: String -> ReadPrec ItemClass
read' x = lift $ do
  _ <- ReadP.string x
  return $ readItemClass x

readItemClass "Active Skill Gems" = ActiveSkillGems
readItemClass "Amulets" = Amulets
readItemClass "Belts" = Belts
readItemClass "Body Armour" = BodyArmour
readItemClass "Boots" = Boots
readItemClass "Bows" = Bows
readItemClass "Claws" = Claws
readItemClass "Daggers" = Daggers
readItemClass "Divination Card" = DivinationCard
readItemClass "Fishing Rods" = FishingRods
readItemClass "Gloves" = Gloves
readItemClass "Helmets" = Helmets
readItemClass "Hybrid Flasks" = HybridFlasks
readItemClass "Jewel" = Jewel
readItemClass "Life Flasks" = LifeFlasks
readItemClass "Mana Flasks" = ManaFlasks
readItemClass "Map Fragments" = MapFragments
readItemClass "Maps" = Maps
readItemClass "One Hand Axes" = OneHandAxes
readItemClass "One Hand Maces" = OneHandMaces
readItemClass "One Hand Sword" = OneHandSwords
readItemClass "Quest Items" = QuestItems
readItemClass "Quivers" = Quivers
readItemClass "Rings" = Rings
readItemClass "Sceptres" = Sceptres
readItemClass "Shields" = Shields
readItemClass "Currency" = StackableCurrency
readItemClass "Staves" = Staves
readItemClass "Support Skill Gems" = SupportSkillGems
readItemClass "Thrusting One Hand Swords" = ThrustingOneHandSwords
readItemClass "Two Hand Axes" = TwoHandAxes
readItemClass "Two Hand Maces" = TwoHandMaces
readItemClass "Two Hand Swords" = TwoHandSwords
readItemClass "Utility Flasks" = UtilityFlasks
readItemClass "Wands" = Wands
readItemClass _ = undefined

-- "real" categories
data Category = Empty | All | Category [[PrimCat]]
              deriving Show

conditions (Category xss) = xss
conditions _ = undefined

union :: Category -> Category -> Category
union Empty x = x
union x Empty = x
union All _ = All
union _ All = All
union x y = Category (conditions x ++ conditions y)

intersect :: Category -> Category -> Category
intersect Empty _ = Empty
intersect _ Empty = Empty
intersect All x = x
intersect x All = x
intersect x y = Category (conditions x `cross` conditions y)
  where xss `cross` yss = [ xs ++ ys | xs <- xss, ys <- yss]

-- utility
unionAll :: [Category] -> Category
unionAll = foldl union Empty

primitive p = Category [[p]]

-- generation functions
nothing = Empty
everything = All

itemLevel o n = primitive $ ItemLevel o n
dropLevel o n = primitive $ DropLevel o n
quality o n = primitive $ Quality o n
rarity o r = primitive $ Rarity o r
itemClass c = primitive $ Class c
baseType t = primitive $ BaseType t
sockets o n = primitive $ Sockets o n
linkedSockets o n = primitive $ LinkedSockets o n
socketGroup cs = primitive $ SocketGroup cs
height o n = primitive $ Height o n
width o n = primitive $ Width o n

-- create filter code for category
-- each list element goes into an extra Show-block
implementCategory :: Category -> [String]
implementCategory Empty = []
implementCategory All = [""]
implementCategory c = [ concatMap implementPrimCat xs | xs <- conditions c ]

implementPrimCat :: PrimCat -> String
implementPrimCat (ItemLevel ord n) = orderedParameter "ItemLevel" ord n
implementPrimCat (DropLevel ord n) = orderedParameter "DropLevel" ord n
implementPrimCat (Quality ord n) = orderedParameter "Quality" ord n
implementPrimCat (Rarity ord r) = orderedParameter "Rarity" ord r
implementPrimCat (Class c) = genericParameter "Class" (show c)
implementPrimCat (BaseType s) = genericParameter "BaseType" s
implementPrimCat (Sockets ord n) = orderedParameter "Sockets" ord n
implementPrimCat (LinkedSockets ord n) = orderedParameter "LinkedSockets" ord n
implementPrimCat (SocketGroup cs) = genericParameter "SocketGroup" cs
implementPrimCat (Height ord n) = orderedParameter "Height" ord n
implementPrimCat (Width ord n) = orderedParameter "Width" ord n

genericParameter :: Show a => String -> a -> String
genericParameter keyword arg = parameter keyword (show arg)

orderedParameter :: Show a => String -> Ordering -> a -> String
orderedParameter keyword ord arg = parameter keyword (comperator ord ++ show arg)

parameter :: String -> String -> String
parameter keyword arg = keyword ++ " " ++ arg ++ newline

comperator :: Ordering -> String
comperator LT = "< "
comperator EQ = " "
comperator GT = "> "

newline = "\n"
