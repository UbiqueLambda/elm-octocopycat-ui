module Internals.Button exposing (Button(..), button, toUI, withColors, withOnClick)

import Internals.Badge exposing (Badge)
import Internals.Icons exposing (Icon)
import Internals.Palette as Palette exposing (Hue)
import Internals.RenderConfig exposing (RenderConfig(..))
import Internals.SSOT as SSOT
import UI


type Button msg
    = Button
        { label : String
        , hue : Palette.Hue
        , icon : Maybe Icon
        , badge : Maybe Badge
        , dropdown : Maybe msg
        , onClickMsg : Maybe msg -- Nothing => Disabled
        }


button : String -> Button msg
button label =
    Button
        { label = label
        , hue = Palette.Background
        , icon = Nothing
        , badge = Nothing
        , dropdown = Nothing
        , onClickMsg = Nothing
        }


withColors : Hue -> Button msg -> Button msg
withColors newHue (Button button_) =
    Button { button_ | hue = newHue }


withOnClick : msg -> Button msg -> Button msg
withOnClick onClickMsg (Button button_) =
    Button { button_ | onClickMsg = Just onClickMsg }


toUI : RenderConfig -> Button msg -> UI.Graphics msg
toUI renderConfig (Button button_) =
    let
        ( backgroundColor, textColor, borderColor ) =
            colors renderConfig button_.hue

        uiWithOnClick =
            case button_.onClickMsg of
                Just onClickMsg_ ->
                    UI.withOnClick onClickMsg_

                Nothing ->
                    identity
    in
    UI.spanText button_.label
        |> UI.withFontSize 14
        |> UI.withPaddingXY 16 7
        |> UI.withFontColor textColor
        |> UI.withBorder (UI.border1uBlack |> UI.borderWithColor borderColor |> SSOT.withBoxRounding |> Just)
        |> UI.withBackground (UI.backgroundColor backgroundColor |> Just)
        |> uiWithOnClick


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
