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

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<schedule>

=cut

__PACKAGE__->table("schedule");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'schedule_id_seq'

=head2 starts

  data_type: 'timestamp'
  is_nullable: 0

=head2 ends

  data_type: 'timestamp'
  is_nullable: 0

=head2 file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 stream_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 clip_length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 fade_in

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=head2 fade_out

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=head2 cue_in

  data_type: 'interval'
  is_nullable: 0

=head2 cue_out

  data_type: 'interval'
  is_nullable: 0

=head2 media_item_played

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=head2 instance_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 playout_status

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=head2 broadcasted

  data_type: 'smallint'
  default_value: 0
  is_nullable: 0

=head2 position

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "schedule_id_seq",
  },
  "starts",
  { data_type => "timestamp", is_nullable => 0 },
  "ends",
  { data_type => "timestamp", is_nullable => 0 },
  "file_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "stream_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "clip_length",
  { data_type => "interval", default_value => "00:00:00", is_nullable => 1 },
  "fade_in",
  { data_type => "time", default_value => "00:00:00", is_nullable => 1 },
  "fade_out",
  { data_type => "time", default_value => "00:00:00", is_nullable => 1 },
  "cue_in",
  { data_type => "interval", is_nullable => 0 },
  "cue_out",
  { data_type => "interval", is_nullable => 0 },
  "media_item_played",
  { data_type => "boolean", default_value => \"false", is_nullable => 1 },
  "instance_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "playout_status",
  { data_type => "smallint", default_value => 1, is_nullable => 0 },
  "broadcasted",
  { data_type => "smallint", default_value => 0, is_nullable => 0 },
  "position",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 webstream_metadatas

Type: has_many

Related object: L<Emitria::Schema::Result::WebstreamMetadata>

=cut

__PACKAGE__->has_many(
  "webstream_metadatas",
  "Emitria::Schema::Result::WebstreamMetadata",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 instance

Type: belongs_to

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->belongs_to(
  "instance",
  "Emitria::Schema::Result::ShowInstance",
  { id => "instance_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 stream

Type: belongs_to

Related object: L<Emitria::Schema::Result::Webstream>

=cut

__PACKAGE__->belongs_to(
  "stream",
  "Emitria::Schema::Result::Webstream",
  { id => "stream_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta->make_immutable;
1;
