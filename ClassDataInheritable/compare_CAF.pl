#!/usr/bin/env perl
use strict;
use warnings;

package MyCAF;
use base qw/Class::Accessor::Fast Class::Data::Inheritable/;
__PACKAGE__->mk_accessors('data');
package MyCDI;
use base qw/Class::Accessor::Fast Class::Data::Inheritable/;
__PACKAGE__->mk_classdata('data');

package main;

my $a = MyCAF->new();
my $b = MyCAF->new();
$a->data('data_a');
$b->data('data_b');
printf "a:%s, b:%s\n",$a->data,$b->data;

my $c = MyCDI->new();
my $d = MyCDI->new();
$c->data('data_c');
$d->data('data_d');
MyCDI->data('Class_Data');
printf "c:%s, d:%s\n",$c->data,$d->data;


