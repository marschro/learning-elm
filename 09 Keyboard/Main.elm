module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Keyboard


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Keyboard.downs KeyDown


type alias Model =
    ( Int, Int )


type Msg
    = KeyDown Keyboard.KeyCode


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


initModel : Model
initModel =
    ( 0, 0 )


velocity : Int
velocity =
    10


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyDown key ->
            ( handleKeyboardInput model key, Cmd.none )


view : Model -> Html Msg
view ( x, y ) =
    let
        position =
            [ ( "position", "absolute" )
            , ( "top", (toString y) ++ "px" )
            , ( "left", (toString x) ++ "px" )
            ]

        pointStyle =
            [ ( "width", "20px" )
            , ( "height", "20px" )
            , ( "borderRadius", "10px" )
            , ( "backgroundColor", "red" )
            ]
    in
        div [ style position ]
            [ div [ style pointStyle ] []
            ]


handleKeyboardInput : Model -> Keyboard.KeyCode -> Model
handleKeyboardInput ( x, y ) keyCodeKeyboard =
    case keyCodeKeyboard of
        37 ->
            ( x - velocity, y )

        38 ->
            ( x, y - velocity )

        39 ->
            ( x + velocity, y )

        40 ->
            ( x, y + velocity )

        _ ->
            ( x, y )
