module Jedis exposing (..)

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
    , hasFocus : Bool
    , jedis : List Jedi
    }


type alias Jedi =
    { name : String
    }


initModel : Model
initModel =
    { input = ""
    , hasFocus = False
    , jedis = []
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = Add
    | Update String
    | SetFocus
    | RemoveFocus


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add ->
            if String.isEmpty model.input then
                ( model, Cmd.none )
            else
                let
                    newJedi =
                        Jedi model.input

                    newJedis =
                        newJedi :: model.jedis
                in
                    ( { model | input = "", jedis = newJedis }, Cmd.none )

        Update string ->
            ( { model | input = string }, Cmd.none )

        SetFocus ->
            ( { model | hasFocus = True }, Cmd.none )

        RemoveFocus ->
            ( { model | hasFocus = False }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    let
        focus =
            if model.hasFocus then
                " has-focus"
            else
                ""
    in
        div [ class ("component" ++ focus) ]
            [ h2 [] [ text "Jedi's" ]
            , input
                [ type_ "text"
                , placeholder "enter jedi name"
                , onInput Update
                , value model.input
                , onFocus SetFocus
                , onBlur RemoveFocus
                ]
                []
            , input [ type_ "submit", value "Add Jedi", onClick Add ] []
            , jedisListView model
            , div [ class "model" ] [ text (toString model) ]
            ]


jedisListView : Model -> Html Msg
jedisListView model =
    model.jedis |> List.sortBy .name |> List.map jediView |> ul []


jediView : Jedi -> Html Msg
jediView jedi =
    li []
        [ span [] [ text jedi.name ] ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
