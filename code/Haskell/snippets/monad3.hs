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
main = writeFile "file.txt" "This is the line written through file."

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
