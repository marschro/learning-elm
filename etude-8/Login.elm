module Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Statistics =
    { success : Int
    , failed : Int
    }


type alias Model =
    { username : String
    , password : String
    , loggedIn : ( Bool, String )
    , stats : Statistics
    }


initModel : Model
initModel =
    { username = ""
    , password = ""
    , loggedIn = ( False, "Please insert your credentials" )
    , stats = { success = 0, failed = 0 }
    }



-- update


type Msg
    = UsernameInput String
    | PasswordInput String
    | Login


update : Msg -> Model -> Model
update msg model =
    case msg of
        UsernameInput username ->
            { model | username = username }

        PasswordInput password ->
            { model | password = password }

        Login ->
            let
                username =
                    model.username == "Martin"

                password =
                    model.password == "locomoto"
            in
                if username && password then
                    { model
                        | loggedIn = ( True, "You are logged in :)" )
                        , username = ""
                        , password = ""
                        , stats = updateStats 1 model.stats
                    }
                else
                    { model
                        | loggedIn = ( False, "Wrong credentials" )
                        , username = ""
                        , password = ""
                        , stats = updateStats 0 model.stats
                    }


updateStats : Int -> Statistics -> Statistics
updateStats int stats =
    case int of
        1 ->
            { success = stats.success + 1, failed = stats.failed }

        0 ->
            { success = stats.success, failed = stats.failed + 1 }

        _ ->
            { success = stats.success, failed = stats.failed }



-- view


view : Model -> Html Msg
view model =
    div []
        [ h4 [] [ text "Login" ]
        , input [ type' "text", placeholder "username", value model.username, onInput UsernameInput ] []
        , input [ type' "password", placeholder "password", value model.password, onInput PasswordInput ] []
        , input [ type' "submit", value "Login", onClick Login, onSubmit Login ] []
        , div [ class "message" ]
            [ p [] [ text <| snd model.loggedIn ]
            , hr [] []
            ]
        ]
