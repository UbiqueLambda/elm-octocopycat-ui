module Internals.Footer exposing (Footer, Model, Msg, footer, height, init, update, view)

import Internals.Effects as Effects exposing (Effects)
import Internals.RenderConfig exposing (RenderConfig)
import UI


type alias Footer =
    ()


type alias Model =
    ()


type alias Msg =
    ()


init : Model
init =
    ()


footer : Model -> Footer
footer _ =
    ()


update : Msg -> Model -> ( Model, Effects Msg )
update _ model =
    ( model, Effects.none )


view : RenderConfig -> Int -> Footer -> UI.Graphics Msg
view _ _ _ =
    UI.empty


height : RenderConfig -> Footer -> Int
height _ _ =
    0
