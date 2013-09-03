#!/usr/bin/env perl
use strict;
use warnings;

use strict;
use warnings;
use Encode qw/find_encoding/;
use Text::Kakasi;
use Test::More;

use Data::Dumper;

my $hiragana = qr/\p{InHiragana}/;
my $katakana = qr/\p{InKatakana}/;
my $kanji    = qr/\p{InCJKUnifiedIdeographs}/;
my $suuji =
  qr/\p{InHalfwidthAndFullwidthForms}/;    #数字だけじゃないけど

my $u = find_encoding('utf8');

#print Dumper ($j, $k);

sub en { $u->encode(shift) }
sub de { $u->decode(shift) }

sub kan {
	my $j = Text::Kakasi->new(qw/-iutf8 -outf8 -JH /);
    my $kana = shift;
    $kana = $j->get($kana);
    $kana;
}

sub kata{
	my $k = Text::Kakasi->new(qw/-iutf8 -outf8 -KH /);
    my $kana = shift;
    $kana = $k->get($kana);
    $kana;
}

#sub suu{
#	my $k = Text::Kakasi->new(qw/-iutf8 -outf8 -KH /);
#    my $kana = shift;
#    $kana = $k->get($kana);
#    $kana;
#}
#

sub yomi {
    my $in = shift;
    my @r = split /($hiragana+)|($katakana+)|($kanji+)|($suuji+)/, $in;
    my $out;
    for my $part ( grep { $_ } @r ) {
       
		if ($part =~ m/^$kanji+$/) {
			$out .= kan($part);
		} elsif ($part =~ m/^$katakana+$/) {
			$out .= kata($part);
#		} elsif ($part =~ m/^$suuji+$/) {
#			$out .= suu($part);
		} else {
			$out .= $part;
		}
		#$out .= $part =~m/^$kanji+$/ ? kan($part) : $part;
	
	}
    $out;
}

{
    use utf8;

    my @data = (
        qw/
          ほげ ほげ
          マウス まうす
          ラーメン らーめん
          富士山 ふじさん
          東京 とうきょう
          紙コップ かみこっぷ
          バニラ味 ばにらあじ
          地上４階 ちじょう４かい
          地上四階 ちじょうよんかい
          長万部 おしゃまんべ
          屈斜路湖 くっしゃろこ
          日暮里 にっぽり
          /
    );

    for ( grep { not( $_ % 2 ) } ( 0 .. $#data ) ) {
        is(
            yomi( $data[$_] ),
            $data[ $_ + 1 ],
            en("$data[$_]\t-> $data[$_ + 1]")
        );
    }
}

done_testing;
