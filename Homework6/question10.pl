use diagnostics;

sub foo {
  my $lex = $_[0];
  my $bar = sub {
    print "$lex\n";
  };
  $bar->();
}

foo(2);
foo(3);
