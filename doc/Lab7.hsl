> module LabH7F11
>    where


Problem 1: Implement Newton's method for calculating the square root of N. Your
definition should use primitive recursive style.
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number)

e.g. 
   Lab7F11> newtonAppr 144 1 0.1             
   12.000545730742438 
   Lab7F11> newtonAppr 144 1 0.0001
   12.0000000124087
   Lab7F11> newtonAppr 144 1 0.000000000000001
   12.0
   Lab7F11> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Lab7F11> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15


problem 2&3:
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)

 

  3c:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.


 
 Problem 4: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
     
 
 

Problem 5: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)



Problem 6:
Define a function replicate which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  i.e.
  ..> replicated [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]




Problem 7:
A Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic can have the type  Fractional a => a -> a.


Problem 8:
Write a Haskell script which implements Ackermann's function as defined in 
homework 1 problem 8.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.
 
ack( m,n ) =	n + 1                           if m = 0
ack( m,n ) =	ack(m - 1, 1)                   if n = 0 and m > 0 
ack( m,n ) =	ack( m-1, ack( m, n-1 ) )      	if n >0 and m > 0


Problem 9. 

Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]

