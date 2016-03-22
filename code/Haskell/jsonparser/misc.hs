-- misc.hs
-- Demontrates miscellaneous concepts of Haskell

-- newtype can have only a single value constructor taking a single
-- type(more formally only one field inside the constructor). newtype creates a
-- strict value constructor and type creates a lazy one. 
import Data.List

newtype Natural = Natural Integer
  deriving (Show, Ord, Eq)

-- Num class in not automatic derivable. We need to manually derive it.

toNatural :: Integer -> Natural
toNatural x | x < 0 = error "Can't convert a negative number"
            | otherwise = Natural x

fromNatural :: Natural -> Integer
fromNatural (Natural n) = n

-- Manual Derivation of Num class

instance Num Natural where
  fromInteger = toNatural
  x + y = toNatural (fromNatural x + fromNatural y)
  x - y = let r = fromNatural x - fromNatural y
          in if r < 0
             then error "Can't Subtract"
             else toNatural r

  x * y = toNatural (fromNatural x * fromNatural y)
  abs = undefined
  signum = undefined

data MCmplx = MCmplx {getReal, getImg :: Float}
  deriving (Show)
absPoint :: MCmplx -> Float
absPoint x = sqrt $ getReal x * getReal x + getImg x * getImg x

p = MCmplx 4 5
q = p{getReal=10}

-- getReal, getImg share top level namespace

data T = C1 {f :: Int, y :: Int}
  | C2 {f :: Int, g :: Int}
    deriving (Show)

a = C1 3 5              -- Declaration of a

c = Natural 4
-- Data Structures in Haskell are lazy i.e. components are not evaluated until needed.

