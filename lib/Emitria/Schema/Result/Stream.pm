use utf8;
package Emitria::Schema::Result::Stream;


=head1 NAME

Emitria::Schema::Result::Stream

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "Stream". That is to say an output for the system.

=head2 TABLE: C<stream>

=cut

__PACKAGE__->table("stream");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item station_id

Foreign key to L<Emitria::Schema::Result::Station>

=item enabled

Boolean indicating whether this stream is enabled.  Default is true.

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
   station_id  => {
      data_type         => 'integer',
      is_nullable       => 0,
      is_foreign_key    => 1,
   },
   enabled  => {
      data_type         => 'boolean',
      default_value     => 1,
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

=head2 RELATIONS

=over 4

=item station

Relation to the L<Emitria::Schema::Result::Station> this is for.

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station','station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item mount_names

A relation to all the L<Emitria::Schema::Result::Stream::MountName>s for this stream.

=cut

__PACKAGE__->has_many( mount_names => "Emitria::Schema::Result::Stream::MountName", 'stream_id', { cascade_copy => 0, cascade_delete => 1 });

=item configuration

This is the relation to the configuration items L<Emitria::Schema::Result::Stream::Setting> for this stream

=cut

__PACKAGE__->has_many( configuration => "Emitria::Schema::Result::Stream::Setting", 'stream_id', { cascade_copy => 0, cascade_delete => 1 });

=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
