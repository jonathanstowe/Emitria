use utf8;
package Emitria::Schema::Result::Block::Content;


=head1 NAME

Emitria::Schema::Result::Block::Content

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

=head2 TABLE: C<blockcontents>

=cut

__PACKAGE__->table("block_content");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item block_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item position

  data_type: 'integer'
  is_nullable: 1

=item trackoffset

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=item cliplength

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item cuein

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item cueout

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item fadein

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=item fadeout

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   block_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   file_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   position => {
      data_type   => "integer",
      is_nullable => 1
   },
   trackoffset => {
      data_type     => "double precision",
      default_value => 0,
      is_nullable   => 0
   },
   cliplength => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   cuein => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   cueout => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   fadein => {
      data_type     => "time",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   fadeout => {
      data_type     => "time",
      default_value => "00:00:00",
      is_nullable   => 1
   },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head2 RELATIONS

=over 4


=item block

Type: belongs_to

Related object: L<Emitria::Schema::Result::Block>

=cut

__PACKAGE__->belongs_to(
  block =>
  "Emitria::Schema::Result::Block",
  { id => "block_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=item file

Type: belongs_to

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->belongs_to(
  file =>
  "Emitria::Schema::Result::File",
  { id => "file_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta()->make_immutable();

1;
