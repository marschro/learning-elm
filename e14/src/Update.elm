module Update exposing (..)

import State exposing (..)


initModel : Model
initModel =
    { fontSize = Small
    , content = "asd"
    }



--UPDATE - What happens if the user makes things... ?


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SwitchTo newFontSize ->
            ( { model | fontSize = newFontSize }, Cmd.none )
