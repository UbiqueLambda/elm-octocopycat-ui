module DesignSystem exposing
    ( Canvas
    , Document
    , DocumentModel
    , DocumentMsg
    , Page
    , RenderConfig
    , background200
    , background600
    , backgroundColor
    , borderWithColor
    , document
    , documentInit
    , documentToElmDocument
    , documentUpdate
    , page
    , renderConfigInit
    , renderConfigOnResize
    )

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


document =
    IDocument.document


page =
    IDocument.page


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
