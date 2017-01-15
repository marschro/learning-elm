module Main exposing (..)

import Html exposing (..)


-- Main


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    {}


type Msg
    = Hi


initModel : Model
initModel =
    {}


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )

update :
update msg model =
    ( initModel, Cmd.none )


subscriptions model =
    Sub.none


view model =
    div []
        [ h1 [] [ text "Hallo Welt" ]
        ]
