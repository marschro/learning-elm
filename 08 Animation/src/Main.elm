port module Main exposing (main)

import State exposing (Model, Msg(..))
import Update exposing (update, initModel)
import Subscriptions exposing (..)
import View exposing (view)
import Html exposing (Html)


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
