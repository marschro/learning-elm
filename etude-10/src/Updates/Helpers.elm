module Updates.Helpers exposing (..)


validateAge : String -> ( String, String )
validateAge age =
    let
        newAge =
            case String.toInt age of
                Err err ->
                    ""

                Ok value ->
                    toString value

        newMessage =
            case String.toInt age of
                Err err ->
                    "Age must be a number!"

                Ok int ->
                    if int > 100 then
                        "Haha... that would be old"
                    else if int < 10 then
                        "Pretty young.. hugh?"
                    else
                        "Good age"
    in
        ( newAge, newMessage )


validateName : String -> ( String, String )
validateName name =
    let
        newName =
            name

        newMessage =
            ""
    in
        ( newName, newMessage )
