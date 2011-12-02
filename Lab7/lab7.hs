-- 1) You know when to stop because you get the same value repeatedly. Seven steps.
newtonAppr value guess tolerance
  | let guessSquare = (*) guess guess in guessSquare <= value + tolerance && guessSquare >= value - tolerance = guess
  | otherwise = newtonAppr value newGuess tolerance where newGuess = ((/) ((+) ((/) value guess) guess) 2)

-- 2)
power :: Integer -> Integer -> Integer
power a 0 = 1
power a b = a * power a (b-1)
{- power 2 5 = 2 * power 2 4
 -                 2 * power 2 3
 -                     2 * power 2 2
 -                         2 * power 2 1
 -                             2 * power 2 0
 -                                 1
 -           = 32
 - O(k) time
 -
 - HUGS: 130025 reductions, 34115232 cells, 35 garbage collections
 - GHC:  0.43 secs, 158651768 bytes
 -}
powerT :: Integer -> Integer -> Integer
powerT a b = trp b 1
  where trp n p = if (n==0) then p else trp (n-1) (a*p)
{- powerT 2 5 = trp 5 1 = trp 4 2 = trp 3 4 = trp 2 8 = trp 1 16 = trp 0 32 = 32
 -
 - HUGS: 120021 reductions, 34105202 cells, 35 garbage collections
 - GHC:  0.41 secs, 159908672 bytes
 -
 - func base exp:
 -   while(exp-- > 0)
 -     base *= base
 -   }
 -   return base;
 -}

-- 3)
turboPower a 0 = 1
turboPower a b
  | even b = turboPower (a*a) (b `div` 2)
  | otherwise = a * turboPower a (b-1)

{- HUGS: 1450 reductions, 92723 cells
 - GHC:  0.22 secs, 81772672 bytes
 -}

turboPowerT base exp
  | exp == 0 = 1
  | even exp = turboPowerT ((*) base base) (exp `div` 2)
  | otherwise = (*) base (turboPowerT base ((-) exp 1))

-- 4)
composeList [f] = f
composeList (f:g) = f . composeList g

-- 5)
sq list = [(^) x 2 | x <- list]

-- 6)
replicated list = [e | e <- list, _ <- [1..e]]

-- 7)
sumHarmonic n sum
  | n == 1 = newSum
  | otherwise = sumHarmonic m newSum
  where
    m = (-) n 1
    newSum = sum + (1/n)

-- 8)
ack m n
  | m == 0 = n2
  | n == 0 && m > 0 = ack m1 1
  | n > 0 && m > 0 = ack m1 (ack m n1)
  where
   m1 = (-) m 1
   n1 = (-) n 1
   n2 = (+) n 1

-- 9)
f1 func arg = func arg
f2 func list = (\arg -> map (\elem -> func arg elem) list)
