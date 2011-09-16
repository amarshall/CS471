/**
 * CS 471 Lab #3
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu>
 */

/* Question 1 */
middle(X, Y) :- X = triple(A, B, C), Y = B.

/* Question 2 */
middleF(triple(A, B, C), B).

/* Question 3 & 4 setup */
mother(mary, ann).
mother(mary, joe).
mother(sue, marY).
mother(sue, mary).
father(mike, ann).
father(mike, joe).
father(tom, mary).
grandparent(sue, ann).
male(joe).
male(mike).
male(tom).
female(mary).
female(ann).
female(sue).

/* Question 3 */
parent(P, C) :- father(P, C).
parent(P, C) :- mother(P, C).

/* Question 4 */
son(P, C) :- parent(P, C), male(C).

/* Question 6 */
isOrdered([L]).
isOrdered([A|T]) :- [B|_] = T, A < B, isOrdered(T).

/* Question 7 */
pyth(X, Y, Z) :- Z is X * X + Y * Y.

/* Question 8 */
sumOfList([L], S) :- S is L.
sumOfList([H|L], S) :- sumOfList(L, M), S is H + M.
