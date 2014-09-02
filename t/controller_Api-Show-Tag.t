use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::Show::Tag;

use HTTP::Request::Common;

is( request(GET '/api/show/tag', Content_Type => 'application/json')->code(),403, 'Request should 403' );
done_testing();
