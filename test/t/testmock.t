use strict;
use warnings;

My::Test->runtests;

package My::Test;
use base qw/Test::Class/;
use Test::More;
use Test::MockObject;
use Test::Exception;
use ItemManager;

sub make_fixture : Test(setup) {
    my $self = shift;
    $self->{item_manager} = ItemManager->new( item_hash => { 10 => 10 } );
}

sub test_instance : Test(no_plan) {
    my $im = shift->{item_manager};

    isa_ok $im, 'ItemManager';
}

sub test_put_item : Test(no_plan) {
    my $self = shift;
    my $im   = $self->{item_manager};

# Itemが足りないとき、ちゃんと例外を投げるかどうか( 1 -2 )
    throws_ok {
        $im->put_item( 10, 11 );
    }
    'ItemShortageException',
      '$im->put_item()は,ItemShortageExceptionを投げて終了した。';

    # forループが正常に終わるか ( 1 - 2 - 3 - 4 - 5 )
    my $mock = Test::MockObject->new;
    $mock->mock(
        'put_item' => sub {
            ok( 1, 'put_item() got called' );
        }
    );
    $im->set_item_unit($mock);

    $im->put_item( 10, 1 );

# item_unitが例外を投げた時、ItemManagerが正常に例外を投げるか ( 1 - 2 - 3 - 4 - 3 - 6  )
    $mock->mock(
        'put_item' => sub {
            die "UnitJammedException";
        }
    );

    throws_ok {
        $im->put_item( 10, 1 );
    }
    "ItemUnitJammedException",
      '$im->put_item()は,ItemUnitJammedExceptionを投げて終了した。';

}
