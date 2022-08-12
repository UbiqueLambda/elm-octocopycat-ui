module Main.Msg exposing (Msg(..))

import DesignSystem as DS


type Msg
    = ForDocument DS.DocumentMsg
    | OnResize Int Int
    | ToDo
