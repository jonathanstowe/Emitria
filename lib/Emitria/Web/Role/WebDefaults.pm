package Emitria::Web::Role::WebDefaults;

use strict;
use warnings;
 
use Moose::Role;
use MooseX::MethodAttributes::Role;
with qw(
         Emitria::Web::Role::WebAuth
         Emitria::Web::Role::WebRender
       );


=head1 NAME

Emitria::Web::Role::WebDefaults

=head1 DESCRIPTION

Just bring in the most commonlly used roles for the web parts.

=head2 METHODS

=over 4

=back

=cut

1;
