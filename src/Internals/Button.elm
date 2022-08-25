module Internals.Button exposing (Button(..), button, toUI, withColors, withOnClick)

import Internals.Config as Config exposing (Config(..))
import Internals.Palette as Palette exposing (Hue)
import Internals.SSOT as SSOT
import UI


type Button msg
    = Button
        { label : String
        , hue : Palette.Hue

        --, icon : Maybe Icon
        --, badge : Maybe Badge
        , dropdown : Maybe msg
        , onClickMsg : Maybe msg -- Nothing => Disabled
        }


button : String -> Button msg
button label =
    Button
        { label = label
        , hue = Palette.Background
        , dropdown = Nothing
        , onClickMsg = Nothing
        }


withColors : Hue -> Button msg -> Button msg
withColors newHue (Button button_) =
    Button { button_ | hue = newHue }


withOnClick : msg -> Button msg -> Button msg
withOnClick onClickMsg (Button button_) =
    Button { button_ | onClickMsg = Just onClickMsg }


toUI : Config -> Button msg -> UI.Graphics msg
toUI ds (Button button_) =
    let
        ( backgroundColor, textColor, borderColor ) =
            colors ds button_.hue

        uiWithOnClick =
            case button_.onClickMsg of
                Just onClickMsg_ ->
                    UI.withOnClick onClickMsg_

                Nothing ->
                    identity
    in
    UI.spanText button_.label
        |> SSOT.withRootFontFamilies
        |> UI.withFontSize (Config.rem0d875 ds)
        |> UI.withFontWeight 400
        |> UI.withFontColor textColor
        |> UI.withPaddingXY 16 7
        |> UI.withBorder (UI.border1uBlack |> UI.borderWithColor borderColor |> SSOT.withBoxRounding |> Just)
        |> UI.withBackground (UI.backgroundColor backgroundColor |> Just)
        |> uiWithOnClick


{-| (background, text, border)
-}
colors : Config -> Palette.Hue -> ( UI.Color, UI.Color, UI.Color )
colors (Config { theme }) hue =
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


hoverColors : Config -> Palette.Hue -> ( UI.Color, UI.Color )
hoverColors (Config { theme }) hue =
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
