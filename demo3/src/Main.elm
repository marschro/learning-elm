module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


--import Html.Attributes exposing (..)
--import Html.Events exposing (..)

import Jedis exposing (..)
import Droids exposing (..)


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
    { jedis : Jedis.Model
    , droids : Droids.Model
    }


initModel : Model
initModel =
    { jedis = Jedis.initModel
    , droids = Droids.initModel
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = JedisMsg Jedis.Msg
    | DroidsMsg Droids.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        JedisMsg msg ->
            let
                ( updateModel, cmd ) =
                    Jedis.update msg model.jedis
            in
                ( { model | jedis = updateModel }
                , Cmd.map JedisMsg cmd
                )

        DroidsMsg msg ->
            let
                ( updateModel, cmd ) =
                    Droids.update msg model.droids
            in
                ( { model | droids = updateModel }
                , Cmd.map DroidsMsg cmd
                )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    let
        jedisView =
            Html.map JedisMsg (Jedis.view model.jedis)

        droidsView =
            Html.map DroidsMsg (Droids.view model.droids)
    in
        div [ class "main" ]
            [ h1 [] [ text "My Star Wars Collection ", span [] [ text (stats model) ] ]
            , div [ class "components" ]
                [ jedisView
                , droidsView
                ]
            , div [ class "model" ] [ text (toString model) ]
            ]


stats : Model -> String
stats model =
    let
        jedis =
            toString (List.length model.jedis.jedis)

        droids =
            toString (List.length model.droids.droids)
    in
        "Jedis: " ++ jedis ++ ", Droids: " ++ droids



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
