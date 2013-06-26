#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my $var = {
	array => [1,2,3],
	hash => {
		key1 => "val1", 
		key2 => "val2"
	},
	coderef => sub { "this is coderef"},
	test => [3,5,6,7,8]
};

#print Dumper $var;


{
    local $Data::Dumper::Deparse = 1;
    print Data::Dumper::Dumper $var;
}



#http://www.omakase.org/perl/datadumper.html
#
