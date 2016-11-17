module Main where

import Lib

printInt :: Int -> IO ()
printInt x = print x

main :: IO ()
main =
  str <- getLine
  printInt (read str)
