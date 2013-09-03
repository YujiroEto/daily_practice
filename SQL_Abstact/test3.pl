#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dump qw(dump);
use SQL::Abstract;
use SQL::Abstract::Plugin::InsertMulti;

my $app_data  =  +{
	pokes  => 10,
	last_poke  => '2009-11-28',
};

my $s  =  SQL::Abstract->new;
my ($stmt, @bind);

($stmt, @bind)  =  $s->insert_multi(
	'app_data',
	[qw/name data created_on updated_on/],
	[
		map { [ $_, $app_data->{$_}, \'UNIX_TIMESTAMP()', \'UNIX_TIMESTAMP()', ] }
		keys %$app_data,
	],
);

print dump( $stmt, \@bind );
