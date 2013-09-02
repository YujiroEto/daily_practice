#!/usr/bin/perl

use strict;
use warnings;

print "error!\n"
	unless (grep {$_ > 0} (1,2,3));


	# １つでも偽なら
