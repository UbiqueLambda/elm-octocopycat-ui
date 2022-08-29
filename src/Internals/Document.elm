module Internals.Document exposing
    ( Document
    , Model
    , Msg
    , Page
    , document
    , headerWithItems
    , init
    , page
    , pageMap
    , pageWithDialog
    , toElmDocument
    , update
    )

import Internals.Config as Config exposing (Config)
import Internals.Dialog as Dialog exposing (Dialog)
import Internals.Effects as Effects exposing (Effects)
import Internals.Footer as Footer exposing (Footer)
import Internals.Header as Header exposing (Header)
import Internals.Helpers exposing (Canvas)
import Internals.Palette as Palette exposing (background100, background800)
import Internals.SSOT as SSOT
import UI


type Document msg
    = Document
        (Msg -> msg)
        { header : Header msg
        , footer : Footer msg
        }


type Model
    = Model
        { header : Header.Model
        }


type Msg
    = ForHeader Header.Msg


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
        , footer = Footer.footer "FOSS 2022 UbiqueLambda" []
        }


headerWithItems : List ( String, msg ) -> Document msg -> Document msg
headerWithItems items (Document toMsg document_) =
    Document toMsg { document_ | header = Header.withItems items document_.header }


init : Model
init =
    Model
        { header = Header.init
        }


page : String -> UI.Graphics msg -> Page msg
page title view =
    Page
        { title = title
        , view = view
        , dialog = Nothing
        , standardSections = True
        }


pageMap : (a -> b) -> Page a -> Page b
pageMap applier (Page page_) =
    Page
        { title = page_.title
        , view = UI.map applier page_.view
        , dialog = Maybe.map (Dialog.map applier) page_.dialog
        , standardSections = page_.standardSections
        }


pageWithDialog : Maybe (Dialog msg) -> Page msg -> Page msg
pageWithDialog dialog (Page page_) =
    Page { page_ | dialog = dialog }


toElmDocument :
    (UI.Graphics msg -> view)
    -> Config
    -> Document msg
    -> (Canvas -> Page msg)
    ->
        { body : view
        , title : String
        }
toElmDocument encoder ds (Document toParentMsg { header, footer }) pageFn =
    let
        bodyCanvas =
            { width = deviceWidth, height = bodyHeight, clipX = True, clipY = False }

        bodyHeight =
            deviceHeight
                - Header.height ds header
                - Footer.height ds footer

        contentView =
            UI.column
                [ Header.view ds
                    (ForHeader >> toParentMsg)
                    deviceWidth
                    header
                    |> Tuple.pair "header"
                , ( "body", page_.view )
                , Footer.view ds deviceWidth footer
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
                    , dialogOverlay ds deviceWidth deviceHeight
                    , Dialog.view ds deviceWidth deviceHeight dialog_
                    ]

                Nothing ->
                    [ contentView ]

        deviceHeight =
            Config.getDeviceHeight ds

        deviceWidth =
            Config.getDeviceWidth ds

        (Page page_) =
            pageFn bodyCanvas

        rootFontSize =
            Config.rem1 ds
    in
    { body =
        contentWithDialog
            |> UI.stack
            |> SSOT.withRootFontFamilies
            |> UI.withFontSize rootFontSize
            |> UI.withJustifyItems UI.center
            |> Palette.withFontColor ds background100
            |> UI.withBackground (Palette.backgroundColor ds background800 |> Just)
            |> encoder
    , title = page_.title
    }


update : Msg -> Model -> ( Model, Effects Msg )
update msg (Model model) =
    case msg of
        ForHeader headerMsg ->
            let
                ( newHeaderModel, headerEffects ) =
                    Header.update headerMsg model.header
            in
            ( Model { model | header = newHeaderModel }
            , Effects.map ForHeader headerEffects
            )


dialogOverlay : Config -> Int -> Int -> ( String, UI.Graphics msg )
dialogOverlay ds deviceWidth deviceHeight =
    UI.empty
        |> UI.withWidth deviceWidth
        |> UI.withHeight deviceHeight
        |> UI.withBackground (UI.intRGBA 0xCC |> UI.backgroundColor |> Just)
        |> Tuple.pair "overlay"
