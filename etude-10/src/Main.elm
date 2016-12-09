module Main exposing (..)

import Html exposing (Html)
import Widgets.UserAdministration.Model exposing (..)
import Widgets.UserAdministration.View exposing (..)
import Widgets.UserAdministration.Update exposing (..)


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
