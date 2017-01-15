module View exposing (..)

import State exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    fieldset []
        [ checkbox ToggleNotifications "Email Notifications" model.notifications
        , checkbox ToggleAutoplay "Video Autoplay" model.autoplay
        , checkbox ToggleLocation "Use Location" model.location
        ]


checkbox : msg -> String -> Bool -> Html msg
checkbox msg name bool =
    label []
        [ input [ type_ "checkbox", checked bool, onClick msg ] []
        , text name
        ]
