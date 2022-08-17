module DesignSystem exposing
    ( Canvas
    , Dialog
    , Document
    , DocumentModel
    , DocumentMsg
    , Hue
    , Page
    , RenderConfig
    , background
    , background100
    , background200
    , background300
    , background400
    , background500
    , background600
    , background700
    , background800
    , backgroundColor
    , borderWithColor
    , button
    , buttonToUI
    , buttonWithColors
    , colorTabShadow
    , danger
    , danger200
    , danger400
    , danger600
    , danger800
    , dialog
    , document
    , documentInit
    , documentToElmDocument
    , documentUpdate
    , page
    , pageWithDialog
    , primary
    , primary200
    , primary400
    , primary600
    , primary800
    , renderConfigInit
    , renderConfigOnResize
    , success
    , success200
    , success400
    , success600
    , success800
    )

import Internals.Button as IButton
import Internals.Dialog as IDialog
import Internals.Document as IDocument
import Internals.Palette as IPalette
import Internals.RenderConfig as IRenderConfig


type alias Canvas =
    { width : Int
    , height : Int
    , clipX : Bool
    , clipY : Bool
    }


type alias RenderConfig =
    IRenderConfig.RenderConfig


type alias Button msg =
    IButton.Button msg


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


type alias Page msg =
    IDocument.Page msg


renderConfigInit =
    IRenderConfig.init


renderConfigOnResize =
    IRenderConfig.onResize


button =
    IButton.button


buttonToUI =
    IButton.toUI


buttonWithColors =
    IButton.withColors


dialog =
    IDialog.dialog


document =
    IDocument.document


page =
    IDocument.page


pageWithDialog =
    IDocument.pageWithDialog


documentInit =
    IDocument.init


documentUpdate =
    IDocument.update


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
