-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/time.html


module Main exposing (..)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time


-- PROGRAM


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { millisecond : Millisecond
    , second : Second
    , minute : Minute
    , hour : Hour
    }


init : ( Model, Cmd Msg )
init =
    ( (Model 0 0 0 0), Cmd.none )



-- TYPES


type alias Millisecond =
    Time.Time


type alias Second =
    Time.Time


type alias Minute =
    Time.Time


type alias Hour =
    Time.Time



-- UPDATE


type Msg
    = Tick Millisecond
    | Tack Second
    | Tock Minute
    | Tuck Hour


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newMillisecond ->
            ( { model | millisecond = newMillisecond }, Cmd.none )

        Tack newSecond ->
            ( { model | second = newSecond }, Cmd.none )

        Tock newMinute ->
            ( { model | minute = newMinute }, Cmd.none )

        Tuck newHour ->
            ( { model | hour = newHour }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every Time.millisecond Tick
        , Time.every Time.second Tack
        , Time.every Time.minute Tock
        , Time.every Time.hour Tuck
        ]



-- VIEW


view : Model -> Html Msg
view model =
    let
        millisecondAngle =
            turns (Time.inMinutes model.millisecond)

        secondAngle =
            turns (Time.inMinutes model.second)

        minuteAngle =
            turns (Time.inMinutes model.minute)

        hourAngle =
            turns (Time.inHours model.hour)

        milliStroke =
            ( toString (50 + 40 * (cos millisecondAngle)), toString (50 + 40 * (sin millisecondAngle)) )

        secondStroke =
            ( toString (50 + 40 * (cos secondAngle)), toString (50 + 40 * (sin secondAngle)) )

        minuteStroke =
            ( toString (50 + 40 * (cos minuteAngle)), toString (50 + 40 * (sin minuteAngle)) )

        hourStroke =
            ( toString (50 + 40 * (cos hourAngle)), toString (50 + 40 * (sin hourAngle)) )
    in
        svg [ viewBox "0 0 100 100", width "300px" ]
            [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
            , line [ x1 "50", y1 "50", x2 (Tuple.first milliStroke), y2 (Tuple.second milliStroke), stroke "#023963" ] []
            , line [ x1 "50", y1 "50", x2 (Tuple.first secondStroke), y2 (Tuple.second secondStroke), stroke "#023963" ] []
            , line [ x1 "50", y1 "50", x2 (Tuple.first minuteStroke), y2 (Tuple.second minuteStroke), stroke "#023963" ] []
            , line [ x1 "50", y1 "50", x2 (Tuple.first hourStroke), y2 (Tuple.second hourStroke), stroke "#023963" ] []
            ]
