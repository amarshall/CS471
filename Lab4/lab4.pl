/**
 * CS471 Lab #4
 * @author: J. Andrew Marshall <jmarsha6@binghamton.edu
 */

% Question 1
ack(0, N, X) :- X is N + 1.
ack(M, 0, X) :- M > 0, M1 is M - 1, ack(M1, 1, X).
ack(M, N, X) :- M > 0, N > 0, M1 is M - 1, N1 is N - 1, ack(M, N1, Y), ack(M1, Y, X).
% Ackermann number is 7.

% Question 2
% Homoiconic means the program is itself expressed as a datatype of the
% language.
% Fully refletive means that a program can inspect everything about its current
% structure and state. No language is fully reflective, but Prolog is very
% reflective.

% Question 4
listOfTerms([], _, []).
listOfTerms([A|L], N, [C|R]) :- C =.. [N|A], listOfTerms(L, N, R).

% Question 7
insert(E, L1, L2) :- select(E, L1, L1).

% Question 8
convertToDecimal(A,0).
convertToDecimal(succ(S), Y) :- numeral(S), Y1 is Y-1, convertToDecimal(S, Y1).
% => N = 0 .
% This result is returned because it is able to match the base case, as the
% first argument unifies with A, so the second argument, N, is implicitly
% unified with 0. This can be fixed by having the base case instead be
% convertToDecimal(0, 0).
