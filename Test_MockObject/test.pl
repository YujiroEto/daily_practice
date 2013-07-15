#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::MockObject;

use Data::Dumper;

#モック作成
my $mock = Test::MockObject->new();

#trueを返すsomemethodをセット
$mock->set_true('somemethod');
#ok( $mock->somemethod() );

#こんな感じでもセット出来る
my $test =  $mock->set_true('veritas')
	->set_false('ficta')
  	->set_series( 'amicae', 'Sunny', 'Kylie', 'Bella' );

print Dumper $test;


