use strict;
use warnings;

use Test::Most;

use Cwd;

use Path::Class;

my $st = getcwd();
my $tmpname = dir("tmp$$");
$tmpname->mkpath();

use_ok('Emitria::Config');

my $obj;

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config";

can_ok($obj,"config_file");
can_ok($obj,"template_path");
can_ok($obj,"htdocs_dir");
can_ok($obj,"config_object");
can_ok($obj,"database");
can_ok($obj,"dbhost");
can_ok($obj,"dbname");
can_ok($obj,"dbuser");
can_ok($obj,"dbpass");
can_ok($obj,"db_dsn");
can_ok($obj,"driver");

my $cf;

lives_ok { $cf = $obj->config_file() } "config_file";

ok(-f $cf, "and $cf exists");

my $tp;

lives_ok { $tp = $obj->template_path() } "template_path";
ok(-d $tp->[0], $tp->[0] . " exists");


my $hd;

lives_ok { $hd = $obj->htdocs_dir() } "htdocs_dir";

ok( -d $hd, "and $hd exists");
my $co;

lives_ok { $co = $obj->config_object() } "config_object";

isa_ok($co, 'Config::Tiny');

chdir $tmpname;

$ENV{EMITRIA_CONFIG} = file($st, $cf);

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config";



lives_ok { $cf = $obj->config_file() } "config_file";

ok(-f $cf, "and it exists");


lives_ok { $tp = $obj->template_path() } "template_path";



lives_ok { $hd = $obj->htdocs_dir() } "htdocs_dir";

ok( -d $hd, "and $hd exists");

lives_ok { $co = $obj->config_object() } "config_object";

isa_ok($co, 'Config::Tiny');

$ENV{EMITRIA_CONFIG} = 'totally/bogus';

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config with bogus environment";

lives_ok { $cf = $obj->config_file() } "config_file now in shared_dir";
ok(-f $cf, "and $cf exists");

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config with bogus environment";

lives_ok { $obj->share_dir('bgus/bogus') } "set share_dir to something bogus";

throws_ok { $cf = $obj->config_file() } qr/Validation failed for 'Str' with value undef/, "config_file throws because it doesn't exist and no fallback";

delete $ENV{EMITRIA_CONFIG};

$ENV{EMITRIA_TEMPLATES} = $tp->[0];

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config with template in the environment";

lives_ok { $tp = $obj->template_path() } "template_path";

ok(-d $tp->[0], $tp->[0] . " exists");

$ENV{EMITRIA_TEMPLATES} = "bigus/bogus";

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config with fake template path in the environment";

lives_ok { $tp = $obj->template_path() } "template_path";

ok(-d $tp->[0], $tp->[0] . " exists");

delete $ENV{EMITRIA_TEMPLATES};

lives_ok { $obj = Emitria::Config->new() } "new Emitria::Config with bogus share_dir";

lives_ok { $obj->share_dir('bogus/bogus') } "totally bogus share_dir";

lives_ok { $tp = $obj->template_path() } "template_path";
throws_ok { $hd = $obj->htdocs_dir() } qr/Validation failed for 'Str' with value undef/, "htdocs_dir not set because no fallback";

done_testing();

END
{
   chdir $st;
   $tmpname->rmtree();
}
