use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::My::Detail;

ok( request('/my/detail')->is_success, 'Request should succeed' );
done_testing();
