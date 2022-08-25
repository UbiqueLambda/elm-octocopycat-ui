module DesignSystem exposing
    ( Hue, Shade, Color
    , Config, configInit, configOnResize
    , configGetDeviceHeight, configGetDeviceWidth
    , rem0d85, rem0d875, rem1, rem1d25, rem1d5, rem2, rem
    , Button, button, buttonWithColors, buttonWithOnClick, buttonToUI
    , Dialog, dialog, dialogMap
    , Canvas, Page, Document, DocumentMsg, DocumentModel
    , background, background100, background200, background300, background400, background500, background600, background700, background800, backgroundColor, borderWithColor, colorTabShadow, danger, danger200, danger400, danger600, danger800, document, documentInit, documentToElmDocument, documentUpdate, headerWithItems, page, pageMap, pageWithDialog, primary, primary200, primary400, primary600, primary800, success, success200, success400, success600, success800, textBody, textH1, textH2, textH3, textH4, textH5, textH6, textHeaderTitle
    )

{-|

@docs Hue, Shade, Color

@docs Config, configInit, configOnResize

@docs configGetDeviceHeight, configGetDeviceWidth

@docs rem0d85, rem0d875, rem1, rem1d25, rem1d5, rem2, rem

@docs Button, button, buttonWithColors, buttonWithOnClick, buttonToUI

@docs Dialog, dialog, dialogMap

@docs Canvas, Page, Document, DocumentMsg, DocumentModel

-}

import Internals.Button as IButton
import Internals.Config as IConfig
import Internals.Dialog as IDialog
import Internals.Document as IDocument
import Internals.Palette as IPalette
import Internals.Text as IText
import UI


type alias Canvas =
    { width : Int
    , height : Int
    , clipX : Bool
    , clipY : Bool
    }


type alias Config =
    IConfig.Config


type alias Button msg =
    IButton.Button msg


type alias Color =
    IPalette.Color


type alias Dialog msg =
    IDialog.Dialog msg


type alias Document msg =
    IDocument.Document msg


type alias DocumentModel =
    IDocument.Model


type alias DocumentMsg =
    IDocument.Msg


type alias Hue =
    IPalette.Hue


type alias Shade =
    IPalette.Shade


type alias Page msg =
    IDocument.Page msg


configInit : { deviceWidth : Int, deviceHeight : Int } -> Config
configInit =
    IConfig.init


configOnResize : { deviceWidth : Int, deviceHeight : Int } -> Config -> Config
configOnResize =
    IConfig.onResize


configGetDeviceWidth : Config -> Int
configGetDeviceWidth =
    IConfig.getDeviceWidth


configGetDeviceHeight : Config -> Int
configGetDeviceHeight =
    IConfig.getDeviceHeight


button : String -> Button msg
button =
    IButton.button


buttonToUI : Config -> Button msg -> UI.Graphics msg
buttonToUI =
    IButton.toUI


buttonWithColors : Hue -> Button msg -> Button msg
buttonWithColors =
    IButton.withColors


buttonWithOnClick : msg -> Button msg -> Button msg
buttonWithOnClick =
    IButton.withOnClick


dialog : msg -> String -> UI.Graphics msg -> Dialog msg
dialog =
    IDialog.dialog


dialogMap : (a -> b) -> Dialog a -> Dialog b
dialogMap =
    IDialog.map


document =
    IDocument.document


page =
    IDocument.page


pageMap =
    IDocument.pageMap


pageWithDialog =
    IDocument.pageWithDialog


documentInit =
    IDocument.init


documentUpdate =
    IDocument.update


headerWithItems =
    IDocument.headerWithItems


documentToElmDocument =
    IDocument.toElmDocument


backgroundColor =
    IPalette.backgroundColor


background =
    IPalette.background


background100 =
    IPalette.background100


background200 =
    IPalette.background200


background300 =
    IPalette.background300


background400 =
    IPalette.background400


background500 =
    IPalette.background500


background600 =
    IPalette.background600


background700 =
    IPalette.background700


background800 =
    IPalette.background800


borderWithColor =
    IPalette.borderWithColor


colorTabShadow =
    IPalette.colorTabShadow


primary =
    IPalette.primary


primary200 =
    IPalette.primary200


primary400 =
    IPalette.primary400


primary600 =
    IPalette.primary600


primary800 =
    IPalette.primary800


danger =
    IPalette.danger


danger200 =
    IPalette.danger200


danger400 =
    IPalette.danger400


danger600 =
    IPalette.danger600


danger800 =
    IPalette.danger800


success =
    IPalette.success


success200 =
    IPalette.success200


success400 =
    IPalette.success400


success600 =
    IPalette.success600


success800 =
    IPalette.success800


textBody =
    IText.body


textH1 =
    IText.h1


textH2 =
    IText.h2


textH3 =
    IText.h3


textH4 =
    IText.h4


textH5 =
    IText.h5


textH6 =
    IText.h6


textHeaderTitle =
    IText.headerTitle


rem : Config -> Float -> Int
rem =
    IConfig.rem


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
