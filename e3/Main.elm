module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Login
import Users


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }



-- model


type alias Model =
    { page : Page
    , login : Login.Model
    , users : Users.Model
    }


initModel : Model
initModel =
    { page = LoginPage
    , login = Login.initModel
    , users = Users.initModel
    }


type Page
    = LoginPage
    | UsersPage



-- update


type Msg
    = ChangePage Page
    | LoginMsg Login.Msg
    | UsersMsg Users.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePage page ->
            { model | page = page }

        LoginMsg loginMsg ->
            { model | login = Login.update loginMsg model.login }

        UsersMsg usersMsg ->
            { model | users = Users.update usersMsg model.users }



-- view


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                LoginPage ->
                    App.map LoginMsg
                        (Login.view model.login)

                UsersPage ->
                    App.map UsersMsg
                        (Users.view model.users)
    in
        div []
            [ div []
                [ a [ href "#", onClick (ChangePage LoginPage) ] [ text "Login" ]
                , span [] [ text " | " ]
                , a [ href "#", onClick (ChangePage UsersPage) ] [ text "Users" ]
                , hr [] []
                , page
                , hr [] []
                , h4 [] [ text "App Model:" ]
                , p [] [ text <| toString model ]
                ]
            ]
