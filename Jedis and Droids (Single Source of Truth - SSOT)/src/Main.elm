module Main exposing (..)

import Html exposing (Html)
import State as Msg exposing (Msg)
import State as Model exposing (Model)
import Update exposing (..)
import View exposing (..)


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
    ( Update.initModel, Cmd.none )



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
