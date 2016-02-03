-- hmonads.hs
import qualified Control.Monad
import System.Environment (getArgs)
main :: IO ()
-- main = getLine >>= putStrLn
-- main = putStrLn =<< getLine
-- main = putStrLn  Control.Monad.>=> putStrLn
main = putStrLn "Hello" >> putStrLn "How are you"
        
