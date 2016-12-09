module Models.Main exposing (..)


type alias Model =
    { users : List User
    , name : String
    , age : String
    , userId : Maybe Int
    , message : String
    , button : String
    }


type alias User =
    { id : Int
    , name : String
    , age : Maybe Int
    , deleted : Bool
    }


initModel : Model
initModel =
    { users = []
    , name = ""
    , age = ""
    , userId = Nothing
    , message = ""
    , button = "Save"
    }
