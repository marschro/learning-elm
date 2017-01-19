module Main exposing (..)

-- a single line comment
{- a multiline comment
   {- can be nested -}
-}
-- ALLGEMEINES


zahl : Int
zahl =
    4


float : Float
float =
    0.5


char : Char
char =
    'a'


string : String
string =
    "Moin"


longString : String
longString =
    """
    aksjdgbas dbhsjka sbdhka
    kahsgdhasjkgd aksjdgbas
    """


concat =
    1 + 2



-- BOOLEAN


bool : Bool
bool =
    True



-- LISTEN


list : List number
list =
    [ 1, 2, 2, 3, 4, 5, 6 ]


names : List String
names =
    [ "Schub", "asd", "Bada" ]


largerList =
    0 :: 1 :: 12 :: list



-- TUPEL


error =
    ( 3, "Serious Level 3 Error !!! " )



-- RECORDS


tom =
    { name = "Morello", age = 57 }



-- FUNKTIONEN


square : Int -> Int
square a =
    a * 2


add : Int -> Int -> ( Int, Int )
add a b =
    ( a, b )


angriff : String -> Int -> String
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
    | Wichtig


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

        Wichtig ->
            tasks
