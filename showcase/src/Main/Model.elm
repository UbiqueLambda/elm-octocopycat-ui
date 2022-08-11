module Main.Model exposing (Flags, Model, Pages(..), init)

import DesignSystem as DS
import Main.Msg exposing (Msg)
import Pages.Home.Model as Home


type alias Flags =
    {}


type alias Model =
    { document : DS.DocumentModel
    , renderConfig : DS.RenderConfig
    , page : Pages
    }


type Pages
    = Home Home.Model


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { document = DS.documentInit
      , renderConfig = DS.renderConfigInit { deviceWidth = 1920, deviceHeight = 1080 }
      , page = Home Home.init
      }
    , Cmd.none
    )
