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
    | Finished
    | Important


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

        Finished ->
            List.filter
                (\task ->
                    task.completed == True
                )
                tasks

        Important ->
            tasks



-- Impossible States
-- old


type alias TaskX =
    { name : String
    , inProgress : Bool
    , progress : Int
    , completed : Bool
    , completedBy : String
    , waiting : Bool
    , waitingReason : List String
    }



-- cleaner


type Status
    = Open
    | InProgress Int
    | Waiting List String
    | Completed String


type alias TaskY =
    { name : String
    , status : Status
    }



-- THERE IS NO UNDEFINED, NULL or NILL or whatsoever...


type Maybe a
    = Just a
    | Nothing


val1 : Maybe Int
val1 =
    Nothing


val2 : Maybe Int
val2 =
    Just 42



-- WHAT'S THE RESULT, ANYWAYS? - sometimes things fail, sometomes they are ok
--
-- type Result err success
--     = Error error
--     | Ok success
