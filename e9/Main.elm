module Main exposing (..)

import Html exposing (Html, div, h1, text, hr, input, ul, li)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { headline : String
    , input : String
    , animals : List Animal
    }


type alias Animal =
    { name : String
    , color : String
    }


type Msg
    = UpdateInput String
    | Add


initModel : Model
initModel =
    { headline = "My animals", input = "", animals = [] }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateInput value ->
            ( { model | input = value }, Cmd.none )

        Add ->
            if String.isEmpty model.input then
                ( model, Cmd.none )
            else
                let
                    animal =
                        Animal model.input "black and white"

                    newAnimals =
                        animal :: model.animals
                in
                    ( { model
                        | animals = newAnimals
                        , input = ""
                        , headline = "My " ++ toString (List.length model.animals) ++ " animals"
                      }
                    , Cmd.none
                    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.headline ]
        , input [ type_ "text", onInput UpdateInput, value model.input ] []
        , input [ type_ "submit", onClick Add ] []
        , listOfAnimals model
        , hr [] []
        , div [] [ text (toString model) ]
        ]


listOfAnimals : Model -> Html Msg
listOfAnimals model =
    model.animals |> List.sortBy .name |> List.map animal |> ul []


animal : Animal -> Html Msg
animal animal =
    li [] [ text animal.name ]
