use utf8;

package Emitria::Schema::Result::User;


=head1 NAME

Emitria::Schema::Result::User

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto PassphraseColumn));

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

=item username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item password

Crypted password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item locale_id

Foreign key to the L<Emitria::Schema::Result::Locale> for this user.

=cut

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
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0,
   },
   locale_id   => {
      data_type      => 'integer',
      is_foreign_key => 1,
      is_nullable    => 1,
   },
   username => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
   password => {
      data_type        => 'varchar',
      size             => 255,
      passphrase       => 'rfc2307',
      passphrase_class => 'SaltedDigest',
      passphrase_args  => {
         algorithm   => 'SHA-1',
         salt_random => 20.
      },
      passphrase_check_method => 'check_password',
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


=head2 UNIQUE CONSTRAINTS

=over 4


=item C<user_username_idx>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("user_username_idx", ["username"]);

=back

=head2 RELATIONS

=over 4

=item station

This is the radio station that the user belongs to.  Any objects created by the
user will be for this station.

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item locale

Relation to the L<Emitria::Schema::Result::Locale> for this user.

=cut

__PACKAGE__->belongs_to(locale  => 'Emitria::Schema::Result::Locale', 'locale_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });


=item user_contacts

This is a relation to the L<Emitria::Schema::Result::User::Contact> only used as an intermediary.

=cut

__PACKAGE__->has_many(user_contacts => 'Emitria::Schema::Result::User::Contact', 'user_id',{ cascade_copy => 0, cascade_delete => 1 });

=item contacts

This is the relation to the L<Emitria::Schema::Result::Contact> that belong to this user.

=cut

__PACKAGE__->many_to_many(contacts  => 'user_contacts', 'contact');

=item user_roles

This is a relation to the L<Emitria::Schema::Result::User::Role> only used as an intermediary.

=cut

__PACKAGE__->has_many(user_roles => 'Emitria::Schema::Result::User::Role', 'user_id',{ cascade_copy => 0, cascade_delete => 1 });

=item roles

This is a C<many_to_many> "relation" to L<Emitria::Schema::Result::User::Role> via C<user_roles>

=cut

__PACKAGE__->many_to_many(roles  => 'user_roles', 'role');


=item permissions

A resultset of L<Emitria::Schema::Result::Permission> associated with this user.

=cut

sub permissions
{
   my ($self) = @_;

   # there has to be a better way
   return $self->related_resultset('user_roles')->related_resultset('role')->related_resultset('role_permissions')->related_resultset('permission');
}


=item _permission_names

This is a cached hashref of the permiision names a user has. This is to support C<can> which is a delegate of C<exists>

=cut

has _permission_names => (
   is => 'ro',
   isa   => 'HashRef',
   lazy => 1,
   traits   => ['Hash'],
   handles  => { can_do => 'exists' },
   builder  => '_get_permission_names',
);

sub _get_permission_names
{
    my ( $self ) = @_;

    my $names = {};

    foreach my $name ($self->permissions()->get_column('name')->all() )
    {
        $names->{$name}++;
    }

    return $names;
}

=item display_name

Convience to returm first_name . last_name or username if that doesnt have a length.

=cut

sub display_name
{
    my ( $self ) = @_;

    my $dn = $self->first_name();

    if($self->last_name())
    {
        $dn .= ($dn ? ' ' : '') . $self->last_name();
    }

   return length $dn ? $dn : $self->username();
}

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

=item files_edited

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many( files_edited => "Emitria::Schema::Result::File",'editedby', { cascade_copy => 0, cascade_delete => 0 });

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

=item preferences

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

Related object: L<Emitria::Schema::Result::Show::Host>

=cut

__PACKAGE__->has_many(
  show_hosts =>
  "Emitria::Schema::Result::Show::Host",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item user_tokens

This is a relation to L<Emitria::Schema::Result::User::Token>.  There is one for each 
potential action.  They will be used to authenticate someusers.

Type: has_many

Related object: L<Emitria::Schema::Result::UsersToken>

=cut

__PACKAGE__->has_many( user_tokens => "Emitria::Schema::Result::User::Token", 'user_id',{cascade_copy => 0, cascade_delete => 0 });

=item new_token

This creates or changes the token for the given "action". returning the new token.

=cut

sub new_token
{
    my ( $self, $action ) = @_;

    my $token;

    if ( $action )
    {
      require Data::UUID;
      require Digest::SHA1;
      require DateTime;
      $token = Digest::SHA1::sha1_hex(Data::UUID->new()->create_hex() . DateTime->now() . $$);

      $self->update_or_create_related(user_tokens => { action => $action, token => $token }, { key => "unq_token_user_action"});
    }

    return $token;
}

=back


=cut

__PACKAGE__->meta()->make_immutable();

1;
