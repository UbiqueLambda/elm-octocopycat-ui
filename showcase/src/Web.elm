module Web exposing (main)

import Browser
import DesignSystem as DS
import Main.Model as Model exposing (Flags, Model)
import Main.Msg exposing (Msg)
import Main.Update as Update
import Main.View as View
import UI.Renderer.Html as UIHtml


main : Program Flags Model Msg
main =
    Browser.document
        { init = Model.init
        , subscriptions = \_ -> Sub.none
        , update = Update.update
        , view =
            \model ->
                DS.documentToElmDocument
                    (UIHtml.encode htmlEncoder)
                    model.renderConfig
                    (View.document model)
                    (View.pageCase model.renderConfig model)
        }


htmlEncoder : UIHtml.Encoder
htmlEncoder =
    UIHtml.init
