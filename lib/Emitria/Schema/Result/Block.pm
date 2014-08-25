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

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<block>

=cut

__PACKAGE__->table("block");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'block_id_seq'

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 mtime

  data_type: 'timestamp'
  is_nullable: 1

=head2 utime

  data_type: 'timestamp'
  is_nullable: 1

=head2 creator_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 type

  data_type: 'varchar'
  default_value: 'static'
  is_nullable: 1
  size: 7

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "block_id_seq",
  },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "mtime",
  { data_type => "timestamp", is_nullable => 1 },
  "utime",
  { data_type => "timestamp", is_nullable => 1 },
  "creator_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "length",
  { data_type => "interval", default_value => "00:00:00", is_nullable => 1 },
  "type",
  {
    data_type => "varchar",
    default_value => "static",
    is_nullable => 1,
    size => 7,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 blockcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Blockcontent>

=cut

__PACKAGE__->has_many(
  "blockcontents",
  "Emitria::Schema::Result::Blockcontent",
  { "foreign.block_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 blockcriterias

Type: has_many

Related object: L<Emitria::Schema::Result::Blockcriteria>

=cut

__PACKAGE__->has_many(
  "blockcriterias",
  "Emitria::Schema::Result::Blockcriteria",
  { "foreign.block_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 playlistcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Playlistcontent>

=cut

__PACKAGE__->has_many(
  "playlistcontents",
  "Emitria::Schema::Result::Playlistcontent",
  { "foreign.block_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 creator

Type: belongs_to

Related object: L<Emitria::Schema::Result::Subj>

=cut

__PACKAGE__->belongs_to(
  "creator",
  "Emitria::Schema::Result::Subj",
  { id => "creator_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta->make_immutable;
1;
