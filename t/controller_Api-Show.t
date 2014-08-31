use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::Show;

ok( request('/api/show')->is_success, 'Request should succeed' );
done_testing();
