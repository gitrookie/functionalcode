module Lib
    ( someFunc
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

someFunc :: IO ()
someFunc = putStrLn "someFunc"


foo s = let z = [(length s, undefined)] in z
