module Main.Update exposing (update)

import DesignSystem as DS
import Effects exposing (Effects)
import Main.Model exposing (Model, Pages(..))
import Main.Msg exposing (Msg(..), PageMsg(..))
import Pages.Home.Update as Home


update : Msg -> Model -> ( Model, Effects Msg )
update msg model =
    case msg of
        ForDocument documentMsg ->
            let
                ( document, effects ) =
                    DS.documentUpdate documentMsg model.document
            in
            ( { model | document = document }, Effects.none )

        OnResize newWidth newHeight ->
            ( { model
                | renderConfig =
                    DS.renderConfigOnResize
                        { deviceWidth = newWidth, deviceHeight = newHeight }
                        model.renderConfig
              }
            , Effects.none
            )

        ForPage pageMsg ->
            let
                ( newPageModel, pageEffects ) =
                    forPage pageMsg model.page
            in
            ( { model | page = newPageModel }
            , pageEffects
            )


forPage msg model =
    case msg of
        ForHome pageMsg ->
            case model of
                Home pageModel ->
                    Home.update pageMsg pageModel
                        |> Tuple.mapBoth Home
                            (Effects.map (ForHome >> ForPage))
