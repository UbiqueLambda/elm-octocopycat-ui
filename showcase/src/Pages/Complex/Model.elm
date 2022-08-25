module Pages.Complex.Model exposing (Dialog(..), Model, init)

import Effects exposing (Effects)
import Pages.Complex.Msg exposing (Msg)


type alias Model =
    { dialog : Maybe Dialog }


type Dialog
    = ButtonDemo String


init : ( Model, Effects Msg )
init =
    ( { dialog = Nothing }
    , Effects.none
    )
