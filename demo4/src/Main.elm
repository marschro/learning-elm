module Main exposing (..)

import Html exposing (Html)
import State exposing (..)
import Update exposing (..)
import View exposing (..)


-- MAIN - The Program


main : Program Never State.Model State.Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT - invoking is essential


init : ( State.Model, Cmd State.Msg )
init =
    ( Update.initModel, Cmd.none )



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : State.Model -> Sub State.Msg
subscriptions model =
    Sub.none
