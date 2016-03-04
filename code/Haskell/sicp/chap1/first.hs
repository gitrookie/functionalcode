-- Haskell uses normal order evaluation


test x y = if x == 0
              then 0
           else y

-- Newton's Square Root Method

squareRoot x = squareIter x 1

  where squareIter num guess = if goodEnough guess
                               then guess
                               else squareIter num (imporvedGuess guess) 
          where goodEnough guess = (abs $ num - guess * guess) < 0.0001
                imporvedGuess var = (var + num/var) / 2

squareRoot2 x = squareIter x 1 1

  where squareIter num guess delta = let newDelta = goodEnough guess
                                     in if (abs $ delta - newDelta) < 0.001
                                        then guess
                                        else squareIter num (improvedGuess guess) (newDelta)
          where goodEnough guess = (abs $ num -guess * guess)
                improvedGuess var = (var + num/var) / 2


-- Factorial of a number
-- Recursive Procedure Recursive Process
factorialIf num = if (num == 0) || (num == 1)
                  then 1
                  else num * factorialIf (num - 1)

factorialCase num = case num of 0 -> 1
                                1 -> 1
                                _ -> num * factorialCase (num - 1)


factorialGaurds num | num == 0 = 1
                    | num == 1 = 1
                    | otherwise = num *factorialGaurds (num - 1)

-- Factorial Using Recursive Procedure and Iterative Process
-- Uses Tail Call Optimization
factorialIter num = factIterative 1 1 num
  where factIterative result counter num = if counter > num
                                           then result
                                           else factIterative (result * counter) (counter + 1) num

-- Fibbonacci Series
-- 0, 1, 1, 2, 3, 5, 8

fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib (n-1) + fib (n-2)

consecutiveSum (x:y:xs) = x+y : consecutiveSum (y:xs)
consecutiveSum (x:xs) = []
consecutiveSum [] = []


pascalTriangle num = if num == 1
                     then [1]
                     else [1] ++ (consecutiveSum $ pascalTriangle (num-1)) ++ [1]

expr base power = expHelp base power 1
  where expHelp base power result =  if power == 0
                                     then result
                                     else expHelp base (power-1) (result * base)

expfast base power | power == 0 = 1
                   | even power = (expfast base (power `div` 2)) ** 2
                   | otherwise  = base * expfast base (power-1)

expSquare base power = expSquare base power 1
  where expSquare base power a | power == 0 = a
                               | even power = expSquare (base * base) (power `div` 2) a
                               | otherwise =  expSquare (base) (power-1) (a * base)

mul a b | b == 1 = a
        | otherwise = a + mul a (b-1)


mulIterative a b = mulhelp a b 0
  where mulhelp a b result | b == 0 = result
                           | otherwise = mulhelp a (b - 1) (result + a)


mulfast a b = mulhelp a b 0
  where mulhelp a b result | b == 0 = result
                           | even b = mulhelp a (b `div` 2) (result * 2)
                           | otherwise = mulhelp a (b - 1) (result + a)


double :: (Num a) => a -> a
double x = x + x

mulfastR a b | b == 0 = 0
             | even b = double(mulfastR a (b `div` 2))
             | otherwise = a + mulfastR a (b-1)


cube x = x * x * x

p x = 3 * x - 4 * cube x

sine angle count = if abs angle < 0.1
                   then (angle, count-1)
                   else sine (angle/3) (count+1)

fibIter num = fibhelper 0 1 num
  where fibhelper a b num | num == 0 = a
                          | otherwise = fibhelper b (a+b) (num-1)

-- GCD algorithms are based on the fact that gcd(x, y) = gcd(y, x/y)
-- It is possible to show that after repeated reductions will always
-- eventually produce a pair where second number is zero.

mygcd a b | a < b = gcdhelper b a
          | otherwise = gcdhelper a b
  where gcdhelper x y = if y == 0
                        then x
                        else gcdhelper y (x `mod` y)
