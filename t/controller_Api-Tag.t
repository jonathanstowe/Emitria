use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::Tag;

ok( request('/api/tag')->is_success, 'Request should succeed' );
done_testing();
