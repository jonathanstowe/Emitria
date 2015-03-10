package TestsFor::Emitria::Web::View::Form;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
			Emitria::Test::Role::Constructor
			Emitria::Test::Role::Package
		 );

use Emitria::Web::View::Form;

sub test_startup
{
   my ( $test ) = @_;

   require Emitria::Web;

	$test->package_name('Emitria::Web::View::Form');
   $test->constructor_args([Emitria::Web->new(), {}]);

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
