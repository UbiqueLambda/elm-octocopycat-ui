module Internals.Header exposing (Header, Model, Msg, header, height, init, update, view)

import Internals.Effects as Effects exposing (Effects)
import Internals.Palette as Palette exposing (background400)
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
view renderConfig width _ =
    [ UI.spanText "Components"
    , UI.spanText "Issues"
    , UI.spanText "Marketplace"
    , UI.spanText "Explorer"
    ]
        |> List.map (UI.withAlignSelf UI.center)
        |> UI.indexedRow
        |> UI.withFontWeight 600
        |> UI.withFontSize 14
        |> UI.withWidth (width - 64)
        |> UI.withHeight 30
        |> UI.withPaddingXY 32 16
        |> UI.withSpacing 16
        |> UI.withBackground
            (Palette.backgroundColor renderConfig background400 |> Just)


height : RenderConfig -> Header -> Int
height _ _ =
    62
