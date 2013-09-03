#!/usr/bin/env perl
use strict;
use warnings;

use Readonly;
Readonly my $name  => q[nekokak];
Readonly my $age   => q[27];
print <<"__EOD__";
Hi!
My name is $name.
My age is $age.
Bye.
__EOD__

$name = 'aaa';
print $name."\n";

