use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::File;
use HTTP::Request::Common;

is( request(GET '/api/file', Content_Type => 'application/json')->code(),403, 'Request should 403' );
done_testing();
