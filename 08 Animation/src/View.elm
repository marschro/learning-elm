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
            class "submenu" :: styles
    in
        div [ class "main" ]
            [ input [ type_ "submit", id "menu", onClick ToggleMenu, value "Menu" ] [ text "Menu" ]
            , div attributes [ text "Dies ist ein Menü" ]
            ]
