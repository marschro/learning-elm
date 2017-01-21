module State exposing (..)

import Animation


-- MODEL - never run without the model, cause it is state


type alias Model =
    { menuIsVisible : Bool
    , menuStyle : Animation.State
    }


type Msg
    = ToggleMenu
    | Animate Animation.Msg
