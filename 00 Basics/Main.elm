module Main exposing (..)

-- a single line comment
{- a multiline comment
   {- can be nested -}
-}


zahl =
    4


float =
    0.5


string =
    "Moin"


bigString =
    """
    aksjdgbas dbhsjka sbdhka
    kahsgdhasjkgd aksjdgbas
    """


concat =
    "Hallo" ++ " Welt"


char =
    'a'


bool =
    True


list =
    [ 1, 2, 2, 3, 4, 5, 6 ]


people =
    [ "Alf", "Mickey", "Asterix" ]


largerList =
    0 :: 1 :: 12 :: list


error =
    ( 3, "Serious Error of Level 3" )


bill =
    { name = "Gates", age = 57 }


largerZero =
    if 0 > 0 then
        True
    else
        False


square a =
    a * 2


add a b =
    a + b


angriff wann wieviele =
    toString (wieviele) ++ " Reiter greifen " ++ wann ++ " an"


type alias User =
    { name : String
    , bio : String
    , pic : String
    }


type Visibility
    = All
    | Active
    | Completed


type Maybe a
    = Nothing
    | Just a


type alias Dog =
    { name : String
    , age : Maybe Int
    }
