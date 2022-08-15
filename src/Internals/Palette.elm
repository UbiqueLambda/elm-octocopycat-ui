module Internals.Palette exposing
    ( Color(..)
    , Hue(..)
    , Shade(..)
    , background
    , background200
    , background400
    , background600
    , background800
    , backgroundColor
    , borderWithColor
    , color
    , danger
    , danger200
    , danger400
    , danger600
    , danger800
    , genericBlack
    , genericWhite
    , primary
    , primary200
    , primary400
    , primary600
    , primary800
    , shade200
    , shade400
    , shade600
    , shade800
    , shadowWithColor
    , success
    , success200
    , success400
    , success600
    , success800
    , tabShadow
    , toUI
    , withFontColor
    )

import Internals.RenderConfig exposing (HueStages, RenderConfig(..))
import UI


type Shade
    = Shade200
    | Shade400
    | Shade600
    | Shade800


type Hue
    = Background
    | Primary
    | Danger
    | Success


type Color
    = Color Hue Shade
    | GenericBlack
    | GenericWhite
    | TabShadow -- Avoid having something like this


color : Hue -> Shade -> Color
color hue shade =
    Color hue shade


genericBlack : Color
genericBlack =
    GenericBlack


genericWhite : Color
genericWhite =
    GenericWhite


tabShadow : Color
tabShadow =
    TabShadow


shade200 : Shade
shade200 =
    Shade200


shade400 : Shade
shade400 =
    Shade400


shade600 : Shade
shade600 =
    Shade600


shade800 : Shade
shade800 =
    Shade800


background : Hue
background =
    Background


background200 : Color
background200 =
    Color Background Shade200


background400 : Color
background400 =
    Color Background Shade400


background600 : Color
background600 =
    Color Background Shade600


background800 : Color
background800 =
    Color Background Shade800


primary : Hue
primary =
    Primary


primary200 : Color
primary200 =
    Color Primary Shade200


primary400 : Color
primary400 =
    Color Primary Shade400


primary600 : Color
primary600 =
    Color Primary Shade600


primary800 : Color
primary800 =
    Color Primary Shade800


danger : Hue
danger =
    Danger


danger200 : Color
danger200 =
    Color Danger Shade200


danger400 : Color
danger400 =
    Color Danger Shade400


danger600 : Color
danger600 =
    Color Danger Shade600


danger800 : Color
danger800 =
    Color Danger Shade800


success : Hue
success =
    Success


success200 : Color
success200 =
    Color Success Shade200


success400 : Color
success400 =
    Color Success Shade400


success600 : Color
success600 =
    Color Success Shade600


success800 : Color
success800 =
    Color Success Shade800


toUI : RenderConfig -> Color -> UI.Color
toUI (RenderConfig { theme }) color_ =
    case color_ of
        GenericWhite ->
            theme.genericWhite

        GenericBlack ->
            theme.genericBlack

        TabShadow ->
            theme.tabShadow

        Color Background shade ->
            shadeFromHue theme.background shade

        Color Primary shade ->
            shadeFromHue theme.primary shade

        Color Danger shade ->
            shadeFromHue theme.danger shade

        Color Success shade ->
            shadeFromHue theme.success shade


shadeFromHue : HueStages -> Shade -> UI.Color
shadeFromHue stages shade =
    case shade of
        Shade200 ->
            stages.shade200

        Shade400 ->
            stages.shade400

        Shade600 ->
            stages.shade600

        Shade800 ->
            stages.shade800


backgroundColor : RenderConfig -> Color -> UI.Background
backgroundColor renderConfig color_ =
    UI.backgroundColor (toUI renderConfig color_)


withFontColor : RenderConfig -> Color -> UI.Graphics msg -> UI.Graphics msg
withFontColor renderConfig color_ =
    UI.withFontColor (toUI renderConfig color_)


shadowWithColor : RenderConfig -> Color -> UI.Shadow -> UI.Shadow
shadowWithColor renderConfig color_ =
    UI.shadowWithColor (toUI renderConfig color_)


borderWithColor : RenderConfig -> Color -> UI.Border -> UI.Border
borderWithColor renderConfig color_ =
    UI.borderWithColor (toUI renderConfig color_)
