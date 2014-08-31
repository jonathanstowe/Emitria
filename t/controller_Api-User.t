use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::User;

ok( request('/api/user')->is_success, 'Request should succeed' );
done_testing();
