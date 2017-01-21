module Update exposing (initModel, update)

import State exposing (..)
import Animation


initModel : Model
initModel =
    { menuIsVisible = False
    , menuStyle =
        Animation.style
            [ Animation.left (Animation.px -100)
            , Animation.opacity 0.0
            ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleMenu ->
            let
                toggleStyle =
                    if model.menuIsVisible then
                        [ Animation.left (Animation.px -100)
                        , Animation.opacity 0.0
                        ]
                    else
                        [ Animation.left (Animation.px 0)
                        , Animation.opacity 1.0
                        ]

                menuStyle =
                    Animation.interrupt [ Animation.to toggleStyle ] model.menuStyle

                toggleValue =
                    case model.menuIsVisible of
                        True ->
                            False

                        False ->
                            True
            in
                ( { model | menuIsVisible = toggleValue, menuStyle = menuStyle }, Cmd.none )

        Animate msg ->
            ( { model | menuStyle = Animation.update msg model.menuStyle }, Cmd.none )
