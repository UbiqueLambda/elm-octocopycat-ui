module Internals.Effects exposing (Effect(..), Effects, batch, foldr, map, none)


type alias Effects msg =
    List (Effect msg)


type Effect msg
    = Loop msg


none : Effects msg
none =
    []


batch : List (Effects msg) -> Effects msg
batch =
    List.concat


map : (a -> b) -> Effects a -> Effects b
map applier =
    List.map (effectMap applier)


effectMap : (a -> b) -> Effect a -> Effect b
effectMap applier effect =
    case effect of
        Loop oldMsg ->
            Loop (applier oldMsg)


foldr : (Effect msg -> a -> a) -> a -> Effects msg -> a
foldr =
    List.foldr
