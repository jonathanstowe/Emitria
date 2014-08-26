use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Login;

ok( request('/login')->is_success, 'Request should succeed' );
done_testing();
