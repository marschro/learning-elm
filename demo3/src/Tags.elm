module Tags exposing (..)

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
    { tag : String
    , tags : List Tag
    }


type alias Tag =
    { name : String
    }


initModel : Model
initModel =
    { tag = ""
    , tags = []
    }



-- UPDATE - What happens if the user makes things... ?


type Msg
    = Add
    | Update String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add ->
            if String.isEmpty model.tag then
                ( model, Cmd.none )
            else
                let
                    newTag =
                        Tag model.tag

                    newTags =
                        newTag :: model.tags
                in
                    ( { model | tag = "", tags = newTags }, Cmd.none )

        Update input ->
            ( { model | tag = input }, Cmd.none )



-- VIEW - Without, you wont see anything...


view : Model -> Html Msg
view model =
    div [ class "component" ]
        [ h2 [] [ text "Tags" ]
        , input [ type_ "text", placeholder "enter tag name", onInput Update, value model.tag ] []
        , input [ type_ "submit", value "Add Tag", onClick Add ] []
        , div [ class "model" ] [ text (toString model) ]
        ]



-- SUBSCRIPTIONS - This is brainfuck... nothing for today


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
