module FVS.Droids exposing (view)

import State exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    let
        focus =
            if model.droidHasFocus then
                " has-focus"
            else
                ""
    in
        div [ class ("component" ++ focus) ]
            [ h2 [] [ text "Droids" ]
            , input
                [ type_ "text"
                , placeholder "enter droid name"
                , onInput Droid_Update
                , value model.inputDroidName
                , onFocus Droid_SetFocus
                , onBlur Droid_RemoveFocus
                ]
                []
            , input [ type_ "submit", value "Add Droid", onClick Droid_Add ] []
            , droidsListView model
            ]


droidsListView : Model -> Html Msg
droidsListView model =
    if List.length model.droids > 0 then
        model.droids |> List.sortBy .name |> List.map droidView |> ul []
    else
        div [] []


droidView : Droid -> Html Msg
droidView droid =
    li []
        [ span [] [ text droid.name ]
        ]
