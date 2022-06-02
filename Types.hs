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
sumApply :: (a -> c) -> (b -> c) -> (Sum a b) -> c
sumApply f1 _ (Left x)  = f1 x
sumApply _ f2 (Right x) = f2 x

-- fromLeft : Takes a sum union, and extracts the `a` from `Left a`.
-- If the input was `Right b`, throw an error.
fromLeft :: (Sum a b) -> a
fromLeft (Left x)  = x 
fromLeft _         = error "fromLeft fed Right x" 

-- fromRight : Takes a sum union, and extracts the `b` from `Right b`.
-- If the input was `Left a`, throw an error.
fromRight :: (Sum a b) -> b
fromRight (Right x)  = x 
fromRight _          = error "fromRight fed Left x" 

-- lefts :Takes a list of sum unions, and returns a list containing
-- only the left elements.
lefts :: [Sum a b] -> [a]
lefts [] = []
lefts ((Left a):xs) = a:(lefts xs)
lefts (_:xs) = lefts xs

-- rights :Takes a list of sum unions, and returns a list containing
-- only the right elements.
rights :: [Sum a b] -> [b]
rights [] = []
rights ((Right a):xs) = a:(rights xs)
rights (_:xs) = rights xs


-- `sumMap` : Takes a list of sums, and two functions, and maps
-- the appropriate function onto each element.
-- (Hint: This function should be easy once you've written `sumApply`)
sumMap :: (a -> c) -> (b -> c) -> [(Sum a b)] -> [c]
sumMap f1 f2 list = map (sumApply f1 f2) list

-- `sumExtract` : Takes a list of sums, and returns a tuple
-- of two lists, seperating all the Left a and Right b elements.
sumExtract :: [Sum a b] -> ([a],[b])
sumExtract list = sumExtHelp list ([],[])

sumExtHelp :: [Sum a b] -> ([a],[b]) -> ([a],[b])
sumExtHelp ((Left a):xs)  (l,r) = sumExtHelp xs ((a:l),r)
sumExtHelp ((Right b):xs) (l,r) = sumExtHelp xs (l,(b:r))
sumExtHelp [] acc               = acc


-- This data type represents construction workers
-- Each worker has a name, an age, and a job.
-- A crew is a list of workers.
data Job = Digger | Driver | Builder | Foreman | Manager 
    deriving (Show, Eq)
data Worker = Worker Name Age Job
    deriving (Show,Eq)
type Name = String
type Age = Int


type Crew = [Worker]

apolloCrew :: Crew 
apolloCrew = [Worker "Alice" 26 Driver,
            Worker "Bob" 21 Digger,
            Worker "Charlie" 34 Foreman,
            Worker "Daniel" 24 Digger,
            Worker "Eve" 31 Builder,
            Worker "Frank" 38 Manager,
            Worker "Grace" 34 Builder]


-- `reassign'` : Takes a worker, and gives them a new job within a crew.
reassign' :: Worker -> Job -> Crew -> Crew
reassign' worker@(Worker name age _) job crew = case crew of
    x:xs
        | x==worker -> (Worker name age job):xs
        | otherwise -> x:(reassign' worker job xs)
    []              -> []

reassign :: Worker -> Job -> Worker
reassign (Worker name age _) job = (Worker name age job)




-- `birthday` : A worker has had a birthday today! Increase their age by one.
birthday :: Worker -> Worker
birthday (Worker name age job) = (Worker name (age+1) job)


-- `isOnCrew` : Checks if a particular worker is on a crew.
isOnCrew :: Worker -> Crew -> Bool
isOnCrew worker crew = case crew of
    x:xs
        | x==worker -> True
        | otherwise -> isOnCrew worker xs
    []              -> False


-- `findSenior` : Finds and returns the name of the most senior (oldest) worker on a crew.
findSenior :: Crew -> Name
findSenior crew = head (findSAcc crew 0 [])

findSAcc :: Crew -> Age -> [Name] -> [Name]
findSAcc [] _ acc = acc
findSAcc ((Worker name age _):xs) maxi acc
    | age >= maxi = findSAcc xs age (name:acc)
    | otherwise  = findSAcc xs maxi acc


-- `filterJob` : Given a crew, returns all workers that match a given job.
filterJob :: Crew -> Job -> Crew
filterJob crew job = case crew of
    (Worker name age j):xs
        | j == job  -> (Worker name age j):(filterJob xs job)
        | otherwise -> (filterJob xs job)
    []              -> []


type Dollars = Int

-- Define a sensible type for PayRate, and then define the wages that ACC pays.

type PayRate = Dollars

apolloWages :: Job -> PayRate 
apolloWages Digger  = 20
apolloWages Driver  = 25
apolloWages Builder = 40
apolloWages Foreman = 80
apolloWages Manager = 120

-- `crewCost` : Given a crew, and a payrate, and a number of hours, determines how much
-- it would cost to hire the crew for that duration of time.
crewCost :: Crew -> Int -> Dollars
crewCost crew hours = hours*(foldr (+) 0 (map (apolloWages) (map getJob crew)))

getJob :: Worker -> Job
getJob (Worker _ _ job) = job