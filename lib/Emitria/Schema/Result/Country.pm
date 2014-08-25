use utf8;
package Emitria::Schema::Result::Country;


=head1 NAME

Emitria::Schema::Result::Country

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

L<DBIx::Class::ResultSource>

=head2 TABLE: C<country>

=cut

__PACKAGE__->table("country");

=head2 METHODS

=over 4

=item isocode

  data_type: 'char'
  is_nullable: 0
  size: 3

=item name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
   isocode => {
      data_type   => "char",
      is_nullable => 0,
      size        => 3
   },
   name => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</isocode>

=back

=cut

__PACKAGE__->set_primary_key("isocode");




__PACKAGE__->meta()->make_immutable();

1;
