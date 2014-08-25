use utf8;
package Emitria::Schema::Result::Schedule;


=head1 NAME

Emitria::Schema::Result::Schedule

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

=head2 TABLE: C<schedule>

=cut

__PACKAGE__->table("schedule");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item starts

  data_type: 'timestamp'
  is_nullable: 0

=item ends

  data_type: 'timestamp'
  is_nullable: 0

=item file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item stream_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item clip_length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item fade_in

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=item fade_out

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=item cue_in

  data_type: 'interval'
  is_nullable: 0

=item cue_out

  data_type: 'interval'
  is_nullable: 0

=item media_item_played

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=item instance_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item playout_status

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=item broadcasted

  data_type: 'smallint'
  default_value: 0
  is_nullable: 0

=item position

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   starts => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   ends => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   file_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   stream_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   clip_length => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   fade_in => {
      data_type     => "time",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   fade_out => {
      data_type     => "time",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   cue_in => {
      data_type   => "interval",
      is_nullable => 0
   },
   cue_out => {
      data_type   => "interval",
      is_nullable => 0
   },
   media_item_played => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   instance_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0
   },
   playout_status => {
      data_type     => "smallint",
      default_value => 1,
      is_nullable   => 0
   },
   broadcasted => {
      data_type     => "smallint",
      default_value => 0,
      is_nullable   => 0
   },
   position => {
      data_type     => "integer",
      default_value => 0,
      is_nullable   => 0
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


=item webstream_metadatas

Type: has_many

Related object: L<Emitria::Schema::Result::WebstreamMetadata>

=cut

__PACKAGE__->has_many(
  webstream_metadatas =>
  "Emitria::Schema::Result::WebstreamMetadata",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=item instance

Type: belongs_to

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->belongs_to(
  instance =>
  "Emitria::Schema::Result::ShowInstance",
  { id => "instance_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=item stream

Type: belongs_to

Related object: L<Emitria::Schema::Result::Webstream>

=cut

__PACKAGE__->belongs_to(
  stream =>
  "Emitria::Schema::Result::Webstream",
  { id => "stream_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta()->make_immutable();

1;
