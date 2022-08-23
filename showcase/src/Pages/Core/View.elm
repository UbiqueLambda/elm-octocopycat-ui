module Pages.Core.View exposing (view)

import DesignSystem as DS exposing (background500, background700)
import Pages.Core.Model exposing (Dialog(..), Model)
import Pages.Core.Msg as Msg exposing (Msg)
import UI


view : DS.Config -> Model -> DS.Canvas -> DS.Page Msg
view ds model canvas =
    UI.indexedRow
        [ UI.indexedColumn
            [ DS.textH4 ds "Colors"
            , DS.textH4 ds "Typography"
            , DS.textH4 ds "Icons"
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
            [ colorsView ds
            , typoView ds
            ]
            |> UI.withWidth (canvas.width - 382)
            |> UI.withHeight (canvas.height - 32)
            |> UI.withPadding 16
            |> UI.withSpacing 48
            |> UI.withScrollingX (UI.scrollInsetAlwaysVisible |> Just)
            |> UI.withScrollingY (UI.scrollInsetAlwaysVisible |> Just)
        ]
        |> DS.page "Showcase: Core elements"


square ds color =
    UI.empty
        |> UI.withWidth 62
        |> UI.withHeight 62
        |> UI.withBackground (DS.backgroundColor ds color |> Just)
        |> UI.withBorder (UI.border1uBlack |> DS.borderWithColor ds DS.colorTabShadow |> Just)


colorsView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Colors"
        , DS.textH4 ds "Background"
        , UI.indexedRow
            [ square ds DS.background800
            , square ds DS.background700
            , square ds DS.background600
            , square ds DS.background500
            , square ds DS.background400
            , square ds DS.background300
            , square ds DS.background200
            , square ds DS.background100
            ]
            |> UI.withSpacing 16
        , DS.textH4 ds "Primary"
        , UI.indexedRow
            [ square ds DS.primary800
            , square ds DS.primary600
            , square ds DS.primary400
            , square ds DS.primary200
            ]
            |> UI.withSpacing 16
        , DS.textH4 ds "Success"
        , UI.indexedRow
            [ square ds DS.success800
            , square ds DS.success600
            , square ds DS.success400
            , square ds DS.success200
            ]
            |> UI.withSpacing 16
        , DS.textH4 ds "Danger"
        , UI.indexedRow
            [ square ds DS.danger800
            , square ds DS.danger600
            , square ds DS.danger400
            , square ds DS.danger200
            ]
            |> UI.withSpacing 16
        ]
        |> UI.withSpacing 16


typoView ds =
    UI.indexedColumn
        [ DS.textHeaderTitle ds "Typography (HeaderTitle)"
        , DS.textH1 ds "Example (H1)"
        , DS.textH2 ds "Example (H2)"
        , DS.textH3 ds "Example (H3)"
        , DS.textH4 ds "Example (H4)"
        , DS.textH5 ds "Example (H5)"
        , DS.textH6 ds "Example (H6)"
        , DS.textBody ds "Example (Body)"
        ]
        |> UI.withSpacing 16
