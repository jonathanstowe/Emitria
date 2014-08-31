use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::Show::Tag;

ok( request('/api/show/tag')->is_success, 'Request should succeed' );
done_testing();
