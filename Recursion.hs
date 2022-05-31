module Recursion where

-- | Computes the tribonacci sequence.
-- | T(0) = 0, T(1) = 0, T(2) = 1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribonacci :: Integer -> Integer
tribonacci int
    | int < 0   = error "undefined"
    | otherwise = fibbhelper int 0 0 1
    where
        fibbhelper 0 _ _ _    = 0
        fibbhelper 1 curr _ _ = curr
        fibbhelper n curr prev1 prev2 
            = fibbhelper (n-1) (curr + prev1 + prev2) curr prev1

-- | Chessboard: Given input of n and m,
-- | returns a list of all tuples from (1,1) to (n,m)
chessboard :: (Integer, Integer) -> [(Integer, Integer)]
chessboard (n,m) = concat (map (pairer m) [1..n])

pairer :: Integer -> Integer -> [(Integer, Integer)]
pairer m n = map (\y -> (n,y)) [1..m]


pairN :: Integer -> Integer -> [(Integer, Integer)]
pairN n m = undefined
-- Work out a suitable type signature to implement the square root
-- by method of bisection algorithm.
bisectSqrt :: Double -> Double
bisectSqrt x = sqrtr x (0,x)

sqrtr :: Double -> (Double,Double) -> Double
sqrtr x (low,upp)
    | (upp - low) < 0.00001    = mid
    | mid**2 > x   = sqrtr x (low, mid)
    | otherwise  = sqrtr x (mid, upp)
    where mid = (upp+low)/2