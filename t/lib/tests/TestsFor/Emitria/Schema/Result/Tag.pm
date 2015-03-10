package TestsFor::Emitria::Schema::Result::Tag;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
			Emitria::Test::Role::Constructor
			Emitria::Test::Role::Package
		 );

use Emitria::Schema::Result::Tag;

sub test_startup
{
   my ( $test ) = @_;

	$test->package_name('Emitria::Schema::Result::Tag');

   $test->next::method();
}

sub test_setup
{
   my ( $test ) = @_;

   $test->next::method();
}

sub test_teardown
{
   my ( $test ) = @_;

   $test->next::method();
}

sub test_shutdown
{
   my ( $test ) = @_;

   $test->next::method();
}

1;
