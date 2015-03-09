use utf8;
package Emitria::Schema::Result::Block;


=head1 NAME

Emitria::Schema::Result::Block

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

=head2 TABLE: C<block>

=cut

__PACKAGE__->table("block");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item mtime

  data_type: 'timestamp'
  is_nullable: 1

=item utime

  data_type: 'timestamp'
  is_nullable: 1

=item creator_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item description

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item block_type

  data_type: 'varchar'
  default_value: 'static'
  is_nullable: 1
  size: 7

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   name => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   mtime => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   utime => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   creator_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   description => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   length => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   block_type => {
      data_type     => "varchar",
      default_value => "static",
      is_nullable   => 1,
      size          => 7,
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


=item blockcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Block::Content>

=cut

__PACKAGE__->has_many(
  blockcontents =>
  "Emitria::Schema::Result::Block::Content",
  { "foreign.block_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item blockcriterias

Type: has_many

Related object: L<Emitria::Schema::Result::Block::Criteria>

=cut

__PACKAGE__->has_many(
  blockcriterias =>
  "Emitria::Schema::Result::Block::Criteria",
  { "foreign.block_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item playlistcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Playlist::Content>

=cut

__PACKAGE__->has_many(
  playlistcontents =>
  "Emitria::Schema::Result::Playlist::Content",
  { "foreign.block_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item creator

Type: belongs_to

Related object: L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  creator =>
  "Emitria::Schema::Result::User",
  { id => "creator_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


=back

=cut


__PACKAGE__->meta()->make_immutable();
1;
