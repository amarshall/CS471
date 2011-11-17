module Lab1
  where
  -- an if expression returns a value, a statement does not
  factorial n = if n == 0 then 1 else n * factorial (n - 1) -- Num a => a -> a
  fact1 :: Int -> Int
  fact1 n = if n == 0 then 1 else n * fact1 (n - 1)
  fact2 :: Integer -> Integer
  fact2 n = if n == 0 then 1 else n * fact2 (n - 1)

  -- fact1 fails for larger numbers because the Int type overflows and wraps-around
  -- factorial (-2) loops indefinitely since n will never reach zero
  -- factorial -2 is attempting to subtract 2 from factorial, which is obviously not possible here

  factP :: Integer -> Integer
  factP 0 = 1
  factP n = n * factP(n -1)

  factG x
    | x < 0     = error "neg x"
    | x == 0    = 1
    | otherwise = x*factG(x-1)

  factG2 :: Integer -> Integer
  factG2 n
    | n < 0     = error "neg n"
    | n == 0    = 1
    | otherwise = n * factG2 (n - 1)

  factE :: Integer -> Integer
  factE n
    | n < 0     = error "neg n"
    | n == 0    = 1
    | otherwise = n * factE n - 1

  -- factorial 5.1 fails because subtracting an integer from a non-integer value will never result in zero, thus it loops indefinitely
  -- factG fails because, like factorial, n never reaches exactly zero, and becomes negative
  -- factG2 fails because 5.1 is not an Integer and is thus incompatible with the arguments

  -- factE 5 fails because it is trying to do (factE 5) - 1 in the function, which allows it to go past zero and loop indefinitely

  -- Tuple data type :: Num a => (a, a, a) -> a
  sumT (a, b, c) = a + b + c

  -- Curried functions :: Num a => a -> a -> a -> a
  sumC a b c = a + b + c

  -- Same inferred type as sumC
  sumCx :: Num a => a -> (a -> (a->a))
  sumCx a b c = a + b + c

  sumC1  = sumC 1   -- Takes two integers
  sumC2  = sumC1 2  -- Takes one integer
  sumC3  = sumC2 3  -- Takes no arguments
  sumC12 = sumC 1 2 -- Takes one integer

  -- None of these are valid
  {- sumT1 = sumT 1 -}
  {- sumT2 = sumT(1) -}
  {- sumT4 = sumT(1,2) -}
  {- sumT3 = sumT(1,x,y) -}


-- 6) Left associative: F G H = (F G) H

-- 7A-a) h(x) = ((3 * x - 1) * 2) * 2 - 5
-- 7A-b) h2(x) = (3 * (x * 2 - 5) - 1) * 2
-- 7A-c) h(2) = 15
-- 7A-d) h2(2) = -8

  f x = x * 2 - 5
  g x = (3 * x - 1) * 2
  h = f . g
  h2 = g . f
