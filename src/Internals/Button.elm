module Internals.Button exposing (Button(..), Style(..), toUI)

import Internals.RenderConfig exposing (RenderConfig)
import UI


type Style
    = Background -- Normal background and white text
    | Success -- Green background with white text
    | Danger -- Normal background with red text


type Button msg
    = Button
        { label : String
        , style : Style
        , icon : Maybe Icon
        , badge : Maybe Badge
        , dopdown : Maybe msg
        , onClick : Maybe msg -- Nothing => Disabled
        }


toUI : RederConfig -> Button msg -> UI.Graphics msg
toUI _ _ =
    UI.empty
