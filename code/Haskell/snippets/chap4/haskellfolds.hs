import Data.Char (digitToInt)

asInt xs = stringtoInt 0 xs
  where stringtoInt acc (x:xs) = let acc' = acc * 10 + digitToInt x
                                 in stringtoInt acc' xs
        stringtoInt acc [] = acc
