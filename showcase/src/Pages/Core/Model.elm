module Pages.Core.Model exposing (Dialog(..), Model, init)

import Effects exposing (Effects)
import Pages.Core.Msg exposing (Msg)


type alias Model =
    { dialog : Maybe Dialog }


type Dialog
    = ButtonDemo String


init : ( Model, Effects Msg )
init =
    ( { dialog = Nothing }
    , Effects.none
    )
