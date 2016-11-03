module Main exposing (..)

import Html exposing (Html, text, h1, div, img)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }



--MODEL


type alias Model =
    { headline : String
    , text : String
    , imgUrl : Maybe String
    }


initModel : Model
initModel =
    { headline = "Foo"
    , text = "Lorem ipsum dolor sit"
    , imgUrl = Just "assets/default.jpg"
    }



--UPDATE


type Msg
    = Next
    | Previous


update : Msg -> Model -> Model
update msg model =
    case msg of
        Next ->
            { model | headline = "Bar" }

        Previous ->
            { model | headline = "Foo" }



--VIEW


pictureSection : Model -> Html Msg
pictureSection model =
    case model.imgUrl of
        Nothing ->
            div [] []

        Just imgUrl ->
            img [ src imgUrl ] []


navigationSection : Model -> Html Msg
navigationSection model =
    div []
        [ Html.button [ type' "button", onClick Previous ] [ text "previous" ]
        , Html.button [ type' "button", onClick Next ] [ text "next" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.headline ]
        , div [] [ text model.text ]
        , pictureSection model
        , navigationSection model
        ]
