module Main exposing (..)

import Html exposing (Html, text, h1, div, img, input, form, ul, li, i, hr, br)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import String
import Random


--import Debug
--import Uuid


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--MODEL


type alias Model =
    { users : List User
    , name : String
    , age : String
    , message : String
    }


type alias User =
    { id : Int
    , name : String
    , age : Maybe Int
    , deleted : Bool
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


initModel : Model
initModel =
    { users = []
    , name = ""
    , age = ""
    , message = ""
    }



--UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InsertName username ->
            ( { model | name = username }, Cmd.none )

        InsertAge age ->
            let
                newAge =
                    case String.toInt age of
                        Err err ->
                            ""

                        Ok value ->
                            toString value

                newMessage =
                    case String.toInt age of
                        Err err ->
                            "Age must be a number!"

                        Ok int ->
                            if int > 100 then
                                "Haha... that would be old"
                            else if int < 10 then
                                "Pretty young.. hugh?"
                            else
                                "accetable"
            in
                ( { model | age = newAge, message = newMessage }, Cmd.none )

        InitNewUser ->
            ( model, Random.generate AddNewUser (Random.int 1 9999) )

        AddNewUser randomId ->
            if String.isEmpty model.name then
                ( { model | message = "Please give a name" }, Cmd.none )
            else
                let
                    ageAsInt =
                        case String.toInt model.age of
                            Err err ->
                                Nothing

                            Ok int ->
                                Just int

                    newUser =
                        User randomId model.name ageAsInt False

                    newUserList =
                        newUser :: model.users
                in
                    ( { model | users = newUserList, name = "", age = "", message = "" }, Cmd.none )

        Delete id ->
            let
                newUserList =
                    List.map
                        (\user ->
                            if user.id == id then
                                { user | deleted = True }
                            else
                                user
                        )
                        model.users
            in
                ( { model | users = newUserList }, Cmd.none )



--VIEW


type Msg
    = InsertName String
    | InsertAge String
    | AddNewUser Int
    | InitNewUser
    | Delete Int


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
            , input [ type' "button", value "Delete", onClick (Delete user.id) ] []
            ]


view : Model -> Html Msg
view model =
    let
        deletedUsers =
            List.length <|
                List.filter (\user -> user.deleted == True) model.users
    in
        div [ class "wrapper" ]
            [ h1 [] [ text ("We have " ++ toString (List.length model.users) ++ " (deleted: " ++ toString deletedUsers ++ ")") ]
            , Html.form []
                [ input [ type' "text", onInput InsertName, placeholder "Name", value model.name ] []
                , input [ type' "text", onInput InsertAge, placeholder "Age", value model.age ] []
                , input [ type' "button", onClick InitNewUser, value "Add new user" ] []
                ]
            , div [] [ text model.message ]
            , userListView model
            , hr [] []
            , div [] [ text (toString model) ]
            ]
