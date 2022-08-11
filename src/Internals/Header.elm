module Internals.Header exposing (Header, Model, Msg, header, height, init, update, view)

import Internals.Effects as Effects exposing (Effects)
import Internals.RenderConfig exposing (RenderConfig)
import UI


type alias Header =
    ()


type alias Model =
    ()


type alias Msg =
    ()


init : Model
init =
    ()


header : Model -> Header
header _ =
    ()


update : Msg -> Model -> ( Model, Effects Msg )
update _ model =
    ( model, Effects.none )


view : RenderConfig -> Int -> Header -> UI.Graphics Msg
view _ _ _ =
    UI.empty


height : RenderConfig -> Header -> Int
height _ _ =
    0
