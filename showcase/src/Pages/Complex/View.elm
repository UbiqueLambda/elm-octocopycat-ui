module Pages.Complex.View exposing (view)

import DesignSystem as DS exposing (background500, background700)
import Pages.Complex.Model exposing (Dialog(..), Model)
import Pages.Complex.Msg as Msg exposing (Msg)
import UI


view : DS.Config -> Model -> DS.Canvas -> DS.Page Msg
view ds model canvas =
    UI.indexedRow
        [ UI.indexedColumn
            [ DS.textH4 ds "Todo"
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
            [ todoView ds
            ]
            |> UI.withWidth (canvas.width - 382)
            |> UI.withHeight (canvas.height - 32)
            |> UI.withPadding 16
            |> UI.withSpacing 48
            |> UI.withScrollingX (UI.scrollInsetAlwaysVisible |> Just)
            |> UI.withScrollingY (UI.scrollInsetAlwaysVisible |> Just)
        ]
        |> DS.page "Showcase: Complex elements"


todoView : DS.Config -> UI.Graphics msg
todoView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "ToDo"
        , DS.textBody ds "(Not ready yet.)"
        ]
        |> UI.withSpacing 16
