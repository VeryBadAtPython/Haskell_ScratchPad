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







thickDiagonal :: Integer -> [(Integer, Integer)]
thickDiagonal n = undefined

pythagoreanTriples :: Integer -> [(Integer, Integer, Integer)]
pythagoreanTriples = undefined

suggestWord :: String -> [String] -> [String]
suggestWord = undefined

--don't worry about this
dictionary :: [String]
dictionary = lines $ unsafePerformIO $ readFile "dictionary.txt"
