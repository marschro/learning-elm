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
    , hasFocus : Bool
    , droids : List Droid
    }


type alias Droid =
    { name : String
    , deleted : Bool
    }


initModel : Model
initModel =
    { input = ""
    , hasFocus = False
    , droids = []
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = Add
    | Update String
    | SetFocus
    | RemoveFocus
    | Delete Droid


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add ->
            let
                droid =
                    String.trim model.input
            in
                if String.isEmpty droid then
                    ( { model | input = "" }, Cmd.none )
                else
                    let
                        newDroid =
                            Droid droid False

                        newDroids =
                            newDroid :: model.droids
                    in
                        ( { model | input = "", droids = newDroids }, Cmd.none )

        Update string ->
            ( { model | input = string }, Cmd.none )

        SetFocus ->
            ( { model | hasFocus = True }, Cmd.none )

        RemoveFocus ->
            ( { model | hasFocus = False }, Cmd.none )

        Delete droidToDelete ->
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
            [ h2 [] [ text "Droids" ]
            , input
                [ type_ "text"
                , placeholder "enter droid name"
                , onInput Update
                , value model.input
                , onFocus SetFocus
                , onBlur RemoveFocus
                ]
                []
            , input [ type_ "submit", value "Add Droid", onClick Add ] []
            , droidsListView model
            , div [ class "model" ] [ text (toString model) ]
            ]


droidsListView : Model -> Html Msg
droidsListView model =
    let
        filteredDroidsList =
            List.filter (\droid -> droid.deleted /= True) model.droids
    in
        if List.length filteredDroidsList > 0 then
            filteredDroidsList |> List.sortBy .name |> List.map droidView |> ul []
        else
            div [] []


droidView : Droid -> Html Msg
droidView droid =
    li []
        [ span [] [ text droid.name ]
        , input [ type_ "button", class "delete", value "delete", onClick (Delete droid) ] []
        ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
