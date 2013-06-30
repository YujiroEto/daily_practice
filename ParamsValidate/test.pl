#!/usr/bin/env perl
use strict;
use warnings;

#引数が与えられたかのチェック
use Params::Validate qw(:all);

sub foo {
  my $args = validate( @_, { 
	      hoge => 1,     ## mandatory (必須)
	      fuga => 0,     ## optional
	    });
	#print $args->{hoge}, "\n";
	print $args->{hoge}, "\n" if defined $args->{hoge};
	print $args->{fuga}, "\n" if defined $args->{fuga};
}

my %hash = ( fuga => 100 );
#my %hash = ( hoge => 100 );
#my %hash = ( hoge => 100, fuga => 200 );
foo( %hash );  
foo( \%hash ); # ハッシュリファレンスでもいける
