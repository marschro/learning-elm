module Modules.Droids exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import State exposing (..)


-- MAIN - The Program


main : Program Never State.Droid_Model State.Droid_Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : ( State.Droid_Model, Cmd State.Droid_Msg )
init =
    ( State.initDroidsModel, Cmd.none )



-- MODEL - never run without the model, cause it is state
-- UPDATE - What happens if the user makes things... ?


update : State.Droid_Msg -> State.Droid_Model -> ( State.Droid_Model, Cmd State.Droid_Msg )
update msg model =
    case msg of
        Add_Droid ->
            let
                droid =
                    String.trim model.input
            in
                if String.isEmpty droid then
                    ( { model | input = "" }, Cmd.none )
                else
                    let
                        newDroid =
                            Droid droid False Nothing

                        newDroids =
                            newDroid :: model.droids
                    in
                        ( { model | input = "", droids = newDroids }, Cmd.none )

        Update_Droid string ->
            ( { model | input = string }, Cmd.none )

        SetFocus_Droid ->
            ( { model | hasFocus = True }, Cmd.none )

        RemoveFocus_Droid ->
            ( { model | hasFocus = False }, Cmd.none )

        Delete_Droid droidToDelete ->
            let
                newDroidsList =
                    List.map
                        (\droid ->
                            if droid == droidToDelete then
                                { droid | deleted = True }
                            else
                                droid
                        )
                        model.droids
            in
                ( { model | droids = newDroidsList }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : State.Droid_Model -> Html State.Droid_Msg
view model =
    let
        focus =
            if model.hasFocus then
                " has-focus"
            else
                ""
    in
        div [ class ("component" ++ focus) ]
            [ h2 [] [ text "Droids" ]
            , input
                [ type_ "text"
                , placeholder "enter droid name"
                , onInput Update_Droid
                , value model.input
                , onFocus SetFocus_Droid
                , onBlur RemoveFocus_Droid
                ]
                []
            , select [] [ option [ value "asd" ] [ text "asd" ] ]
            , input [ type_ "submit", value "Add Droid", onClick Add_Droid ] []
            , droidsListView model
            , div [ class "model" ] [ text (toString model) ]
            ]


ownerOptions : String -> String -> Html State.Droid_Msg
ownerOptions v t =
    option [ value v ] [ text t ]


droidsListView : State.Droid_Model -> Html State.Droid_Msg
droidsListView model =
    let
        filteredDroidsList =
            List.filter (\droid -> droid.deleted /= True) model.droids
    in
        if List.length filteredDroidsList > 0 then
            filteredDroidsList |> List.sortBy .name |> List.map droidView |> ul []
        else
            div [] []


droidView : State.Droid -> Html State.Droid_Msg
droidView droid =
    li []
        [ span [] [ text droid.name ]
        , input [ type_ "button", class "delete", value "delete", onClick (Delete_Droid droid) ] []
        ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : State.Droid_Model -> Sub State.Droid_Msg
subscriptions model =
    Sub.none
