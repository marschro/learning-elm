module View exposing (view)

import State exposing (Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Animation


view : Model -> Html Msg
view model =
    let
        styles =
            Animation.render model.menuStyle

        attributes =
            class "menu" :: styles
    in
        div [ class "main" ]
            [ input [ type_ "submit", id "menu-button", onClick ToggleMenu, value "Menu" ] [ text "Menu" ]
            , div attributes
                [ p []
                    [ text "Dies ist ein Menü oder sowas..."
                    ]
                ]
            , div [] [ text "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet." ]
            , p [ class "model" ] [ text (toString (model)) ]
            ]
