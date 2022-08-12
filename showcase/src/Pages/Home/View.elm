module Pages.Home.View exposing (view)

import DesignSystem as DS exposing (background200, background600)
import Pages.Home.Model exposing (Model)
import UI


view : DS.RenderConfig -> Model -> DS.Canvas -> DS.Page msg
view renderConfig model canvas =
    UI.indexedRow
        [ UI.indexedColumn
            [ UI.looseText "Sidebar" ]
            |> UI.withWidth 350
            |> UI.withHeight canvas.height
            |> UI.withBackground
                (DS.backgroundColor renderConfig background600 |> Just)
            |> UI.withBorder
                (UI.border1uBlack
                    |> UI.borderWithWidthEach { top = 0, right = 1, bottom = 0, left = 0 }
                    |> DS.borderWithColor renderConfig background200
                    |> Just
                )
        , UI.looseText "HELLO WORLD"
        ]
        |> DS.page "Showcase"
