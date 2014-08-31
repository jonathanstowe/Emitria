use utf8;

package Emitria::Schema::Result::Contact;


=head1 NAME

Emitria::Schema::Result::Contact

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "contact".

=head2 TABLE: C<contact>

=cut

__PACKAGE__->table("contact");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item contact_type_id

The foreign key L<Emitria::Schema::Result::Contact::Type>

  data_type:   'integer'
  is_nullable: 0
  is_foreign_key: 1

=item contact_value

The actual contact, the structure is dependent on the type.

   data_type: "varchar"
   is_nullable:   0
   length:     255

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
   contact_type_id => {
      data_type         => "integer",
      is_nullable       => 0,
      is_foreign_key    => 1,
   },
   contact_value  => {
       data_type  => 'varchar',
       size       => 255,
       is_nullable   => 0,

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

=item contact_type

This is a relation to L<Emitria::Schema::Result::Contact::Type> 

=cut

__PACKAGE__->belongs_to(contact_type   => 'Emitria::Schema::Result::Contact::Type', 'contact_type_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
