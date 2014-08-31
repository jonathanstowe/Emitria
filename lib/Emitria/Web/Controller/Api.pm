package Emitria::Web::Controller::Api;

use Moose;
extends 'Catalyst::Controller';

use MooseX::MethodAttributes;

use namespace::autoclean;

=head1 NAME

Emitria::Web::Controller::Api - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Emitria::Web::Controller::Api in Api.');
}


=head1 AUTHOR

Jonathan Stowe

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
