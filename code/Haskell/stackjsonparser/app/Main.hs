module Main where

-- import directives should appear at the begining of the module
-- after moudle declaration.
import Lib
import SimpleJSON

main :: IO ()
main = print (JObject [("foo", JNumber 1), ("bar", JBool False)])
