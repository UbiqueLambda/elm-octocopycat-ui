module Pages.Home.Model exposing (Dialog(..), Model, init)


type alias Model =
    { dialog : Maybe Dialog }


type Dialog
    = ButtonDemo String


init : Model
init =
    { dialog = Nothing }
