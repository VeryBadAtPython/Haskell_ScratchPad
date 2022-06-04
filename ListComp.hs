module ListComp where

import System.IO.Unsafe

fizzBuzz :: Integer -> [Integer]
fizzBuzz = undefined






myMap :: (a -> b) -> [a] -> [b]
myMap f list = case list of
    []   -> []
    x:xs -> (f x):myMap f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs)
    | (f x)     = x:myFilter f xs
    | otherwise = myFilter f xs




fastFib :: Integer -> Integer
fastFib n
    | n<0 = undefined
    | otherwise = help n 0 1
    where
        help 0 curr _       = curr
        help n curr prev = help (n-1) (curr + prev) curr






thickDiagonal :: Integer -> [(Integer, Integer)]
thickDiagonal = undefined

pythagoreanTriples :: Integer -> [(Integer, Integer, Integer)]
pythagoreanTriples = undefined



foo :: String -> Int -> Bool
foo _ _ = True

rekt :: Int -> Int -> Bool
rekt = foo . show
