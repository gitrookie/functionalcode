import Control.Monad
--f x y = x * x + y * y

f x = x + 2

g x = x * x

mysum = \x -> \y -> x + y


h = f . g
h' = g >.> f
k = (+ 2)

zero = \f -> \x -> x
one = \f -> \x -> f x

(>.>) = flip (.)

main :: IO ()
--main = getLine >>= putStrLn
--main = flip (>>=) putStrLn getLine

