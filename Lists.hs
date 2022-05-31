module Lists where

-- | isSorted : Checks if a list is sorted from smallest to biggest.
isSorted :: (Ord a) => [a] -> Bool
isSorted list = case list of
    x:y:ys
        | x <= y    -> isSorted (y:ys)
        | otherwise -> False
    [_]             -> True
    _               -> True


-- insertSorted : Assuming that the input list is sorted, take an element and
-- insert it into the list in the correct place, so that the list is still
-- sorted.
insertSorted :: (Ord a) => [a] -> a -> [a]
insertSorted list a = case list of
    x:xs
        | x >= a    -> a:x:xs
        | otherwise -> x:(insertSorted xs a) 
    []              -> [a]


-- removeDup : Takes a list, and deletes any elements that have already
-- appeared in the list so far. (Don't use nub here.)
removeDup :: (Eq a) => [a] -> [a]
removeDup list = remDup list []

remDup :: (Eq a) => [a] -> [a] -> [a]
remDup list acc = case list of
    x:xs
        | elem x acc -> remDup xs acc
        | otherwise  -> remDup xs (x:acc)
    []               -> reverse acc

-- continuous : Takes a list of integers, and checks that each element
-- in the list is at most one away from the previous element
continuous :: [Integer] -> Bool
continuous list = case list of
    x:y:ys
        | (abs (y-x)) <= 1 -> continuous (y:ys)
        | otherwise        -> False
    _                      -> True

-- rotate : Takes a list, and a value, and rotates the list around
-- by the number of elements indicated
rotate :: [a] -> Int -> [a]
rotate list x = rotacc list x []

rotacc :: [a] -> Int -> [a] -> [a]
rotacc (x:xs) depth acc
    | depth == 0 = (xs ++ [x] ++ acc)
    | otherwise  = rotacc (xs) (depth-1) (x:acc)
rotacc [] _ _ = error "Depth not in list"



-- insertAt : Takes a list of `a`, an element of type `a`, an index `Int`,
-- and inserts that element into the list at that element.
insertAt :: [a] -> a -> Int -> [a]
insertAt list e depth = case (list,depth) of
    (_,0)    -> e:list
    (x:xs,n) -> x:(insertAt xs e (n-1))
    ([],_)   -> error "Not in list"


-- runLengthEncoding : Takes a list, and returns a list of tuples,
-- counting how many times that element was duplicated consecutively.
runLengthEncoding :: (Eq a) => [a] -> [(a,Integer)]
runLengthEncoding list = map (\y -> (y, occurs y list)) list

occurs :: (Eq a) => a -> [a] -> Integer
occurs e list = case list of
    x:xs
      | x == e    -> 1 + occurs e xs
      | otherwise -> occurs e xs
    []              -> 0


-- runLengthDecoding : Take the output from `runLengthEncoding`, and 
-- reconstruct the original string.
runLengthDecoding :: [(a,Integer)] -> [a]
runLengthDecoding list = map (\(x,_y)->x) list

-- transpose : Takes [[a]] as input, and transpose it 
-- (swap rows with columns). (Don't use the transposes function in Data.List here)
transpose :: [[a]] -> [[a]]
transpose = undefined