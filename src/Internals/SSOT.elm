module Internals.SSOT exposing (withBoxRounding)

import UI


withBoxRounding : UI.Border -> UI.Border
withBoxRounding =
    UI.borderWithRounding 6
