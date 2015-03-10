package Emitria::Test::Role::RoleHelper;

use strict;
use warnings;

use Moose::Role;
with qw(
         Emitria::Test::Role::Package
      );

has role_test_class  => (
      is    => 'rw',
      isa   => 'Str',
      lazy  => 1,
      builder  => '_get_role_test_class',
);

sub _get_role_test_class
{
   my ( $self ) = @_;

   my $name = join '::', 'Test', $$, $self->package_name();

   return $name;
}

has test_meta_class  => (
   is    => 'rw',
   isa   => 'Moose::Meta::Class',
   lazy  => 1,
   builder  => '_get_test_meta_class',
);

sub _get_test_meta_class
{
   my ( $self ) = @_;

   require Moose::Meta::Class;

   my $meta;

   my @opts = ( roles => [ $self->package_name() ] );

   if ( $self->has_superclasses() )
   {
      push @opts, (superclasses => $self->test_class_superclasses());
   }

   $meta = Moose::Meta::Class->create($self->role_test_class() => @opts);

   return $meta;
}

has test_class_superclasses   => (
   is    => 'rw',
   isa   => 'Maybe[ArrayRef]',
   predicate   => 'has_superclasses',
);


sub role_test_object
{
   my ( $self, @args ) = @_;

   return $self->test_meta_class()->new_object(@args);
}

1;
