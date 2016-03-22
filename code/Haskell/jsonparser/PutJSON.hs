-- PutJSON.hs

module PutJSON where

import Data.List (intercalate)
import Data.Char (toLower)
import SimpleJSON

renderJValue :: JValue -> String

renderJValue (JString s) = show s
renderJValue (JNumber n) = show n
-- renderJValue (JBool x) = serialize_bool $ show x
--   where serialize_bool (y:ys) = toLower y : ys
--         serialize_bool [] = []
renderJValue JNull = "null"
renderJValue (JBool True) = "true"
renderJValue (JBool False) = "false"
renderJValue (JObject o) = "{" ++ pairs o ++ "}"
  where pairs [] = ""
        pairs ps = intercalate "," (map renderPair  ps)
        renderPair (k, v) = show k ++ " : " ++ renderJValue v

renderJValue (JArray a) = "[" ++ values a  ++ "]"
  where values [] = ""
        values  as = intercalate "," (map renderJValue as)


putJValue :: JValue -> IO ()
putJValue v = putStrLn $ renderJValue v
