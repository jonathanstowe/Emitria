use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::My::Detail;

is( request('/my/detail')->code(), 302, 'Request should redirect' );
done_testing();
