# t/02_new.t
use strict;
use warnings;
use Test::More;
use SomeModule;

#my $obj  =  SomeModule->new;
#isa_ok $obj, 'SomeModule';
#
#done_testing;

subtest 'no args' => sub {
    my $obj = SomeModule->new;
    isa_ok $obj, 'SomeModule';
};

subtest 'foo  => bar' => sub {
    my $obj = SomeModule->new( foo => 'bar' );
    isa_ok $obj, 'SomeModule';
};

done_testing;
