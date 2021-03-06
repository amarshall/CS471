/**
 * CS471 Homework #3
 * @author: J. Andrew Marshall <jmarsha6@binghamton.edu
 */

/**
 * 1: Read 3.1.3 Example 3: Successor from "Learn Prolog Now!"
 * http://cs.union.edu/~striegnk/learn-prolog-now/html/node27.html#subsec.l3.ex3
 *
 * Define a predicate convertToDecimal(Succ, Decimal), which converts the
 * succ representation for numbers to decimal representation, i.e.
 *   ?- convertToDecimal(succ(succ(succ(succ(succ(0))))),N).
 *   N = 5.
 *   ?- convertToDecimal(S,4).
 *   S = succ(succ(succ(succ(0)))).
*/

numeral(0).
numeral(succ(X)) :- numeral(X).

convertToDecimal(0, 0).
convertToDecimal(succ(S), D) :- convertToDecimal(S, E), D is E + 1.


/**
 * 2:
 *
 * Define a predicate grtThanLst(Lst1, Lst2), such that it succeeds if each
 * corresponding element in Lst1 has a greater the corresponding element in Lst2.
 * Comment any assumptions you make.
 * Depending on your assumptions this can be done with
 *   2 clauses, or 3 clauses or 4 clauses.
 *
 *   ?- grtThanLst([1,15,2],[0,11,1]).
 *   true.
 *   ?- grtThanLst([1,15,2],[0,51,1]).
 *   false.
 */

% Assumption: both lists are of equal length.

grtThanLst([], []).
grtThanLst([A|X], [B|Y]) :- A > B, grtThanLst(X, Y).


/**
 * 3:
 * Define a predicate equivalentL1(Lst1, Lst2), such that it succeeds if
 * the firsts items of list Lst2 are in the same order as the equivalent items in list
 * Lst1 and all the items in list Lst1 have equivalent items in Lst2.
 * Use a recursive definition. Lst1 and Lst2 may be the same length.
 *   ?- equivalentL1([1,2,3],[1,2]).
 *   false.
 *   ?- equivalentL1([1,2,3],[1,2,3]).
 *   true.
 *   ?- equivalentL1([1,2,3],[3,2,1]).
 *   false.
 *   ?- equivalentL1([1,2],[1,2,3,4]).
 *   true.
 */

equivalentL1([], Y).
equivalentL1([A|X], [B|Y]) :- A = B, equivalentL1(X, Y).


/**
 * 4:
 * Define a predicate hasSubseq(L,S), such that it succeeds if the list L
 * contains the list S as a sub-sequence of equivalent items. Use a recursive
 * definition. e.g.
 *   ?- hasSubseq([a,g,b,d],[g,b]).
 *   true .
 *   ?- hasSubseq([a,g,b,d],[g,d]).
 *   true .
 *   ?- hasSubseq([a,g,b,d],[b,g]).
 *   false.
 * (This can be done with 3 clauses.)
 */

hasSubseq([], []).
hasSubseq([A|X], Y) :- hasSubseq(X, Y).
hasSubseq([A|X], [B|Y]) :- A = B, hasSubseq(X, Y).


/**
 * 5:
 * Define a predicate init(Lst, InitOfLst) succeeds if InitOfLst is the same
 * as Lst except the last element of Lst is missing. i.e.
 *   ?- init([a,b,c,d,e],Init).
 *   Init= [a, b, c, d]
 *   true
 * (This can be done with 2 clauses.)
 */

init([_], []).
init([E|X], [E|Y]) :- init(X, Y).


/**
 * 6:
 * Define a predicate nth(Num,Lst,Element), such that it succeeds if the
 * variable Element is unified with the Numth element of the list Lst .
 * The count starts with 0. e.g.
 *   ?- nth(3,[a,b,c,d,e,f,g],E).
 *   E = d .
 * (This can be done with 2 clauses.)
 */

nth(0, [E|_], E).
nth(N, [_|L], E) :- M is N - 1, nth(M, L, E).


/**
 * 7:
 * Define the procedure 'zip' so that zip(Lst1,Lst2,Zipped) succeeds if
 * Zipped is a list of sequences (tuples) . The first value of the sequence
 * is from the corresponding position from Lst1 and the second value is from
 * corresponding position from Lst2. Note: The length of Zipped will be the
 * minimum of the length of Lst1 and length of Lst2. e.g.
 *   ?- zip([1,2,3,4],[a,b,c],Z).
 *   Z = [ (1, a), (2, b), (3, c)].
 *   ?- zip([a],[1,2,3,4],Z).
 *   Z = [ (a, 1)].
 *   ?- zip([a],[],[(a,a)]).
 *   false.
 * (This can be done with 3 clauses.)
 */

zip(_, [], []).
zip([], _, []).
zip([A|X], [B|Y], [(A,B)|Z]) :- zip(X, Y, Z).
