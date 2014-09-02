package Emitria::Schema::ResultSet;

use strict;
use warnings;
 
use Moose;
extends 'DBIx::Class::ResultSet';

use MooseX::NonMoose;

use namespace::autoclean;



__PACKAGE__->load_components(qw(Helper::ResultSet::SetOperations Helper::ResultSet::RemoveColumns));

=head1 NAME

Emitria::Schema::ResultSet

=head1 DESCRIPTION

This is a convenient default result set class and base class for resultsets
it brings in some handy and convenient stuff.

=head2 METHODS

=over 4

=item BUILDARGS

Needs to be overridden to match its signature.

=cut

sub BUILDARGS { $_[2] }

=back

=cut


__PACKAGE__->meta()->make_immutable();

1;
