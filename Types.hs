module Types where

-- There is already a type using these keywords,
-- so we wish to not import it.
import Prelude hiding (Either, Left, Right)

-- The sum data type is representing the disjoint union
-- of two sets, tagged with either Left or Right, so
-- we can tell which set it came from.
data Sum a b = Left a | Right b
    deriving Show

-- sumApply : Takes two functions, the first can take type `a` as input,
-- and the second can take type `b` as input. Also takes a disjoint union
-- of `a` and `b` as input. If the input was of the form `Left a`,
-- extract the variable of type `a` and apple the first function.
-- Else, apply the second function to the argument in `Right b`.
-- sumApply :: ???
sumApply = undefined

-- fromLeft : Takes a sum union, and extracts the `a` from `Left a`.
-- If the input was `Right b`, throw an error.
-- fromLeft :: ???
fromLeft = undefined 

-- fromRight : Takes a sum union, and extracts the `b` from `Right b`.
-- If the input was `Left a`, throw an error.
-- fromRight :: ???
fromRight = undefined

-- lefts :Takes a list of sum unions, and returns a list containing
-- only the left elements.
-- lefts :: ???
lefts = undefined

-- rights :Takes a list of sum unions, and returns a list containing
-- only the right elements.
-- rights :: ???
rights = undefined

-- `sumMap` : Takes a list of sums, and two functions, and maps
-- the appropriate function onto each element.
-- (Hint: This function should be easy once you've written `sumApply`)
sumMap = undefined

-- `sumExtract` : Takes a list of sums, and returns a tuple
-- of two lists, seperating all the Left a and Right b elements.
-- sumExtract :: ???
sumExtract = undefined 
