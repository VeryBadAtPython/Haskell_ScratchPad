module Warmup where

-- bigThree : Takes three arguments, and returns the biggest.
bigThree :: (Ord a) => a -> a -> a -> a
bigThree = undefined

-- middle : Take as input a tuple of three elements, 
-- and returns the middle element.
-- middle :: ???
middle = undefined

-- isVowel : Takes in a character, and checks if the character
-- is a vowel. A vowel is one of the following letters: `a,e,i,o,u`.
-- isVowel :: ???
isVowel = undefined

-- xor: Takes two booleans, and returns true if one and only
-- one of the inputs was `True`. Try to define it in a single line without
-- guards.
-- xor :: ???
xor = undefined

-- threeDiff : Returns true if all the inputs are different.
threeDiff :: (Eq a) => a -> a -> a -> Bool
threeDiff = undefined

-- Warmup (requires math)
--Takes in three arguments, `a,b,c` 
--and returns the discriminate D of the quadratic equation
--ax^2 + bx + c = 0, defined as D = b^2 - 4ac
discriminate :: Double -> Double -> Double -> Double
discriminate = undefined


-- rootsQuad : Returns any real roots of a quadratic polynomial
-- You'll have to work out a suitable type signature,
-- so you can return two roots, one root, or no roots (depending
-- on how many exist)
-- rootsQuad :: ???
rootsQuad = undefined

