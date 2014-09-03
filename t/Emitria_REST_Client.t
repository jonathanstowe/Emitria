
use strict;
use warnings;

use Test::Most;

use_ok('Emitria::REST::Client');

my $obj;

lives_ok { $obj = Emitria::REST::Client->new() } "make a new one";

isa_ok($obj,'Emitria::REST::Client', 'new object');

foreach my $meth ( qw(get post put delete head options))
{
    can_ok($obj, "_$meth");
    can_ok($obj,$meth);
    my $req;
    my $us_meth = "_$meth";

    lives_ok { $req = $obj->$us_meth(url => 'foo') } "run $us_meth";

    isa_ok($req, 'HTTP::Message', 'returned object');

}

is($obj->content_type(), 'application/json', "got the right default content_type");


done_testing();



