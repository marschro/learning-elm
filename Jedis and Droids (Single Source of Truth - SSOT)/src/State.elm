module State exposing (Model, Msg)

-- MODEL - never run without the model, cause it is state


type alias Model =
    { inputJediName : String
    , inputDroidName : String
    , jediHasFocus : Bool
    , droidHasFocus : Bool
    , jedis : List Jedi
    , droids : List Droid
    }


type alias Droid =
    { name : String
    }


type alias Jedi =
    { name : String
    }


type Msg
    = Jedi_Add
    | Jedi_Update String
    | Jedi_SetFocus
    | Jedi_RemoveFocus
    | Droid_Add
    | Droid_Update String
    | Droid_SetFocus
    | Droid_RemoveFocus
    | Droid_Delete Droid
