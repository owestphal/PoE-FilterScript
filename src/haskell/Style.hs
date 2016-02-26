module Style (
  Style,
  style,
  defaultStyle,
  backgroundColor,
  borderColor,
  textColor,
  fontSize,
  alertSound,
  (<+),
  implementStyle
  ) where

-- each entry migth specifiy a propertiy for the display style or Nothing
-- if the value should be the default value
data Style = Style (Maybe Color) -- background
                   (Maybe Color) -- border
                   (Maybe Color) -- text
                   (Maybe Int)   -- font size
                   (Maybe (Int,Int))   -- alert sound
             deriving (Show, Eq)

type Color = (Int, Int, Int, Int)

-- TODO: make constructors aware of limitations
style a b c d e = Style (Just a) (Just b) (Just c) (Just d) (Just e)

defaultStyle = Style Nothing Nothing Nothing Nothing Nothing
backgroundColor x = Style (Just x) Nothing Nothing Nothing Nothing
borderColor x = Style Nothing (Just x) Nothing Nothing Nothing
textColor x = Style Nothing Nothing (Just x) Nothing Nothing
fontSize x = Style Nothing Nothing Nothing (Just x) Nothing
alertSound x = Style Nothing Nothing Nothing Nothing (Just x)

(<+) = combineStylePars

combineStylePars :: Style -> Style -> Style
combineStylePars (Style x1 x2 x3 x4 x5) (Style y1 y2 y3 y4 y5) =
  Style (x1 <++ y1) (x2 <++ y2) (x3 <++ y3) (x4 <++ y4) (x5 <++ y5)
  where
    a <++ Nothing = a
    _ <++ a = a

-- create filter code for a style
implementStyle :: Style -> String
implementStyle x = concat
                   $ [backgroundCode, borderCode, textColorCode, fontSizeCode, alertSoundCode]
                   <*> [x]

backgroundCode (Style x _ _ _ _) = colorParameter "SetBackgroundColor" x
borderCode (Style _ x _ _ _) = colorParameter "SetBorderColor" x
textColorCode (Style _ _ x _ _) = colorParameter "SetTextColor" x
fontSizeCode (Style _ _ _ x _) = genericParameter "SetFontSize" x
alertSoundCode (Style _ _ _ _ x) = soundParameter "PlayAlertSound" x

genericParameter _ Nothing = ""
genericParameter keyword (Just arg) = keyword <> show arg ++ newline

colorParameter _ Nothing = ""
colorParameter keyword (Just arg) = keyword <> showColor arg ++ newline

soundParameter _ Nothing = ""
soundParameter keyword (Just (i,v)) = keyword <> show i <> show v ++ newline

showColor (r, g, b, a) = show r <> show g <> show b <> show a

xs <> ys = xs ++ " " ++ ys

newline = "\n"
