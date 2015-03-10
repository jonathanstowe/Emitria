package TestsFor::Emitria::Schema;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
         Emitria::Test::Role::Application
			Emitria::Test::Role::Package
		 );

use Emitria::Schema;

sub test_startup
{
   my ( $test ) = @_;

	$test->package_name('Emitria::Schema');

   $test->next::method();
}

sub test_setup
{
   my ( $test ) = @_;

   $test->next::method();
}

sub test_schema
{
   my ( $test ) = @_;

   ok(my $schema = $test->emitria_database(), 'get a connected database');
   isa_ok($schema, $test->package_name(),'schema');
   isa_ok($schema, 'DBIx::Class::Schema','schema');
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
