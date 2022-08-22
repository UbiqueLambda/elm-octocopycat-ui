module Internals.SSOT exposing (withBoxRounding, withRootFontFamilies)

import UI


withBoxRounding : UI.Border -> UI.Border
withBoxRounding =
    UI.borderWithRounding 6


withRootFontFamilies : UI.Graphics msg -> UI.Graphics msg
withRootFontFamilies =
    UI.withFontFamilies
        [ "-apple-system"
        , "BlinkMacSystemFont"
        , "Segoe UI"
        , "Helvetica"
        , "Arial"
        ]
        UI.sansSerif
