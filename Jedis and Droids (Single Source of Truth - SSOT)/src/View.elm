module View exposing (..)

import State as Msg exposing (Msg)
import State as Model exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model =
    div [ class "main" ]
        [ h1 [] [ text "My Star Wars Collection " ]
        , div [ class "components" ] []
        , div [ class "model" ] [ text (toString model) ]
        ]
