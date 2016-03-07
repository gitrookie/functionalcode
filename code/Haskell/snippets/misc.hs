-- Prime Factorization

smallestDivisor n = helper 2 n
  where helper x n | x * x > n = n
                   | n `rem` x == 0 = x
                   | otherwise = if x == 2
                                 then helper (x+1) n
                                 else helper (x+2) n

isPrime n = n > 1 && smallestDivisor n == n


primefactors n = helper n [] 5
  where helper n xs i | n == 1 = xs
                      | n `rem` 2 == 0 = helper (n `div` 2) (2 : xs) 2
                      | n `rem` 3 == 0 = helper (n `div` 3) (3 : xs) 3
                      | otherwise = if (n `rem` i) == 0
                                    then helper (n `div` i) (i : xs) i
                                    else helper n xs (i+2)                                         
