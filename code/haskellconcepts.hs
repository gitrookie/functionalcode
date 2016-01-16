-- Chapter 1 Writing Scheme Interpreter in Haskell

module Main (main) where

import qualified System.Environment
       -- getArgs is imported from System.Environment
main :: IO ()
main = do args <- System.Environment.getArgs
          putStrLn ("Hello, " ++ args !! 0)

inc :: Num a => a -> a      -- type expression
inc c = c + 1                   -- expression


myhead :: [a] -> a
myhead (x:xs) = x


foo x = let var = 12
        in var + x


bar x = var + x
  where var = 12
