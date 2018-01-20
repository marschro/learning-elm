module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json


-- MAIN - The Program


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { url : String
    , data : String
    , message : String
    }


type Msg
    = InitRequest
    | Fetch (Result Http.Error String)


initModel : Model
initModel =
    { url = "http://api.icndb.com/jokes/random"
    , data = ""
    , message = ""
    }



-- INIT - invoking is essential


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MODEL - never run without the model, cause it is state
-- UPDATE - What happens if the user makes things... ?


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InitRequest ->
            ( model, getDataStores model.url )

        Fetch (Ok result) ->
            ( { model | data = result }, Cmd.none )

        Fetch (Err err) ->
            ( { model | message = "ERROR: " ++ toString (err) }, Cmd.none )


getDataStores : String -> Cmd Msg
getDataStores url =
    let
        request =
            Http.get url decodeJson
    in
        Http.send Fetch request


decodeJson : Json.Decoder String
decodeJson =
    Json.at [ "value", "joke" ] Json.string



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    let
        myStyle =
            style
                [ ( "fontSize", "30pt" )
                , ( "width", "80%" )
                ]
    in
        div []
            [ h1 [] [ text "Chuck Norris Jokes" ]
            , input [ type_ "submit", value "Get Joke", onClick InitRequest ] []
            , div [] [ text model.message ]
            , div [ myStyle ] [ text model.data ]
            ]



-- SUBSCRIPTIONS - communicate with the outer world


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
