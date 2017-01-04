module Main exposing (..)

import Html exposing (..)


--import Html.Attributes exposing (..)
--import Html.Events exposing (..)

import Users exposing (..)
import Tags exposing (..)


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
    { users : Users.Model
    , tags : Tags.Model
    }


initModel : Model
initModel =
    { users = Users.initModel
    , tags = Tags.initModel
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = UsersMsg Users.Msg
    | TagsMsg Tags.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UsersMsg msg ->
            let
                ( updateModel, cmd ) =
                    Users.update msg model.users
            in
                ( { model | users = updateModel }
                , Cmd.map UsersMsg cmd
                )

        TagsMsg msg ->
            let
                ( updateModel, cmd ) =
                    Tags.update msg model.tags
            in
                ( { model | tags = updateModel }
                , Cmd.map TagsMsg cmd
                )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    let
        usersView =
            Html.map UsersMsg (Users.view model.users)

        tagsView =
            Html.map TagsMsg (Tags.view model.tags)
    in
        div []
            [ h1 [] [ text "Dashboard" ]
            , usersView
            , tagsView
            , hr [] []
            , p [] [ text (toString model) ]
            ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
