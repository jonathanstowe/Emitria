use utf8;
package Emitria::Schema::Result::Subj;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Emitria::Schema::Result::Subj

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

=head1 TABLE: C<subjs>

=cut

__PACKAGE__->table("subjs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'subjs_id_seq'

=head2 login

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 pass

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 type

  data_type: 'char'
  default_value: 'U'
  is_nullable: 0
  size: 1

=head2 first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 lastlogin

  data_type: 'timestamp'
  is_nullable: 1

=head2 lastfail

  data_type: 'timestamp'
  is_nullable: 1

=head2 skype_contact

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 jabber_contact

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 cell_phone

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 login_attempts

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "subjs_id_seq",
  },
  "login",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "pass",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "type",
  { data_type => "char", default_value => "U", is_nullable => 0, size => 1 },
  "first_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "last_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "lastlogin",
  { data_type => "timestamp", is_nullable => 1 },
  "lastfail",
  { data_type => "timestamp", is_nullable => 1 },
  "skype_contact",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "jabber_contact",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "cell_phone",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "login_attempts",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<subjs_login_idx>

=over 4

=item * L</login>

=back

=cut

__PACKAGE__->add_unique_constraint("subjs_login_idx", ["login"]);

=head1 RELATIONS

=head2 blocks

Type: has_many

Related object: L<Emitria::Schema::Result::Block>

=cut

__PACKAGE__->has_many(
  "blocks",
  "Emitria::Schema::Result::Block",
  { "foreign.creator_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 files_editedbies

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  "files_editedbies",
  "Emitria::Schema::Result::File",
  { "foreign.editedby" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 files_owners

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  "files_owners",
  "Emitria::Schema::Result::File",
  { "foreign.owner_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 perms

Type: has_many

Related object: L<Emitria::Schema::Result::Perm>

=cut

__PACKAGE__->has_many(
  "perms",
  "Emitria::Schema::Result::Perm",
  { "foreign.subj" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 playlists

Type: has_many

Related object: L<Emitria::Schema::Result::Playlist>

=cut

__PACKAGE__->has_many(
  "playlists",
  "Emitria::Schema::Result::Playlist",
  { "foreign.creator_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 prefs

Type: has_many

Related object: L<Emitria::Schema::Result::Pref>

=cut

__PACKAGE__->has_many(
  "prefs",
  "Emitria::Schema::Result::Pref",
  { "foreign.subjid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sesses

Type: has_many

Related object: L<Emitria::Schema::Result::Sess>

=cut

__PACKAGE__->has_many(
  "sesses",
  "Emitria::Schema::Result::Sess",
  { "foreign.userid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 show_hosts

Type: has_many

Related object: L<Emitria::Schema::Result::ShowHost>

=cut

__PACKAGE__->has_many(
  "show_hosts",
  "Emitria::Schema::Result::ShowHost",
  { "foreign.subjs_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 subjs_tokens

Type: has_many

Related object: L<Emitria::Schema::Result::SubjsToken>

=cut

__PACKAGE__->has_many(
  "subjs_tokens",
  "Emitria::Schema::Result::SubjsToken",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-30 17:33:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DOkh4Cr6tUZZvNGpCV+JVw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;