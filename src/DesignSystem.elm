module DesignSystem exposing
    ( Config, configInit, configOnResize
    , configGetDeviceHeight, configGetDeviceWidth
    , rem0d85, rem0d875, rem1, rem1d25, rem1d5, rem2, rem
    , Button, button, buttonWithColors, buttonWithOnClick, buttonToUI
    , Dialog, dialog, dialogMap
    , Page, page, pageMap, pageWithDialog
    , Document, DocumentMsg, DocumentModel, document, documentInit, documentUpdate, headerWithItems
    , Canvas, documentToElm
    , Effects, effectsMap, effectsBatch, effectsToElmCmd
    , Color, color, colorTabShadow, backgroundColor, borderWithColor, shadowWithColor, colorToUI
    , Hue, background, primary, success, danger
    , Shade, shade200, shade400, shade600, shade800
    , background100, background200, background300, background400, background500, background600, background700, background800
    , primary200, primary400, primary600, primary800
    , danger200, danger400, danger600, danger800
    , success200, success400, success600, success800
    , textBody, textH1, textH2, textH3, textH4, textH5, textH6, textHeaderTitle
    )

{-|

@docs Config, configInit, configOnResize

@docs configGetDeviceHeight, configGetDeviceWidth

@docs rem0d85, rem0d875, rem1, rem1d25, rem1d5, rem2, rem

@docs Button, button, buttonWithColors, buttonWithOnClick, buttonToUI

@docs Dialog, dialog, dialogMap

@docs Page, page, pageMap, pageWithDialog

@docs Document, DocumentMsg, DocumentModel, document, documentInit, documentUpdate, headerWithItems

@docs Canvas, documentToElm

@docs Effects, effectsMap, effectsBatch, effectsToElmCmd

@docs Color, color, colorTabShadow, backgroundColor, borderWithColor, shadowWithColor, colorToUI

@docs Hue, background, primary, success, danger

@docs Shade, shade200, shade400, shade600, shade800

@docs background100, background200, background300, background400, background500, background600, background700, background800

@docs primary200, primary400, primary600, primary800

@docs danger200, danger400, danger600, danger800

@docs success200, success400, success600, success800

@docs textBody, textH1, textH2, textH3, textH4, textH5, textH6, textHeaderTitle

-}

import Internals.Button as IButton
import Internals.Config as IConfig
import Internals.Dialog as IDialog
import Internals.Document as IDocument
import Internals.Effects as IEffects
import Internals.Palette as IPalette
import Internals.Text as IText
import UI


type alias Config =
    IConfig.Config


type alias Button msg =
    IButton.Button msg


type alias Dialog msg =
    IDialog.Dialog msg


type alias Page msg =
    IDocument.Page msg


type alias Document msg =
    IDocument.Document msg


type alias DocumentMsg =
    IDocument.Msg


type alias DocumentModel =
    IDocument.Model


type alias Canvas =
    { width : Int
    , height : Int
    , clipX : Bool
    , clipY : Bool
    }


type alias Effects msg =
    IEffects.Effects msg


type alias Color =
    IPalette.Color


type alias Hue =
    IPalette.Hue


type alias Shade =
    IPalette.Shade


configInit : { deviceHeight : Int, deviceWidth : Int } -> Config
configInit =
    IConfig.init


configOnResize : { deviceHeight : Int, deviceWidth : Int } -> Config -> Config
configOnResize =
    IConfig.onResize


configGetDeviceHeight : Config -> Int
configGetDeviceHeight =
    IConfig.getDeviceHeight


configGetDeviceWidth : Config -> Int
configGetDeviceWidth =
    IConfig.getDeviceWidth


rem0d85 : Config -> Int
rem0d85 =
    IConfig.rem0d85


rem0d875 : Config -> Int
rem0d875 =
    IConfig.rem0d875


rem1 : Config -> Int
rem1 =
    IConfig.rem1


rem1d25 : Config -> Int
rem1d25 =
    IConfig.rem1d25


rem1d5 : Config -> Int
rem1d5 =
    IConfig.rem1d5


rem2 : Config -> Int
rem2 =
    IConfig.rem2


rem : Config -> Float -> Int
rem =
    IConfig.rem


button : String -> Button msg
button =
    IButton.button


buttonWithColors : Hue -> Button msg -> Button msg
buttonWithColors =
    IButton.withColors


buttonWithOnClick : msg -> Button msg -> Button msg
buttonWithOnClick =
    IButton.withOnClick


buttonToUI : Config -> Button msg -> UI.Graphics msg
buttonToUI =
    IButton.toUI


dialog : msg -> String -> UI.Graphics msg -> Dialog msg
dialog =
    IDialog.dialog


dialogMap : (a -> b) -> Dialog a -> Dialog b
dialogMap =
    IDialog.map


page : String -> UI.Graphics msg -> Page msg
page =
    IDocument.page


pageMap : (a -> b) -> Page a -> Page b
pageMap =
    IDocument.pageMap


pageWithDialog : Maybe (Dialog msg) -> Page msg -> Page msg
pageWithDialog =
    IDocument.pageWithDialog


document : (DocumentMsg -> msg) -> DocumentModel -> Document msg
document =
    IDocument.document


documentInit : DocumentModel
documentInit =
    IDocument.init


documentUpdate : DocumentMsg -> DocumentModel -> ( DocumentModel, Effects DocumentMsg )
documentUpdate =
    IDocument.update


headerWithItems : List ( String, msg ) -> Document msg -> Document msg
headerWithItems =
    IDocument.headerWithItems


documentToElm :
    (UI.Graphics msg -> view)
    -> Config
    -> Document msg
    -> (Canvas -> Page msg)
    ->
        { body : view
        , title : String
        }
documentToElm =
    IDocument.toElmDocument


effectsMap : (a -> b) -> Effects a -> Effects b
effectsMap =
    IEffects.map


effectsBatch : List (Effects msg) -> Effects msg
effectsBatch =
    IEffects.batch


effectsToElmCmd : Effects msg -> Cmd msg
effectsToElmCmd =
    IEffects.toElmCmd


color : Hue -> Shade -> Color
color =
    IPalette.color


colorTabShadow : Color
colorTabShadow =
    IPalette.colorTabShadow


backgroundColor : Config -> Color -> UI.Background
backgroundColor =
    IPalette.backgroundColor


borderWithColor : Config -> Color -> UI.Border -> UI.Border
borderWithColor =
    IPalette.borderWithColor


shadowWithColor : Config -> Color -> UI.Shadow -> UI.Shadow
shadowWithColor =
    IPalette.shadowWithColor


colorToUI : Config -> Color -> UI.Color
colorToUI =
    IPalette.toUI


background : Hue
background =
    IPalette.background


primary : Hue
primary =
    IPalette.primary


success : Hue
success =
    IPalette.success


danger : Hue
danger =
    IPalette.danger


shade200 : Shade
shade200 =
    IPalette.shade200


shade400 : Shade
shade400 =
    IPalette.shade400


shade600 : Shade
shade600 =
    IPalette.shade600


shade800 : Shade
shade800 =
    IPalette.shade800


background100 : Color
background100 =
    IPalette.background100


background200 : Color
background200 =
    IPalette.background200


background300 : Color
background300 =
    IPalette.background300


background400 : Color
background400 =
    IPalette.background400


background500 : Color
background500 =
    IPalette.background500


background600 : Color
background600 =
    IPalette.background600


background700 : Color
background700 =
    IPalette.background700


background800 : Color
background800 =
    IPalette.background800


primary200 : Color
primary200 =
    IPalette.primary200


primary400 : Color
primary400 =
    IPalette.primary400


primary600 : Color
primary600 =
    IPalette.primary600


primary800 : Color
primary800 =
    IPalette.primary800


danger200 : Color
danger200 =
    IPalette.danger200


danger400 : Color
danger400 =
    IPalette.danger400


danger600 : Color
danger600 =
    IPalette.danger600


danger800 : Color
danger800 =
    IPalette.danger800


success200 : Color
success200 =
    IPalette.success200


success400 : Color
success400 =
    IPalette.success400


success600 : Color
success600 =
    IPalette.success600


success800 : Color
success800 =
    IPalette.success800


textBody : Config -> String -> UI.Graphics msg
textBody =
    IText.body


textH1 : Config -> String -> UI.Graphics msg
textH1 =
    IText.h1


textH2 : Config -> String -> UI.Graphics msg
textH2 =
    IText.h2


textH3 : Config -> String -> UI.Graphics msg
textH3 =
    IText.h3


textH4 : Config -> String -> UI.Graphics msg
textH4 =
    IText.h4


textH5 : Config -> String -> UI.Graphics msg
textH5 =
    IText.h5


textH6 : Config -> String -> UI.Graphics msg
textH6 =
    IText.h6


textHeaderTitle : Config -> String -> UI.Graphics msg
textHeaderTitle =
    IText.headerTitle
