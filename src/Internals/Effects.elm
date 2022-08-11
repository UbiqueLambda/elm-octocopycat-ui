module Internals.Effects exposing (Effects(..), none)


type Effects msg
    = None
    | Cons (Effects msg)


none : Effects msg
none =
    None
