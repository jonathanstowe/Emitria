#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Emitria::Web';

is( request('/')->code(), 302, 'Request should redirect' );

done_testing();
