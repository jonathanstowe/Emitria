use utf8;
package Emitria::Schema::Result::User;


=head1 NAME

Emitria::Schema::Result::User

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "user".

=head2 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item station_id

This is the foreign key to the station this user belongs to. A user will
always be created in the context of the station.  The user will only have
access to the artifacts of that station.

  data_type: "integer"
  is_nullable: 0

=item login

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item pass

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item type

  data_type: 'char'
  default_value: 'U'
  is_nullable: 0
  size: 1

=item first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item lastlogin

  data_type: 'timestamp'
  is_nullable: 1

=item lastfail

  data_type: 'timestamp'
  is_nullable: 1

=item skype_contact

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item jabber_contact

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item cell_phone

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item login_attempts

  data_type: 'integer'
  default_value: 0
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
   login => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   pass => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   type => {
      data_type     => "char",
      default_value => "U",
      is_nullable   => 0,
      size          => 1
   },
   first_name => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   last_name => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   lastlogin => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   lastfail => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   skype_contact => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   jabber_contact => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   email => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   cell_phone => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   login_attempts => {
      data_type     => "integer",
      default_value => 0,
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

=head1 UNIQUE CONSTRAINTS

=item C<user_login_idx>

=over 4

=item * L</login>

=back

=cut

__PACKAGE__->add_unique_constraint("user_login_idx", ["login"]);

=head2 RELATIONS

=over 4

=item station

This is the radio station that the user belongs to.  Any objects created by the
user will be for this station.

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });


=item blocks

Type: has_many

Related object: L<Emitria::Schema::Result::Block>

=cut

__PACKAGE__->has_many(
  blocks =>
  "Emitria::Schema::Result::Block",
  { "foreign.creator_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item files_editedbies

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  files_editedbies =>
  "Emitria::Schema::Result::File",
  { "foreign.editedby" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item files_owners

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  files_owners =>
  "Emitria::Schema::Result::File",
  { "foreign.owner_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item permissions

Type: has_many

Related object: L<Emitria::Schema::Result::Permission>

=cut

__PACKAGE__->has_many(
  permissons =>
  "Emitria::Schema::Result::Permission",
  { "foreign.user" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item playlists

Type: has_many

Related object: L<Emitria::Schema::Result::Playlist>

=cut

__PACKAGE__->has_many(
  playlists =>
  "Emitria::Schema::Result::Playlist",
  { "foreign.creator_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item prefs

Type: has_many

Related object: L<Emitria::Schema::Result::Preference>

=cut

__PACKAGE__->has_many(
  preferences =>
  "Emitria::Schema::Result::Preference",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item sessions

Type: has_many

Related object: L<Emitria::Schema::Result::Session>

=cut

__PACKAGE__->has_many(
  sessions =>
  "Emitria::Schema::Result::Session",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item show_hosts

Type: has_many

Related object: L<Emitria::Schema::Result::ShowHost>

=cut

__PACKAGE__->has_many(
  show_hosts =>
  "Emitria::Schema::Result::ShowHost",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item user_tokens

Type: has_many

Related object: L<Emitria::Schema::Result::UsersToken>

=cut

__PACKAGE__->has_many(
  user_tokens =>
  "Emitria::Schema::Result::UserToken",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=back

=cut



__PACKAGE__->meta()->make_immutable();

1;
