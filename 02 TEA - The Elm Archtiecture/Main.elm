module Main exposing (..)

import Html exposing (..)


-- MAIN - The Program


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT - invoking is essential


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MODEL - never run without the model, cause it is state
-- UPDATE - What happens if the user makes things... ?


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    div [] []



-- SUBSCRIPTIONS - communicate with the outer world


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
