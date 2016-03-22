-- Prettify.hs
-- Instead of rendering straight to the string we will render it to an abstract
-- type called Doc.

-- Doc type is actually a tree. Concat and Union construtors create an internal
-- node from two other Doc values while Empty and other single constructor build
-- leaves.

module Prettify where

data Doc = Empty
  | Char Char
  | Text String
  | Line
  | Concat Doc Doc
  | Union Doc Doc
    deriving (Show,Eq)

empty :: Doc
empty = Empty

char :: Char -> Doc
char c = Char c

text :: String -> Doc
text "" = Empty
text s = Text s

double :: Double -> Doc
double d = text (show d)

line :: Doc
line = Line

-- Mathematically, Empty is identity under concatenation
(<>) :: Doc -> Doc -> Doc
Empty <> y = y
x <> Empty = x
x <> y = x `Concat` y
