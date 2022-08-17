module Internals.Button exposing (Button(..), button, toUI)

import Internals.Badge exposing (Badge)
import Internals.Icons exposing (Icon)
import Internals.Palette as Palette
import Internals.RenderConfig exposing (RenderConfig(..))
import UI


type Button msg
    = Button
        { label : String
        , hue : Palette.Hue
        , icon : Maybe Icon
        , badge : Maybe Badge
        , dropdown : Maybe msg
        , onClick : Maybe msg -- Nothing => Disabled
        }


button : String -> Button msg
button label =
    Button
        { label = label
        , hue = Palette.Background
        , icon = Nothing
        , badge = Nothing
        , dropdown = Nothing
        , onClick = Nothing
        }


toUI : RenderConfig -> Button msg -> UI.Graphics msg
toUI renderConfig (Button button_) =
    let
        ( backgroundColor, textColor, borderColor ) =
            colors renderConfig button_.hue
    in
    UI.spanText button_.label
        |> UI.withFontSize 14
        |> UI.withPaddingXY 16 7
        |> UI.withBorder (UI.border1uBlack |> UI.borderWithColor borderColor |> UI.borderWithRounding 6 |> Just)
        |> UI.withBackground (UI.backgroundColor backgroundColor |> Just)


{-| (background, text, border)
-}
colors : RenderConfig -> Palette.Hue -> ( UI.Color, UI.Color, UI.Color )
colors (RenderConfig { theme }) hue =
    case hue of
        Palette.Background ->
            ( theme.background.shade500
            , theme.background.shade100
            , theme.background.shade300
            )

        Palette.Success ->
            ( theme.success.shade800
            , theme.background.shade100
            , theme.success.shade800
            )

        Palette.Danger ->
            ( theme.background.shade500
            , theme.danger.shade200
            , theme.background.shade500
            )

        Palette.Primary ->
            ( theme.background.shade500
            , theme.primary.shade200
            , theme.background.shade500
            )


hoverColors : RenderConfig -> Palette.Hue -> ( UI.Color, UI.Color )
hoverColors (RenderConfig { theme }) hue =
    case hue of
        Palette.Background ->
            ( theme.background.shade200, theme.background.shade100 )

        Palette.Success ->
            ( theme.success.shade400, theme.background.shade100 )

        Palette.Danger ->
            ( theme.danger.shade600, theme.background.shade100 )

        Palette.Primary ->
            ( theme.background.shade300, theme.primary.shade200 )



-- TODO: disabledColors
