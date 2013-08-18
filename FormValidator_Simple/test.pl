#!/usr/bin/env perl
use strict;
use warnings;
use YAML;
use Data::Dumper;
use FormValidator::Simple;

FormValidator::Simple->set_messages('/Users/Yujiro/git_YujiroEto/daily_practice/FormValidator_Simple/message.yml');
#FormValidator::Simple->set_mesasges_decode_from('utf-8');

my $params = +{
    param1 => '12345',
	param2 => 'abcdefg',
	#param2 => '123',
	#param3 => undef,
    param3 => 'a',
    mail1  => 'test@example.com',
    mail2  => 'test2@example.com',
    year   => 2010,
    month  => 02,
    day    => 30,
};

my $result = FormValidator::Simple->check(
    $params => [
        param1 => [ 'NOT_BLANK', 'ASCII' ],
        param2 => [ 'NOT_BLANK', 'INT', [ 'LENGTH', 1, 3 ] ],
        param3 => ['NOT_BLANK'],
        mail1  => ['EMAIL_LOOSE'],
        mail2  => ['EMAIL_LOOSE'],
        { mails => [ 'mail1', 'mail2' ] } => ['DUPLICATION'],
        { date => [ 'year', 'month', 'day' ] } => ['DATE'],
    ]
);

#my $message = $result->messages('action1');

my $message = $result->field_messages('action1');
print Dumper $message;
#print $result->has_error."\n";
#print Dumper $result->error;
#print Dumper $params;
#print $result->error."\n";
#
#if ( $result->has_error ) {
#    for my $key ( $result->error ) {
#        my @types = map { $_ } $result->error($key);
#        printf "$key:%s\n", join q{,}, @types;
#    }
#}
