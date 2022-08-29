module Internals.Config exposing
    ( Config(..)
    , FullHueStages
    , ShortHueStages
    , Terms
    , Theme
    , getDeviceHeight
    , getDeviceWidth
    , getTerms
    , init
    , onResize
    , rem
    , rem0d85
    , rem0d875
    , rem1
    , rem1d25
    , rem1d5
    , rem2
    )

import UI


type Config
    = Config
        { theme : Theme
        , deviceWidth : Int
        , deviceHeight : Int
        , terms : Terms
        , fontSizes : FontSizes
        }


type alias FullHueStages =
    { shade100 : UI.Color
    , shade200 : UI.Color
    , shade300 : UI.Color
    , shade400 : UI.Color
    , shade500 : UI.Color
    , shade600 : UI.Color
    , shade700 : UI.Color
    , shade800 : UI.Color
    }


type alias ShortHueStages =
    { shade200 : UI.Color
    , shade400 : UI.Color
    , shade600 : UI.Color
    , shade800 : UI.Color
    }


{-| To be replaced by auto-generated i18n
-}
type alias Terms =
    { core : String
    , basics : String
    , complex : String
    , layout : String
    }


type alias Theme =
    { background : FullHueStages
    , primary : ShortHueStages
    , danger : ShortHueStages
    , success : ShortHueStages
    , tabShadow : UI.Color
    }


type alias FontSizes =
    { r0d85 : Int
    , r0d875 : Int
    , r1 : Int
    , r1d25 : Int
    , r1d5 : Int
    , r2 : Int
    }


getDeviceHeight : Config -> Int
getDeviceHeight (Config { deviceHeight }) =
    deviceHeight


getDeviceWidth : Config -> Int
getDeviceWidth (Config { deviceWidth }) =
    deviceWidth


getTerms : Config -> Terms
getTerms (Config { terms }) =
    terms


init : { deviceHeight : Int, deviceWidth : Int } -> Config
init { deviceHeight, deviceWidth } =
    Config
        { theme = defaultTheme
        , deviceWidth = deviceWidth
        , deviceHeight = deviceHeight
        , terms = defaultTerms
        , fontSizes = calcFontSizes 16
        }


onResize : { deviceHeight : Int, deviceWidth : Int } -> Config -> Config
onResize { deviceHeight, deviceWidth } (Config config) =
    Config
        { config
            | deviceWidth = deviceWidth
            , deviceHeight = deviceHeight
        }


rem : Config -> Float -> Int
rem (Config { fontSizes }) rem_ =
    floor (toFloat fontSizes.r1 * rem_)


rem0d85 : Config -> Int
rem0d85 (Config { fontSizes }) =
    fontSizes.r0d85


rem0d875 : Config -> Int
rem0d875 (Config { fontSizes }) =
    fontSizes.r0d875


rem1 : Config -> Int
rem1 (Config { fontSizes }) =
    fontSizes.r1


rem1d25 : Config -> Int
rem1d25 (Config { fontSizes }) =
    fontSizes.r1d25


rem1d5 : Config -> Int
rem1d5 (Config { fontSizes }) =
    fontSizes.r1d5


rem2 : Config -> Int
rem2 (Config { fontSizes }) =
    fontSizes.r2


calcFontSizes : Int -> FontSizes
calcFontSizes rootFontSize =
    let
        calcFloat rem_ =
            floor (rootFontSizeFloat * rem_)

        rootFontSizeFloat =
            toFloat rootFontSize
    in
    { r0d85 = calcFloat 0.85
    , r0d875 = calcFloat 0.875
    , r1 = rootFontSize
    , r1d25 = calcFloat 1.25
    , r1d5 = calcFloat 1.5
    , r2 = rootFontSize * 2
    }


defaultTerms =
    { core = "Core"
    , basics = "Basics"
    , complex = "Complex"
    , layout = "Layout"
    }


defaultTheme =
    { background =
        { shade100 = UI.intRGBA 0xF0F6FCFF
        , shade200 = UI.intRGBA 0x8B949EFF
        , shade300 = UI.intRGBA 0x30363DFF
        , shade400 = UI.intRGBA 0x2B2A33FF
        , shade500 = UI.intRGBA 0x21262DFF
        , shade600 = UI.intRGBA 0x161B22FF
        , shade700 = UI.intRGBA 0x0D1117FF
        , shade800 = UI.intRGBA 0x010409FF
        }
    , primary =
        { shade200 = UI.intRGBA 0x58A6FFFF
        , shade400 = UI.intRGBA 0x549EF5FF
        , shade600 = UI.intRGBA 0x214C87FF
        , shade800 = UI.intRGBA 0x132339FF
        }
    , danger =
        { shade200 = UI.intRGBA 0xF85149FF
        , shade400 = UI.intRGBA 0xF75048FF
        , shade600 = UI.intRGBA 0xDA3633FF
        , shade800 = UI.intRGBA 0x6B2A2BFF
        }
    , success =
        { shade200 = UI.intRGBA 0x41A956FF
        , shade400 = UI.intRGBA 0x2EA043FF
        , shade600 = UI.intRGBA 0x2A943EFF
        , shade800 = UI.intRGBA 0x238636FF
        }
    , tabShadow = UI.intRGBA 0xF78166FF
    }
