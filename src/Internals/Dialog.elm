module Internals.Dialog exposing (Dialog(..), dialog, map, view)

import Internals.Config exposing (Config)
import Internals.Palette as Palette
import Internals.SSOT as SSOT
import Internals.Text as Text
import UI


type Dialog msg
    = Dialog { closeMsg : msg, title : String, contents : UI.Graphics msg }


dialog : msg -> String -> UI.Graphics msg -> Dialog msg
dialog closeMsg title contents =
    Dialog { closeMsg = closeMsg, title = title, contents = contents }


map : (a -> b) -> Dialog a -> Dialog b
map applier (Dialog dialog_) =
    Dialog
        { closeMsg = applier dialog_.closeMsg
        , title = dialog_.title
        , contents = UI.map applier dialog_.contents
        }


view : Config -> Int -> Int -> Dialog msg -> ( String, UI.Graphics msg )
view ds screenWidth screenHeight (Dialog { contents, title, closeMsg }) =
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
            [ Text.h5 ds title
                |> UI.withWidth (width_ - 48)
                |> UI.withAlignSelf UI.center
                |> UI.withPaddingXY 16 0
            , UI.spanText "X"
                |> UI.withHeight 18
                |> UI.withWidth 12
                |> UI.withTextAlign UI.textCenter
                |> UI.withPadding 16
                |> UI.withOnClick closeMsg
            ]
            |> UI.withJustifyItems UI.center
            |> UI.withBackground (Just <| Palette.backgroundColor ds Palette.background600)
            |> UI.withBorder
                (UI.border1uBlack
                    |> UI.borderWithWidthEach { top = 0, right = 0, bottom = 1, left = 0 }
                    |> Palette.borderWithColor ds Palette.background300
                    |> Just
                )
            |> UI.withWidth width_
        , contents
        ]
        |> UI.withBackground (Just <| Palette.backgroundColor ds Palette.background700)
        |> UI.withAlignSelf UI.center
        |> UI.withBorder (UI.border1uBlack |> Palette.borderWithColor ds Palette.background300 |> SSOT.withBoxRounding |> Just)
    )
