#!/usr/bin/env perl
use strict;
use warnings;


my @test = count_ave(1..1000);

sub count_ave {
	my @num = @_:
	my $average = ave(@num);
	my 
	for 

}

sub ave {
	my @num = @_;
	my $sum;
	my $count;

	for (@num) {
		$sum += &_;
		$count++;
	}
	$sum/$count;
}
