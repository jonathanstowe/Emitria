use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::Show::Instance;

ok( request('/api/show/instance')->is_success, 'Request should succeed' );
done_testing();
