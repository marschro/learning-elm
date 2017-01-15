module View exposing (view)

import State exposing (Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Jedis exposing (view)
import Droids exposing (view)


view : Model -> Html Msg
view model =
    div [ class "main" ]
        [ h1 [] [ text "My Star Wars Collection " ]
        , div [ class "components" ]
            [ Jedis.view model
            , Droids.view model
            ]
        , div [ class "model" ] [ text (toString model) ]
        ]
