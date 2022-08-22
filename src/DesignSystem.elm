module DesignSystem exposing
    ( Canvas
    , Config
    , Dialog
    , Document
    , DocumentModel
    , DocumentMsg
    , Hue
    , Page
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
    , buttonWithOnClick
    , colorTabShadow
    , configInit
    , configOnResize
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
    , headerWithItems
    , page
    , pageMap
    , pageWithDialog
    , primary
    , primary200
    , primary400
    , primary600
    , primary800
    , rem
    , rem0d85
    , rem0d875
    , rem1
    , rem1d25
    , rem1d5
    , rem2
    , success
    , success200
    , success400
    , success600
    , success800
    , textBody
    , textH1
    , textH2
    , textH3
    , textH4
    , textH5
    , textH6
    , textHeaderTitle
    )

import Internals.Button as IButton
import Internals.Config as IConfig
import Internals.Dialog as IDialog
import Internals.Document as IDocument
import Internals.Palette as IPalette
import Internals.Text as IText


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


configInit =
    IConfig.init


configOnResize =
    IConfig.onResize


button =
    IButton.button


buttonToUI =
    IButton.toUI


buttonWithColors =
    IButton.withColors


buttonWithOnClick =
    IButton.withOnClick


dialog =
    IDialog.dialog


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


rem =
    IConfig.rem


rem0d85 =
    IConfig.rem0d85


rem0d875 =
    IConfig.rem0d875


rem1 =
    IConfig.rem1


rem1d25 =
    IConfig.rem1d25


rem1d5 =
    IConfig.rem1d5


rem2 =
    IConfig.rem2
