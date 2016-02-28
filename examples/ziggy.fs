# a port of ZIGGYD's Loot Filter v1.1
# plus my own rule for highlighting talismans
# ###############
# Set definitions
# ###############

Set mapsAndFragments = maps + mapFragments
Set midTierMaps = nonUniques & BaseType "Waste Pool" "Mine" "Jungle Valley" "Terrace" "Torture Chamber"
                                        "Canyon" "Dry Peninsula" "Dark Forest" "Cells" "Orchard"
                                        "Gorge" "Arid Lake" "Underground River" "Residence" "Malformation"
                                        "Plateau" "Volcano" "Bazaar" "Necropolis"
                                        "Precinct" "Academy" "Crematorium"
Set highTierMaps = nonUniques & BaseType "Shipyard" "Overgrown Ruin" "Arsenal" "Village Ruin"
                                         "Wasteland" "Waterways" "Courtyard" "Excavation"
                                         "Conservatory" "Shrine" "Palace"
                                         "Colosseum" "Abyss" "Core"
Set highCurrency = BaseType "Exalted Orb" "Eternal Orb" "Divine Orb"

Set midCurrency = BaseType "Chaos Orb" "Gemcutter's Prism" "Regal Orb" "Orb of Alchemy" "Vaal Orb" "Orb of Fusing"
                           "Orb of Scouring" "Blessed Orb" "Cartographer's Chisel" "Orb of Regret"

Set qualityGems = gems & Quality >= 5
Set important = questItems + currency + gems

Set normalHighLinks = normals & (fiveLinks + sixLinks)
Set magicHighLinks = magics & (fiveLinks + sixLinks)
Set rareHighLinks = rares & (fiveLinks + sixLinks)
Set uniqueHighLinks = uniques & (fiveLinks + sixLinks)

Set hammers = (normals + (magics & Quality >= 12) ) & BaseType "Gavel" "Stone Hammer" "Rock Breaker"
Set maxQualityNormals = smallItems & (Quality = 20 & normals)
Set qualityFlasks = flasks & Quality >= 5

Set chaosItems = rares & (smallItems + bodyArmour) & (ItemLevel >= 60 & ItemLevel < 75)
Set regalItems = rares & (smallItems + bodyArmour) & (ItemLevel >= 75)

Set highJewellery = rares & jewellery & ItemLevel >= 75

Set smallItems = (Heigth <= 3 & Width = 1) + (Heigth <= 2 & Width <= 2)

Set lowFourLinks = LinkedSockets >= 4 & ItemLevel <= 68 & (bodyArmour + gloves + helmets)
Set lowThreeLinks = threeLinks & ItemLevel <= 32

Set marakeths = BaseType "Sai" "Fleshripper" "Eclipse Staff" "Dragoon Sword" "Gemini Claw" "Exquisite Blade"
                         "Behemoth Mace" "Maraketh Bow" "Tiger Hook" "Profane Wand" "Runic Hatchet" "Sambar Sceptre"
                         "Coronal Maul" "Sacrificial Garb"

Set chanceBases = normals & ItemLevel >= 60 & BaseType "Occultist's Vestment" "Spine Bow" "Prophecy Wand" "Judgement Staff"
                                                       "Amethyst Ring" "Gold Ring" "Imperial Bow" "Glorious Plate" "Siege Axe"

Set goodFlasks = utilityFlasks
               + ((eternalFlasks + divineFlasks) & ItemLevel < 75)
               + (hallowedFlasks & ItemLevel < 65)
               + (flasks & ItemLevel <= 60)
Set badFlasks = ((divineFlasks + eternalFlasks) & ItemLevel >= 75)
              + (hallowedFlasks & ItemLevel >= 65)

Set hallowedFlasks = BaseType "Hallowed Life Flask"
Set divineFlasks = BaseType "Divine Life Flask"
Set eternalFlasks = BaseType "Eternal Life Flask"

Set badJewellery = normals & ItemLevel >= 12 & BaseType "Paua Ring" "Coral Amulet" "Studded Belt" "Cloth Belt"

Set normalsWhileLvling = ItemLevel < 12
    + (ItemLevel < 13 & DropLevel >= 2)
    + (ItemLevel < 14 & DropLevel >= 4)
    + (ItemLevel < 16 & DropLevel >= 6)
    + (ItemLevel < 18 & DropLevel >= 8)
    + (ItemLevel < 20 & DropLevel >= 10)
    + (ItemLevel < 22 & DropLevel >= 13)
    + (ItemLevel < 24 & DropLevel >= 16)
    + (ItemLevel < 26 & DropLevel >= 18)
    + (ItemLevel < 28 & DropLevel >= 20)
    + (ItemLevel < 30 & DropLevel >= 22)
    + (ItemLevel < 32 & DropLevel >= 24)
    + (ItemLevel < 34 & DropLevel >= 26)
    + (ItemLevel < 36 & DropLevel >= 30)
    + (ItemLevel < 38 & DropLevel >= 32)
    + (ItemLevel < 40 & DropLevel >= 34)
    + (ItemLevel < 42 & DropLevel >= 35)
    + (ItemLevel < 46 & DropLevel >= 40)
    + (ItemLevel < 48 & DropLevel >= 42)
    + (ItemLevel < 50 & DropLevel >= 44)
    + (ItemLevel < 52 & DropLevel >= 46)
    + (ItemLevel < 54 & DropLevel >= 48)
    + (ItemLevel < 56 & DropLevel >= 52)
    + (ItemLevel < 58 & DropLevel >= 54)
    + (ItemLevel < 60 & DropLevel >= 56)
    + (ItemLevel < 62 & DropLevel >= 58)
    + (ItemLevel < 64 & DropLevel >= 60)
    + (ItemLevel < 66 & DropLevel >= 62)
    + (ItemLevel < 68 & DropLevel >= 64)

# #################
# Style definitions
# #################

Style midTierMapBorder = BorderColor 254 213 0
Style highTierMapBorder = BorderColor 191 0 0

Style jewelBorder = BorderColor 98 0 255
Style divCardStyle = BorderColor 153 255 255 + FontSize 37 + AlertSound 9 88

Style highCurrStyle = TextColor 230 214 177 + BorderColor 230 214 177 + FontSize 42 + AlertSound 7 100
Style midCurrStyle = TextColor 219 190 147 + FontSize 36
Style mirrorStyle = TextColor 0 0 0 + BackgroundColor 255 128 255 + BorderColor 0 0 0 + FontSize 45 + AlertSound 8 100

Style gemColoredBorder = BorderColor 0 128 128 + BackgroundColor 0 0 0

Style rodStyle = TextColor 255 128 255 + BorderColor 255 128 255 + FontSize 45

Style normalHighLinkStyle = TextColor 255 255 255 + BackgroundColor 20 20 20 + BorderColor 180 180 180 + highLinkFont + highLinkSound
Style magicHighLinkStyle = TextColor 136 136 255 + BackgroundColor 0 15 31 + BorderColor 136 136 255 + highLinkFont + highLinkSound
Style rareHighLinkStyle = TextColor 255 255 119 + BackgroundColor 30 30 0 + BorderColor 180 180 60 + highLinkFont + highLinkSound
Style uniqueHighLinkStyle = TextColor 175 96 37 + BackgroundColor 31 15 2 + BorderColor 175 96 37 + highLinkFont + highLinkSound
Style highLinkFont = FontSize 42
Style highLinkSound = AlertSound 1 100

Style uniqueFont = FontSize 36

Style currencyRecipeStyle = BackgroundColor 33 30 26 + BorderColor 128 119 99

Style chaosStyle = BorderColor 170 158 130
Style regalStyle = TextColor 255 255 119 + BackgroundColor 0 0 0 + BorderColor 54 100 146 219
Style highJewelleryStyle = regalStyle + TextColor 255 255 51

Style talismanStyle = BorderColor 210 0 0 + AlertSound 2 100

Style chanceBaseStyle = BorderColor 175 96 37 193 + BackgroundColor 31 17 7

Style smallFont = FontSize 30

Style hiddenStyle = BackgroundColor 17 17 17 100 + FontSize 26

Style redBackground = BackgroundColor 191 0 0 120
Style greenBackground = BackgroundColor 0 191 0 120
Style blueBackground = BackgroundColor 0 0 254 120
Style redBlueBackground = BackgroundColor 254 213 0 120
Style redGreenBackground = BackgroundColor 204 0 154 120
Style greenblueBackground = BackgroundColor 30 144 255 120

# ################
# Rule definitions
# ################

Show jewels jewelBorder

Global midTierMaps midTierMapBorder
       highTierMaps highTierMapBorder
{
  Show mapsAndFragments defaultStyle
}

Show divinationCards divCardStyle

Show highCurrency highCurrStyle
Show midCurrency midCurrStyle
Show mirrors mirrorStyle

Show qualityGems gemColoredBorder
Show important defaultStyle
Show fishingRods rodStyle

Global pureArmour redBackground
       pureEvasion greenBackground
       pureEnergyShield blueBackground
       armourEvasion redBlueBackground
       armourEnergyShield redGreenBackground
       evasionEnergyShield greenblueBackground
{
  Show normalHighLinks normalHighLinkStyle
  Show magicHighLinks magicHighLinkStyle
  Show rareHighLinks rareHighLinkStyle
  Show uniqueHighLinks uniqueHighLinkStyle

  Show uniques uniqueFont

  Show chromatics currencyRecipeStyle
  Show sixSockets currencyRecipeStyle
  Show maxQualityNormals currencyRecipeStyle

  Show chaosItems chaosStyle
  Show regalItems regalStyle

  Show lowFourLinks defaultStyle
  Show lowThreeLinks defaultStyle

  Show marakeths defaultStyle
  Show chanceBases chanceBaseStyle

  Show normalsWhileLvling smallFont
}

Show hammers currencyRecipeStyle
Show qualityFlasks currencyRecipeStyle

Show talismans talismanStyle

Show highJewellery highJewelleryStyle

Show goodFlasks defaultStyle
Hide badFlasks hiddenStyle

Hide badJewellery hiddenStyle
Show jewellery defaultStyle
Show quivers defaultStyle

Show rares defaultStyle


Hide everything hiddenStyle
