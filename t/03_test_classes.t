#!/usr/bin/perl

use strict;
use warnings;
use Test::Builder;
use Test::Class::Moose::Load 't/lib/tests';

use lib qw(t/lib);


use Test::Class::Moose::Runner;

use Catalyst::Test 'Emitria::Web';

use Emitria;

my $e = Emitria->new();

my $config = $e->config();

my $db_name = $config->dbname();

my $db = $e->database();


$db->deploy();

my $runner  = Test::Class::Moose::Runner->new(test_classes => \@ARGV);
$runner->runtests();

END
{
   if ( $db_name )
   {
      unlink $db_name;
   }
}

1;
