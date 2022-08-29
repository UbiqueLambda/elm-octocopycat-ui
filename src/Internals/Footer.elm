module Internals.Footer exposing (Footer, footer, height, view)

import Internals.Config exposing (Config)
import UI


type Footer msg
    = Footer ()


footer : String -> List ( String, msg ) -> Footer msg
footer _ _ =
    Footer ()


height : Config -> Footer msg -> Int
height _ _ =
    0


view : Config -> Int -> Footer msg -> UI.Graphics msg
view _ _ _ =
    UI.empty
