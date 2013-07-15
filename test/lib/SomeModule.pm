package SomeModule;

use strict;
use warnings;

sub new {
    my ( $class, %args ) = @_;
    bless \%args, $class;
}

sub sum {
    my $self = shift;
    my $ret  = 0;
    for my $num (@_) {
        $ret += $num;
    }
    return $ret;
}

1;
