module Pages.Basics.View exposing (view)

import DesignSystem as DS exposing (background500, background700)
import Pages.Basics.Model exposing (Dialog(..), Model)
import Pages.Basics.Msg as Msg exposing (Msg)
import UI


view : DS.Config -> Model -> DS.Canvas -> DS.Page Msg
view ds model canvas =
    UI.indexedRow
        [ UI.indexedColumn
            [ DS.textH4 ds "Buttons"
            , DS.textH4 ds "Tabs"
            , DS.textH4 ds "Radio Buttons"
            ]
            |> UI.withWidth 318
            |> UI.withHeight (canvas.height - 32)
            |> UI.withSpacing 16
            |> UI.withPadding 16
            |> UI.withBackground
                (DS.backgroundColor ds background700 |> Just)
            |> UI.withBorder
                (UI.border1uBlack
                    |> UI.borderWithWidthEach { top = 0, right = 1, bottom = 0, left = 0 }
                    |> DS.borderWithColor ds background500
                    |> Just
                )
        , UI.indexedColumn
            [ buttonsView ds
            ]
            |> UI.withWidth (canvas.width - 382)
            |> UI.withHeight (canvas.height - 32)
            |> UI.withPadding 16
            |> UI.withSpacing 48
            |> UI.withScrollingX (UI.scrollInsetAlwaysVisible |> Just)
            |> UI.withScrollingY (UI.scrollInsetAlwaysVisible |> Just)
        ]
        |> DS.page "Showcase: Basic elements"
        |> DS.pageWithDialog (dialogSetup ds model.dialog)


buttonsView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Buttons"
        , UI.indexedRow
            [ button "Background" ds DS.background
            , button "Primary" ds DS.primary
            , button "Success" ds DS.success
            , button "Danger" ds DS.danger
            ]
            |> UI.withSpacing 16
        ]
        |> UI.withSpacing 16


button label ds hue =
    UI.indexedColumn
        [ DS.textH4 ds label
        , DS.button "Go to Google"
            |> DS.buttonWithColors hue
            |> DS.buttonWithOnClick (Msg.OnButton label)
            |> DS.buttonToUI ds
        ]
        |> UI.withSpacing 16


dialogSetup ds dialogModel =
    case dialogModel of
        Just (ButtonDemo _) ->
            DS.dialog Msg.CloseDialog
                "Demo dialog"
                |> Just

        Nothing ->
            Nothing
