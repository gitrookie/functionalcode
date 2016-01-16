module Main where

import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces) -- spaces function is not
       -- imported

main :: IO ()
main = do args <- getArgs
--          ignoreWhiteSpace (args !! 0)
--          putStrLn . readExpr . ignoreWhiteSpace $ args !! 0
          putStrLn . readExpr $ args !! 0

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#"

-- The second argument of the parse function is the name of the file which we
-- are parsing. In example below we have named it as "lisp"
readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of Left err -> "No match : " ++ show err
                                                               Right val -> "Found Value:" ++ show val

ignoreWhiteSpace :: [Char] -> [Char]
ignoreWhiteSpace [] = ""
ignoreWhiteSpace (x:xs) | x /= ' ' = x:""
                        | otherwise = ignoreWhiteSpace xs

spaces :: Parser ()
spaces = skipMany1 space


data LispVal = Atom String
  | List [LispVal]
  | DottedList [LispVal] LispVal
  | Number Integer
  | String String
  | Bool Bool

parseString :: Parser LispVal
parseString = do char '"'
                 x <- many (noneOf "\"")
                 char '"'
                 return  $ String x
