module Pages.Basics.View exposing (view)

import DesignSystem as DS exposing (background500, background700)
import Pages.Basics.Model exposing (Dialog(..), Model)
import Pages.Basics.Msg as Msg exposing (Msg)
import UI


view : DS.Config -> Model -> DS.Canvas -> DS.Page Msg
view ds model canvas =
    UI.indexedRow
        [ UI.indexedColumn
            [ DS.textH4 ds "Buttons"
            , DS.textH4 ds "Badges"
            , DS.textH4 ds "Tabs"
            , DS.textH4 ds "Radio Buttons"
            , DS.textH4 ds "Alerts"
            ]
            |> UI.withWidth 318
            |> UI.withHeight (canvas.height - 32)
            |> UI.withSpacing 16
            |> UI.withPadding 16
            |> UI.withBackground
                (DS.backgroundColor ds background700 |> Just)
            |> UI.withBorder
                (UI.border1uBlack
                    |> UI.borderWithWidthEach { top = 0, right = 1, bottom = 0, left = 0 }
                    |> DS.borderWithColor ds background500
                    |> Just
                )
        , UI.indexedColumn
            [ buttonsView ds
            , badgesView ds
            , tabsView ds
            , radioView ds
            , alertsView ds
            ]
            |> UI.withWidth (canvas.width - 382)
            |> UI.withHeight (canvas.height - 32)
            |> UI.withPadding 16
            |> UI.withSpacing 48
            |> UI.withScrollingX (UI.scrollInsetAlwaysVisible |> Just)
            |> UI.withScrollingY (UI.scrollInsetAlwaysVisible |> Just)
        ]
        |> DS.page "Showcase: Basic elements"
        |> DS.pageWithDialog (dialogSetup ds model.dialog)


buttonsView : DS.Config -> UI.Graphics Msg
buttonsView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Buttons"
        , UI.indexedRow
            [ button ds "Background" DS.background
            , button ds "Primary" DS.primary
            , button ds "Success" DS.success
            , button ds "Danger" DS.danger
            ]
            |> UI.withSpacing 16
        ]
        |> UI.withSpacing 16


button : DS.Config -> String -> DS.Hue -> UI.Graphics Msg
button ds label hue =
    UI.indexedColumn
        [ DS.textH4 ds label
        , DS.button "Go to Google"
            |> DS.buttonWithColors hue
            |> DS.buttonWithOnClick (Msg.OnButton label)
            |> DS.buttonToUI ds
        ]
        |> UI.withSpacing 16


dialogSetup : DS.Config -> Maybe Dialog -> Maybe (DS.Dialog Msg)
dialogSetup ds dialogModel =
    case dialogModel of
        Just (ButtonDemo buttonName) ->
            UI.indexedColumn
                [ DS.textBody ds "This is an example of a dialog box."
                , DS.textBody ds <| "You've clicked the \"" ++ buttonName ++ "\" button."
                ]
                |> UI.withPadding 16
                |> UI.withSpacing 16
                |> DS.dialog Msg.CloseDialog
                    "Dialog demo"
                |> Just

        Nothing ->
            Nothing


badgesView : DS.Config -> UI.Graphics msg
badgesView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Badges"
        , DS.textBody ds "(Not ready yet.)"
        ]
        |> UI.withSpacing 16


tabsView : DS.Config -> UI.Graphics msg
tabsView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Tabs"
        , DS.textBody ds "(Not ready yet.)"
        ]
        |> UI.withSpacing 16


radioView : DS.Config -> UI.Graphics msg
radioView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Radio Buttons"
        , DS.textBody ds "(Not ready yet.)"
        ]
        |> UI.withSpacing 16


alertsView : DS.Config -> UI.Graphics msg
alertsView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Alerts"
        , DS.textBody ds "(Not ready yet.)"
        ]
        |> UI.withSpacing 16
