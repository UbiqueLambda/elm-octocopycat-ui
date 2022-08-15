module Internals.RenderConfig exposing
    ( HueStages
    , RenderConfig(..)
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
    { background : HueStages
    , primary : HueStages
    , danger : HueStages
    , success : HueStages
    , genericBlack : UI.Color
    , genericWhite : UI.Color
    , tabShadow : UI.Color
    }


type alias HueStages =
    { shade200 : UI.Color
    , shade400 : UI.Color
    , shade600 : UI.Color
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
        , shade600 = UI.intRGBA 0x0D1117FF
        , shade400 = UI.intRGBA 0x161B22FF
        , shade200 = UI.intRGBA 0x21262DFF
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
    , genericBlack = UI.intRGBA 0xFF
    , genericWhite = UI.intRGBA 0xFFFFFFFF
    , tabShadow = UI.intRGBA 0xF78166FF
    }
