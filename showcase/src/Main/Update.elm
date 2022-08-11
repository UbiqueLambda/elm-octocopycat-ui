module Main.Update exposing (update)

import DesignSystem as DS
import Main.Model exposing (Model)
import Main.Msg exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ForDocument documentMsg ->
            let
                ( document, effects ) =
                    DS.documentUpdate documentMsg model.document
            in
            ( { model | document = document }, Cmd.none )

        ToDo ->
            ( model, Cmd.none )
