package Emitria::Test::Role::Package;

use strict;
use warnings;

use Moose::Role;

has package_name  => (
   is    => 'rw',
   isa   => 'Str',
);

1;

