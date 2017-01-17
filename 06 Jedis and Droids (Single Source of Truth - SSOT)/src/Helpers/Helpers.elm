
Droid_Delete droidToDelete ->
    let
        newDroidsList =
            List.map
                (\droid ->
                    if droid == droidToDelete then
                        { droid | deleted = True }
                    else
                        droid
                )
                model.droids
    in
        ( { model | droids = newDroidsList }, Cmd.none )


input
    [ type_ "button"
    , value "Delete"
    , class "delete"
    , onClick (Droid_Delete droid)
    ]
    []
