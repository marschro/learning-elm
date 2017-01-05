module Droids exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MAIN - The Program


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT - invoking is essential


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MODEL - never run without the model, cause it is state


type alias Model =
    { input : String
    , droids : List Droid
    }


type alias Droid =
    { name : String
    }


initModel : Model
initModel =
    { input = ""
    , droids = []
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = Add
    | Update String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add ->
            if String.isEmpty model.input then
                ( model, Cmd.none )
            else
                let
                    newDroid =
                        Droid model.input

                    newDroids =
                        newDroid :: model.droids
                in
                    ( { model | input = "", droids = newDroids }, Cmd.none )

        Update string ->
            ( { model | input = string }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    div [ class "component" ]
        [ h2 [] [ text "Droids" ]
        , input [ type_ "text", placeholder "enter droid name", onInput Update, value model.input ] []
        , input [ type_ "submit", value "Add Droid", onClick Add ] []
        , div [ class "model" ] [ text (toString model) ]
        ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
