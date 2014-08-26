use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Logout;

is( request('/logout')->code(),302, 'Request should redirect' );
done_testing();
