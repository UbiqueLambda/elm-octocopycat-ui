module Pages.Home.View exposing (view)

import DesignSystem as DS exposing (background500, background700)
import Pages.Home.Model exposing (Dialog(..), Model)
import Pages.Home.Msg as Msg exposing (Msg)
import UI


view : DS.RenderConfig -> Model -> DS.Canvas -> DS.Page Msg
view renderConfig model canvas =
    UI.indexedRow
        [ UI.indexedColumn
            [ UI.spanText "Colors"
            , UI.spanText "Typography"
            , UI.spanText "Buttons"
            ]
            |> UI.withWidth 318
            |> UI.withHeight (canvas.height - 32)
            |> UI.withSpacing 16
            |> UI.withPadding 16
            |> UI.withBackground
                (DS.backgroundColor renderConfig background700 |> Just)
            |> UI.withBorder
                (UI.border1uBlack
                    |> UI.borderWithWidthEach { top = 0, right = 1, bottom = 0, left = 0 }
                    |> DS.borderWithColor renderConfig background500
                    |> Just
                )
        , UI.indexedColumn
            [ colorsView renderConfig
            , typoView renderConfig
            , buttonsView renderConfig
            ]
            |> UI.withWidth (canvas.width - 382)
            |> UI.withHeight (canvas.height - 32)
            |> UI.withPadding 16
            |> UI.withSpacing 48
            |> UI.withScrollingX (UI.scrollInsetAlwaysVisible |> Just)
            |> UI.withScrollingY (UI.scrollInsetAlwaysVisible |> Just)
        ]
        |> DS.page "Showcase"
        |> DS.pageWithDialog (dialogSetup renderConfig model.dialog)


square renderConfig color =
    UI.empty
        |> UI.withWidth 62
        |> UI.withHeight 62
        |> UI.withBackground (DS.backgroundColor renderConfig color |> Just)
        |> UI.withBorder (UI.border1uBlack |> DS.borderWithColor renderConfig DS.colorTabShadow |> Just)


colorsView renderConfig =
    UI.indexedColumn
        [ UI.spanText "Colors"
        , UI.spanText "Background"
        , UI.indexedRow
            [ square renderConfig DS.background800
            , square renderConfig DS.background700
            , square renderConfig DS.background600
            , square renderConfig DS.background500
            , square renderConfig DS.background400
            , square renderConfig DS.background300
            , square renderConfig DS.background200
            , square renderConfig DS.background100
            ]
            |> UI.withSpacing 16
        , UI.spanText "Primary"
        , UI.indexedRow
            [ square renderConfig DS.primary800
            , square renderConfig DS.primary600
            , square renderConfig DS.primary400
            , square renderConfig DS.primary200
            ]
            |> UI.withSpacing 16
        , UI.spanText "Success"
        , UI.indexedRow
            [ square renderConfig DS.success800
            , square renderConfig DS.success600
            , square renderConfig DS.success400
            , square renderConfig DS.success200
            ]
            |> UI.withSpacing 16
        , UI.spanText "Danger"
        , UI.indexedRow
            [ square renderConfig DS.danger800
            , square renderConfig DS.danger600
            , square renderConfig DS.danger400
            , square renderConfig DS.danger200
            ]
            |> UI.withSpacing 16
        ]
        |> UI.withSpacing 16


typoView renderConfig =
    UI.spanText "Typography"
        |> UI.withSpacing 16


buttonsView renderConfig =
    UI.indexedColumn
        [ UI.spanText "Buttons"
        , UI.indexedRow
            [ button "Background" renderConfig DS.background
            , button "Primary" renderConfig DS.primary
            , button "Success" renderConfig DS.success
            , button "Danger" renderConfig DS.danger
            ]
            |> UI.withSpacing 16
        ]
        |> UI.withSpacing 16


button label renderConfig hue =
    UI.indexedColumn
        [ UI.spanText label
        , DS.button "Go to Google"
            |> DS.buttonWithColors hue
            |> DS.buttonWithOnClick (Msg.OnButton label)
            |> DS.buttonToUI renderConfig
        ]
        |> UI.withSpacing 16


dialogSetup renderConfig dialogModel =
    case dialogModel of
        Just (ButtonDemo _) ->
            DS.dialog Msg.CloseDialog
                "Demo dialog"
                |> Just

        Nothing ->
            Nothing
