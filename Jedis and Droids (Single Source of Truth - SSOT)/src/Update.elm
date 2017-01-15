module Update exposing (..)

import State as Msg exposing (Msg)
import State as Model exposing (Model)


initModel : Model
initModel =
    { inputJediName = ""
    , inputDroidName = ""
    , jediHasFocus = False
    , droidHasFocus = False
    , jedis = []
    , droids = []
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Jedi ->
            ( model, Cmd.none )

        -- Jedi_Add ->
        --     ( model, Cmd.none )
        -- Jedi_Update string ->
        --     ( model, Cmd.none )
        --
        -- Jedi_SetFocus ->
        --     ( model, Cmd.none )
        --
        -- Jedi_RemoveFocus ->
        --     ( model, Cmd.none )
        --
        _ ->
            ( model, Cmd.none )
