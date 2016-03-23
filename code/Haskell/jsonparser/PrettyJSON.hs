-- PrettyJSON.hs
-- Prettify module provides the text, double, string functions.

import SimpleJSON
import Prettify
import Numeric (showHex)

renderJValue :: JValue -> Doc
renderJValue (JBool True) = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = string str


string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right

-- lookup looks for keys in list of tuples
oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
  Just r -> text r
  otherwise -> char c
  -- Nothing | mustEscape c -> hexEscape c
  --         | otherwise -> char c
  --   where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

-- zipWith f (a:as) (b:bs) = f a b : zipWith as bs
simpleEscapes :: [(Char, [Char])]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
  where ch a b = (a, ['\\', b])

hcat = undefined
-- hexEscape = undefined

-- smallHex :: Int -> Doc
-- smallHex x = text "\\u"
--   <> text (replicate (4 - length h) '0')
--   <> text h
--   where h = showHex x ""

        
