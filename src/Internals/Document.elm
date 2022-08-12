module Internals.Document exposing (Document, Model, Msg, Page, document, init, page, toElmDocument, update)

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
        , dialog : Maybe (UI.Graphics msg)
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
    in
    { title = page_.title
    , body =
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
            |> UI.withFontFamilies
                [ "-apple-system"
                , "BlinkMacSystemFont"
                , "Segoe UI"
                , "Helvetica"
                , "Arial"
                ]
                UI.sansSerif
            |> Palette.withFontColor renderConfig genericWhite
            |> UI.withBackground (Palette.backgroundColor renderConfig background800 |> Just)
            |> encoder
    }
