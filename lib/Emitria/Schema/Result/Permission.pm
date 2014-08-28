use utf8;
package Emitria::Schema::Result::Permission;


=head1 NAME

Emitria::Schema::Result::Permission

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto PassphraseColumn));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "user".

=head2 TABLE: C<permission>

=cut

__PACKAGE__->table("permission");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
   id => {
           data_type         => "integer",
           is_auto_increment => 1,
           is_nullable       => 0,
   },
   name => {
             data_type   => "varchar",
             is_nullable => 0,
             size        => 255
   },
   description => {
             data_type   => "varchar",
             is_nullable => 1,
             size        => 255
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

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint(unq_permission => [qw(name)]);


=back

=cut

__PACKAGE__->meta()->make_immutable();
