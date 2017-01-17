module Main exposing (..)

-- a single line comment
{- a multiline comment
   {- can be nested -}
-}
-- ALLGEMEINES


zahl =
    4


float =
    0.5


char =
    'a'


string =
    "Moin"


longString =
    """
    aksjdgbas dbhsjka sbdhka
    kahsgdhasjkgd aksjdgbas
    """


concat =
    "Hallo" ++ " Welt"



-- BOOLEAN


bool =
    True



-- LISTEN


list =
    [ 1, 2, 2, 3, 4, 5, 6 ]


names =
    [ "Schub", "Didu", "Bada" ]


largerList =
    0 :: 1 :: 12 :: list



-- TUPEL


error =
    ( 3, "Serious Error of Level 3" )



-- RECORDS


bill =
    { name = "Gates", age = 57 }



-- FUNKTIONEN


square a =
    a * 2


add a b =
    a + b


angriff wann wieviele =
    toString (wieviele) ++ " Reiter greifen " ++ wann ++ " an"



-- CONDITIONS


largerZero =
    if 0 > 0 then
        True
    else
        False



-- TYPE ALIASSES


type alias User =
    { name : String
    , bio : String
    , pic : String
    , age : Maybe Int
    }


lala =
    { name = "Lala Toskoljowitsch"
    , bio = "Lorem ipsum dolor sit..."
    , pic = "/users/lala/avatar.png"
    }


getName user =
    user.name



-- UNION TYPES


type Visibility
    = All
    | Active
    | Completed


type alias Task =
    { active : Bool
    , completed : Bool
    }



-- PATERN MATCHING WITH UNION TYPES


showTasks : Visibility -> List Task -> List Task
showTasks msg tasks =
    case msg of
        All ->
            tasks

        Active ->
            List.filter
                (\task ->
                    task.active == not False
                )
                tasks

        Completed ->
            List.filter
                (\task ->
                    task.completed == True
                )
                tasks
