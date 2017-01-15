module Main exposing (..)

import Html exposing (Html, div, h1, text, input, hr, p, ul, li, span)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    { animals : List Animal
    , input : String
    , message : String
    }


type alias Animal =
    { name : String
    , likes : Int
    }


type Msg
    = InsertName String
    | Add
    | Like Animal


model : Model
model =
    { animals = []
    , input = ""
    , message = ""
    }


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InsertName name ->
            ( { model | input = name }, Cmd.none )

        Add ->
            let
                newAnimal =
                    Animal model.input 0

                newAnimals =
                    newAnimal :: model.animals
            in
                if String.isEmpty newAnimal.name then
                    ( { model | message = "Missing animal", input = "" }, Cmd.none )
                else
                    ( { model | animals = newAnimals, input = "" }, Cmd.none )

        Like animal ->
            let
                alteredAnimals =
                    List.map
                        (\this ->
                            if this == animal then
                                { this | likes = animal.likes + 1 }
                            else
                                this
                        )
                        model.animals
            in
                ( { model | animals = alteredAnimals, input = "" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Hello World" ]
        , input [ placeholder "name", value model.input, onInput InsertName ] []
        , input [ type_ "button", value "Add", onClick Add ] []
        , p [] [ text model.message ]
        , hr [] []
        , animalsListView model
        , p [] [ text (toString model) ]
        ]


animalsListView : Model -> Html Msg
animalsListView model =
    model.animals
        |> List.sortBy .name
        |> List.map animalView
        |> ul []


animalView : Animal -> Html Msg
animalView animal =
    li []
        [ span [] [ text animal.name ]
        , span [] [ text (" (likes: " ++ (toString <| animal.likes) ++ ")") ]
        , input [ type_ "button", value "like", onClick (Like animal) ] []
        ]
