-- 1a)
fix :: (t -> t) -> t
fix f = f (fix f )

{- Not legal: fix2 f = f fix2 f -}

-- 1b)
hLen :: (Num u, Eq t) => ([t] -> u) -> [t] -> u
hLen = (\f x -> if x == [] then 0 else 1 + (f (tail x)))
mLength ls = if ls == [] then 0 else 1 + mLength (tail ls)
factorial n = if n ==0 then 1 else n * (factorial (n - 1))
hFact = (\f n -> if n ==0 then 1 else n * (f (n - 1)))
factorial' = hFact factorial'
{- hLen & hFact are not recursive -}

-- 2)
sum [24,15,6]       -- => 45
hLen sum [24,15,6]  -- => 22
hLen head [24,15,6] -- => 16
{- No, hLen doesn't have any relation to sum or head. -}

-- 3)
hLen mLength [4,15,26] -- => 3
{- Both "mLength" & "hLen mLength" will return the length of the list -}

-- 4)
fix hLen [4,15,26] -- => 3
fix hFact 9        -- => 362880
mLength [4,15,26]  -- => 3
factorial 9        -- => 362880
factorial' 9       -- => 362880

-- 5)
{- "fix hLen" and "mLength" are both recursive
 - "fix hFact" and "factorial" are both recursive
 -
 - However, the first functions are not themselves recursive, but are made
 - recursive by fix.
 -}

-- 6)
{- They're all recursive. -}
