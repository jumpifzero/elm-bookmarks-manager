import Html exposing (..)
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
    }
    
type Msg = AddBookmark Bookmark



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
  (Model [] False, Cmd.none)


-- ============================================================
-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        AddBookmark bookmark ->
            (model, Cmd.none)
      

-- ============================================================
-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "test" ]
        , button [ onClick (AddBookmark (Bookmark "" "" Nothing)) ] [ text "Add bookmark" ]
        ]



-- ============================================================
-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
