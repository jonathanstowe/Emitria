use utf8;

package Emitria::Schema::Result::File;


=head1 NAME

Emitria::Schema::Result::File

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

This L<DBIx::Class::ResultSource> describes a "file" that may either be uploaded to form
part of a show or be a recording of a live show.

=head2 TABLE: C<file>

=cut

__PACKAGE__->table("file");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item station_id

A foreign key to the L<Emitria::Schema::Result::Station> that this file is for.

  data_type: 'integer'
  is_nullable: 0

=item name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item mime

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item ftype

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=item directory

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item filepath

  data_type: 'text'
  default_value: (empty string)
  is_nullable: 1

=item state

  data_type: 'varchar'
  default_value: 'empty'
  is_nullable: 0
  size: 128

=item currentlyaccessing

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=item editedby

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item mtime

  data_type: 'timestamp'
  is_nullable: 1

=item utime

  data_type: 'timestamp'
  is_nullable: 1

=item lptime

  data_type: 'timestamp'
  is_nullable: 1

=item md5

  data_type: 'char'
  is_nullable: 1
  size: 32

=item bit_rate

  data_type: 'integer'
  is_nullable: 1

=item sample_rate

  data_type: 'integer'
  is_nullable: 1

=item format

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=item length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item channels

  data_type: 'integer'
  is_nullable: 1

=item checksum

  data_type: 'varchar'
  is_nullable: 1
  size: 256


=item file_exists

  data_type: 'boolean'
  default_value: true
  is_nullable: 1


=item replay_gain

  data_type: 'numeric'
  is_nullable: 1

=item owner_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item cuein

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item cueout

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item silan_check

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=item hidden

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=item is_scheduled

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=item is_playlist

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   station_id => {
      data_type   => "integer",
      is_foreign_key => 1,
      is_nullable => 0,
   },
   name => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   mime => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   ftype => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 128
   },
   directory => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   filepath => {
      data_type     => "text",
      default_value => "",
      is_nullable   => 1
   },
   state => {
      data_type     => "varchar",
      default_value => "empty",
      is_nullable   => 0,
      size          => 128,
   },
   currentlyaccessing => {
      data_type     => "integer",
      default_value => 0,
      is_nullable   => 0
   },
   editedby => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   mtime => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   utime => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   lptime => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   "md5" => {
      data_type   => "char",
      is_nullable => 1,
      size        => 32
   },
   bit_rate => {
      data_type   => "integer",
      is_nullable => 1
   },
   sample_rate => {
      data_type   => "integer",
      is_nullable => 1
   },
   format => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 128
   },
   length => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   channels => {
      data_type   => "integer",
      is_nullable => 1
   },
   checksum => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 256
   },
   file_exists => {
      data_type     => "boolean",
      default_value => \"true",
      is_nullable   => 1
   },
   replay_gain => {
      data_type   => "numeric",
      is_nullable => 1
   },
   owner_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
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
   silan_check => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   hidden => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   is_scheduled => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   is_playlist => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   date_created => {
      data_type     => 'datetime',
      set_on_create => 1,
      is_nullable   => 0,
   },
   last_modified => {
      data_type     => 'datetime',
      set_on_update => 1,
      set_on_create => 0,
      is_nullable   => 1,
   }
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


=item station

This is the radio station that the file belongs to.  

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });


=item metadata

This is a relation to the L<Emitra::Schema::Result::File::Metadata>s for this file.

=cut

__PACKAGE__->has_many(metadata   => 'Emitria::Schema::Result::File::Metadata', 'file_id');

=item blockcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Block::Content>

=cut

__PACKAGE__->has_many(
  blockcontents =>
  "Emitria::Schema::Result::Block::Content",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item playlistcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Playlist::Content>

=cut

__PACKAGE__->has_many(
  playlistcontents =>
  "Emitria::Schema::Result::Playlist::Content",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item playout_histories

Type: has_many

Related object: L<Emitria::Schema::Result::Playout::History>

=cut

__PACKAGE__->has_many(
  playout_histories =>
  "Emitria::Schema::Result::Playout::History",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item schedules

Type: has_many

Related object: L<Emitria::Schema::Result::Schedule>

=cut

__PACKAGE__->has_many(
  schedules =>
  "Emitria::Schema::Result::Schedule",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item show_instances

Type: has_many

Related object: L<Emitria::Schema::Result::Show::Instance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::Show::Instance",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item directory

Type: belongs_to

Related object: L<Emitria::Schema::Result::MusicDir>

=cut

__PACKAGE__->belongs_to(
  directory =>
  "Emitria::Schema::Result::MusicDir",
  { id => "directory" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=item editedby

Type: belongs_to

Related object: L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  editedby =>
  "Emitria::Schema::Result::User",
  { id => "editedby" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=item owner

Type: belongs_to

Related object: L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  owner =>
  "Emitria::Schema::Result::User",
  { id => "owner_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta()->make_immutable();

1;
