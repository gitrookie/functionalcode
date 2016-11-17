class Foo a where
    foo :: Int -> a


data Emp = Emp String Int
           deriving (Eq, Show)
data Tmp = Tmp String Int
           deriving (Eq, Show)


instance Foo Emp where
    foo x = Emp "Permanent" x


instance Foo Tmp where
    foo x = Tmp "Temporary" x


test x y = if x == y
           then True
           else False


x = 42
plus = (20.5+)

hola :: (Num a) => a -> String
hola 1 = "OK"
hola _ = "Not OK"

--a = ((1::Num a => a) == (1::Num a => a))

z = 2



