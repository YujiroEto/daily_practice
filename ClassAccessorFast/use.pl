#!/usr/bin/env perl
use strict;
use warnings;
use MyClass;

my $obj = MyClass->new({
	address => 'tokyo',
	blog	=> 'aaa',
});

print $obj->address;
print "\n";
print $obj->blog;
print "\n";

$obj->address('osaka');
$obj->blog('bbb');

print $obj->address;
print "\n";
print $obj->blog;
print "\n";


