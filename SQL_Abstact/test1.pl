#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dump qw(dump);
use SQL::Abstract;

use Data::Dumper;



#http://perl-users.jp/articles/advent-calendar/2009/hacker/06.html
#
my $s  =  SQL::Abstract->new;
my ($stmt, @bind)  =  $s->select(
	"activity", # tables
	[qw/id title sender created_on/], # columns
	+{ guid  => 100 }, # where
);
#print dump( $stmt, \@bind );

print Data::Dumper::Dumper ( $stmt, \@bind );
