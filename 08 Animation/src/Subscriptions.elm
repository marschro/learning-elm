port module Subscriptions exposing (..)

import State exposing (Model, Msg(..))
import Animation


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Animation.subscription Animate [ model.menuStyle ]
        ]
