module State exposing (..)

-- Main Model


type alias Model =
    { fontSize : FontSize
    , content : String
    }


type FontSize
    = Small
    | Medium
    | Large


type Msg
    = SwitchTo FontSize
