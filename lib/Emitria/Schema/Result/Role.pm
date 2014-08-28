use utf8;
package Emitria::Schema::Result::Role;


=head1 NAME

Emitria::Schema::Result::Role

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

=head2 TABLE: C<user>

=cut

__PACKAGE__->table("role");

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
   station_id => {
                   data_type      => "integer",
                   is_foreign_key => 1,
                   is_nullable    => 0,
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


=item station

This is the radio station that the user belongs to.  Any objects created by the
user will be for this station.

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });


=back

=cut

__PACKAGE__->meta()->make_immutable();
