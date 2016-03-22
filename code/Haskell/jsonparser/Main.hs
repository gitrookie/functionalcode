-- Main.hs

module Main where
import SimpleJSON

main = print (JObject [("foo", JNumber 1), ("bar", JBool False), ("hi", JNull), ("as", JObject [("yu", JNull)])])
