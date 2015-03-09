use utf8;

package Emitria::Schema::Result::User::Token;


=head1 NAME

Emitria::Schema::Result::User::Token

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that stores an authentication token that may be used for authentication. The token is available
for a specific "action" such as "api".

=head2 TABLE: C<user_token>

=cut

__PACKAGE__->table("user_token");

=head2 METHODS

=over 4

=item id

Primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item user_id

A foreign key to the L<Emitria::Schema::Result::User> this is for.

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item action

The action.

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=item token

The actual token,  this should be generated in some relatively cryptographic manner.

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=item created

  data_type: 'timestamp'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   user_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0
   },
   action => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
   token => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 40
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


=item C<user_token_idx>

=over 4

=item * L</token>

=back

=cut

__PACKAGE__->add_unique_constraint("user_token_token_idx", ["token"]);

=item C<unq_token_user_action>

=over 4

=item * L</user_id>

=item * L</action>

=back

=cut

__PACKAGE__->add_unique_constraint("unq_token_user_action", [qw(user_id action)]);


=back

=head2 RELATIONS

=over 4


=item user

Type: belongs_to

Related object: L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to( user => "Emitria::Schema::Result::User", "user_id" , { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=back

=cut


__PACKAGE__->meta()->make_immutable();

1;
