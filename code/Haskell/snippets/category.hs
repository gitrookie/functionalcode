-- category.hs
data Money = Rupee Int | Paisa Int
  deriving (Show, Read)


newtype Currency = Currency Money
  deriving (Show, Read)
           
data Curr a = Curr a

main :: IO ()
main = do inp <- getLine
          let t = (read inp) :: Currency
          putStrLn $ show t


newtype MState s b = MState (s -> (b, s))

f s = (fst s + snd s, s)

newtype MyInt = MyInt {getInt :: Int}

fn x = case x of
  MyInt a -> a

data Any = Any {getAny :: Bool}
  deriving (Show)

newtype Anny = Anny {getAnny :: Bool}
  deriving (Show)

newtype Age = Age { unAge :: Int }

fnn x = case x of
  Any y -> ()
