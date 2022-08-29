module Internals.Effects exposing (Effect(..), Effects, batch, foldr, map, none, toElmCmd)

import Task


type Effect msg
    = Loop msg


type alias Effects msg =
    List (Effect msg)


batch : List (Effects msg) -> Effects msg
batch =
    List.concat


foldr : (Effect msg -> a -> a) -> a -> Effects msg -> a
foldr =
    List.foldr


map : (a -> b) -> Effects a -> Effects b
map applier =
    List.map (effectMap applier)


none : Effects msg
none =
    []


toElmCmd : Effects msg -> Cmd msg
toElmCmd =
    foldr
        (\effect accu -> performEffect effect :: accu)
        []
        >> Cmd.batch


effectMap : (a -> b) -> Effect a -> Effect b
effectMap applier effect =
    case effect of
        Loop oldMsg ->
            Loop (applier oldMsg)


performEffect : Effect msg -> Cmd msg
performEffect effect =
    case effect of
        Loop msg ->
            Task.perform identity <| Task.succeed msg
