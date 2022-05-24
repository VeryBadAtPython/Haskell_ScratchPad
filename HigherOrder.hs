module HigherOrder where

--Implement the following functions using higher order functions.
--Your solutions should be very succinct, and should
--not use recursion (other than the recursion provided by a higher
--order function). 

-- arithMean : Computes the average of a list of numbers.
arithMean :: (Fractional a) => [a] -> a
arithMean list = (foldr (+) 0 list)/(fromIntegral (length list))



-- Computes the geometric mean of a list of numbers.
geoMean :: (Floating a) => [a] -> a
geoMean list = (foldr (+) 0 list)/(fromIntegral (length list))

-- l1Norm : Takes a list of numbers, and computes the sum of the 
-- absolute values of each term.
l1Norm :: (Num a) => [a] -> a
l1Norm list = foldr (+) 0 (map abs list)

-- l2Norm : Takes a list of numbers, and computes the Euclidean norm,
-- defined to be the square root of the sum of the squares of each element.
l2Norm :: (Floating a) => [a] -> a 
l2Norm list = sqrt $ foldr (+) 0 $ map (\x->x*x) list

-- cesaroSum : Takes a list of numbers, and returns a list, where the nth element
-- is the average of the first n terms of the input list.
cesaroSum :: (Fractional a) => [a] -> [a]
cesaroSum list = case list of
    []   -> []
    x:xs -> (cesaroSum xs)++[arithMean (x:xs)]


-- ===========================================


-- | revMap : Takes an element, and feeds that element to each function in a list.
revMap :: a -> [(a -> b)] -> [b]
revMap e l = case l of
    []   -> []
    f:fs -> (f e):revMap e fs

-- | superMap : Takes a list of elements, and a list of functions, and applies each element to
-- | each function. Your output should be a list of lists.
superMap :: [a] -> [(a -> b)] -> [[b]]
superMap eList fList = case eList of
    [] -> []
    e:es -> (revMap e fList):(superMap es fList)

