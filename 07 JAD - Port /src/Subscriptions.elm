port module Subscriptions exposing (..)

import State exposing (Model, Msg(..), Call)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- port for sending strings out to JavaScript


port animate : Call -> Cmd msg



-- port for listening for suggestions from JavaScript


port animationDone : (String -> msg) -> Sub msg
