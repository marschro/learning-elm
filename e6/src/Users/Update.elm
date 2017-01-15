module Users.Update exposing (..)

import Users.Model exposing (..)
import Helpers.General as Utils
import Random


type Msg
    = InsertName String
    | InsertAge String
    | UpdateOrSave
    | SaveUser Int
    | DeleteUser Int
    | EditUser User


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InsertName username ->
            let
                ( validName, error ) =
                    Utils.validateName username
            in
                ( { model | name = validName, message = error }, Cmd.none )

        InsertAge age ->
            let
                ( validAge, error ) =
                    Utils.validateAge age
            in
                ( { model | age = validAge, message = error }, Cmd.none )

        UpdateOrSave ->
            if String.isEmpty model.name then
                ( { model | message = "Please give a name" }, Cmd.none )
            else
                updateOrSave model

        SaveUser id ->
            ( saveUser model id, Cmd.none )

        EditUser user ->
            let
                userAge =
                    case user.age of
                        Nothing ->
                            ""

                        Just int ->
                            toString (int)
            in
                ( { model
                    | name = user.name
                    , age = userAge
                    , button = "Update"
                    , userId = Just user.id
                  }
                , Cmd.none
                )

        DeleteUser id ->
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


updateOrSave : Model -> ( Model, Cmd Msg )
updateOrSave model =
    case model.userId of
        Just id ->
            ( updateUser model id, Cmd.none )

        Nothing ->
            ( model, Random.generate SaveUser (Random.int 111111 999999) )


saveUser : Model -> Int -> Model
saveUser model random =
    let
        ageAsInt =
            case String.toInt model.age of
                Err err ->
                    Nothing

                Ok int ->
                    Just int

        user =
            User random model.name ageAsInt False

        newUsers =
            user :: model.users
    in
        { model
            | users = newUsers
            , name = ""
            , age = ""
            , message = ""
        }


updateUser : Model -> Int -> Model
updateUser model id =
    let
        ageAsInt =
            case String.toInt model.age of
                Err err ->
                    Nothing

                Ok int ->
                    Just int

        newUsers =
            List.map
                (\user ->
                    if user.id == id then
                        { user
                            | name = model.name
                            , age = ageAsInt
                        }
                    else
                        user
                )
                model.users
    in
        { model
            | users = newUsers
            , name = ""
            , age = ""
            , message = ""
            , button = "save"
            , userId = Nothing
        }
