module Main.Msg exposing (Msg(..), PageMsg(..))

import DesignSystem as DS
import Pages.Home.Msg as Home


type Msg
    = ForDocument DS.DocumentMsg
    | ForPage PageMsg
    | OnResize Int Int


type PageMsg
    = ForHome Home.Msg
