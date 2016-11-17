-- Maybe Monads
f :: Int -> Maybe Int
f x = if x `mod` 2 == 0
      then Nothing
      else Just (2 * x)


g :: Int -> Maybe Int
g y = if y `mod` 3 == 0
      then Nothing
      else Just (3 * y)


h :: Int -> Maybe Int
h z = if z `mod` 5 == 0
      then Nothing
      else Just (5 * z)


k x = do y <- f x
         z <- g y
         h z


l x = f x >>= g >>= h


m = \x -> f x >>= g >>= h
