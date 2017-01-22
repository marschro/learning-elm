module Update exposing (initModel, update)

import State exposing (..)
import Animation


initModel : Model
initModel =
    { menuIsVisible = False
    , menuStyle =
        Animation.style
            [ Animation.left (Animation.px -40)
            , Animation.opacity 0.0
            , Animation.height (Animation.px 0)
            ]
    }


menuHeight : Float
menuHeight =
    300


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleMenu ->
            let
                menuState =
                    case model.menuIsVisible of
                        True ->
                            False

                        False ->
                            True

                toggleStyle =
                    if menuState then
                        [ Animation.left (Animation.px 0)
                        , Animation.opacity 1.0
                        , Animation.height (Animation.px menuHeight)
                        ]
                    else
                        [ Animation.left (Animation.px -40)
                        , Animation.opacity 0.0
                        , Animation.height (Animation.px 0)
                        ]

                menuStyle =
                    Animation.interrupt [ Animation.to toggleStyle ] model.menuStyle
            in
                ( { model | menuIsVisible = menuState, menuStyle = menuStyle }, Cmd.none )

        Animate msg ->
            ( { model | menuStyle = Animation.update msg model.menuStyle }, Cmd.none )
