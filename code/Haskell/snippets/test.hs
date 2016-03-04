import qualified System.Environment


f s@(x:xs) = x:s

sign x | x > 0 = 1
       | x == 0 = 0
       | x < 0 = -1
test (x:xs) | x == -1 = True
            | x > 0 = False
test [] = False

testc xs = case xs of (x:xs) -> x
                      [] -> 0

foo xs = case xs of (x:xs) -> x
                    [] -> []

bar :: Int -> Either [Char] Int
bar x = if x > 2
        then Right x
        else Left "Number less than two"
-- getArgs usage
main :: IO ()
-- main = do args <- System.Environment.getArgs
--           putStrLn $ concat args

-- main = foo2

foo2 =  putStrLn "Enter the name: "
  >> getLine
  >>= \name -> putStrLn $ "You Entered: " ++ name


class BasicEq a where
  isEqual :: a -> a -> Bool

instance BasicEq Bool where
  isEqual True True = True
  isEqual False False = True
  isEqual _     _     = False

data Date = Date Int Int Int
  deriving (Show)
data Time = Time Int Int Int
  deriving (Show)
data Reading = Reading Int
  deriving (Show)
data Day = Day String String
  deriving (Show)
data BloodReading = BloodReading Date Time Reading Day
  deriving (Show)

getReading :: BloodReading -> Reading
getReading (BloodReading _ _ x _) = x

getInt :: Reading -> Int
getInt (Reading x) = x


class BasicEq3 a where
  isEqual1, isNotEqual1 :: a -> a -> Bool
  isEqual1 x y = not (isNotEqual1 x y )

  isNotEqual1 x y = not (isEqual1 x y)


instance BasicEq3 Bool where
  isEqual1 True True = True
  isEqual1 False False = True
  isEqual1 _ _ = False


data Color = Red | Green | Blue
  deriving (Show, Read)


instance BasicEq3 Color where
  isEqual1 Red Red = True
  isEqual1 Green Green = True
  isEqual1 Blue Blue = True
  isEqual1 _ _ = False


-- main = do putStrLn "Enter the number: "
--           inpStr <- getLine
--           let inpDouble = (read inpStr)::Color
--           putStrLn $ " square of number is " ++ show inpDouble

-- Serialization using read and show typeclasses

main = do putStrLn "Enter the data:"
          inpStr <- getLine
          putStrLn "Writing to File..."
          writeFile "test" inpStr
          putStrLn "Reading File..."
          fileString <- readFile "test"
          let x = (read fileString)::[Maybe Int]
          putStrLn (show x)


data MyType = MyType (Int -> Bool)

foo1 x = x < 5

data CannotShow = CannotShow
  deriving (Show)

data CannotDeriveShow = CannotDeriveShow CannotShow
  deriving (Show)
 

g :: a -> () -> a
g x () = x

sumList xs ys = map add $ zip xs ys
  where add (x, y) = x + y


listComb xs ys = do x <- xs
                    y <- ys
                    return (x, y)

mymap f = foldl (\x -> f x) 0

mi x = [(1, 2), (4, 5)]
