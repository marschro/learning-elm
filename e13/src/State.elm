module State exposing (..)

-- Main Model


type alias Model =
    { notifications : Bool
    , autoplay : Bool
    , location : Bool
    }


type Msg
    = ToggleNotifications
    | ToggleAutoplay
    | ToggleLocation
