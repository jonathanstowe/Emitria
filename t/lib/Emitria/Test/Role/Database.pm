package Emitria::Test::Role::Database;

use strict;
use warnings;

use Moose::Role;
with qw(Emitria::Test::Role::Application);

sub resultset
{
   my ( $self, $source ) = @_;

   return $self->emitria_database()->resultset($source);
}

1;
