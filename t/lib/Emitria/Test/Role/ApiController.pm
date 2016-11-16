package Emitria::Test::Role::ApiController;

use strict;
use warnings;

use Moose::Role;

use Catalyst::Test 'Emitria::Web';
use HTTP::Request::Common;
use Test::Most;

has index_path => (
    is => 'rw',
    isa => 'Str',
);

sub test_get_index {
    my ( $self ) = @_;
    is( request(GET $self->index_path, Content_Type => 'application/json')->code(),403, 'Request should 403' );
}

1;
