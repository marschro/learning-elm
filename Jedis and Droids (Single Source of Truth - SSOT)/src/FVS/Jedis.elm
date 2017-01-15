module FVS.Jedis exposing (view)

import State exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    let
        focus =
            if model.jediHasFocus then
                " has-focus"
            else
                ""
    in
        div [ class ("component" ++ focus) ]
            [ h2 [] [ text "Jedi's" ]
            , input
                [ type_ "text"
                , placeholder "enter jedi name"
                , onInput Jedi_Update
                , value model.inputJediName
                , onFocus Jedi_SetFocus
                , onBlur Jedi_RemoveFocus
                ]
                []
            , input [ type_ "submit", value "Add Jedi", onClick Jedi_Add ] []
            , jedisListView model
            ]


jedisListView : Model -> Html Msg
jedisListView model =
    model.jedis |> List.sortBy .name |> List.map jediView |> ul []


jediView : Jedi -> Html Msg
jediView jedi =
    li []
        [ span [] [ text jedi.name ] ]
