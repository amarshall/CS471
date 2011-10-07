/**
 * CS471 Homework #5
 * @author J. Andrew Marshall <jmarsha6@bighamton.edu>
 */


/* 1: Below are 3 structures that representation expression trees using Prolog.
 * (Op is any Prolog operator.)
 *
 *   expTree(Op,Lt,Rt).
 *   expTree(lit,Value).
 *   expTree(Op,T).
 *
 * Write a Prolog program:
 *   eval(Tree,Value).
 * which succeeds if Value is the result of computing the expressions
 * represented by an expression tree.  For example:
 *
 *   ?- eTree4(T),eval(T,V).
 *   T = expTree(float, expTree(sin, expTree(/, expTree(lit, pi), expTree(lit, 2))))
 *   V = 1.0
 *
 *   ?- eTree1(T),eval(T,V).
 *   T = expTree(+, expTree(lit, 5), expTree(*, expTree(lit, 3), expTree(lit, 2)))
 *   V = 11
 *
 * Below are trees you can use for testing.
 *
 * This can be done with only 4 clauses  -- if you understand lab 4.
*/

eval(expTree(lit, V), V).
eval(expTree(O, X), V) :- eval(X, A), U =.. [O, A], V is U.
eval(expTree(O, X, Y), V) :- eval(X, A), eval(Y, B), U =.. [O, A, B], V is U.

eTree1(expTree('+',
  expTree(lit, 5),
  expTree('*',
    expTree(lit, 3),
    expTree(lit, 2)
  )
)).


eTree2(expTree('*',
  expTree('-',
    expTree(lit, -3),
    expTree(lit, 2)
  ),

  expTree('+',
    expTree(lit, 3),
      expTree('-',
        expTree(lit, 2)
      )
    )
  )
).

eTree3(expTree('*',
  expTree('min',
    expTree(lit, -3),
    expTree(lit, 2)
  ),

  expTree('+',
    expTree(lit, 3),
    expTree('-',
      expTree(lit, 2)
    )
  )
)).


eTree4(expTree(float,
  expTree('sin',
    expTree('/',
      expTree(lit, pi),
      expTree(lit, 2)
    )
  )
)).


/* 2. countLit(ExpTree,NumLit) is successful if  number of "lit" nodes in an
 * expTree structure unifies with NoLit. i.e.
 *
 *   ?- eTree1(T).
 *   T = expTree(+, expTree(lit, 5), expTree(*, expTree(lit, 3), expTree(lit, 2))).
 *
 *   ?- eTree1(T), countLit(T,N).
 *   T = expTree(+, expTree(lit, 5), expTree(*, expTree(lit, 3), expTree(lit, 2))),
 *   N = 3 .
 *
 *   ?- eTree2(T), countLit(T,N).
 *   T = expTree(*, expTree(-, expTree(lit, -3), expTree(lit, 2)),
 *             expTree(+, expTree(lit, 3), expTree(-, expTree(lit, 2)))) ,
 *   N = 4 .
 *
 *   ?- eTree3(T), countLit(T,N).
 *   T = expTree(*, expTree(min, expTree(lit, -3), expTree(lit, 2)),
 *           expTree(+, expTree(lit, 3), expTree(-, expTree(lit, 2)))) ,
 *   N = 4 .
 *
 *   ?- eTree4(T), countLit(T,N).
 *   T = expTree(float, expTree(sin, expTree(/, expTree(lit, pi), expTree(lit, 2)))),
 *   N = 2 .
 *
 * This can be done with 3 clauses. It is not too hard.
 */

countLit(expTree(lit, _), 1).
countLit(expTree(_, X), N) :- countLit(X, N).
countLit(expTree(_, X, Y), N) :- countLit(X, N1), countLit(Y, N2), N is N1 + N2.


/**
 * 3: In homework 4 problem 5 we had the following:
 * Syntax-Directed Differentiation:  A motivating example illustrating the
 * power of pattern matching in Prolog. ....
 * Below is a solution for this exercise.
 */

d(x,x,1).
d(C,x,0):-number(C).
d(C*x,x,C):-number(C).
d(-U, X, -DU) :- d(U, X, DU).
d( U + V, x, RU + RV ):-d(U,x,RU), d(V,x,RV).
d( U - V, x, RU - RV ):-d(U,x,RU), d(V,x,RV).
d(U * V,x, U * DV + V * DU):- d(U,x,DU), d(V,x,DV).
d(U^N, x, N*U^N1*DU) :- integer(N), N1 is N-1, d(U, x, DU).

/**
 * Keep in mind, though, that terms such as U+V are still trees with the
 * functor at the root, and that evaluation of such terms requires
 * additional processing which you will complete.
 *
 * Define the predicate, 'evaluate', that uses the result from
 * differentiation (above) and a list of values for each variable and
 * computes the resulting value. e.g.
 *
 *   ?- d(3*(x +2*x*x),x,Result), LVarValue=[x:3], evaluate(Result,Value,LVarValue).
 *   Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
 *   LVarValue = [x:3]
 *   Value = 39 .
 *   ?- d((3*x) ^ 4,x,Result), VarValue=[x:2] , evaluate(Result,Value,LVarValue).
 *   Result = 4* (3*x)^3*3,
 *   LVarValue = x:2,
 *   Value = 2592 .
 *
 * The only built-predicates you may use are (You won't need all of them):
 * is, //, /, +, -, ^, *,=..,>, <,
 * atom, is_list, functor, arg, integer, number, member, append
 *
 * Follow the example covered in class on Wed, last week.
 */

evaluate(R, V, Xval) :- member(Xval, x:X).
% :(

/**
 * 4: (Very Easy) Write a predicate, value(Coin, Num, Amt), where Coin is the name,
 * Num is how many coins and Amt is the total value,
 * (the value of the coin (in pennies) times the number of coins. )
 * You should use the facts created as
 * as subgoal to find the value.
 *
 *   ?- value(quarter,5, Amt).
 *   Amt = 125
 *   ?- value(dime,10, 100).
 *   Yes
 *   ?- value(dime,N, 100).
 *   ERROR: is/2: Arguments are not sufficiently instantiated
 */

coin(dollar, 100).
coin(half, 50).
coin(quarter, 25).
coin(dime,10).
coin(nickel,5).
coin(penny,1).

value(C, N, A) :- coin(C, V), A is V * N.


/**
 * 5: Write a predicate change/2 that given the change amount, computes the ways
 * in which we can give change.  Use USA's  coin denominations above.
 *
 * The predicate "change" is such that an positive integer S,
 * change(S,T) "returns" a list of tuples, T, where the tuple contains the
 * name of the denomination (Name,Count),
 * the atom Name of the denomination and integer Count that gives
 * the number of coins of each denomination in D that add up to S.
 * (Notice that you do not have to be able to generate or
 * validate all possible solutions.)
 * For example::
 *   ?- change(127,L).
 *   L = [ (dollar, 1), (quarter, 1), (penny, 2)]
 *   Yes
 *   ?- change(44,L).
 *   L = [ (quarter, 1), (dime, 1), (nickel, 1), (penny, 4)] ;
 *   L = [ (quarter, 1), (dime, 1), (penny, 9)] ;
 *   L = [ (quarter, 1), (nickel, 3), (penny, 4)] ;
 *   L = [ (quarter, 1), (penny, 19)] ;
 *   L = [ (dime, 4), (penny, 4)] ;
 *   L = [ (nickel, 8), (penny, 4)] ;
 *   L = [ (penny, 44)] ;
 *   No
 *
 * This can be solved with only 2 clauses.
 *
 * The Coin Changing problem is an interesting problem usually studied in
 * Algorthms.  http://condor.depaul.edu/~rjohnson/algorithm/coins.pdf is a
 * nice discussion.
 * Think about ::
 *    1) How could we generalize this problem to handle different
 *       denominations?
 *    2) What are the different techinques to find the change with the
 *       fewest number of coins ?
 *    3) What happens if the order of the "coin" facts change?
 */

change(0, []).
change(A, [(Cname, Cnum)|L]) :- coin(Cname, Cval), A >= Cval, Cnum is floor(A / Cval), B is A mod Cval, change(B, L).


/**
 * 6. Define a predicate, numOfAtoms(LtofLts, NofAtoms), such that NofAtoms is
 * the total number of atoms/numbers in LtofLts (including the nested lists).
 * You might want to use the following built-in predicates, atom and number.
 * You only need 4 clauses including only one recursive clause.
 * DO NOT USE the built-in predicate FLATTEN.
 * You may use "!", but it is not required.
 *
 *  ?-numOfAtoms([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
 *  NA = 15 .
 *  ?- numOfAtoms([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
 *  NA = 15 .
 */

numOfAtoms([], 0) :- !.
numOfAtoms(X, 1) :- atom(X).
numOfAtoms(X, 1) :- number(X).
numOfAtoms([H|T], N) :- numOfAtoms(H, X), numOfAtoms(T, Y), N is X + Y.


/**
 * 7. Do exercise 11.14 page 572.  You may have use TWO or Three functors.
 * You may overload "insertionSort".
 * One for the outer loop and one for the inner loop.
 *
 *   ?- insertionSort([4,53,5,1,7],S).
 *   S = [1, 4, 5, 7, 53] .
 */

insertionSort([], S, S).
insertionSort([H|T], A1, S) :- insert(H, A1, A2), insertionSort(T, A2, S).
insertionSort(L, S) :- insertionSort(L, [], S).

insert(E, [], [E]).
insert(E, [H|T], [H|S]) :- E > H, insert(E, T, S).
insert(E, [H|T], [E,H|T]) :- E =< H.


/**
 * 8. Do exercise 11.15 page 572.  Follow the hint in the text book.
 * This can be done with THREE additional predicates.
 */

quickSort([], []).
quickSort([A|L1], L2) :- partition(A, L1, P1, S1, N), N > 15, quickSort(P1, P2), quickSort(S1, S2), append(P2, [A|S2], L2).
quickSort([A|L1], L2) :- insertionSort(L1, L2).

partition(A, [], [], [], 0).
partition(A, [H|T], [H|P], S, N) :- A >= H, partition(A, T, P, S, N1), N is N1 + 1.
partition(A, [H|T], P, [H|S], N) :- A =< H, partition(A, T, P, S, N1), N is N1 + 1.
