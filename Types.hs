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

-- This data type represents construction workers
-- Each worker has a name, an age, and a job.
-- A crew is a list of workers.
data Job = Digger | Driver | Builder | Foreman | Manager 
    deriving (Show, Eq)
data Worker = Worker Name Age Job
    deriving Show
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


-- `reassign` : Takes a worker, and gives them a new job.
-- reassign :: ???
reassign = undefined

-- `birthday` : A worker has had a birthday today! Increase their age by one.
-- birthday :: ???
birthday = undefined


-- `isOnCrew` : Checks if a particular worker is on a crew.
-- isOnCrew :: ???
isOnCrew = undefined


-- `findSenior` : Finds and returns the name of the most senior (oldest) worker on a crew.
-- findSenior :: ???
findSenior = undefined

-- `filterJob` : Given a crew, returns all workers that match a given job.
-- filterJob :: ???
filterJob = undefined


type Dollars = Int

-- Define a sensible type for PayRate, and then define the wages that ACC pays.

-- data PayRate = ???

-- apolloWages :: PayRate 
apolloWages = undefined

-- `crewCost` : Given a crew, and a payrate, and a number of hours, determines how much
-- it would cost to hire the crew for that duration of time.
crewCost = undefined