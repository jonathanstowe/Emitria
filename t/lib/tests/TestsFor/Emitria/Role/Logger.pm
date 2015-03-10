package TestsFor::Emitria::Role::Logger;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
			Emitria::Test::Role::RoleHelper
			Emitria::Test::Role::Package
		 );

use Emitria::Role::Logger;

sub test_startup
{
   my ( $test ) = @_;

	$test->package_name('Emitria::Role::Logger');

   $test->next::method();
}

sub test_setup
{
   my ( $test ) = @_;

   $test->next::method();
}

sub test_role_object
{
   my ( $test ) = @_;

   ok(my $obj = $test->role_test_object(), 'get object');
   can_ok($obj, 'log');
   can_ok($obj, 'logger_config');
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
