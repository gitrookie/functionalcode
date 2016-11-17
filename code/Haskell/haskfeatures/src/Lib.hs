module Lib
    ( someFunc
    , rtpoly
    ) where

-- Case expression
heads' xs = case xs of [] -> error "List Empty"
                       (x:_) -> x
-- as Patterns
f (x:xs) = (x:x:xs)
f' s@(x:xs) = x:s

data Color = Red | Blue | Green
  deriving (Enum, Show, Read)

-- Type synonyms
type Shape a = a -> [(a, String)]

-- newtype declaration
newtype Mypair = Mypair (Int, Int)

foo :: Mypair -> Int
foo (Mypair x) = fst x

someFunc :: IO ()
someFunc = putStrLn "someFunc"


data Customer  = Customer {customerID :: Int,
                          customerName :: String
                          }
                 deriving (Show)


bar x = let y = x + 2
        in if y < 4
           then y ** 2
           else x ** 2


myhead x = case x of (x:xs) -> x
                     [] -> error "List Empty"


mytail x = case x of (x:xs) -> xs
                     [] -> error "List Empty"


                     
data Foo a b = Foo (a -> b)

myFunc x | x > 0 = True
         | otherwise = False


myLength ::  [a] -> Int
myLength (x:xs) = 1 + myLength xs
myLength [] = 0

-- instance Num Foo (a -> b) where
--   (+) :: Foo (a -> b) -> Foo (a -> b) -> Foo (a -> b)
--   (+) x y  = 
--   (*) = undefined
--   (-) = undefined
--   abs = undefined
--   negate = undefined
data TempUnit = Kelvin Float
              | Celcius Float
              | Fahrenheit Float
  
  
class Foo a where
  foo :: Int -> a


-- instance Foo TempUnit where


data Color = Red | Green | Blue
