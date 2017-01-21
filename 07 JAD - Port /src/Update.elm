module Update exposing (initModel, update)

import State exposing (..)
import Subscriptions exposing (..)


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
        Jedi_Add ->
            if String.isEmpty model.inputJediName then
                ( model, Cmd.none )
            else
                let
                    newJedi =
                        Jedi model.inputJediName

                    newJedis =
                        newJedi :: model.jedis
                in
                    ( { model | inputJediName = "", jedis = newJedis }, Cmd.none )

        Jedi_Update string ->
            ( { model | inputJediName = string }, Cmd.none )

        Jedi_SetFocus ->
            ( { model | jediHasFocus = True }, Cmd.none )

        Jedi_RemoveFocus ->
            ( { model | jediHasFocus = False }, Cmd.none )

        Droid_Add ->
            if String.isEmpty model.inputDroidName then
                ( model, Cmd.none )
            else
                let
                    newDroid =
                        Droid model.inputDroidName False

                    newDroids =
                        newDroid :: model.droids
                in
                    ( { model | inputDroidName = "", droids = newDroids }, Cmd.none )

        Droid_Update string ->
            ( { model | inputDroidName = string }, Cmd.none )

        Droid_SetFocus ->
            ( { model | droidHasFocus = True }, Cmd.none )

        Droid_RemoveFocus ->
            ( { model | droidHasFocus = False }, Cmd.none )

        Droid_Delete droidToDelete ->
            let
                newDroidsList =
                    List.map
                        (\droid ->
                            if droid == droidToDelete then
                                { droid | deleted = True }
                            else
                                droid
                        )
                        model.droids
            in
                ( { model | droids = newDroidsList }, Cmd.none )
