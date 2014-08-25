use strict;
use warnings;

use Test::More;
use Test::Exception;

use_ok('Emitria');

ok(my $e = Emitria->new(), "create new object");

isa_ok($e, 'Emitria');

my ($config, $db);

lives_ok { $config = $e->config() } "get a config";

isa_ok($config, 'Emitria::Config');

ok(my $db_name = $config->dbname(), "got dbname");

lives_ok { $db = $e->database() } "got the database";

isa_ok($db, 'Emitria::Schema');

lives_ok { $db->deploy() } "deploy the test database";

ok(-f $db_name, "and the DB was created");

END
{
    if ( $db_name )
    {
        unlink $db_name;
    }
}





done_testing();



