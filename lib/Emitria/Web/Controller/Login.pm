package Emitria::Web::Controller::Login;

use Moose;
extends 'Catalyst::Controller';

use MooseX::MethodAttributes;

use namespace::autoclean;

=head1 NAME

Emitria::Web::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index : Path : Args(0)
{
   my ( $self, $c ) = @_;

   $c->stash->{current_view} = 'HTML';
   my $username = $c->request->params->{username};
   my $password = $c->request->params->{password};

   my $auth = 0;
   if ( $username && $password )
   {
      if ( $c->authenticate( { username => $username, password => $password }))
      {
         $c->response->redirect('/');
         $auth = 1;
      }
      else
      {
         $c->stash( error_msg => "Bad username or password." );
      }
   }
   else
   {
       if (!$c->user_exists())
       {
         $c->stash( error_msg => "Empty username or password." )
       }
   }

   if (!$auth)
   {
      $c->stash( template => 'login.tt' );
   }
}


=head1 AUTHOR

Jonathan Stowe

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
