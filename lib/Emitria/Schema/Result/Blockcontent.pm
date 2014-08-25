use utf8;
package Emitria::Schema::Result::Blockcontent;


=head1 NAME

Emitria::Schema::Result::Blockcontent

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

=head1 TABLE: C<blockcontents>

=cut

__PACKAGE__->table("blockcontents");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'blockcontents_id_seq'

=head2 block_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 position

  data_type: 'integer'
  is_nullable: 1

=head2 trackoffset

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 cliplength

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 cuein

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 cueout

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 fadein

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=head2 fadeout

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "blockcontents_id_seq",
  },
  "block_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "file_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "position",
  { data_type => "integer", is_nullable => 1 },
  "trackoffset",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "cliplength",
  { data_type => "interval", default_value => "00:00:00", is_nullable => 1 },
  "cuein",
  { data_type => "interval", default_value => "00:00:00", is_nullable => 1 },
  "cueout",
  { data_type => "interval", default_value => "00:00:00", is_nullable => 1 },
  "fadein",
  { data_type => "time", default_value => "00:00:00", is_nullable => 1 },
  "fadeout",
  { data_type => "time", default_value => "00:00:00", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 block

Type: belongs_to

Related object: L<Emitria::Schema::Result::Block>

=cut

__PACKAGE__->belongs_to(
  "block",
  "Emitria::Schema::Result::Block",
  { id => "block_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 file

Type: belongs_to

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->belongs_to(
  "file",
  "Emitria::Schema::Result::File",
  { id => "file_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta->make_immutable;
1;
