f = (+ 1)
g x = 3 * x + 2

h = f . g

k = \x y -> x * y

foo y = \x -> x * y

bar x = \x -> x * x

plus :: Num a => a -> a -> a
plus = (+)

f1 x = show x

mflip :: (a -> b -> c) -> (b -> a -> c)
mflip f = \x y -> f y x

rtake = mflip take


foo1 = Just 2 >> Just "Hi"
