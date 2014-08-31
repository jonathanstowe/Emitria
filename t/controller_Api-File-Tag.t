use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Emitria::Web';
use Emitria::Web::Controller::Api::File::Tag;

ok( request('/api/file/tag')->is_success, 'Request should succeed' );
done_testing();
