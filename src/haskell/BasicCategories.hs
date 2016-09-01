{-# OPTIONS_GHC -Wno-missing-signatures #-}
module BasicCategories (
  module BasicCategories,
  module BaseTypeList
  ) where

import           BaseTypeList
import           Category

jewels = itemClass Jewel

divinationCards = itemClass DivinationCard

normals = rarity EQ Normal
nonNormals = rarity GT Normal
magics = rarity EQ Magic
rares = rarity EQ Rare
uniques = rarity EQ Unique
nonUniques = rarity LT Unique

gems = activeGems `union` supportGems
activeGems = itemClass ActiveSkillGems
skillGems = activeGems
supportGems = itemClass SupportSkillGems

weapons = unionAll [axes, bows, claws, daggers, maces, staves, swords, wands]
axes = oneHandAxes `union` twoHandAxes
oneHandAxes = itemClass OneHandAxes
twoHandAxes = itemClass TwoHandAxes
bows = itemClass Bows
claws = itemClass Claws
daggers = itemClass Daggers
maces = unionAll [oneHandMaces, sceptres, twoHandMaces]
oneHandMaces = itemClass OneHandMaces
sceptres = itemClass Sceptres
twoHandMaces = itemClass TwoHandMaces
staves = itemClass Staves
swords = unionAll [oneHandSwords, thrustingOneHandSwords, twoHandSwords]
oneHandSwords = itemClass OneHandSwords
thrustingOneHandSwords = itemClass ThrustingOneHandSwords
twoHandSwords = itemClass TwoHandSwords
wands = itemClass Wands

armour = unionAll [bodyArmour, boots, gloves, helmets, shields]
bodyArmour = itemClass BodyArmour
boots = itemClass Boots
gloves = itemClass Gloves
helmets = itemClass Helmets
shields = itemClass Shields

pureArmour = unionAll $ zipWith intersect [bodyArmour,boots,gloves,helmets,shields] $ map baseTypes pureArmourBases
pureEvasion = unionAll $ zipWith intersect [bodyArmour,boots,gloves,helmets,shields] $ map baseTypes pureEvasionBases
pureEnergyShield = unionAll $ zipWith intersect [bodyArmour,boots,gloves,helmets,shields] $ map baseTypes pureEnergyShieldBases
armourEvasion = unionAll $ zipWith intersect [bodyArmour,boots,gloves,helmets,shields] $ map baseTypes armourEvasionBases
armourEnergyShield  = unionAll $ zipWith intersect [bodyArmour,boots,gloves,helmets,shields] $ map baseTypes armourEnergyShieldBases
evasionEnergyShield = unionAll $ zipWith intersect [bodyArmour,boots,gloves,helmets,shields] $ map baseTypes evasionEnergyShieldBases

jewellery = unionAll [belts, rings, amulets]
belts = itemClass Belts
rings = itemClass Rings
amulets = itemClass Amulets
talismans = amulets `intersect` baseType "Talisman"

quivers = itemClass Quivers

flasks = unionAll [hybridFlasks, lifeFlasks, manaFlasks, utilityFlasks]
hybridFlasks = itemClass HybridFlasks
lifeFlasks = itemClass LifeFlasks
manaFlasks = itemClass ManaFlasks
utilityFlasks = itemClass UtilityFlasks

currency = itemClass StackableCurrency

fishingRods = itemClass FishingRods

questItems = itemClass QuestItems

threeSockets = sockets GT 3
fourSockets = sockets EQ 4
fiveSokets = sockets EQ 5
sixSockets = sockets EQ 6

twoLinks = linkedSockets EQ 2
threeLinks = linkedSockets EQ 3
fourLinks = linkedSockets EQ 4
fiveLinks = linkedSockets EQ 5
sixLinks = linkedSockets EQ 6

chromatics = socketGroup $ ColorList [Red, Green, Blue]

mirrors = baseType "Mirror of Kalandra"

maps = itemClass Maps
mapFragments = itemClass MapFragments

lowTierMaps = unionAll $ map (intersect maps . baseType) lowTierMapBases
lowTierShapedMaps = unionAll $ map (intersect maps . baseType) lowTierShapedBases
midTierMaps = unionAll $ map (intersect maps . baseType) midTierMapBases
midTierShapedMaps = unionAll $ map (intersect maps . baseType) midTierShapedBases
highTierMaps = unionAll $ map (intersect maps . baseType) highTierMapBases
highTierShapedMaps = unionAll $ map (intersect maps . baseType) highTierShapedBases

atlasItems = intersect currency $
 baseTypes ["Cartographer's Sextant", "Cartographer's Seal","Unshaping Orb"]
