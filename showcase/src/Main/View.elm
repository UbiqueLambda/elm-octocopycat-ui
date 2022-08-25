module Main.View exposing (document, pageCase)

import DesignSystem as DS
import Main.Model exposing (Model, Pages(..))
import Main.Msg as Msg exposing (Msg)
import Pages.Basics.View as Basics
import Pages.Complex.View as Complex
import Pages.Core.View as Core
import Pages.Route as Route
import UI


document : Model -> DS.Document Msg
document model =
    DS.document Msg.ForDocument
        model.document
        |> DS.headerWithItems
            [ ( "Core", Msg.GoToInternal Route.GoToCore )
            , ( "Basics", Msg.GoToInternal Route.GoToBasics )
            , ( "Complex", Msg.GoToInternal Route.GoToComplex ) -- TODO: Dialogs, Button with Toolbox
            ]


pageCase : DS.Config -> Model -> DS.Canvas -> DS.Page Msg
pageCase ds model =
    case model.page of
        BasicsPage pageModel ->
            Basics.view ds pageModel
                >> DS.pageMap (Msg.ForBasics >> Msg.ForPage)

        CorePage pageModel ->
            Core.view ds pageModel
                >> DS.pageMap (Msg.ForCore >> Msg.ForPage)

        ComplexPage pageModel ->
            Complex.view ds pageModel
                >> DS.pageMap (Msg.ForComplex >> Msg.ForPage)
