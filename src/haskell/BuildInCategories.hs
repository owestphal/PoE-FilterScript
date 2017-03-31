module BuildInCategories (
    buildInCats
    ) where

import           EmbeddedLootLanguage
import           Types

buildInCats = zipWith (\x y -> (x, PropCat y)) names functions

names = [
  "lowTierMaps",
  "midTierMaps",
  "highTierMaps",
  "atlasItems",
  "jewels",
  "divinationCards",
  "normals",
  "nonNormals",
  "magics",
  "rares",
  "uniques",
  "nonUniques",
  "gems",
  "activeGems",
  "skillGems",
  "supportGems",
  "weapons",
  "axes",
  "oneHandAxes",
  "twoHandAxes",
  "bows",
  "claws",
  "daggers",
  "maces",
  "oneHandMaces",
  "sceptres",
  "twoHandMaces",
  "staves",
  "swords",
  "oneHandSwords",
  "thrustingOneHandSwords",
  "twoHandSwords",
  "wands",
  "armour",
  "bodyArmour",
  "boots",
  "gloves",
  "helmets",
  "shields",
  "pureArmour",
  "pureEvasion",
  "pureEnergyShield",
  "armourEvasion",
  "armourEnergyShield",
  "evasionEnergyShield",
  "jewellery",
  "belts",
  "rings",
  "amulets",
  "talismans",
  "quivers",
  "flasks",
  "hybridFlasks",
  "lifeFlasks",
  "manaFlasks",
  "utilityFlasks",
  "currency",
  "fishingRods",
  "questItems",
  "threeSockets",
  "fourSockets",
  "fiveSokets",
  "sixSockets",
  "twoLinks",
  "threeLinks",
  "fourLinks",
  "fiveLinks",
  "sixLinks",
  "chromatics",
  "mirrors",
  "maps",
  "mapFragments",
  "everything"]

functions =[
  lowTierMaps,
  midTierMaps,
  highTierMaps,
  atlasItems,
  jewels,
  divinationCards,
  normals,
  nonNormals,
  magics,
  rares,
  uniques,
  nonUniques,
  gems,
  activeGems,
  skillGems,
  supportGems,
  weapons,
  axes,
  oneHandAxes,
  twoHandAxes,
  bows,
  claws,
  daggers,
  maces,
  oneHandMaces,
  sceptres,
  twoHandMaces,
  staves,
  swords,
  oneHandSwords,
  thrustingOneHandSwords,
  twoHandSwords,
  wands,
  armour,
  bodyArmour,
  boots,
  gloves,
  helmets,
  shields,
  pureArmour,
  pureEvasion,
  pureEnergyShield,
  armourEvasion,
  armourEnergyShield,
  evasionEnergyShield,
  jewellery,
  belts,
  rings,
  amulets,
  talismans,
  quivers,
  flasks,
  hybridFlasks,
  lifeFlasks,
  manaFlasks,
  utilityFlasks,
  currency,
  fishingRods,
  questItems,
  threeSockets,
  fourSockets,
  fiveSokets,
  sixSockets,
  twoLinks,
  threeLinks,
  fourLinks,
  fiveLinks,
  sixLinks,
  chromatics,
  mirrors,
  maps,
  mapFragments,
  everything]

-- tests
lengthMatch :: Bool
lengthMatch = length names == length functions
