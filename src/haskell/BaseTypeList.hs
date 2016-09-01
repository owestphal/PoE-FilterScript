{-# OPTIONS_GHC -Wno-missing-signatures #-}
module BaseTypeList where

-- maps
lowTierMapBases = ["Arcade Map","Crystal Ore Map","Desert Map","Jungle Valley Map","Beach Map",
    "Factory Map","Ghetto Map","Oasis Map","Arid Lake Map","Cavern Map","Channel Map",
    "Grotto Map","Marshes Map","Sewer Map","Vaal Pyramid Map","Academy Map","Acid Lakes Map",
    "Dungeon Map","Graveyard Map","Phantasmagoria Map","Villa Map","Waste Pool Map",
    "Burial Chambers Map","Peninsula Map","Dunes Map","Mesa Map","Pit Map","Primordial Pool Map",
    "Spider Lair Map","Tower Map","Canyon Map","Quarry Map","Racecourse Map","Ramparts Map",
    "Spider Forest Map","Strand Map","Thicket Map","Vaal City Map","Wharf Map"]
lowTierShapedBases = ["Shaped Arcade Map","Shaped Crystal Ore Map","Shaped Desert Map",
    "Shaped Jungle Valley Map"]
midTierMapBases = ["Arachnid Tomb Map","Castle Ruins Map","Catacombs Map","Cells Map",
    "Armory Map","Ashen Wood Map","Mud Geyser Map","Arachnid Nest Map","Arena Map",
    "Bog Map","Cemetery Map","Barrows Map","Atoll Map","Pier Map","Shore Map",
    "Tropical Island Map","Coves Map","Crypt Map","Museum Map","Orchard Map",
    "Overgrown Shrine Map","Promenade Map","Reef Map","Temple Map","Colonnade Map",
    "Arsenal Map","Courtyard Map","Malformation Map","Quay Map","Terrace Map",
    "Underground River Map","Bazaar Map","Chateau Map","Excavation Map",
    "Precinct Map","Torture Chamber Map","Underground Sea Map","Wasteland Map"]
midTierShapedBases = ["Shaped Beach Map","Shaped Factory Map","Shaped Ghetto Map","Shaped Oasis Map",
    "Shaped Arid Lake Map","Shaped Cavern Map","Shaped Channel Map","Shaped Grotto Map",
    "Shaped Marshes Map","Shaped Sewer Map","Shaped Vaal Pyramid Map","Shaped Academy Map",
    "Shaped Acid Lakes Map","Shaped Dungeon Map","Shaped Graveyard Map","Shaped Phantasmagoria Map",
    "Shaped Villa Map","Shaped Waste Pool Map","Shaped Burial Chambers Map","Shaped Peninsula Map",
    "Shaped Dunes Map","Shaped Mesa Map","Shaped Pit Map","Shaped Primordial Pool Map","Shaped Canyon Map",
    "Shaped Quarry Map","Shaped Racecourse Map","Shaped Ramparts Map","Shaped Spider Forest Map",
    "Shaped Strand Map","Shaped Thicket Map","Shaped Vaal City Map","Shaped Wharf Map",
    "Shaped Spider Lair Map","Shaped Tower Map"]
highTierMapBases = ["Crematorium Map","Estuary Map","Necropolis Map","Plateau Map","Ivory Temple Map",
    "Residence Map","Shipyard Map","Vault Map","Lair Map","Beacon Map",
    "Gorge Map","High Gardens Map","Plaza Map","Scriptorium Map","Sulphur Wastes Map",
    "Waterways Map","Maze Map","Mineral Pools Map","Palace Map","Shrine Map","Springs Map",
    "Volcano Map","Abyss Map","Colosseum Map","Core Map","Dark Forest Map","Overgrown Ruin Map",
    "Pit of the Chimera Map","Lair of the Hydra Map","Maze of the Minotaur Map",
    "Forge of the Phoenix Map","Vaal Temple Map"]
highTierShapedBases = ["Shaped Arachnid Tomb Map","Shaped Castle Ruins Map","Shaped Catacombs Map",
    "Shaped Cells Map","Shaped Armory Map","Shaped Ashen Wood Map","Shaped Mud Geyser Map",
    "Shaped Arachnid Nest Map","Shaped Arena Map","Shaped Bog Map","Shaped Cemetery Map",
    "Shaped Barrows Map","Shaped Atoll Map","Shaped Pier Map","Shaped Shore Map",
    "Shaped Tropical Island Map","Shaped Coves Map","Shaped Crypt Map","Shaped Museum Map",
    "Shaped Orchard Map","Shaped Overgrown Shrine Map","Shaped Promenade Map","Shaped Reef Map",
    "Shaped Temple Map","Shaped Colonnade Map","Shaped Arsenal Map","Shaped Courtyard Map",
    "Shaped Malformation Map","Shaped Quay Map","Shaped Terrace Map","Shaped Underground River Map"]

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
