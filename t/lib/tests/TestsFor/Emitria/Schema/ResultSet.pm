package TestsFor::Emitria::Schema::ResultSet;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
			Emitria::Test::Role::Package
         Emitria::Test::Role::Database
		 );

use Emitria::Schema::ResultSet;

sub test_startup
{
   my ( $test ) = @_;

	$test->package_name('Emitria::Schema::ResultSet');

   $test->next::method();
}

sub test_setup
{
   my ( $test ) = @_;

   $test->next::method();
}

sub test_inheritance
{
   my ( $test ) = @_;

   foreach my $source ( $test->emitria_database()->sources() )
   {
      ok(my $rs = $test->resultset($source), "get $source RS");
      isa_ok($rs, 'DBIx::Class::ResultSet');
      isa_ok($rs, 'Emitria::Schema::ResultSet');
   }
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
