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

ok(my $station = $db->resultset('Station')->find_or_create({name => 'test_station'}), "create a station");

ok(my $permission = $db->resultset('Permission')->find_or_create({name => 'test_permission'}), "create a permission");

ok(my $role = $station->create_related(roles => {name => 'test_role'}), "create a role");

lives_ok { $role->add_to_permissions($permission) } "add permission to role";

is($role->permissions()->count(), 1, "and the role has permissions");

ok(my $user = $station->create_related(users => {username => 'test_user', password => 'foo'}), "create a user");

lives_ok { $user->add_to_roles($role) } "add role to user";

is($user->roles()->count(),1, "user has one role");
is($user->permissions()->count(),1, "user has one permissions");

ok($user->can_do($permission->name()), "user can do the permission");
ok(!$user->can_do('xest_permission'), "user cant do another permission");

ok(my $token = $user->new_token('api'), 'new_token');

isnt(my $new_token = $user->new_token('api'), $token, "and we get a different one back again");

ok(my $tokens = $db->resultset('User::Token'), 'get user takens');

ok($token = $tokens->find({token => $new_token }), 'search for token');

is($token->user()->id(), $user->id(), "and got one for the right user");

END
{
    if ( $db_name )
    {
        unlink $db_name;
    }
}





done_testing();



