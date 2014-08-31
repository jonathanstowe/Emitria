use utf8;

package Emitria::Schema::Result::User::Contact;


=head1 NAME

Emitria::Schema::Result::User::Contact

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes the relationship between a user and a contact

=head2 TABLE: C<user_contact>

=cut

__PACKAGE__->table("user_contact");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item user_id

The foreign key to the L<Emitria::Schema::Result::User>

  data_type: 'integer'
  is_nullable: 0
  is_foreign_key: 1

=item contact_id

The foreign key to the L<Emitria::Schema::Result::Contact>

  data_type: 'integer'
  is_nullable: 0
  is_foreign_key: 1

=item date_created

Auto populated when the row is created.

  data_type: 'datetime'
  is_auto_increment: 1
  is_nullable: 0

=item last_modified

Auto populated when the row is updated.

  data_type: 'datetime'
  is_auto_increment: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   user_id => {
      data_type         => "integer",
      is_nullable       => 0,
      is_foreign_key    => 1,
   },
   contact_id => {
      data_type         => "integer",
      is_foreign_key    => 1,
      is_nullable       => 0,
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

__PACKAGE__->add_unique_constraint(unq_user_contact   => [qw(user_id contact_id)]);

=head2 RELATIONS

=over 4

=item user

This is the relation L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(user   => 'Emitria::Schema::Result::User', 'user_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item contact

This is the relation L<Emitria::Schema::Result::Contact>

=cut

__PACKAGE__->belongs_to(contact   => 'Emitria::Schema::Result::Contact', 'contact_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
