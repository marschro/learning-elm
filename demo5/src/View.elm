module View exposing (..)

import State exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    let
        classname =
            model.fontSize |> toString |> String.toLower
    in
        div []
            [ viewPicker
                [ ( "Small", SwitchTo Small )
                , ( "Medium", SwitchTo Medium )
                , ( "Large", SwitchTo Large )
                ]
            , section [ class classname ] [ text model.content ]
            ]


viewPicker : List ( String, msg ) -> Html msg
viewPicker options =
    fieldset [] (List.map radio options)


radio : ( String, msg ) -> Html msg
radio ( name, msg ) =
    label []
        [ input [ type_ "radio", onClick msg ] []
        , text name
        ]
