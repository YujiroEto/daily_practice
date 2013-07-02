#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::MockObject;

my $mock = Test::MockObject->new({ key => 'foobar' });

$mock->mock(get_key => sub {
	my ($self) = @_;
	$self->{key};
	});

print $mock->get_key;

