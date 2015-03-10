package TestsFor::Emitria::Web::Model::DB;

use strict;
use warnings;
use lib qw(t/lib);


use Test::Class::Moose;
with qw(
			Emitria::Test::Role::Package
         Emitria::Test::Role::Application
         Emitria::Test::Role::WebApplication
		 );

use Emitria::Web::Model::DB;

sub test_startup
{
   my ( $test ) = @_;

	$test->package_name('Emitria::Web::Model::DB');

   $test->next::method();
}

sub test_setup
{
   my ( $test ) = @_;

   $test->next::method();
}

sub test_model
{
   my ( $test ) = @_;

   my $db = $test->emitria_database();
   my $c  = $test->emitria_web();

   ok(my $model = $c->model('DB'), "get the model");
   isa_ok($model, 'Catalyst::Model');
   isa_ok($model->schema(), 'Emitria::Schema');
   foreach my $source ( $db->sources() )
   {
      ok(my $rs = $c->model("DB::$source"), "get model for $source");
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
