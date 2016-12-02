##################
# General Styles #
##################
Style bigFont = FontSize 36
Style veryBigFont = FontSize 40
Style ludicrousFont = FontSize 45
Style smallFont = FontSize 28

Style gemColoredBorder = BorderColor 40 128 128
Style purpleBorder = BorderColor 130 60 255
Style lightBlueBorder = BorderColor 66 142 255

Style redBorder = BorderColor 199 22 22
Style greenBorder = BorderColor 21 99 21
Style blueBorder = BorderColor 82 82 227
Style yellowBorder = BorderColor 220 200 16
Style magentaBorder = BorderColor 195 57 166
Style cyanBorder = BorderColor 33 112 96
Style silverBorder = BorderColor 170 170 170

Style whiteBorder = BorderColor 255 255 255
Style yellowMapBorder = BorderColor 171 143 0
Style redMapBorder = BorderColor 112 0 0

Style whiteBackground = BackgroundColor 255 255 255
Style yellowBackground = BackgroundColor 171 143 0
Style redBackground = BackgroundColor 112 0 0

Style currencyColorBorder = BorderColor 230 214 177

Style currencyColorBackground = BackgroundColor 128 119 99 230
Style tealBackground = BackgroundColor 210 255 255 200
Style greenBackground = BackgroundColor 11 84 21 230
Style orangeBackground = BackgroundColor 175 96 37 200

Style blackText = TextColor 0 0 0
Style redText = TextColor 125 16 16
Style purpleText = TextColor 138 21 193
Style mintText = TextColor 128 254 128
Style silverText = TextColor 170 170 170
Style lightBlueText = TextColor 75 180 215

Style recipeStyle = currencyColorBackground + whiteBorder + smallFont

########
# Maps #
########
Style highMapStyle = blackText + redBackground
Style midMapStyle = blackText + yellowBackground
Style lowMapStyle = blackText + whiteBackground

Global highTierShapedMaps highMapStyle
       highTierMaps highMapStyle
       midTierShapedMaps midMapStyle
       midTierMaps midMapStyle
{
  Show lowTierShapedMaps lowMapStyle
  Show maps lowMapStyle
}
Set vaalFragments = mapFragments & (BaseType "Sacrifice" + BaseType "Mortal")
Set councilFragments = mapFragments & BaseType "Key"
Set breachFragments = mapFragments & BaseType "Breachstone"
Show vaalFragments redText
Show councilFragments defaultStyle
Show breachFragments purpleText

Set labyrinthMap = BaseType "Offering to the Goddess"
Show labyrinthMap mintText

############
# Currency #
############
Set topTierCurrency = BaseType "Exalted Orb" "Eternal Orb" "Divine Orb"

Set midTierCurrency = BaseType "Chaos Orb" "Gemcutter's Prism" "Regal Orb"
                                "Orb of Alchemy" "Vaal Orb" "Orb of Fusing"
                                "Orb of Scouring" "Blessed Orb" "Orb of Regret"
                                "Cartographer's Chisel"

Set breachStuff = (BaseType "Splinter" + BaseType "Blessing") & currency

Show breachStuff purpleText

Set silverCoins = BaseType "Silver Coin" & currency
Set essences = BaseType "Essence" & currency
Set remnants = BaseType "Remnant of Corruption" & currency

Style silverCoinStyle = silverText + silverBorder + bigFontSize

Show silverCoins silverText
Show essences lightBlueText
Show remnants redText

Style topCurrStyle = currencyColorBorder + veryBigFont
Style midCurrStyle = currencyColorBorder + bigFont
Style mirrorStyle = TextColor 0 0 0 + BackgroundColor 255 128 255
                  + BorderColor 0 0 0 + FontSize 45 + AlertSound 8 100

Show topTierCurrency topCurrStyle
Show atlasItems midCurrStyle
Show midTierCurrency midCurrStyle
Show mirrors mirrorStyle

Set scrolls = BaseType "Scroll"
Show scrolls bigFont

###########################################
# Random Stuff to pick up or Worth seeing #
###########################################
# Quality Gems
Set qualityGems = gems & Quality >= 5
Show qualityGems gemColoredBorder

# Quest Items / Gems / Rest Currency
Set important = questItems + currency + gems
Show important defaultStyle

# Jewels
Show jewels purpleBorder

# Div Cards
Style divCardStyle = tealBackground + bigFont + lightBlueBorder
Show divinationCards divCardStyle

# 5/6 Links
Set highLinks = fiveLinks + sixLinks

# Uniques
Set highUniques = uniques & DropLevel >= 68

# Good Bases
Set breachRings = BaseType "Breach Ring" & jewellery
Style breachRingStyle = purpleBorder + bigFont
Show breachRings breachRingStyle

Set craftingBases = normals & (DropLevel >= 68 + jewellery)

Global pureArmour redBorder
       pureEvasion greenBorder
       pureEnergyShield blueBorder
       armourEvasion yellowBorder
       armourEnergyShield magentaBorder
       evasionEnergyShield cyanBorder
{
    Show highLinks ludicrousFont

    Show highUniques bigFont
    Show uniques defaultStyle

    Show sixSockets recipeStyle

    Show chromatics recipeStyle
    Show chanceBases chanceStyle
    Show craftingBases smallFont
}

# Flasks
Show utilityFlasks greenBackground

Set qualityFlasks = flasks & Quality >= 5
Show qualityFlasks recipeStyle

Set goodFlasks = (BaseType "Hallowed Life Flask" & ItemLevel < 60)
            + ( (BaseType "Divine Life Flask" + BaseType "Eternal Life Flask")
                & ItemLevel < 70 )
Show goodFlasks smallFont


# Rares
Set notableRares = (rares &
                ((ItemLevel <= 35)
                + (ItemLevel <= 45 & DropLevel > 30 )
                + (ItemLevel <= 50 & DropLevel > 40 )
                + DropLevel > 50))

# Chance Bases
Set chanceBases = normals & BaseType "Occultist's Vestment" "Spine Bow" "Gold Ring"
                "Prophecy Wand" "Judgement Staff" "Amethyst Ring"
                "Imperial Bow" "Glorious Plate"
Style chanceStyle = orangeBackground + smallFont

Global pureArmour redBorder
       pureEvasion greenBorder
       pureEnergyShield blueBorder
       armourEvasion yellowBorder
       armourEnergyShield magentaBorder
       evasionEnergyShield cyanBorder
{
    Show jewellery bigFont
    Show notableRares defaultStyle
}

# Hammers
Set hammers = (normals + (magics & Quality >= 12) )
            & BaseType "Gavel" "Stone Hammer" "Rock Breaker"
Show hammers recipeStyle

# Rods
Style rodStyle = TextColor 255 128 255 + BorderColor 255 128 255 + FontSize 45
Show fishingRods rodStyle

###########################
# Leveling / League Start #
###########################
# Rings / Belts / Amulets
Set lowJewellery = normals & ( belts + amulets + rings ) & ItemLevel < 16
Show lowJewellery smallFont

# Low Flasks
Set lowFlasks = (lifeFlasks + manaFlasks)
        & ((DropLevel < 24 & ItemLevel < 24)
         + (DropLevel >= 24 & ItemLevel < 42))
Show lowFlasks smallFont

# Magics
Set lowMagics = magics & ItemLevel <= 40

# Low Whites
Set lowWhites = normals &
    ( ItemLevel < 11
    + (ItemLevel < 12 & DropLevel >= 9)
    + (ItemLevel < 16 & DropLevel >= 12)
    + (ItemLevel < 20 & DropLevel >= 16)
    + (ItemLevel < 25 & DropLevel >= 20)
    + (ItemLevel < 30 & DropLevel >= 25) )


Global pureArmour redBorder
       pureEvasion greenBorder
       pureEnergyShield blueBorder
       armourEvasion yellowBorder
       armourEnergyShield magentaBorder
       evasionEnergyShield cyanBorder
{
    Show lowWhites smallFont
    Show lowMagics smallFont
}

#####################
# Past League Stuff #
#####################
# Style talismanStyle = BorderColor 210 0 0 + AlertSound 2 100
# Set coins = BaseType "Perandus Coin"
# Style coinStyle = BorderColor 170 158 130 + bigFont

#############
# Hide Rest #
#############
Style hiddenStyle = BackgroundColor 17 17 17 150 + smallFont
Global pureArmour redBorder
       pureEvasion greenBorder
       pureEnergyShield blueBorder
       armourEvasion yellowBorder
       armourEnergyShield magentaBorder
       evasionEnergyShield cyanBorder
{
    Hide everything hiddenStyle
}
