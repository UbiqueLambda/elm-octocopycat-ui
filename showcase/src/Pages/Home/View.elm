module Pages.Home.View exposing (view)

import DesignSystem as DS exposing (background500, background700)
import Pages.Home.Model exposing (Model)
import UI


view : DS.RenderConfig -> Model -> DS.Canvas -> DS.Page msg
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
            |> UI.withPadding 16
            |> UI.withSpacing 48
        ]
        |> DS.page "Showcase"


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
        , DS.button "Go to Google"
            |> DS.buttonToUI renderConfig
        ]
        |> UI.withSpacing 16
