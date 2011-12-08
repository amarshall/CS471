> module Lab8F11
>     where

> hLen :: (Num u, Eq t) => ([t] -> u) -> [t] -> u 
> hLen = (\f x -> if x == [] then 0 else 1 + (f (tail x)))
> mLength ls = if ls == [] then 0 else 1 + mLength (tail ls)
> factorial n = if n ==0 then 1 else n * (factorial (n - 1))
> hFact = (\f n -> if n ==0 then 1 else n * (f (n - 1)))
> factorial' = hFact factorial'

1a)  What is the type of 

> fix f = f (fix f )

( Is this a legal definition? > fix2 f = f fix2 f)

1b) Are hLen and hFact recursive?

2) What is the value of
   sum [24,15,6] 
   hLen sum [24,15,6]
   hLen head [24,15,6]
Does hLen have anything to do with sum or head?

3) What is the value of
   hLen mLength [4,15,26] 
   What is the relationship between hLen and mLength?
   
4) What is the value of 
   fix hLen [4,15,26] 
   fix hFact 9
   mLength [4,15,26] 
   factorial 9
   factorial' 9
   
5) What is the relation between
   'fix hLen' and mLength
   'fix hFact' and factorial
   
6) What is the relation between
  'fix hFact' and factorial and factorial'
   
Hope these examples peak your curiousity.



