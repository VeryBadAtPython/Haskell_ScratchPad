module Lists where

-- | isSorted : Checks if a list is sorted from smallest to biggest.
isSorted :: (Ord a) => [a] -> Bool
isSorted = undefined 


-- insertSorted : Assuming that the input list is sorted, take an element and
-- insert it into the list in the correct place, so that the list is still
-- sorted.
insertSorted :: (Ord a) => [a] -> a -> [a]
insertSorted = undefined


-- removeDup : Takes a list, and deletes any elements that have already
-- appeared in the list so far. (Don't use nub here.)
removeDup :: (Eq a) => [a] -> [a]
removeDup = undefined

-- continuous : Takes a list of integers, and checks that each element
-- in the list is at most one away from the previous element
continuous :: [Integer] -> Bool
continuous = undefined

-- rotate : Takes a list, and a value, and rotates the list around
-- by the number of elements indicated
rotate :: [a] -> Int -> [a]
rotate = undefined

-- insertAt : Takes a list of `a`, an element of type `a`, an index `Int`,
-- and inserts that element into the list at that element.
insertAt :: [a] -> a -> Int -> [a]
insertAt = undefined

-- runLengthEncoding : Takes a list, and returns a list of tuples,
-- counting how many times that element was duplicated consecutively.
runLengthEncoding :: (Eq a) => [a] -> [(a,Integer)]
runLengthEncoding = undefined

-- runLengthDecoding : Take the output from `runLengthEncoding`, and 
-- reconstruct the original string.
runLengthDecoding :: [(a,Integer)] -> [a]
runLengthDecoding = undefined

-- transpose : Takes [[a]] as input, and transpose it 
-- (swap rows with columns). (Don't use the transpoes function in Data.List here)
transpose :: [[a]] -> [[a]]
transpose = undefined