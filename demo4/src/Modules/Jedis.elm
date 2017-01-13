module Modules.Jedis exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import State exposing (..)


-- MAIN - The Program


main : Program Never State.Jedi_Model State.Jedi_Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT - invoking is essential


init : ( State.Jedi_Model, Cmd State.Jedi_Msg )
init =
    ( initJediModel, Cmd.none )



-- UPDATE - What happens if the user makes things... ?


update : State.Jedi_Msg -> State.Jedi_Model -> ( State.Jedi_Model, Cmd State.Jedi_Msg )
update msg model =
    case msg of
        Add_Jedi ->
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

        Update_Jedi string ->
            ( { model | input = string }, Cmd.none )

        SetFocus_Jedi ->
            ( { model | hasFocus = True }, Cmd.none )

        RemoveFocus_Jedi ->
            ( { model | hasFocus = False }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : State.Jedi_Model -> Html State.Jedi_Msg
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
                , onInput Update_Jedi
                , value model.input
                , onFocus SetFocus_Jedi
                , onBlur RemoveFocus_Jedi
                ]
                []
            , input [ type_ "submit", value "Add Jedi", onClick Add_Jedi ] []
            , jedisListView model
            ]


jedisListView : State.Jedi_Model -> Html State.Jedi_Msg
jedisListView model =
    model.jedis |> List.sortBy .name |> List.map jediView |> ul []


jediView : Jedi -> Html State.Jedi_Msg
jediView jedi =
    li []
        [ span [] [ text jedi.name ] ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : State.Jedi_Model -> Sub State.Jedi_Msg
subscriptions model =
    Sub.none
