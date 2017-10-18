import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- ============================================================
-- TYPES
type alias Bookmark =
    { url: String
    , title: String
    , notes: Maybe String
    
    }

type alias Model =
    { bookmarks : List Bookmark
    , unsaved: Bool
    -- , bookmark: Bookmark -- elm nested update problem
    , url: String
    , title: String
    }
    
type Msg = AddBookmark Bookmark
         | URLChanged String
         | TitleChanged String



-- ============================================================
-- MAIN
main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- ============================================================
-- INIT
init : (Model, Cmd Msg)
init =
  (Model [] False "" "", Cmd.none)


-- ============================================================
-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        AddBookmark bookmark ->
            ({model | bookmarks = (bookmark :: model.bookmarks)}, Cmd.none)
        
        URLChanged newURL ->
            ({model | url = newURL}, Cmd.none)

        TitleChanged newTitle ->
            ({model | title = newTitle}, Cmd.none)
      

-- ============================================================
-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "URL", onInput URLChanged ] []
        , input [ placeholder "Title", onInput TitleChanged ] []
        , button [ onClick (AddBookmark (Bookmark model.url model.title Nothing)) ] [ text "Add bookmark" ]
        , bookmarks model
        ]

-- Render the Bookmarks list by wrapping each element in an LI
bookmarks : Model -> Html Msg
bookmarks model =
    let
        liWrapper bookmark = (li []
                                  [ a [ href bookmark.url ]
                                        [ text bookmark.title ] ])
    in
        ul []
            (List.map liWrapper model.bookmarks)


-- ============================================================
-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
