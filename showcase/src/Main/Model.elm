module Main.Model exposing (Flags, Model, Pages(..), init)

import DesignSystem as DS
import Effects exposing (Effects)
import Main.Msg as Msg exposing (Msg)
import Pages.Basics.Model as Basics
import Pages.Core.Model as Core


type alias Flags =
    { innerWidth : Int
    , innerHeight : Int
    }


type alias Model =
    { document : DS.DocumentModel
    , ds : DS.Config
    , page : Pages
    }


type Pages
    = CorePage Core.Model
    | BasicsPage Basics.Model


init : Flags -> ( Model, Effects Msg )
init { innerWidth, innerHeight } =
    let
        ( pageModel, pageEffects ) =
            Core.init
    in
    ( { document = DS.documentInit
      , ds = DS.configInit { deviceWidth = innerWidth, deviceHeight = innerHeight }
      , page = CorePage pageModel
      }
    , Effects.map (Msg.ForCore >> Msg.ForPage) pageEffects
    )
