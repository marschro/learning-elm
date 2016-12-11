module Main exposing (..)

import Html exposing (Html, div, text, a, span, hr)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Users.Model exposing (..)
import Users.View exposing (..)
import Users.Update exposing (..)
import Members.Model exposing (..)
import Members.View exposing (..)
import Members.Update exposing (..)


-- Model


type alias Model =
    { page : Page
    , users : ( Users.Model.Model, Cmd Msg )
    , members : ( Members.Model.Model, Cmd Msg )
    }


type Page
    = UsersPage
    | MembersPage


initModel : Model
initModel =
    { page = UsersPage
    , users = ( Users.Model.initModel, Cmd.none )
    , members = ( Members.Model.initModel, Cmd.none )
    }



-- Update


type Msg
    = ChangePage Page
    | UsersMsg Users.Update.Msg
    | MembersMsg Members.Update.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePage page ->
            { model | page = page }

        UsersMsg msg ->
            { model | members = ( Users.Update.update msg model.users, Cmd.none ) }

        MembersMsg msg ->
            { model | members = ( Members.Update.update msg model.members, Cmd.none ) }



-- View


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                UsersPage ->
                    Html.map UsersMsg
                        (Users.View.mainView model.usersModel)

                MembersPage ->
                    Html.map MembersMsg
                        (Members.View.mainView model.members)
    in
        div []
            [ div []
                [ a [ href "#", onClick ChangePage (UsersPage) ] [ text "Users" ]
                , span [] [ text " | " ]
                , a [ href "#", onClick ChangePage (MembersPage) ] [ text "Members" ]
                ]
            , hr [] []
            , page
            ]



-- Main
--
-- main : Program Never Model Msg
-- main =
--     Html.beginnerProgram
--         { model = initModel
--         , update = update
--         , view = view
--         }


main : Program Never Model Msg
main =
    Html.program
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none