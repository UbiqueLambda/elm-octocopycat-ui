module DesignSystem exposing
    ( Canvas
    , Dialog
    , Document
    , DocumentModel
    , DocumentMsg
    , Page
    , RenderConfig
    , background200
    , background600
    , backgroundColor
    , borderWithColor
    , dialog
    , document
    , documentInit
    , documentToElmDocument
    , documentUpdate
    , page
    , renderConfigInit
    , renderConfigOnResize
    )

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


type alias Dialog msg =
    IDialog.Dialog msg


type alias Document msg =
    IDocument.Document msg


type alias DocumentModel =
    IDocument.Model


type alias DocumentMsg =
    IDocument.Msg


type alias Page msg =
    IDocument.Page msg


renderConfigInit =
    IRenderConfig.init


renderConfigOnResize =
    IRenderConfig.onResize


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


background600 =
    IPalette.background600


background200 =
    IPalette.background200


borderWithColor =
    IPalette.borderWithColor
