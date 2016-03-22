-- SimpleJSON.hs
-- jsonparser/SimpleJSON.hs

-- To compile a moudle we can use "ghc -c" options. which will compile it to
-- generate object code. Omitting "-c" option, compiler will try to generate an
-- executable which will fail because it doesn't contain main action. We will
-- get SimpleJSON.hi, SimpleJSON.o

-- Module Declaration
module SimpleJSON
       (                        -- List of names to export
       JValue(..)
       , getString
       , getInt
       , getDouble
       , getBool
       , getObject
       , getArray
       , isNull
       ) where

-- Other way to write module declaration
-- "module SimpleJSON where " Every name is exported
-- "module SimpleJSON () where" No Name is exported

data JValue = JString [Char]
  | JNumber Double
  | JBool Bool
  | JNull
  | JArray [JValue]
  | JObject [([Char], JValue)]
    deriving (Show, Eq, Ord)

getString :: JValue -> Maybe [Char]
getString (JString s) = Just s
getString _ = Nothing

isNull :: JValue -> Bool
isNull x = x == JNull

getInt :: JValue -> Maybe Int
getInt (JNumber x) = Just (truncate x)
getInt _ = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber x) = Just x
getDouble _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray a) = Just a
getArray _ = Nothing

getObject :: JValue -> Maybe [([Char], JValue)]
getObject (JObject o) = Just o
getObject _ = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b
getBool _ = Nothing
