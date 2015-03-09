use strict;
use warnings;

use Test::Most;

use Moose::Meta::Class;
use Path::Class;

use Cwd;

my $st = getcwd();

use_ok('Emitria::Role::ShareDir');


my $meta_class = Moose::Meta::Class->create('Test::Emitria::Role::ShareDir' => ( roles => [qw(Emitria::Role::ShareDir)]));

my $obj;

ok($meta_class->does_role('Emitria::Role::ShareDir'), "meta class has the role");

lives_ok { $obj = $meta_class->new_object() } "create a class that consumes the role";

isa_ok($obj, 'Test::Emitria::Role::ShareDir', 'object');

can_ok($obj, 'share_dir');


my $dir;

lives_ok { $dir = $obj->share_dir() } "share_dir";

ok(-d $dir, "$dir exists");

my $tmpname = dir("tmp$$");

$tmpname->mkpath();

chdir $tmpname;


lives_ok { $obj = $meta_class->new_object() } "create a class that consumes the role";

lives_ok { $dir = $obj->share_dir() } "share_dir";

ok(-d $dir, "$dir exists");

done_testing();

END
{
   chdir $st;
   $tmpname->rmtree();
}
