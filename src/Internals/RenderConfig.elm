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
        { shade800 = UI.intRGBA 0xFF
        , shade600 = UI.intRGBA 0xFF
        , shade400 = UI.intRGBA 0xFF
        , shade200 = UI.intRGBA 0xFF
        }
    , danger =
        { shade800 = UI.intRGBA 0xFF
        , shade600 = UI.intRGBA 0xFF
        , shade400 = UI.intRGBA 0xFF
        , shade200 = UI.intRGBA 0xFF
        }
    , success =
        { shade800 = UI.intRGBA 0xFF
        , shade600 = UI.intRGBA 0xFF
        , shade400 = UI.intRGBA 0xFF
        , shade200 = UI.intRGBA 0xFF
        }
    , genericBlack = UI.intRGBA 0xFF
    , genericWhite = UI.intRGBA 0xFFFFFFFF
    }
