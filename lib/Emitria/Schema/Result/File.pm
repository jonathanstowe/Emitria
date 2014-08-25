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

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<files>

=cut

__PACKAGE__->table("files");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 mime

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 ftype

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 directory

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 filepath

  data_type: 'text'
  default_value: (empty string)
  is_nullable: 1

=head2 state

  data_type: 'varchar'
  default_value: 'empty'
  is_nullable: 0
  size: 128

=head2 currentlyaccessing

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 editedby

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 mtime

  data_type: 'timestamp'
  is_nullable: 1

=head2 utime

  data_type: 'timestamp'
  is_nullable: 1

=head2 lptime

  data_type: 'timestamp'
  is_nullable: 1

=head2 md5

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 track_title

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 artist_name

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 bit_rate

  data_type: 'integer'
  is_nullable: 1

=head2 sample_rate

  data_type: 'integer'
  is_nullable: 1

=head2 format

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 album_title

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 genre

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 comments

  data_type: 'text'
  is_nullable: 1

=head2 year

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 track_number

  data_type: 'integer'
  is_nullable: 1

=head2 channels

  data_type: 'integer'
  is_nullable: 1

=head2 url

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 bpm

  data_type: 'integer'
  is_nullable: 1

=head2 rating

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 encoded_by

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 disc_number

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 mood

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 label

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 composer

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 encoder

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 checksum

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 lyrics

  data_type: 'text'
  is_nullable: 1

=head2 orchestra

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 conductor

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 lyricist

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 original_lyricist

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 radio_station_name

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 info_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 artist_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 audio_source_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 radio_station_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 buy_this_url

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 isrc_number

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 catalog_number

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 original_artist

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 copyright

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 report_datetime

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 report_location

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 report_organization

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 userect

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 contributor

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 language

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 file_exists

  data_type: 'boolean'
  default_value: true
  is_nullable: 1

=head2 soundcloud_id

  data_type: 'integer'
  is_nullable: 1

=head2 soundcloud_error_code

  data_type: 'integer'
  is_nullable: 1

=head2 soundcloud_error_msg

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 soundcloud_link_to_file

  data_type: 'varchar'
  is_nullable: 1
  size: 4096

=head2 soundcloud_upload_time

  data_type: 'timestamp'
  is_nullable: 1

=head2 replay_gain

  data_type: 'numeric'
  is_nullable: 1

=head2 owner_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 cuein

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 cueout

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 silan_check

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=head2 hidden

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=head2 is_scheduled

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=head2 is_playlist

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
  blockcontents =>
  "Emitria::Schema::Result::Blockcontent",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 playlistcontents

Type: has_many

Related object: L<Emitria::Schema::Result::Playlistcontent>

=cut

__PACKAGE__->has_many(
  playlistcontents =>
  "Emitria::Schema::Result::Playlistcontent",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 playout_histories

Type: has_many

Related object: L<Emitria::Schema::Result::PlayoutHistory>

=cut

__PACKAGE__->has_many(
  playout_histories =>
  "Emitria::Schema::Result::PlayoutHistory",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 schedules

Type: has_many

Related object: L<Emitria::Schema::Result::Schedule>

=cut

__PACKAGE__->has_many(
  schedules =>
  "Emitria::Schema::Result::Schedule",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 show_instances

Type: has_many

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::ShowInstance",
  { "foreign.file_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 directory

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

=head2 editedby

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

=head2 owner

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
