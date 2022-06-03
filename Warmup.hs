module Warmup where

-- bigThree : Takes three arguments, and returns the biggest.
bigThree :: (Ord a) => a -> a -> a -> a
bigThree  a b c = max a (max b c)

-- middle : Take as input a tuple of three elements, 
-- and returns the middle element.
middle :: (a,b,c) -> b
middle (_,b,_) = b

-- isVowel : Takes in a character, and checks if the character
-- is a vowel. A vowel is one of the following letters: `a,e,i,o,u`.
isVowel :: Char -> Bool
isVowel x = elem x "aeiou"

-- xor: Takes two booleans, and returns true if one and only
-- one of the inputs was `True`. Try to define it in a single line without
-- guards.
xor :: Bool -> Bool -> Bool
xor a b = not (a == b)

-- threeDiff : Returns true if all the inputs are different.
threeDiff :: (Eq a) => a -> a -> a -> Bool
threeDiff a b c = (a /= b) && (b /= c) && (a /= c)

-- Warmup (requires math)
--Takes in three arguments, `a,b,c` 
--and returns the discriminate D of the quadratic equation
--ax^2 + bx + c = 0, defined as D = b^2 - 4ac
discriminate :: Double -> Double -> Double -> Double
discriminate a b c = b**2+4*a*c


-- rootsQuad : Returns any real roots of a quadratic polynomial
-- You'll have to work out a suitable type signature,
-- so you can return two roots, one root, or no roots (depending
-- on how many exist)
rootsQuad :: Double -> Double -> Double -> [Double]
rootsQuad a b c
    | (discriminate a b c) > 0   = [((-b) - (sqrt(discriminate a b c)))/2*a,
                                   ((-b) + (sqrt(discriminate a b c)))/2*a]
    | (discriminate a b c) == 0 = [-b/(2*a)]
    | otherwise                 = []

