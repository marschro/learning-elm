port module Subscriptions exposing (subscriptions)

import State exposing (Model, Msg(..), Call)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- port for sending strings out to JavaScript


port send : Call -> Cmd msg



-- port for listening for suggestions from JavaScript


port receive : (String -> msg) -> Sub msg
