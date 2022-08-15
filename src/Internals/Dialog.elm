module Internals.Dialog exposing (Dialog(..), dialog, view)

import Internals.RenderConfig exposing (RenderConfig)
import UI


type Dialog msg
    = Dialog { closeMsg : msg, title : String, contents : UI.Graphics msg }


dialog : String -> msg -> Dialog msg
dialog title closeMsg =
    Dialog { closeMsg = closeMsg, title = title, contents = UI.empty }


view : RenderConfig -> Int -> Int -> Dialog msg -> ( String, UI.Graphics msg )
view _ _ _ (Dialog { contents, title, closeMsg }) =
    ( "dialog"
    , UI.indexedColumn
        [ UI.indexedRow
            [ UI.spanText title
            , UI.spanText "X"
                |> UI.withOnClick closeMsg
            ]
        , contents
        ]
    )
