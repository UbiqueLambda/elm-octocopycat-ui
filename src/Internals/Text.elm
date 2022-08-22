module Internals.Text exposing (body, h1, h2, h3, h4, h5, h6, headerTitle)

import Internals.Config exposing (Config(..))
import Internals.SSOT as SSOT
import UI


body : Config -> String -> UI.Graphics msgh
body (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r1
        >> UI.withFontWeight 400


headerTitle : Config -> String -> UI.Graphics msgh
headerTitle (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r2
        >> UI.withFontWeight 400


h1 : Config -> String -> UI.Graphics msgh
h1 (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r2
        >> UI.withFontWeight 600


h2 : Config -> String -> UI.Graphics msgh
h2 (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r1d5
        >> UI.withFontWeight 600


h3 : Config -> String -> UI.Graphics msgh
h3 (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r1d25
        >> UI.withFontWeight 600


h4 : Config -> String -> UI.Graphics msgh
h4 (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r1
        >> UI.withFontWeight 600


h5 : Config -> String -> UI.Graphics msgh
h5 (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r0d875
        >> UI.withFontWeight 600


h6 : Config -> String -> UI.Graphics msgh
h6 (Config { fontSizes }) =
    UI.spanText
        >> SSOT.withRootFontFamilies
        >> UI.withFontSize fontSizes.r0d85
        >> UI.withFontWeight 600
