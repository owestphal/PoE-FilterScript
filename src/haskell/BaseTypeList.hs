{-# OPTIONS_GHC -Wno-missing-signatures #-}
module BaseTypeList where

-- s
lowTierMapBases = ["Arcade","Crystal Ore","Desert","Jungle Valley","Beach",
    "Factory","Ghetto","Oasis","Arid Lake","Cavern","Channel",
    "Grotto","Marshes","Sewer","Vaal Pyramid","Academy","Acid Lakes",
    "Dungeon","Graveyard","Phantasmagoria","Villa","Waste Pool",
    "Burial Chambers","Peninsula","Dunes","Mesa","Pit","Primordial Pool",
    "Spider Lair","Tower","Canyon","Quarry","Racecourse","Ramparts",
    "Spider Forest","Strand","Thicket","Vaal City","Wharf"]
lowTierShapedBases = ["Shaped Arcade","Shaped Crystal Ore","Shaped Desert",
    "Shaped Jungle Valley"]
midTierMapBases = ["Arachnid Tomb","Castle Ruins","Catacombs","Cells",
    "Armoury","Ashen Wood","Mud Geyser","Arachnid Nest","Arena",
    "Bog","Cemetery","Barrows","Atoll","Pier","Shore",
    "Tropical Island","Coves","Crypt","Museum","Orchard",
    "Overgrown Shrine","Promenade","Reef","Temple","Colonnade",
    "Arsenal","Courtyard","Malformation","Quay","Terrace",
    "Underground River","Bazaar","Chateau","Excavation",
    "Precinct","Torture Chamber","Underground Sea","Wasteland"]
midTierShapedBases = ["Shaped Beach","Shaped Factory","Shaped Ghetto","Shaped Oasis",
    "Shaped Arid Lake","Shaped Cavern","Shaped Channel","Shaped Grotto",
    "Shaped Marshes","Shaped Sewer","Shaped Vaal Pyramid","Shaped Academy",
    "Shaped Acid Lakes","Shaped Dungeon","Shaped Graveyard","Shaped Phantasmagoria",
    "Shaped Villa","Shaped Waste Pool","Shaped Burial Chambers","Shaped Peninsula",
    "Shaped Dunes","Shaped Mesa","Shaped Pit","Shaped Primordial Pool","Shaped Canyon",
    "Shaped Quarry","Shaped Racecourse","Shaped Ramparts","Shaped Spider Forest",
    "Shaped Strand","Shaped Thicket","Shaped Vaal City","Shaped Wharf",
    "Shaped Spider Lair","Shaped Tower"]
highTierMapBases = ["Crematorium","Estuary","Necropolis","Plateau","Ivory Temple",
    "Residence","Shipyard","Vault","Lair","Beacon",
    "Gorge","High Gardens","Plaza","Scriptorium","Sulphur Wastes",
    "Waterways","Maze","Mineral Pools","Palace","Shrine","Springs",
    "Volcano","Abyss","Colosseum","Core","Dark Forest","Overgrown Ruin",
    "Pit of the Chimera","Lair of the Hydra","Maze of the Minotaur",
    "Forge of the Phoenix","Vaal Temple"]
highTierShapedBases = ["Shaped Arachnid Tomb","Shaped Castle Ruins","Shaped Catacombs",
    "Shaped Cells","Shaped Armoury","Shaped Ashen Wood","Shaped Mud Geyser",
    "Shaped Arachnid Nest","Shaped Arena","Shaped Bog","Shaped Cemetery",
    "Shaped Barrows","Shaped Atoll","Shaped Pier","Shaped Shore",
    "Shaped Tropical Island","Shaped Coves","Shaped Crypt","Shaped Museum",
    "Shaped Orchard","Shaped Overgrown Shrine","Shaped Promenade","Shaped Reef",
    "Shaped Temple","Shaped Colonnade","Shaped Arsenal","Shaped Courtyard",
    "Shaped Malformation","Shaped Quay","Shaped Terrace","Shaped Underground River"]

-- armour
pureArmourBases = [pureArmourBA, pureArmourBoots, pureArmourGloves, pureArmourHelmets, pureArmourShields]
pureEvasionBases = [pureEvasionBA, pureEvasionBoots, pureEvasionGloves, pureEvasionHelmets, pureEvasionShields]
pureEnergyShieldBases = [pureEnergyShieldBA, pureEnergyShieldBoots, pureEnergyShieldGloves, pureEnergyShieldHelmets, pureEnergyShieldShields]
armourEvasionBases = [armourEvasionBA, armourEvasionBoots, armourEvasionGloves, armourEvasionHelmets, armourEvasionShields]
armourEnergyShieldBases  = [armourEnergyShieldBA, armourEnergyShieldBoots, armourEnergyShieldGloves, armourEnergyShieldHelmets, armourEnergyShieldShields]
evasionEnergyShieldBases = [evasionEnergyShieldBA, evasionEnergyShieldBoots, evasionEnergyShieldGloves, evasionEnergyShieldHelmets, evasionEnergyShieldShields]

-- body armour
pureArmourBA = ["Plate Vest","Chestplate","Copper Plate","War Plate","Full Plate","Arena Plate",
  "Lordly Plate","Bronze Plate","Battle Plate","Sun Plate","Colosseum Plate","Majestic Plate","Golden Plate",
  "Crusader Plate","Astral Plate","Gladiator Plate","Glorious Plate"]
pureEvasionBA = ["Shabby Jerkin","Strapped Leather","Buckskin Tunic","Wild Leather","Full Leather","Sun Leather",
  "Thief's Garb","Eelskin Tunic","Frontier Leather","Glorious Leather","Coronal Leather","Cutthroat's Garb",
  "Sharkskin Tunic","Destiny Leather","Exquisite Leather","Zodiac Leather","Assassin's Garb"]
pureEnergyShieldBA = ["Simple Robe","Silken Vest","Scholar's Robe","Silken Garb","Mage's Vestment","Silk Robe",
  "Cabalist Regalia","Sage's Robe","Silken Wrap","Conjurer's Vestment","Spidersilk Robe","Destroyer Regalia",
  "Savant's Robe","Necromancer Silks","Occultist's Vestment","Widowsilk Robe","Vaal Regalia"]
armourEvasionBA = ["Scale Vest","Light Brigandine","Scale Doublet","Infantry Brigandine","Full Scale Armour",
  "Soldier's Brigandine","Field Lamellar","Wyrmscale Doublet","Hussar Brigandine","Full Wyrmscale",
  "Commander's Brigandine","Battle Lamellar","Dragonscale Doublet","Desert Brigandine","Full Dragonscale",
  "General's Brigandine","Triumphant Lamellar"]
armourEnergyShieldBA = ["Chainmail Vest","Chainmail Tunic","Ringmail Coat","Chainmail Doublet","Full Ringmail",
  "Full Chainmail","Holy Chainmail","Latticed Ringmail","Crusader Chainmail","Ornate Ringmail","Chain Hauberk",
  "Devout Chainmail","Loricated Ringmail","Conquest Chainmail","Elegant Ringmail","Saint's Hauberk",
  "Saintly Chainmail"]
evasionEnergyShieldBA = ["Padded Vest","Oiled Vest","Padded Jacket","Oiled Coat","Scarlet Raiment","Waxed Garb",
  "Bone Armour","Quilted Jacket","Sleek Coat","Crimson Raiment","Lacquered Garb","Crypt Armour","Sentinel Jacket",
  "Varnished Coat","Blood Raiment","Sadist Garb","Carnal Armour"]
-- boots
pureArmourBoots = ["Iron Greaves","Steel Greaves","Plated Greaves","Reinforced Greaves",
  "Antique Greaves","Ancient Greaves","Goliath Greaves","Vaal Greaves","Titan Greaves"]
pureEvasionBoots = ["Rawhide Boots","Goathide Boots","Deerskin Boots","Nubuck Boots",
  "Eelskin Boots","Sharkskin Boots","Shagreen Boots","Stealth Boots","Slink Boots"]
pureEnergyShieldBoots = ["Wool Shoes","Velvet Slippers","Silk Slippers","Scholar Boots",
  "Satin Slippers","Samite Slippers","Conjurer Boots","Arcanist Slippers","Sorcerer Boots"]
armourEvasionBoots = ["Leatherscale Boots","Ironscale Boots","Bronzescale Boots","Steelscale Boots",
  "Serpentscale Boots","Wyrmscale Boots","Hydrascale Boots","Dragonscale Boots"]
armourEnergyShieldBoots = ["Chain Boots","Ringmail Boots","Mesh Boots","Riveted Boots",
  "Zealot Boots","Soldier Boots","Legion Boots","Crusader Boots"]
evasionEnergyShieldBoots = ["Wrapped Boots","Strapped Boots","Clasped Boots","Shackled Boots",
  "Trapper Boots","Ambush Boots","Carnal Boots","Assassin's Boots","Murder Boots"]
-- gloves
pureArmourGloves = ["Iron Gauntlets","Plated Gauntlets","Bronze Gauntlets","Steel Gauntlets",
  "Antique Gauntlets","Ancient Gauntlets","Goliath Gauntlets","Vaal Gauntlets","Titan Gauntlets"]
pureEvasionGloves = ["Rawhide Gloves","Goathide Gloves","Deerskin Gloves","Nubuck Gloves",
  "Eelskin Gloves","Sharkskin Gloves","Shagreen Gloves","Stealth Gloves","Slink Gloves"]
pureEnergyShieldGloves = ["Wool Gloves","Velvet Gloves","Silk Gloves","Embroidered Gloves",
  "Satin Gloves","Samite Gloves","Conjurer Gloves","Arcanist Gloves","Sorcerer Gloves"]
armourEvasionGloves = ["Fishscale Gauntlets","Ironscale Gauntlets","Bronzescale Gauntlets",
  "Steelscale Gauntlets","Serpentscale Gauntlets","Wyrmscale Gauntlets","Hydrascale Gauntlets","Dragonscale Gauntlets"]
armourEnergyShieldGloves = ["Chain Gloves","Ringmail Gloves","Mesh Gloves","Riveted Gloves",
  "Zealot Gloves","Soldier Gloves","Legion Gloves","Crusader Gloves"]
evasionEnergyShieldGloves = ["Wrapped Mitts","Strapped Mitts","Clasped Mitts",
  "Trapper Mitts","Ambush Mitts","Carnal Mitts","Assassin's Mitts","Murder Mitts"]
-- helmets
pureArmourHelmets = ["Iron Hat","Cone Helmet","Barbute Helmet","Close Helmet","Gladiator Helmet",
  "Reaver Helmet","Siege Helmet","Samite Helmet","Ezomyte Burgonet","Royal Burgonet","Eternal Burgonet"]
pureEvasionHelmets = ["Leather Cap","Tricorne","Leather Hood","Wolf Pelt","Hunter Hood",
  "Noble Tricorne","Ursine Pelt","Silken Hood","Sinner Tricorne","Lion Pelt"]
pureEnergyShieldHelmets = ["Vine Circlet","Iron Circlet","Torture Cage","Tribal Circlet","Bone Circlet",
  "Lunaris Circlet","Steel Circlet","Necromancer Circlet","Solaris Circlet","Mind Cage","Hubris Circlet"]
armourEvasionHelmets = ["Battered Helm","Sallet","Visored Sallet","Gilded Sallet","Secutor Helm",
  "Fencer Helm","Lacquered Helmet","Fluted Bascinet","Pig-Faced Bascinet","Nightmare Bascinet"]
armourEnergyShieldHelmets = ["Rusted Coif","Soldier Helmet","Great Helmet","Crusader Helmet",
  "Aventail Helmet","Zealot Helmet","Great Crown","Magistrate Crown","Prophet Crown","Praetor Crown"]
evasionEnergyShieldHelmets = ["Scare Mask","Plague Mask","Iron Mask","Festival Mask","Golden Mask",
  "Raven Mask","Callous Mask","Regicide Mask","Harlequin Mask","Vaal Mask","Deicide Mask"]
-- shields
pureArmourShields = ["Tower Shield"]
pureEvasionShields = ["Buckler"]
pureEnergyShieldShields = ["Spirit Shield"]
armourEvasionShields = ["Round Shield"]
armourEnergyShieldShields = ["Kite Shield"]
evasionEnergyShieldShields = ["Spiked Bundle","Spiked Shield"]
