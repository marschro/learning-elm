module View exposing (..)

import Html exposing (Html, text, h1, div, img, input, form, ul, li, i, hr, br)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Update exposing (..)


userListView : Model -> Html Msg
userListView model =
    let
        newList =
            List.filter (\user -> (user.deleted /= True)) model.users
    in
        newList
            |> List.sortBy .name
            |> List.map userView
            |> ul []


userView : User -> Html Msg
userView user =
    let
        ageAsString =
            case user.age of
                Just val ->
                    val |> toString

                Nothing ->
                    "-"
    in
        li []
            [ div [] [ text ("ID: " ++ toString user.id) ]
            , div [] [ text ("Name: " ++ user.name) ]
            , div [] [ text ("Age: " ++ ageAsString) ]
            , input [ type_ "button", value "Delete", onClick (DeleteUser user.id) ] []
            , input [ type_ "button", value "Edit", onClick (EditUser user) ] []
            ]


mainView : Model -> Html Msg
mainView model =
    let
        deletedUsers =
            List.length <|
                List.filter (\user -> user.deleted == True) model.users
    in
        div [ class "wrapper" ]
            [ h1 [] [ text ("We have " ++ toString (List.length model.users) ++ " (deleted: " ++ toString deletedUsers ++ ")") ]
            , Html.form []
                [ input [ type_ "text", onInput InsertName, placeholder "Name", value model.name ] []
                , input [ type_ "text", onInput InsertAge, placeholder "Age", value model.age ] []
                , input [ type_ "button", onClick UpdateOrSave, value model.button ] []
                ]
            , div [] [ text model.message ]
            , userListView model
            , hr [] []
            , div [] [ text (toString model) ]
            ]
