use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::File;

ok( request('/api/file')->is_success, 'Request should succeed' );
done_testing();
