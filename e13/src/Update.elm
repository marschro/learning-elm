module Update exposing (..)

import State exposing (..)


-- INIT


initModel : State.Model
initModel =
    { notifications = False
    , autoplay = False
    , location = False
    }



-- UPDATE - What happens if the user makes things... ?


update : State.Msg -> State.Model -> ( State.Model, Cmd State.Msg )
update msg model =
    case msg of
        ToggleNotifications ->
            ( { model | notifications = not model.notifications }, Cmd.none )

        ToggleAutoplay ->
            ( { model | notifications = not model.autoplay }, Cmd.none )

        ToggleLocation ->
            ( { model | notifications = not model.location }, Cmd.none )
