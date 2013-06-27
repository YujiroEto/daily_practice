#!/usr/bin/env perl
use strict;
use warnings;


use Params::Validate qw(:all);

sub foo {
  my $args = validate( @_, { 
	      hoge => 1,     ## mandatory (必須)
	      fuga => 0,     ## optional
	    });
  print $args->{hoge}, "\n";
    print $args->{fuga}, "\n" if defined $args->{fuga};
}

my %hash = ( hoge => 100, fuga => 200 );
foo( %hash );  
foo( \%hash ); # ハッシュリファレンスでもいける
