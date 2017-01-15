module Joke exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Http
import Task


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


fetchRandomJoke : Cmd Msg
fetchRandomJoke =
    let
        url =
            "http://api.icndb.com/jokes/random"

        task =
            Http.getString url

        cmd =
            Task.perform Failure Joke task
    in
        cmd



-- model


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchRandomJoke )


initModel : Model
initModel =
    "Finding a joke..."



-- update


type Msg
    = Joke String
    | Failure Http.Error
    | FetchNewJoke


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Joke joke ->
            ( joke, Cmd.none )

        Failure error ->
            ( (toString error), Cmd.none )

        FetchNewJoke ->
            ( "FEtching joke...", fetchRandomJoke )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- view


view : Model -> Html Msg
view model =
    div []
        [ input [ type' "button", onClick FetchNewJoke, value "Fetch a joke" ] []
        , br [] []
        , p [] [ text <| toString model ]
        ]
