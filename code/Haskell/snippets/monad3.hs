import Control.Monad

main :: IO ()
-- main = putStrLn "Hello" >> putStrLn "How are you"
-- main = getLine >>= (\x -> putStrLn x)
-- main = readandPrintLineTwice >> readandPrintLineTwice
-- main = readAndPrintLine
-- main = putStrLn "Hey there" >>= foo
-- main = getLine >>= putStrLn >>= foo
-- main = bar "Hey there!" >>= foo
-- main = (bar >=> foo) "Hey there!!!!!"
-- main = readLine >>= putStrLn
-- main = writeFile "file.txt" "This is the line written through file."
-- main = do
--   s <- getLine
--   putStrLn s

main = do
  putStrLn "how are you"
  putStrLn "I am fine"

bar :: [Char] -> IO ()
bar = \x -> putStrLn x

readandPrintLineTwice :: IO ()
readandPrintLineTwice = getLine >>= \s -> putStrLn s >> putStrLn s


f x = if x `mod` 2 == 0
      then Nothing
      else Just (2 * x)

g x = if x `mod` 3 == 0
      then Nothing
      else Just (3 * x)

h x = if x `mod` 5 == 0
      then Nothing
      else Just (5 * x)

k = f >=> g >=> h


mJust :: a -> Maybe a
mJust x = return x

f1 :: Int -> [Int]
f1 x = [x-1, x, x+1]

g1 :: Int -> [Int]
g1 x = [-x, x]

h1 = f1 >=> g1


readAndPrintLine :: IO ()
readAndPrintLine = getLine >>= putStrLn

foo :: () -> IO ()
foo () = putStrLn "How are you!!"

readLine :: IO String
readLine = readFile "file.txt"


mtest :: Maybe Int -> Maybe Int -> Maybe Int
mtest x y = case x of
  Nothing -> Nothing
  Just p -> case y of
    Nothing -> Nothing
    Just q -> Just (p + q)


monadAdd :: Maybe Int -> Maybe Int -> Maybe Int
monadAdd x y = do a <- x
                  b <- y
                  return (a + b)



-- List Monad

lf :: Int -> [Int]
lf x = [x-1, x, x+1]

lg :: Int -> [Int]
lg x = [-x, x]

lh = lf >=> lg

lr :: Int -> [Int]

lr x = return x

dice :: [Int] -> [Int] -> [(Int, Int)]
dice a b = do x <- a
              y <- b
              if x + y == 7 then return (x, y) else []


listSum :: [Int] -> [Int] -> [Int]
listSum (x:xs) (y:ys) = x+y : listSum xs ys
listSum [] b = b
listSum a [] = a


safeDivide :: Int -> Int -> Either String Int
safeDivide _ 0 = Left "Divide by Zero"
safeDivide x y = Right (x `div` y)


sduse :: Int -> Int -> Int -> Either String Int
sduse x y z = case y `safeDivide` z of Left msg -> Left msg
                                       Right r -> Right (x + r)


safeDivide2 :: Int -> Int -> Either String Int
safeDivide2  _ 0 = Left "Divide By Zero"
safeDivide2 x y | x `mod` y /= 0 = Left "Not Divisible"
safeDivide2 x y = Right (x `div` y)


sduse2 :: Int -> Int -> Int -> Either String Int
sduse2 x y z = case y `safeDivide2` z of Left "Divide By Zero" -> Left "Divide By Zero"
                                         Left "Not Divisible"  -> Left "Not Divsible"
                                         Right r               -> Right (x + r)



data AirthmeticError = DivideByZero | NotDivisible
  deriving (Show)

safeDivide3 :: Int -> Int -> Either AirthmeticError Int
safeDivide3 _ 0 = Left DivideByZero
safeDivide3 x y | x `mod` y /= 0 = Left NotDivisible
safeDivide3 x y = Right (x `div` y)


sduse3 :: Int -> Int -> Int -> Either AirthmeticError Int
sduse3 x y z = case y `safeDivide3` z of Left DivideByZero -> Left DivideByZero
                                         Left NotDivisible -> Left NotDivisible
                                         Right r           -> Right (x + r)


f'= \x -> \y -> x * 2 + y
