use strict;
use warnings;

use Test::Most;

use Moose::Meta::Class;

use Path::Class;

use_ok('Emitria::Role::Logger');

my $meta_class = Moose::Meta::Class->create('Test::Emitria::Role::Logger' => ( roles => [qw(Emitria::Role::Logger)]));

my $obj;

ok($meta_class->does_role('Emitria::Role::Logger'), "meta class has the role");

lives_ok { $obj = $meta_class->new_object() } "create a class that consumes the role";

isa_ok($obj, 'Test::Emitria::Role::Logger', 'object');

can_ok($obj, 'log');
can_ok($obj, 'logger_config');

# not quite sure why this doesn't work at the moment
#ok($obj->DOES('Emitria::Role::Logger'), "and it does the role");

my $tmpname = "tmp$$";
mkdir $tmpname or die "$!\n";
chdir $tmpname;

my $config;

lives_ok { $config = $obj->logger_config() } "get logger_config in wrong directory for test";

ok(-f $config, "$config exists");


$ENV{'EMITRIA_LOGGER_CONFIG'} = file($obj->share_dir(), 'etc', 'emitria_logger.conf');

lives_ok { $obj = $meta_class->new_object() } "create a new object that consumes the role";

lives_ok { $config = $obj->logger_config() } "get logger_config in wrong directory for test but with the environment set";

ok(-f $config, "$config exists");

lives_ok { $obj = $meta_class->new_object() } "create a new object that consumes the role";

$ENV{'EMITRIA_LOGGER_CONFIG'} = 'utter/garbage/path';

lives_ok { $config = $obj->logger_config() } "get logger_config in wrong directory for test but with the environment set to something stupid";

ok(-f $config, "$config exists");

delete $ENV{'EMITRIA_LOGGER_CONFIG'};

lives_ok { $obj = $meta_class->new_object() } "create a new object that consumes the role";

lives_ok { $obj->share_dir('garbage/garbage') } "set share to something bogus";


throws_ok { $config = $obj->logger_config() } qr/Validation failed for 'Str' with value undef/, "get logger_config in wrong directory for test no environment set and share_dir bogus should throw";

chdir '..';

lives_ok { $obj = $meta_class->new_object() } "create a new object that consumes the role";

lives_ok { $config = $obj->logger_config() } "get logger_config in correct directory for test";

ok(-f $config, "$config exists");

my $logger;

lives_ok { $logger = $obj->log() } "get the logger";

isa_ok($logger, 'Log::Log4perl::Logger', "logger");

done_testing();
