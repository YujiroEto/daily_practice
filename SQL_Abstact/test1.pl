#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dump qw(dump);
use SQL::Abstract;

use Data::Dumper;

#
my $s  =  SQL::Abstract->new;
my ($stmt, @bind)  =  $s->select(
	"activity", # tables
	[qw/id title sender created_on/], # columns
	+{ guid  => 100 }, # where
);
#print dump( $stmt, \@bind );

print Dumper ( $stmt, \@bind );

## こんな感じで実効
#my $sth  =  $dbh->prepare($stmt);
#$sth->execute(@bind);
