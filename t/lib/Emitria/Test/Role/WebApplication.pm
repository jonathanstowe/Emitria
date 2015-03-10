package Emitria::Test::Role::WebApplication;

use strict;
use warnings;

use Moose::Role;

has emitria_web   => (
   is => 'rw',
   isa   => 'Catalyst',
   lazy  => 1,
   builder  => '_get_emitria_web',
);

sub _get_emitria_web
{
   my ( $self ) = @_;

   require Emitria::Web;
   return Emitria::Web->new();
}

1;
