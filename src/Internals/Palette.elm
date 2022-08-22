module Internals.Palette exposing
    ( Color(..)
    , Hue(..)
    , Shade(..)
    , background
    , background100
    , background200
    , background300
    , background400
    , background500
    , background600
    , background700
    , background800
    , backgroundColor
    , borderWithColor
    , color
    , colorTabShadow
    , danger
    , danger200
    , danger400
    , danger600
    , danger800
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
    , toUI
    , withFontColor
    )

import Internals.Config exposing (Config(..))
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
    | Background100
    | Background300
    | Background500
    | Background700
    | TabShadow -- Avoid having something like this


color : Hue -> Shade -> Color
color hue shade =
    Color hue shade


colorTabShadow : Color
colorTabShadow =
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


background100 : Color
background100 =
    Background100


background200 : Color
background200 =
    Color Background Shade200


background300 : Color
background300 =
    Background300


background400 : Color
background400 =
    Color Background Shade400


background500 : Color
background500 =
    Background500


background600 : Color
background600 =
    Color Background Shade600


background700 : Color
background700 =
    Background700


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


toUI : Config -> Color -> UI.Color
toUI (Config { theme }) color_ =
    case color_ of
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

        Background100 ->
            theme.background.shade100

        Background300 ->
            theme.background.shade300

        Background500 ->
            theme.background.shade500

        Background700 ->
            theme.background.shade700


shadeFromHue : { x | shade200 : UI.Color, shade400 : UI.Color, shade600 : UI.Color, shade800 : UI.Color } -> Shade -> UI.Color
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


backgroundColor : Config -> Color -> UI.Background
backgroundColor ds color_ =
    UI.backgroundColor (toUI ds color_)


withFontColor : Config -> Color -> UI.Graphics msg -> UI.Graphics msg
withFontColor ds color_ =
    UI.withFontColor (toUI ds color_)


shadowWithColor : Config -> Color -> UI.Shadow -> UI.Shadow
shadowWithColor ds color_ =
    UI.shadowWithColor (toUI ds color_)


borderWithColor : Config -> Color -> UI.Border -> UI.Border
borderWithColor ds color_ =
    UI.borderWithColor (toUI ds color_)
