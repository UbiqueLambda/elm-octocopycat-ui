module Pages.Basics.Update exposing (..)

import Effects exposing (Effects)
import Pages.Basics.Model as Model exposing (Model)
import Pages.Basics.Msg exposing (Msg(..))


update : Msg -> Model -> ( Model, Effects Msg )
update msg model =
    case msg of
        CloseDialog ->
            ( { model | dialog = Nothing }
            , Effects.none
            )

        OnButton content ->
            ( { model | dialog = Just <| Model.ButtonDemo content }
            , Effects.none
            )
