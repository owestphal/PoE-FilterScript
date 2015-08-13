# PoE-FilterScript
A simplistic scripting language to create itemfilters for [Path of Exile](https://www.pathofexile.com/)

## Installation
Just downloading the executable from the [release page](https://github.com/owestphal/PoE-FilterScript/releases)
should work fine. If it does not work maybe installing the [Haskell Platform](https://www.haskell.org/platform/)
helps.

You can also build from source using the [Haskell Platform](https://www.haskell.org/platform/) (namley cabal-install).
For a guide an how to build cabal packages see for example [this](the [Haskell Platform](https://www.haskell.org/platform/)) guide

## Usage
To compile a script into a .filter file, simply use the filter language compiler
(flc) on the source file.
Just type
```
flc <sourceFile>
```
into the command-line, or
```
flc <sourceFile> -o <outputFile>
```
if you want to specify the name of the output file.
(on Windows you can open a command-line in the current directory by
  `Shift`+`Rightclick` into the folder and selecting "Open command window here"
  from the context menu)

## The Language
The language has four types of definitions which are used to create a filter:

1. **Sets**: Sets are groups of items that satisfy certain conditions.
Multiple sets can be combined using the logical operators `+` (or) and `&` (and).  
e.g. `flask + ItemLevel = 50` contains all items that are flasks **or** have itemLevel 50  
and `flask & ItemLevel = 50` contains all items that are flasks **and** have itemLevel 50  
(be aware `&` binds stronger than `+`, so you need to use parenthesis if you want `+` to apply first)

2. **Styles**: A Style describes the way items are displayed.
Styles can be combined with the `+` operator. If in a combination of styles the same
property is defined twice (e.g. two different border colors) the latest (rightmost) one
will override the previous ones.

3. **Rules**: Rules define how a set of items is displayed, they state if the set should
be shown (`Show`) or hidden (`Hide`) and what style should be used to display the set.  
Like in GGG's default language the order in which rules are defined is important (first rule that matches an item is choosen).

4. **Imports**: It is possible to import set and style definitions (but not the rules)
 from another sourcefile.
Note: Since imports are recursive (all imports from imported files are also imported)
 and no checking for circular imports is done, the compiler gets stuck if such a circle
 exists

The language also contains some build in sets (see below) and a build in `defaultStyle`.

[example script](https://github.com/owestphal/PoE-FilterScript/blob/master/examples/ziggy.fs)

## Syntax
```
<exrp> ::= <import> | <setExpr> | <styleExpr> | <ruleExpr>

<import> ::= "Import" <filename>

<setExpr> ::= "Set" <id> "=" <setDef>

<setDef> ::= <id> | <setProperty> | "(" <setDef> ")" | <setDef> <setOp> <setDef>

<setOp> ::= "+" | "&"

<setProperty> ::= "ItemLevel" ...
                | "DropLevel" ...
                | "Quality" ...
                | "Sockets" ...
                | "LinkedSockets" ...
                | "SocketGroup" ...
                | "Rarity" ...
                | "ItemClass" ...
                | "BaseType" ...
                | "Width" ...
                | "Heigth" ...

<styleExpr> ::= "Style" <id> "=" <styleDef>

<styleDef> ::= <id> | <styleProperty> | "(" <styleDef> ")" | <styleDef> "+" <styleDef>

<styleProperty> ::= "BackgroundColor" ...
                  | "BorderColor" ...
                  | "TextColor" ...
                  | "FontSize" ...
                  | "AlertSound" ...

<ruleExpr> ::= <type> <setId> <styleId>

<type> ::= "Show" | "Hide"

<setId> ::= <id>
<styleId> ::= <id>
<id> ::= <idStart>{<idRest>}

<idStart> ::= <letter>

<idRest> ::= <letter> | <digit> | "_"
```
Almost all basic properties take the same values as their counterparts in the
[standard filter scripts](http://pathofexile.gamepedia.com/Item_filter),
the only exception being that the equality operator `=` cant be omitted,
and that names of itemclasses must be complete and written without quotation marks.

## Build in sets
`jewels`,`divinationCards`,`normals`,`nonNormals`,`magics`,`rares`,`uniques`,
`gems`,`activeGems`,`skillGems`,`supportGems`,`weapons`,`axes`,`oneHandAxes`,
`twoHandAxes`,`bows`,`claws`,`daggers`,`maces`,`oneHandMaces`,`sceptres`,
`twoHandMaces`,`staves`,`swords`,`oneHandSwords`,`thrustingOneHandSwords`,
`twoHandSwords`,`wands`,`armour`,`bodyArmour`,`boots`,`gloves`,`helmets`,
`shields`,`jewellery`,`belts`,`rings`,`amulets`,`quivers`,`flasks`,
`hybridFlasks`,`lifeFlasks`,`manaFlasks`,`utilityFlasks`,`currency`,
`fishingRods`,`questItems`,`threeSockets`,`fourSockets`,`fiveSokets`,
`sixSockets`,`twoLinks`,`threeLinks`,`fourLinks`,`fiveLinks`,`sixLinks`,
`chromatics`,`mirrors`,`maps`,`mapFragments`,`everything`
