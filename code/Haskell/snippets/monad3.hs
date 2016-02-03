import Control.Monad

main :: IO ()
-- main = putStrLn "Hello" >> putStrLn "How are you"
-- main = getLine >>= (\x -> putStrLn x)
main = readandPrintLineTwice >> readandPrintLineTwice

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
