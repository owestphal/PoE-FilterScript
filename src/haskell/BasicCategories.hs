module BasicCategories where

import           Category

jewels = itemClass Jewel

divinationCards = itemClass DivinationCard

baseTypes = unionAll.map baseType

normals = rarity EQ Normal
nonNormals = rarity GT Normal
magics = rarity EQ Magic
rares = rarity EQ Rare
uniques = rarity EQ Unique

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
