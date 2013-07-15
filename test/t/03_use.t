# t/03_sum.t

use strict;
use warnings;
use Test::More;
use SomeModule;

my $obj = SomeModule->new;

subtest 'bacic' => sub {
	my $got = $obj->sum(1,2,3);
	is $got, 6;
};

subtest 'skip undef'  => sub {
    my $got = $obj->sum(undef, 2, 3);
    is $got, 5;
};


done_testing;


