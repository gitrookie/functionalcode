class Foo a where
    foo :: Int -> a


data Emp = Emp String Int
data Tmp = Tmp String Int


instance Foo Emp where
    foo x = Emp "Permanent" x


f x = [1..x]
g x = [-x, x]

myconcat :: [[a]] -> [a]
myconcat  = concat

myconcat1 = concat
