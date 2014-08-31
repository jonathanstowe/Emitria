use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::My::Password;

is( request('/my/password')->code(),302, 'Request should redirect' );
done_testing();
