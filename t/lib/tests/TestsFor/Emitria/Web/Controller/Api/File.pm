package TestsFor::Emitria::Web::Controller::Api::File;

use strict;
use warnings;
use lib qw(t/lib);

use Test::Class::Moose;
with qw(
  Emitria::Test::Role::Constructor
  Emitria::Test::Role::Package
  Emitria::Test::Role::ApiController
);

use Emitria::Web::Controller::Api::File;

sub test_startup {
    my ($test) = @_;

    $test->constructor_args( [qw(Emitria::Web)] );
    $test->package_name('Emitria::Web::Controller::Api::File');
    $test->index_path('/api/file');

    $test->next::method();
}

sub test_setup {
    my ($test) = @_;

    $test->next::method();
}

sub test_teardown
{
    my ($test) = @_;

    $test->next::method();
}

sub test_shutdown
{
    my ($test) = @_;

    $test->next::method();
}

1;
