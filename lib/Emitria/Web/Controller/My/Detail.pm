package Emitria::Web::Controller::My::Detail;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Emitria::Web::Controller::My::Detail - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index_get

=cut

sub index_get : Path : Args(0) : GET
{
   my ( $self, $c ) = @_;

   $c->stash->{current_view} = 'Form';
   $c->stash( template => 'form/userdetail.tt' );
}

=head2 index_post

=cut

sub index_post : Path : Args(0) : POST
{
   my ( $self, $c ) = @_;

   my $user_id = $c->req()->parameters()->{user_id};

   my $is_me = ($c->user()->id() eq $user_id );

   if ( $is_me || $c->user()->can_do('edit_user') )
   {
      my $user;

      if ( $is_me )
      {
          $user = $c->user();
      }

      foreach my $field (qw(first_name last_name))
      {
          if(my $value = $c->req()->parameters()->{$field})
          {
              $c->log()->debug("updating $field with $value");
              $user->$field($value);
          }
      }
      $c->model('DB')->txn_do(sub {
         $user->update();
         $c->response()->body('');
         $c->response()->status(201);
      });
   }
   else
   {
       $c->response()->status('403');
       $c->response()->body('Access denied');
   }
}

=head1 AUTHOR

Jonathan Stowe

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta()->make_immutable();

1;
