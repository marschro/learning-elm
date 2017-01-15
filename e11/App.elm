module App exposing (..)

import Html exposing (Html, div, text, h1, input, p, hr)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { headline : String
    , message : String
    , name : String
    , animals : List Animal
    }


type alias Animal =
    { name : String
    , likes : Int
    }


type Msg
    = UpdateInput String
    | Add


initModel : Model
initModel =
    { headline = "All my Animals"
    , message = ""
    , name = ""
    , animals = []
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateInput input ->
            ( { model | name = input }, Cmd.none )

        Add ->
            let
                newAnimal =
                    Animal model.name 0

                newListOfAnimals =
                    newAnimal :: model.animals
            in
                ( { model | name = "", animals = newListOfAnimals }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.headline ]
        , input [ type_ "text", placeholder "enter new animal here", value model.name, onInput UpdateInput ] []
        , input [ type_ "submit", onClick Add ] []
        , p [] [ text model.message ]
        , hr [] []
        , p [] [ text (toString model) ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
