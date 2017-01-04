module Users exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


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


type alias Model =
    { name : String
    , users : List User
    }


type alias User =
    { name : String
    }


initModel : Model
initModel =
    { name = ""
    , users = []
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = Add
    | Update String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add ->
            if String.isEmpty model.name then
                ( model, Cmd.none )
            else
                let
                    newUser =
                        User model.name

                    newUsers =
                        newUser :: model.users
                in
                    ( { model | name = "", users = newUsers }, Cmd.none )

        Update input ->
            ( { model | name = input }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Users" ]
        , input [ type_ "text", placeholder "enter username", onInput Update, value model.name ] []
        , input [ type_ "submit", value "Add User", onClick Add ] []
        , p [] [ text (toString model) ]
        ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
