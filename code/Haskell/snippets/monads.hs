f :: Int -> Either String Int
f a = if a < 5
      then Right a
      else Left "Wrong data"
