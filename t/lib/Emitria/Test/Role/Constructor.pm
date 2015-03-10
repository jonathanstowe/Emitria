package Emitria::Test::Role::Constructor;

use strict;
use warnings;

use Moose::Role;
with qw(
         Emitria::Test::Role::Package
       );

use Test::Most;

=head1 NAME

Emitria::Test::Role::Constructor

=head1 DESCRIPTION

=cut

has constructor_args => (
   is          => 'rw',
   isa         => 'ArrayRef',
   auto_deref  => 1,
   default     => sub { [] },
);

sub test_constructor
{
   my ( $test ) = @_;

   my $package = $test->package_name();

   my @args;


   if($package->can('new') )
   {
      my $obj;

      my @args = $test->constructor_args();
      lives_ok { $obj =  $package->new(@args) } "Create $package";
      isa_ok($obj, $package);
   }
   else
   {
      $test->test_skip();
   }
}

1;
