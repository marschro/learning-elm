module Main exposing (..)

import Html exposing (Html, div, text, a, span, hr)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Navigation exposing (..)
import Users.Model exposing (..)
import Users.View exposing (..)
import Users.Update exposing (..)


-- Model


type Page
    = NotFound
    | UsersPage


type alias Model =
    { page : Page
    , users : Users.Model.Model
    }


initModel : Model
initModel =
    { page = UsersPage
    , users = Users.Model.initModel
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            hashToPage location.hash
    in
        ( initModel page, Cmd.none )



-- Update


type Msg
    = Navigate Page
    | UsersMsg Users.Update.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate page ->
            ( { model | page = page }, Cmd.none )

        UsersMsg msg ->
            ( { model | users = Users.Update.update msg model.users }, Cmd.none )



-- MembersMsg msg ->
--     { model | members = ( Members.Update.update msg model.members, Cmd.none ) }
-- View


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                UsersPage ->
                    Html.map UsersMsg
                        (Users.View.mainView model.users)
    in
        div []
            [ div []
                [ a [ href "#", onClick (Navigate UsersPage) ] [ text "Users" ]
                , span [] [ text " | " ]
                , a [ href "#", onClick (Navigate UsersPage) ] [ text "Members" ]
                ]
            , hr [] []
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
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
