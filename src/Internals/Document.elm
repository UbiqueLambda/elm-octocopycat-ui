module Internals.Document exposing
    ( Document
    , Model
    , Msg
    , Page
    , document
    , init
    , page
    , pageWithDialog
    , toElmDocument
    , update
    )

import Internals.Dialog as Dialog exposing (Dialog)
import Internals.Effects as Effects exposing (Effects)
import Internals.Footer as Footer exposing (Footer)
import Internals.Header as Header exposing (Header)
import Internals.Helpers exposing (Canvas)
import Internals.Palette as Palette exposing (background800, genericWhite)
import Internals.RenderConfig as RenderConfig exposing (RenderConfig)
import UI


type Document msg
    = Document
        (Msg -> msg)
        { header : Header
        , footer : Footer
        }


type Msg
    = ForHeader Header.Msg
    | ForFooter Footer.Msg


type Model
    = Model
        { header : Header.Model
        , footer : Footer.Model
        }


type Page msg
    = Page
        { title : String
        , view : UI.Graphics msg
        , dialog : Maybe (Dialog msg)
        , standardSections : Bool -- header and footer
        }


document : (Msg -> msg) -> Model -> Document msg
document toParentMsg (Model model) =
    Document toParentMsg
        { header = Header.header model.header
        , footer = Footer.footer model.footer
        }


init : Model
init =
    Model
        { header = Header.init
        , footer = Footer.init
        }


update : Msg -> Model -> ( Model, Effects Msg )
update _ model =
    ( model, Effects.none )


page : String -> UI.Graphics msg -> Page msg
page title view =
    Page
        { title = title
        , view = view
        , dialog = Nothing
        , standardSections = True
        }


pageWithDialog : Maybe (Dialog msg) -> Page msg -> Page msg
pageWithDialog dialog (Page page_) =
    Page { page_ | dialog = dialog }


toElmDocument :
    (UI.Graphics msg -> view)
    -> RenderConfig
    -> Document msg
    -> (Canvas -> Page msg)
    ->
        { body : view
        , title : String
        }
toElmDocument encoder renderConfig (Document toParentMsg { header, footer }) pageFn =
    let
        deviceWidth =
            RenderConfig.getDeviceWidth renderConfig

        deviceHeight =
            RenderConfig.getDeviceHeight renderConfig

        bodyHeight =
            deviceHeight
                - Header.height renderConfig header
                - Footer.height renderConfig footer

        bodyCanvas =
            { width = deviceWidth, height = bodyHeight, clipX = True, clipY = False }

        (Page page_) =
            pageFn bodyCanvas

        contentView =
            UI.column
                [ Header.view renderConfig deviceWidth header
                    |> UI.map (ForHeader >> toParentMsg)
                    |> Tuple.pair "header"
                , ( "body", page_.view )
                , Footer.view renderConfig deviceWidth footer
                    |> UI.map (ForFooter >> toParentMsg)
                    |> Tuple.pair "footer"
                ]
                |> UI.withWidth deviceWidth
                |> UI.withHeight deviceHeight
                |> UI.withScrollingY (Just UI.scrollInsetAlwaysVisible)
                |> Tuple.pair "content"

        contentWithDialog =
            case page_.dialog of
                Just dialog_ ->
                    [ contentView
                    , dialogOverlay renderConfig deviceWidth deviceHeight
                    , Dialog.view renderConfig deviceWidth deviceHeight dialog_
                    ]

                Nothing ->
                    [ contentView ]
    in
    { title = page_.title
    , body =
        contentWithDialog
            |> UI.stack
            |> UI.withFontFamilies
                [ "-apple-system"
                , "BlinkMacSystemFont"
                , "Segoe UI"
                , "Helvetica"
                , "Arial"
                ]
                UI.sansSerif
            |> UI.withJustifyItems UI.center
            |> Palette.withFontColor renderConfig genericWhite
            |> UI.withBackground (Palette.backgroundColor renderConfig background800 |> Just)
            |> encoder
    }


dialogOverlay : RenderConfig -> Int -> Int -> ( String, UI.Graphics msg )
dialogOverlay renderConfig deviceWidth deviceHeight =
    UI.empty
        |> UI.withWidth deviceWidth
        |> UI.withHeight deviceHeight
        |> UI.withBackground (Palette.backgroundColor renderConfig background800 |> Just)
        |> Tuple.pair "overlay"
