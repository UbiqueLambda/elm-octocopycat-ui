module Web exposing (main)

import Browser
import Browser.Events as Browser
import DesignSystem as DS
import Effects exposing (Effect(..), Effects)
import Main.Model as Model exposing (Flags, Model)
import Main.Msg as Msg exposing (Msg)
import Main.Subscriptions as Subscriptions
import Main.Update as Update
import Main.View as View
import Task
import UI.Renderer.Html as UIHtml


main : Program Flags Model Msg
main =
    Browser.document
        { init =
            \flags ->
                Model.init flags
                    |> Tuple.mapSecond performEffects
        , subscriptions =
            \model ->
                Sub.batch
                    [ Browser.onResize Msg.OnResize
                    , Subscriptions.subscriptions model
                    ]
        , update =
            \msg model ->
                Update.update msg model
                    |> Tuple.mapSecond performEffects
        , view =
            \model ->
                DS.documentToElmDocument
                    (UIHtml.encode htmlEncoder)
                    model.ds
                    (View.document model)
                    (View.pageCase model.ds model)
        }


htmlEncoder : UIHtml.Encoder
htmlEncoder =
    UIHtml.init


performEffects : Effects msg -> Cmd msg
performEffects =
    Effects.foldr
        (\effect accu -> performEffect effect :: accu)
        []
        >> Cmd.batch


performEffect : Effect msg -> Cmd msg
performEffect effect =
    case effect of
        Loop msg ->
            Task.perform identity <| Task.succeed msg
