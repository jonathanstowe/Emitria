use utf8;
package Emitria::Schema::Result::UserRole;


=head1 NAME

Emitria::Schema::Result::UserRole

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto PassphraseColumn));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes the relationship between a
user and a role.

=head2 TABLE: C<user_role>

=cut

__PACKAGE__->table("user_role");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item user_id

=item role_id

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
                   is_nullable    => 0,
   },
   user_id => {
                   data_type      => "integer",
                   is_foreign_key => 1,
                   is_nullable    => 0,
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


=item user

=cut

__PACKAGE__->belongs_to(user => 'Emitria::Schema::Result::User', 'user_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item role


=cut

__PACKAGE__->belongs_to(role => 'Emitria::Schema::Result::Role', 'role_id',{ is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=back

=cut

__PACKAGE__->meta()->make_immutable();
