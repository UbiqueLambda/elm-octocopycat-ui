module Internals.Dialog exposing (Dialog(..), dialog, map, view)

import Internals.Palette as Palette
import Internals.RenderConfig exposing (RenderConfig)
import Internals.SSOT as SSOT
import UI


type Dialog msg
    = Dialog { closeMsg : msg, title : String, contents : UI.Graphics msg }


dialog : msg -> String -> Dialog msg
dialog closeMsg title =
    Dialog { closeMsg = closeMsg, title = title, contents = UI.empty }


map : (a -> b) -> Dialog a -> Dialog b
map applier (Dialog dialog_) =
    Dialog
        { closeMsg = applier dialog_.closeMsg
        , title = dialog_.title
        , contents = UI.map applier dialog_.contents
        }


view : RenderConfig -> Int -> Int -> Dialog msg -> ( String, UI.Graphics msg )
view renderConfig screenWidth screenHeight (Dialog { contents, title, closeMsg }) =
    let
        width_ =
            if screenWidth < 640 then
                screenWidth

            else
                448
    in
    ( "dialog"
    , UI.indexedColumn
        [ UI.indexedRow
            [ UI.spanText title
            , UI.spanText "X"
                |> UI.withOnClick closeMsg
            ]
            |> UI.withJustifyItems UI.center
            |> UI.withBackground (Just <| Palette.backgroundColor renderConfig Palette.background600)
            |> UI.withPadding 16
            |> UI.withWidth width_
            |> UI.withHeight 21
        , contents
        ]
        |> UI.withBackground (Just <| Palette.backgroundColor renderConfig Palette.background700)
        |> UI.withAlignSelf UI.center
        |> UI.withBorder (UI.border1uBlack |> Palette.borderWithColor renderConfig Palette.background300 |> SSOT.withBoxRounding |> Just)
    )
