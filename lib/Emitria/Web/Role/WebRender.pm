package Emitria::Web::Role::WebRender;

use strict;
use warnings;
 
use Moose::Role;
use MooseX::MethodAttributes::Role;

=head1 NAME

Emitria::Web::Role::WebRender

=head1 DESCRIPTION

This provides a default C<emd> method to do RenderView

=head2 METHODS

=over 4

=item end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=back

=cut

1;
