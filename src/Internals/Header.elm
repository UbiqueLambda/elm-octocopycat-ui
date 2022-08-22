module Internals.Header exposing
    ( Header
    , Model
    , Msg
    , header
    , height
    , init
    , update
    , view
    , withItems
    )

import Internals.Config as Config exposing (Config)
import Internals.Effects as Effects exposing (Effects)
import Internals.Palette as Palette exposing (background600)
import Internals.Text as Text
import UI


type Header msg
    = Header { items : List ( String, msg ), currentPage : Maybe String }


type Model
    = Model { dropdownOpen : Bool }


type Msg
    = ToggleDropdown Bool


init : Model
init =
    Model { dropdownOpen = False }


header : Model -> Header msg
header _ =
    Header { items = [], currentPage = Nothing }


withItems : List ( String, msg ) -> Header msg -> Header msg
withItems items (Header header_) =
    Header { header_ | items = items }


update : Msg -> Model -> ( Model, Effects Msg )
update msg (Model model) =
    case msg of
        ToggleDropdown newState ->
            ( Model { model | dropdownOpen = newState }, Effects.none )


view : Config -> (Msg -> msg) -> Int -> Header msg -> UI.Graphics msg
view ds _ width (Header { items }) =
    items
        |> List.map (itemView ds)
        |> UI.indexedRow
        |> UI.withWidth (width - 64)
        |> UI.withHeight 30
        |> UI.withPaddingXY 32 16
        |> UI.withSpacing 16
        |> UI.withBackground
            (Palette.backgroundColor ds background600 |> Just)


itemView : Config -> ( String, msg ) -> UI.Graphics msg
itemView ds ( label, msg ) =
    Text.h5 ds label
        |> UI.withAlignSelf UI.center
        |> UI.withOnClick msg


height : Config -> Header msg -> Int
height _ _ =
    62
