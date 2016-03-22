-- List Sum using folds
mysuml xs = foldl (+) 0 xs
mysumr xs = foldr (+) 0 xs

smallestDivisor n = helper 2 n
  where helper x n | x * x > n = n
                   | n `rem` x == 0 = x
                   | otherwise = if x ==2
                                 then helper (x+1) n
                                 else helper (x+2) n

isPrime n = if n == 1
            then False
            else smallestDivisor n == n

-- General Accumulation
genAccumulate combiner f initVal n filterFunc = foldl (\x y -> combiner x $ f y) initVal $ filter filterFunc [1..n]


length_foldl xs = foldl (\acc _ -> acc + 1) 0 xs
length_foldr xs = foldr (\_ acc -> 1 + acc) 0 xs

reverse_foldl xs = foldl (\acc x -> x : acc) [] xs
reverse_foldr xs = foldr (\x acc -> x : acc) [] xs
