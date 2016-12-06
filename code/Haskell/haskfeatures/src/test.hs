-- Maybe Monads
{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

import Control.Monad.Error.Class (MonadError, throwError, catchError)

f :: Int -> Maybe Int
f x = if x `mod` 2 == 0
      then Nothing
      else Just (2 * x)

g :: Int -> Maybe Int
g y = if y `mod` 3 == 0
      then Nothing
      else Just (3 * y)

h :: Int -> Maybe Int
h z = if z `mod` 5 == 0
      then Nothing
      else Just (5 * z)

k x = do y <- f x
         z <- g y
         h z

l x = f x >>= g >>= h

m = \x -> f x >>= g >>= h

k' x = case f x of
	Nothing -> Nothing
	Just y -> case g y of
		    Nothing -> Nothing
		    Just z ->  h z

f1 i j k = i `div` k + j `div` k

data ArithmeticError = DivideByZero | NotDivisible Int Int
    deriving (Show)

--safeDivide i j | j == 0 = Left DivideByZero
--               | i `rem` j == 0 = Right (i `div` j)
--               | otherwise = Left NotDivisible


--f1m i j k = do x1 <- i `safeDivide` k
--               x2 <- j `safeDivide` k
--               return (x1 + x2)


--g''' i j k = (i `safeDivide` k) + (j `safeDivide` k)

instance {-# OVERLAPPING #-} MonadError ArithmeticError (Either ArithmeticError) where
    throwError = Left
    catchError (Right val) _ = Right val
    catchError (Left err) h = h err

safeDivideMonad :: Int -> Int -> Either ArithmeticError Int
safeDivideMonad i j | j == 0 = throwError DivideByZero
                    | i `rem` j == 0 = return (i `div` j)
                    | otherwise = throwError (NotDivisible i j)

arithmeticHandler :: ArithmeticError -> Either ArithmeticError Int
arithmeticHandler DivideByZero = throwError DivideByZero
arithmeticHandler (NotDivisible i j) = return (i `div` j)

divide :: Int -> Int -> Either ArithmeticError Int
divide i j = catchError (i `safeDivideMonad` j) arithmeticHandler

dividec :: Int -> Int -> Either ArithmeticError Int
dividec i j = (i `safeDivideMonad` j) `catchError` \e -> case e of DivideByZero    -> throwError DivideByZero
                                                                   NotDivisible i j -> return (i `div` j)	
