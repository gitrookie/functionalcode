-- Haskell uses normal order evaluation

p = p

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
