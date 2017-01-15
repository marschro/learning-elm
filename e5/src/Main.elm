module Main exposing (..)

import Html exposing (Html)
import Model exposing (..)
import View exposing (..)
import Update exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = mainView
        , update = update
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- INIT MODEL


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )
