use Test::More 'no_plan';
use strict;
use warnings;
use Test::MockObject;

BEGIN {
	use_ok('Ysm::Example::Cart');
}

# 商品クラスのモック作成
my $mock_item  =  Test::MockObject->new;
$mock_item->fake_module('Ysm::Example::Item');
$mock_item->fake_new('Ysm::Example::Item');
$mock_item->set_always('get_id', 100);
$mock_item->set_always('get_name', '商品A');
$mock_item->set_always('get_price', 150);
$mock_item->set_always('get_pr', '商品紹介');

use_ok('Ysm::Example::Item');

# new test
{
	my $t  =  Ysm::Example::Cart->new;
	ok $t;
}

# add 正常系
{   
	my $t  =  Ysm::Example::Cart->new;
	my $item  =  Ysm::Example::Item->new(100, '商品A', 150, '商品紹介');    
	$t->add($item, 10);
	is $t->get_total, 1500;
}

# add 商品の数省略
{
	my $t  =  Ysm::Example::Cart->new;
	my $item  =  Ysm::Example::Item->new(100, '商品A', 150, '商品紹介');    
	$t->add($item);
	is $t->get_total, 150;
}

