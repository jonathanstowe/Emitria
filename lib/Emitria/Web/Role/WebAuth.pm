package Emitria::Web::Role::WebAuth;

use strict;
use warnings;
 
use Moose::Role;
use MooseX::MethodAttributes::Role;

=head1 NAME

Emitria::Web::Role::WebAuth

=head1 DESCRIPTION

This provides a C<begin> sub that causes the default web authentication
for the browser parts of the application

=head2 METHODS

=over 4

=item begin
 
Check if there is a user and, if not, forward to login page
 
=cut

sub begin : Private
{
   my ( $self, $c ) = @_;

   my $rc = 1;

   if ( $c->controller() ne $c->controller('Login') )
   {

      if ( !$c->user_exists )
      {
         $c->log->debug('User not found, forwarding to /login');
         $c->response()->redirect( $c->uri_for('/login') );
	 $c->detach();
         $rc = 0;
      }
   }

   return $rc;
}

=back

=cut

1;
