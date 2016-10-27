module Lib
    ( someFunc
    ) where


data Color = Blue | Red | Green
  deriving (Show, Read)

colorEq :: Color -> Color -> Bool
colorEq Red Red = True
colorEq Blue Blue = True
colorEq Green Green = True
colorEq _ _ = False

stringEq :: String -> String -> Bool
stringEq [] [] = True
stringEq (x:xs) (y:ys) = x == y && stringEq xs ys
stringEq _ _ = False


class BasicEq a where
  isEqual :: a -> a -> Bool

class BasicEq2 a where
  isEqual2 :: a -> a -> Bool
  isnotEqual2 :: a -> a -> Bool

class BasicEq3 a where
  isEqual3, isnotEqual3 :: a -> a -> Bool

  isEqual3 x y = not(isnotEqual3 x y)
  isnotEqual3 x y = not(isEqual3 x y)

instance BasicEq Color where
  isEqual Red Red = True
  isEqual Blue Blue = True
  isEqual Green Green = True
  isEqual _ _ = False

instance BasicEq3 Color where
  isEqual3 Red Red = True
  isEqual3 Blue Blue = True
  isEqual3 Green Green = True
  isEqual3 _ _ = False

-- instance Show Color where
--   show Red = "Red"
--   show Blue = "Blue"
--   show Green = "Green"

  
someFunc :: IO ()
-- someFunc = putStrLn "someFunc"
-- someFunc = getLine >>= putStrLn
-- someFunc = putStrLn "Hello" >> putStrLn "World"
-- someFunc = do s <- getLine
--               putStrLn s
someFunc = do putStrLn "Hello World"
              putStrLn "Yes!"

