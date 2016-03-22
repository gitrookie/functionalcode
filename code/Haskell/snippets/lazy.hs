-- lazy.hs
-- Demonstrates concepts of laziness in Haskell

-- Weak Head Normal Form

f = let (x, y) = (length [1..5], reverse "hello")
    in (x, y)

g = let (x, y) = (undefined, undefined)
    in 2


head' ::[a] -> a
head' ~x = undefined
head' ~(x:xs) = x
