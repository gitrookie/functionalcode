class Foo a where
    foo :: Int -> a


data Emp = Emp String Int
data Tmp = Tmp String Int


instance Foo Emp where
    foo x = Emp "Permanent" x


data Color = Red | Green | Blue
    deriving (Eq, Ord)
