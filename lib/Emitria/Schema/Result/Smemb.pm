use utf8;
package Emitria::Schema::Result::Smemb;


=head1 NAME

Emitria::Schema::Result::Smemb

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<smemb>

=cut

__PACKAGE__->table("smemb");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 uid

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 gid

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 level

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 mid

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type   => "integer",
      is_nullable => 0
   },
   uid => {
      data_type     => "integer",
      default_value => 0,
      is_nullable   => 0
   },
   gid => {
      data_type     => "integer",
      default_value => 0,
      is_nullable   => 0
   },
   level => {
      data_type     => "integer",
      default_value => 0,
      is_nullable   => 0
   },
   mid => {
      data_type   => "integer",
      is_nullable => 1
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");




__PACKAGE__->meta->make_immutable;

1;
