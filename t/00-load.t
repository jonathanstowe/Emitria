#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Emitria' ) || print "Bail out!\n";
}

diag( "Testing Emitria $Emitria::VERSION, Perl $], $^X" );
