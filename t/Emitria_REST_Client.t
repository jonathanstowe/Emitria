
use strict;
use warnings;

use Test::Most;
use Test::LWP::UserAgent;

use_ok('Emitria::REST::Client');

my $obj;

lives_ok { $obj = Emitria::REST::Client->new(base => 'http://localhost', default_headers => { Bumble => 'bee'}) } "make a new one";

isa_ok($obj,'Emitria::REST::Client', 'new object');

isa_ok($obj->ua(), 'LWP::UserAgent', 'ua');

my $ua = Test::LWP::UserAgent->new();

lives_ok { $obj->ua($ua) } "set ua to a Test::LWP::UserAgent";

$ua->map_response(qr/foo/, HTTP::Response->new('200', HTTP::Status::status_message('200'),
        [ 'Content-Type' => 'application/json' ],'{}'));

foreach my $meth ( qw(get post put delete head options))
{
   can_ok($obj, "_$meth");
   can_ok($obj,$meth);
   my $req;
   my $us_meth = "_$meth";

   throws_ok { $obj->$us_meth() } qr/No URL provided/, "throw without url";

   lives_ok { $obj->force_http_10(1) } "set force_http_10 true";
   lives_ok { $req = $obj->$us_meth(url => 'foo') } "run $us_meth just url";
   isa_ok($req, 'HTTP::Message', 'returned object');
   is($req->protocol(), 'HTTP/1.0', "got correct protocol");

   lives_ok { $obj->force_http_10(0) } "set force_http_10 false";
   lives_ok { $req = $obj->$us_meth(url => 'foo') } "run $us_meth just url";
   isa_ok($req, 'HTTP::Message', 'returned object');
   is($req->protocol(), 'HTTP/1.1', "got correct protocol");
   is($req->header('Bumble'), 'bee', "got the default header");

   lives_ok { $req = $obj->$us_meth(url => 'foo', headers => { Bumble => 'tumble'}) } "run $us_meth just url with default header";
   isa_ok($req, 'HTTP::Message', 'returned object');
   is($req->protocol(), 'HTTP/1.1', "got correct protocol");
   is($req->header('Bumble'), 'tumble', "got the default header over-ridden");

   lives_ok { $req = $obj->$us_meth(url => 'foo', headers => { Rumble => 'tumble'}) } "run $us_meth just url with new header";
   isa_ok($req, 'HTTP::Message', 'returned object');
   is($req->protocol(), 'HTTP/1.1', "got correct protocol");
   is($req->header('Bumble'), 'bee', "got the default header");
   is($req->header('Rumble'), 'tumble', "got the new header");

   lives_ok { $req = $obj->$us_meth(url => 'foo', query => { baz => 'zum'}) } "run $us_meth with url and query";
   isa_ok($req, 'HTTP::Message', 'returned object');

   lives_ok { $req = $obj->$us_meth(url => 'foo', data => "{}") } "run $us_meth with url and data";
   isa_ok($req, 'HTTP::Message', 'returned object');

   my $res;
   lives_ok { $res = $obj->$meth(url => 'foo') } "run $meth using base()";
   isa_ok($res, 'HTTP::Response', 'response');
   is($res->code(), 200, "and got the right kind of response");
   lives_ok { $res = $obj->$meth(url => 'http://localhost/foo') } "run $meth using absolute url";
   isa_ok($res, 'HTTP::Response', 'response');
}

is($obj->content_type(), 'application/json', "got the right default content_type");

#
{
   my $obj = Emitria::REST::Client->new();

   $obj->ua($ua);
   my $res;

   lives_ok { $res =  $obj->get(url => '/foo') } "get with no base and not a full URI";
   is($res->code(), 400, "and the response is 400 as we expected");
}



done_testing();
