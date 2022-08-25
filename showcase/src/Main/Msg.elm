module Main.Msg exposing (Msg(..), PageMsg(..))

import DesignSystem as DS
import Pages.Basics.Msg as Basics
import Pages.Complex.Msg as Complex
import Pages.Core.Msg as Core
import Pages.Route exposing (Route)


type Msg
    = ForDocument DS.DocumentMsg
    | ForPage PageMsg
    | GoToInternal Route
    | OnResize Int Int


type PageMsg
    = ForBasics Basics.Msg
    | ForCore Core.Msg
    | ForComplex Complex.Msg
