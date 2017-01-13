module Update exposing (..)

import Modules.Jedis as Jedis exposing (..)
import Modules.Droids as Droids exposing (..)
import State exposing (..)


-- UPDATE - What happens if the user makes things... ?


update : State.Msg -> State.Model -> ( State.Model, Cmd State.Msg )
update msg model =
    case msg of
        JedisMsg msg ->
            let
                ( updateJedis, cmd ) =
                    Jedis.update msg model.jedis
            in
                ( { model | jedis = updateJedis }
                , Cmd.map JedisMsg cmd
                )

        DroidsMsg msg ->
            let
                ( updateModel, cmd ) =
                    Droids.update msg model.droids
            in
                ( { model | droids = updateModel }
                , Cmd.map DroidsMsg cmd
                )
