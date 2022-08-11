module Main.View exposing (document, pageCase)

import DesignSystem as DS
import Main.Model exposing (Model, Pages(..))
import Main.Msg as Msg exposing (Msg)
import Pages.Home.View as Home
import UI


document : Model -> DS.Document Msg
document model =
    DS.document Msg.ForDocument model.document


pageCase : DS.RenderConfig -> Model -> DS.Canvas -> DS.Page Msg
pageCase renderConfig model =
    case model.page of
        Home homeModel ->
            Home.view renderConfig homeModel
