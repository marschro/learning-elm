module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type', value)
import Html.Events exposing (..)
import Html.App as App
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)
import Unicode exposing (unEsc)
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


type alias Response =
    { id : Int
    , joke : String
    , categories : List String
    }



-- responseDecoder : Decoder Response
-- responseDecoder =
--     object3 Response
--         ("id" := int)
--         ("joke" := string)
--         ("categories" := Json.Decode.list string)
--         |> at [ "value" ]


responseDecoder : Decoder Response
responseDecoder =
    decode Response
        |> required "id" int
        |> required "joke" string
        |> optional "categories" (list string) []
        |> at [ "value" ]


fetchRandomJoke : Cmd Msg
fetchRandomJoke =
    let
        url =
            "http://api.icndb.com/jokes/random"

        task =
            --Http.getString url
            Http.get responseDecoder url

        cmd =
            Task.perform Failure Joke task
    in
        cmd



-- model


type alias Model =
    Response


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchRandomJoke )


initModel : Response
initModel =
    { id = 0, joke = "Fetching joke...", categories = [] }



-- update


type Msg
    = Joke Response
    | Failure Http.Error
    | FetchNewJoke


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Joke response ->
            ( response, Cmd.none )

        Failure error ->
            ( { id = 0, joke = toString (error), categories = [] }, Cmd.none )

        FetchNewJoke ->
            ( { id = 0, joke = "Fetching joke...", categories = [] }, fetchRandomJoke )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- view


view : Model -> Html Msg
view model =
    div []
        [ input [ type' "button", onClick FetchNewJoke, Html.Attributes.value "Fetch a joke" ] []
        , br [] []
        , h4 [] [ text ("Joke #" ++ toString (model.id)) ]
        , p [] [ text (model.joke |> unEsc) ]
        , p [] [ text (toString model.categories) ]
        ]
