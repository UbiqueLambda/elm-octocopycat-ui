module Pages.Home.View exposing (view)

import DesignSystem as DS
import Pages.Home.Model exposing (Model)
import UI


view : DS.RenderConfig -> Model -> DS.Canvas -> DS.Page msg
view _ _ _ =
    UI.looseText "HELLO WORLD"
        |> DS.page "Showcase"
