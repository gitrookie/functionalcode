-- Typeclasses
{-# LANGUAGE FlexibleContexts, FlexibleInstances #-}

class Borked a where
    bork :: a -> String


instance Borked Int where
    bork = show

--instance Num a => Borked a where
--    bork = show

--instance Borked (Int, Int) where
--    bork (x, y) = bork x ++ " " ++ bork y


--instance (Borked a, Borked b) => Borked (a, b) where
--    bork (x, y) = ">>" ++ bork x ++ " " ++ bork y ++ "<<"


main :: IO ()
main = putStrLn $ bork (3::Int) 

