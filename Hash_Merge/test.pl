#!/usr/bin/env perl
use strict;
use warnings;

use YAML;
use Hash::Merge qw( merge );
my %hash1 = (
    sv1 => {
        name => "primary-sv",
        addr => "172.16.1.2",
        mask => "255.255.255.0",
    },
    sv2 => {
        name => "secondary-sv",
        addr => "172.16.1.3",
        mask => "255.255.255.0",
    },
);
my %hash2 = (
    sv1 => {
        disk   => "200GB",
        device => "none",
    },
    sv2 => {
        disk   => "500GB",
        device => "DVD",
    },
);
my %hash3 = %{ merge( \%hash1, \%hash2 ) };

print Dump \%hash1;
print Dump \%hash2;
print Dump \%hash3;

my %a =
  ( 'foo' => 1, 'bar' => [qw( a b e )], 'querty' => { 'bob' => 'alice' }, );
my %b =
  ( 'foo' => 2, 'bar' => [qw(c d)], 'querty' => { 'ted' => 'margeret' }, );

# スカラーは上書きされる
my %c = %{ merge( \%a, \%b ) };
print Dump \%a;
print Dump \%b;
print Dump \%c;

