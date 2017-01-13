module State exposing (..)


type alias Model =
    { jedis : Jedi_Model
    , droids : Droid_Model
    }


type alias Jedi_Model =
    { input : String
    , hasFocus : Bool
    , jedis : List Jedi
    }


type alias Jedi =
    { name : String
    }


type Jedi_Msg
    = Add_Jedi
    | Update_Jedi String
    | SetFocus_Jedi
    | RemoveFocus_Jedi


initJediModel : Jedi_Model
initJediModel =
    { input = ""
    , hasFocus = False
    , jedis = []
    }


type alias Droid_Model =
    { input : String
    , hasFocus : Bool
    , droids : List Droid
    , ownerSelect : Maybe Jedi
    }


type alias Droid =
    { name : String
    , deleted : Bool
    , owner : Maybe Jedi
    }


type Msg
    = JedisMsg Jedi_Msg
    | DroidsMsg Droid_Msg


type Droid_Msg
    = Add_Droid
    | Update_Droid String
    | SetFocus_Droid
    | RemoveFocus_Droid
    | Delete_Droid Droid


initModel : Model
initModel =
    { jedis = initJediModel
    , droids = initDroidsModel
    }


initDroidsModel : Droid_Model
initDroidsModel =
    { input = ""
    , hasFocus = False
    , droids = []
    , ownerSelect = Nothing
    }
