module Internals.Helpers exposing (Canvas)


type alias Canvas =
    { width : Int
    , height : Int
    , clipX : Bool
    , clipY : Bool
    }
