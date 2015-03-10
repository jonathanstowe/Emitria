package Emitria::Test::Role::Application;

use strict;
use warnings;

use Moose::Role;

=head1 NAME

Emitria::Test::Role::Application

=head1 DESCRIPTION

This is just a convenience to return L<Emitria> object to be used in tests.

=head2 METHODS

=over 4

=item emitria

Returns a L<Emitria> object.

=cut

has emitria => (
                  is => 'rw',
                  isa   => 'Emitria',
                  builder  => '_get_emitria',
                  handles  => {
                     emitria_config => 'config',
                     emitria_database  => 'database',
                  },
               );

sub _get_emitria
{
   my ( $self ) = @_;

   require Emitria;
   return Emitria->new();
}


=back

=cut



1;
