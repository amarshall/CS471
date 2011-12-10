#!/usr/bin/perl 
# Problem 13.11 

# Run this code in Perl.
# Rerun using--> use diagnostics; (remove "#" on the next line)
# use diagnostics;

# reference
# http://www.computer-books.us/perl_0010.php


# $ is used to denote a scalar value.
# $_[0]  --- is the first parameter


sub foo {
	my $lex = $_[0];
	sub bar { 
  		print "$lex\n";
		$lex = 5;
	};
	print "Call to foo ";
	print "$lex\n";
	bar();
}
foo(2);

foo(3);
