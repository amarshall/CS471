/* Example to illustrate backtracking search used to implement Prolog */
/* Ghezzi and Jazayeri, 1998 Programming Concepts page 386 */
/* This program finds the transitive closure of rel. */
/*    rel = relation, clos= closure */
rel(a,b).         %1
rel(a,c).         %2
rel(b,f).         %3
rel(f,g).         %4
clos(A,B) :- rel(A,B).             %5
clos(A,B) :- rel(A,Z), clos(Z,B).  %6

