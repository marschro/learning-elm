module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


a : Int
a =
    0



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
    { input : String
    , output : String
    }


type Msg
    = UpdateInput String
    | Clear


initModel : Model
initModel =
    { input = ""
    , output = ""
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
        UpdateInput string ->
            ( { model | input = string, output = (String.reverse string) }, Cmd.none )

        Clear ->
            ( { model | input = "", output = "" }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "My First Elm" ]
        , input [ type_ "text", onInput UpdateInput, value (model.input) ] []
        , input [ type_ "button", onClick Clear, value "Clear" ] []
        , p [] [ text (model.output) ]
        , p [] [ text (toString model) ]
        ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
