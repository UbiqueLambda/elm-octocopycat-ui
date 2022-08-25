module Main.Update exposing (update)

import DesignSystem as DS
import Effects exposing (Effects)
import Main.Model exposing (Model, Pages(..))
import Main.Msg exposing (Msg(..), PageMsg(..))
import Pages.Basics.Model as Basics
import Pages.Basics.Update as Basics
import Pages.Complex.Model as Complex
import Pages.Complex.Update as Complex
import Pages.Core.Model as Core
import Pages.Core.Update as Core
import Pages.Route exposing (Route(..))


update : Msg -> Model -> ( Model, Effects Msg )
update msg model =
    case msg of
        ForDocument documentMsg ->
            let
                ( document, effects ) =
                    DS.documentUpdate documentMsg model.document
            in
            ( { model | document = document }, Effects.none )

        ForPage pageMsg ->
            let
                ( newPageModel, pageEffects ) =
                    forPage pageMsg model.page
            in
            ( { model | page = newPageModel }
            , pageEffects
            )

        GoToInternal route ->
            pageChange route model

        OnResize newWidth newHeight ->
            ( { model
                | ds =
                    DS.configOnResize
                        { deviceWidth = newWidth, deviceHeight = newHeight }
                        model.ds
              }
            , Effects.none
            )


forPage : PageMsg -> Pages -> ( Pages, Effects Msg )
forPage msg model =
    case msg of
        ForBasics pageMsg ->
            case model of
                BasicsPage pageModel ->
                    Basics.update pageMsg pageModel
                        |> Tuple.mapBoth BasicsPage
                            (Effects.map (ForBasics >> ForPage))

                _ ->
                    ( model, Effects.none )

        ForCore pageMsg ->
            case model of
                CorePage pageModel ->
                    Core.update pageMsg pageModel
                        |> Tuple.mapBoth CorePage
                            (Effects.map (ForCore >> ForPage))

                _ ->
                    ( model, Effects.none )

        ForComplex pageMsg ->
            case model of
                ComplexPage pageModel ->
                    Complex.update pageMsg pageModel
                        |> Tuple.mapBoth ComplexPage
                            (Effects.map (ForComplex >> ForPage))

                _ ->
                    ( model, Effects.none )


pageChange : Route -> Model -> ( Model, Effects Msg )
pageChange route model =
    let
        pageApply modelMap msgMap ( pageModel, pageEffects ) =
            ( { model | page = modelMap pageModel }
            , Effects.map (msgMap >> ForPage) pageEffects
            )
    in
    case route of
        GoToBasics ->
            pageApply BasicsPage ForBasics Basics.init

        GoToCore ->
            pageApply CorePage ForCore Core.init

        GoToComplex ->
            pageApply ComplexPage ForComplex Complex.init
