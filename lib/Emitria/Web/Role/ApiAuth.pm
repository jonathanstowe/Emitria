package Emitria::Web::Role::ApiAuth;

use strict;
use warnings;
 
use Moose::Role;
use MooseX::MethodAttributes::Role;

=head1 NAME

Emitria::Web::Role::ApiAuth

=head1 DESCRIPTION

This provides a C<begin> sub that causes the api authentication

=head2 METHODS

=over 4

=item begin
 
Check if there is a user with the supplied aoi token an if not 403
 
=cut

sub begin : Private
{
   my ( $self, $c ) = @_;

   my $rc = 1;

   if ( !$c->user_exists )
   {
       if ( my $token = $c->req->params->{api_token} )
       {
           my $tokens = $c->model('DB::User::Token');

           if (defined(my $t = $tokens->find({token => $token }) ))
           {
               if(!$c->authenticate({ id   => $t->user()->id() }, 'api'))
               {
                  $self->status_forbidden($c, { message => "bad credentials" });
                  $c->detach();
               }
           }
           else
           {
               $self->status_forbidden($c, { message => "no credentials" });
               $c->detach();
           }
       }
       else
       {
           $self->status_forbidden($c, { message => "no credentials" });
           $c->detach();
       }
       $rc = 0;
   }

   return $rc;
}

=back

=cut

1;
