/* list of facts in prolog, stored in an ascii file, 'family.pl'*/
/* WE can think of "mother(mary,ann)" as meaning - */
/*                  Mary is the mother of Ann */

mother(mary, ann).
mother(mary, joe).
mother(sue, marY).  /* marY not the same as mary */
mother(sue,mary).

father(mike, ann).
father(mike, joe).
father(tom,mary).

grandparent(sue, ann). 

male(joe).
male(mike).
male(tom).

female(mary).
female(ann).
female(sue).