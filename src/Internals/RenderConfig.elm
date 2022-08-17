module Internals.RenderConfig exposing
    ( FullHueStages
    , RenderConfig(..)
    , ShortHueStages
    , Terms
    , Theme
    , getDeviceHeight
    , getDeviceWidth
    , getTerms
    , init
    , onResize
    )

import UI


type RenderConfig
    = RenderConfig
        { theme : Theme
        , deviceWidth : Int
        , deviceHeight : Int
        , terms : Terms
        }


init : { deviceWidth : Int, deviceHeight : Int } -> RenderConfig
init { deviceWidth, deviceHeight } =
    RenderConfig
        { theme = defaultTheme
        , terms = defaultTerms
        , deviceWidth = deviceWidth
        , deviceHeight = deviceHeight
        }


onResize : { deviceWidth : Int, deviceHeight : Int } -> RenderConfig -> RenderConfig
onResize { deviceWidth, deviceHeight } (RenderConfig config) =
    RenderConfig
        { config
            | deviceWidth = deviceWidth
            , deviceHeight = deviceHeight
        }


getDeviceWidth : RenderConfig -> Int
getDeviceWidth (RenderConfig { deviceWidth }) =
    deviceWidth


getDeviceHeight : RenderConfig -> Int
getDeviceHeight (RenderConfig { deviceHeight }) =
    deviceHeight


getTerms : RenderConfig -> Terms
getTerms (RenderConfig { terms }) =
    terms


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
