module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import State exposing (..)
import Modules.Jedis as Jedis exposing (..)
import Modules.Droids as Droids exposing (..)


view : State.Model -> Html State.Msg
view model =
    let
        jedisView =
            Html.map JedisMsg (Jedis.view model.jedis)

        droidsView =
            Html.map DroidsMsg (Droids.view model.droids)
    in
        div [ class "main" ]
            [ h1 [] [ text "My Star Wars Collection ", span [] [ text (stats model) ] ]
            , div [ class "components" ]
                [ jedisView
                , droidsView
                ]
            , div [ class "model" ] [ text (toString model) ]
            ]


stats : State.Model -> String
stats model =
    let
        jedis =
            toString (List.length model.jedis.jedis)

        droids =
            toString (List.length model.droids.droids)
    in
        "Jedis: " ++ jedis ++ ", Droids: " ++ droids
