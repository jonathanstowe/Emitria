package TestsFor::Emitria::Web::Role::WebAuth;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
			Emitria::Test::Role::RoleHelper
			Emitria::Test::Role::Package
		 );

use Emitria::Web::Role::WebAuth;

sub test_startup
{
   my ( $test ) = @_;

	$test->package_name('Emitria::Web::Role::WebAuth');
   $test->test_class_superclasses([qw(Catalyst::Controller)]);

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

   ok(my $obj = $test->role_test_object(), "get object");
   isa_ok($obj, 'Catalyst::Controller');
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
