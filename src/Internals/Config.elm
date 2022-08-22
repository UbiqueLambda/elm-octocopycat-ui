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


init : { deviceWidth : Int, deviceHeight : Int } -> Config
init { deviceWidth, deviceHeight } =
    Config
        { theme = defaultTheme
        , terms = defaultTerms
        , deviceWidth = deviceWidth
        , deviceHeight = deviceHeight
        , fontSizes = calcFontSizes 16
        }


onResize : { deviceWidth : Int, deviceHeight : Int } -> Config -> Config
onResize { deviceWidth, deviceHeight } (Config config) =
    Config
        { config
            | deviceWidth = deviceWidth
            , deviceHeight = deviceHeight
        }


getDeviceWidth : Config -> Int
getDeviceWidth (Config { deviceWidth }) =
    deviceWidth


getDeviceHeight : Config -> Int
getDeviceHeight (Config { deviceHeight }) =
    deviceHeight


getTerms : Config -> Terms
getTerms (Config { terms }) =
    terms


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


rem : Config -> Float -> Int
rem (Config { fontSizes }) rem_ =
    floor (toFloat fontSizes.r1 * rem_)


calcFontSizes : Int -> FontSizes
calcFontSizes rootFontSize =
    let
        rootFontSizeFloat =
            toFloat rootFontSize

        calcFloat rem_ =
            floor (rootFontSizeFloat * rem_)
    in
    { r0d85 = calcFloat 0.85
    , r0d875 = calcFloat 0.875
    , r1 = rootFontSize
    , r1d25 = calcFloat 1.25
    , r1d5 = calcFloat 1.5
    , r2 = rootFontSize * 2
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


type alias ShortHueStages =
    { shade200 : UI.Color
    , shade400 : UI.Color
    , shade600 : UI.Color
    , shade800 : UI.Color
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


defaultTerms =
    { core = "Core"
    , basics = "Basics"
    , complex = "Complex"
    , layout = "Layout"
    }


defaultTheme =
    { background =
        { shade800 = UI.intRGBA 0x010409FF
        , shade700 = UI.intRGBA 0x0D1117FF
        , shade600 = UI.intRGBA 0x161B22FF
        , shade500 = UI.intRGBA 0x21262DFF
        , shade400 = UI.intRGBA 0x2B2A33FF
        , shade300 = UI.intRGBA 0x30363DFF
        , shade200 = UI.intRGBA 0x8B949EFF
        , shade100 = UI.intRGBA 0xF0F6FCFF
        }
    , primary =
        { shade800 = UI.intRGBA 0x132339FF
        , shade600 = UI.intRGBA 0x214C87FF
        , shade400 = UI.intRGBA 0x549EF5FF
        , shade200 = UI.intRGBA 0x58A6FFFF
        }
    , danger =
        { shade800 = UI.intRGBA 0x6B2A2BFF
        , shade600 = UI.intRGBA 0xDA3633FF
        , shade400 = UI.intRGBA 0xF75048FF
        , shade200 = UI.intRGBA 0xF85149FF
        }
    , success =
        { shade800 = UI.intRGBA 0x238636FF
        , shade600 = UI.intRGBA 0x2A943EFF
        , shade400 = UI.intRGBA 0x2EA043FF
        , shade200 = UI.intRGBA 0x41A956FF
        }
    , tabShadow = UI.intRGBA 0xF78166FF
    }
