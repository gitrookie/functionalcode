module Main where

import System.Environment

testif :: (Num a, Ord a) => a -> [Char]
testif x = if x <= 2
           then "hey"
           else "Hello"

promptLine :: String -> IO String
promptLine prompt = do
  putStrLn prompt
  getLine


promptTwoLines :: String -> String -> IO String
promptTwoLines prompt1 prompt2 = do
  line1 <- promptLine prompt1
  line2 <- promptLine prompt2
  return (line1 ++ " " ++ line2)

main :: IO ()
main = do
  -- x <- promptLine "Enter the first line"
  -- x <- promptTwoLines "Enter first line" "Enter second line"
  -- putStrLn $ "You Entered " ++ x
  -- x <- promptLine "Enter the line"
  -- if x == "wisdom"
  --  then putStrLn "No man is without enemies"
  --  else putStrLn $ "I don't have wisdom"
  x <- getArgs
  putStrLn $ "Hello"++ x !! 0


