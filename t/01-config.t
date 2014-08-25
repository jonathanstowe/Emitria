#!perl
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;


use_ok( 'Emitria::Config' );

ok(my $obj = Emitria::Config->new(), "get an Emetria::Config");

isa_ok($obj, 'Emitria::Config');

foreach my $attr ( $obj->meta()->get_attribute_list() )
{
    lives_ok { $obj->$attr() } "check $attr doesn't die";
}

done_testing();
