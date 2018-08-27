module Set.Any exposing (..)

import Dict
import Dict.Any exposing (AnyDict)
import Set exposing (Set)


type AnySet comparable a
    = AnySet (AnyDict comparable a ())


empty : (a -> comparable) -> AnySet comparable a
empty =
    AnySet << Dict.Any.empty


singleton : a -> (a -> comparable) -> AnySet comparable a
singleton a =
    AnySet << Dict.Any.singleton a ()


insert : a -> AnySet comparable a -> AnySet comparable a
insert a (AnySet dict) =
    AnySet <| Dict.Any.insert a () dict


remove : a -> AnySet comparable a -> AnySet comparable a
remove a (AnySet dict) =
    AnySet <| Dict.Any.remove a dict


isEmpty : AnySet comparable a -> Bool
isEmpty (AnySet dict) =
    Dict.Any.isEmpty dict


member : a -> AnySet comparable a -> Bool
member a (AnySet dict) =
    Dict.Any.member a dict


size : AnySet comparable a -> Int
size (AnySet dict) =
    Dict.Any.size dict


union : AnySet comparable a -> AnySet comparable a -> AnySet comparable a
union (AnySet d1) (AnySet d2) =
    AnySet <| Dict.Any.union d1 d2


intersect : AnySet comparable a -> AnySet comparable a -> AnySet comparable a
intersect (AnySet d1) (AnySet d2) =
    AnySet <| Dict.Any.intersect d1 d2


diff : AnySet comparable a -> AnySet comparable a -> AnySet comparable a
diff (AnySet d1) (AnySet d2) =
    AnySet <| Dict.Any.diff d1 d2


toList : AnySet comparable a -> List a
toList (AnySet dict) =
    Dict.Any.keys dict


fromList : (a -> comparable) -> List a -> AnySet comparable a
fromList toComparable =
    AnySet << Dict.Any.fromList toComparable << List.map (\a -> ( a, () ))


map : (b -> comparable2) -> (a -> b) -> AnySet comparable a -> AnySet comparable2 b
map toComparable f =
    fromList toComparable << foldl (\x xs -> f x :: xs) []


foldl : (a -> b -> b) -> b -> AnySet comparable a -> b
foldl f init (AnySet dict) =
    Dict.Any.foldl (\x _ acc -> f x acc) init dict


foldr : (a -> b -> b) -> b -> AnySet comparable a -> b
foldr f init (AnySet dict) =
    Dict.Any.foldr (\x _ acc -> f x acc) init dict


filter : (a -> Bool) -> AnySet comparable a -> AnySet comparable a
filter f (AnySet dict) =
    AnySet <| Dict.Any.filter (always << f) dict


partition : (a -> Bool) -> AnySet comparable a -> ( AnySet comparable a, AnySet comparable a )
partition f (AnySet dict) =
    Dict.Any.partition (always << f) dict
        |> Tuple.mapFirst AnySet
        |> Tuple.mapSecond AnySet


toSet : AnySet comparable a -> Set comparable
toSet (AnySet dict) =
    Dict.Any.toDict dict
        |> Dict.keys
        |> Set.fromList
