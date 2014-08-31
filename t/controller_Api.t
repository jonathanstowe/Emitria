use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api;

is( request('/api')->code(),302, 'Request should redirect' );
done_testing();
