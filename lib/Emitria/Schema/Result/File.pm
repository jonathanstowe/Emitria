use utf8;
package Emitria::Schema::Result::File;


=head1 NAME

Emitria::Schema::Result::File

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


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

=item track_title

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item artist_name

  data_type: 'varchar'
  is_nullable: 1
  size: 512

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

=item album_title

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item genre

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=item comments

  data_type: 'text'
  is_nullable: 1

=item year

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=item track_number

  data_type: 'integer'
  is_nullable: 1

=item channels

  data_type: 'integer'
  is_nullable: 1

=item url

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=item bpm

  data_type: 'integer'
  is_nullable: 1

=item rating

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=item encoded_by

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item disc_number

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=item mood

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=item label

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item composer

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item encoder

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=item checksum

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=item lyrics

  data_type: 'text'
  is_nullable: 1

=item orchestra

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item conductor

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item lyricist

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item original_lyricist

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item radio_station_name

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item info_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item artist_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item audio_source_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item radio_station_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item buy_this_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item isrc_number

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item catalog_number

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item original_artist

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item copyright

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item report_datetime

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=item report_location

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item report_organization

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item userect

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item contributor

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item language

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item file_exists

  data_type: 'boolean'
  default_value: true
  is_nullable: 1

=item soundcloud_id

  data_type: 'integer'
  is_nullable: 1

=item soundcloud_error_code

  data_type: 'integer'
  is_nullable: 1

=item soundcloud_error_msg

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item soundcloud_link_to_file

  data_type: 'varchar'
  is_nullable: 1
  size: 4096

=item soundcloud_upload_time

  data_type: 'timestamp'
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
   track_title => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   artist_name => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
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
   album_title => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   genre => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 64
   },
   comments => {
      data_type   => "text",
      is_nullable => 1
   },
   year => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 16
   },
   track_number => {
      data_type   => "integer",
      is_nullable => 1
   },
   channels => {
      data_type   => "integer",
      is_nullable => 1
   },
   url => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 1024
   },
   bpm => {
      data_type   => "integer",
      is_nullable => 1
   },
   rating => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 8
   },
   encoded_by => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   disc_number => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 8
   },
   mood => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 64
   },
   label => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   composer => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   encoder => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 64
   },
   checksum => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 256
   },
   lyrics => {
      data_type   => "text",
      is_nullable => 1
   },
   orchestra => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   conductor => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   lyricist => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   original_lyricist => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   radio_station_name => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   info_url => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   artist_url => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   audio_source_url => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   radio_station_url => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   buy_this_url => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   isrc_number => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   catalog_number => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   original_artist => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   copyright => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   report_datetime => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 32
   },
   report_location => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   report_organization => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   userect => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   contributor => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   language => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   file_exists => {
      data_type     => "boolean",
      default_value => \"true",
      is_nullable   => 1
   },
   soundcloud_id => {
      data_type   => "integer",
      is_nullable => 1
   },
   soundcloud_error_code => {
      data_type   => "integer",
      is_nullable => 1
   },
   soundcloud_error_msg => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   soundcloud_link_to_file => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 4096
   },
   soundcloud_upload_time => {
      data_type   => "timestamp",
      is_nullable => 1
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


=item blockcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Blockcontent>

=cut

__PACKAGE__->has_many(
  blockcontents =>
  "Emitria::Schema::Result::Blockcontent",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item playlistcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Playlistcontent>

=cut

__PACKAGE__->has_many(
  playlistcontents =>
  "Emitria::Schema::Result::Playlistcontent",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item playout_histories

Type: has_many

Related object: L<Emitria::Schema::Result::PlayoutHistory>

=cut

__PACKAGE__->has_many(
  playout_histories =>
  "Emitria::Schema::Result::PlayoutHistory",
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

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::ShowInstance",
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
