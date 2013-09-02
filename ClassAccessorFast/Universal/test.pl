#!/usr/bin/perl

use strict;
use warnings;

use UNIVERSAL qw(isa);

package Sam;
sub new{
  return bless {},shift;
}

package main;
my $aSam=Sam->new;
print 'isa($aSam,\'San\'):  '.isa($aSam,'Sam')."\n"; # (1)
print '$aSam->isa(\'Sam\'): '.$aSam->isa('Sam')."\n"; # (2)
