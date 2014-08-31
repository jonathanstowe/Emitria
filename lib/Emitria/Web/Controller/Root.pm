package Emitria::Web::Controller::Root;

use Moose;
extends 'Catalyst::Controller';
with qw(
         Emitria::Web::Role::WebDefaults
       );

use MooseX::MethodAttributes;

use namespace::autoclean;

__PACKAGE__->config(namespace => '');

=head1 NAME

Emitria::Web::Controller::Root - Root Controller for Emitria::Web

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) 
{
    my ( $self, $c ) = @_;

    $c->stash->{current_view} = 'HTML';
    $c->stash(template => 'root.tt');    
}


=head2 default

Standard 404 error page

=cut

sub default :Path 
{
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head1 AUTHOR

Jonathan Stowe

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
