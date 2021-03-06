#!/usr/bin/env perl

use List::MoreUtils qw(:all);	#全部(デフォルトではexportされない)

#リストを評価して要素の一つでも条件を満たすと真、満たさなかったら偽を返します。 リストが空ならundefを返します。
my $v = any {$_ < 10} 1..10; # 真
print $v."\n";

#リストを評価して全ての要素が条件を満たすと真、満たさなかったら偽を返します。 リストが空ならundefを返します。
my $b = all {$_ < 10} 1..10; # 偽
print $b."\n";

#リストを評価して全て要素が条件を満たさなかったら真、一つでも満たしたら偽を返します。 リストが空ならundefを返します。 anyの逆です。
$b = none {$_ < 10} 1..10; # 偽
print $b."\n";

$b = none {$_ < 10} 11..20; # 偽
print $b."\n";

#リストを評価して条件を満たした要素数を返します。
$v = true {$_ < 10} 1..10; #9
print $v."\n";

