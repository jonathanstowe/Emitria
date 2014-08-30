use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::My::Password;

ok( request('/my/password')->is_success, 'Request should succeed' );
done_testing();
