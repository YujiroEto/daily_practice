package ItemManager;
use strict;
use warnings;

sub new {
    my $class = shift;
    bless {@_}, $class;
}

sub put_item {
    my $self = shift;
    my ( $item_number, $count ) = @_;

    # 1
    $self->{item_hash}->{$item_number} ||= 0;
    my $rest = $self->{item_hash}->{$item_number};
    if ( $rest < $count ) {

        # 2
        die bless {}, "ItemShortageException";
    }

    # 3
    for ( my $i = 0 ; $i < $count ; $i++ ) {
        eval {
            # 4
            $self->{item_unit}->put_item($item_number);
        };
        if ($@) {

            #5
            die bless {}, "ItemUnitJammedException";
        }
    }

    # 6
}

sub set_item_unit {
    my $self = shift;
    my ($item_unit) = @_;
    $self->{item_unit} = $item_unit;
}

1;
