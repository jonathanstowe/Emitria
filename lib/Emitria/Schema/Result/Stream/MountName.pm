use utf8;
package Emitria::Schema::Result::Stream::MountName;


=head1 NAME

Emitria::Schema::Result::Stream::MountName

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

L<DBIx::Class::ResultSource>

=head2 TABLE: C<stream_mount_name>

=cut

__PACKAGE__->table("stream_mount_name");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

=item stream_id

Foreign key to the L<Emitria::Schema::Result::Stream> this belongs to.

=cut

=item mount_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   stream_id   => {
      data_type      => 'integer',
      is_foreign_key => 1,
      is_nullable    => 0,
   },
   mount_name => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
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

=item stream

The relation to the L<Emitria::Schema::Result::Stream> that this belongs to.

=cut

__PACKAGE__->belongs_to(stream   => 'Emitria::Schema::Result::Stream', 'stream_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item listener_counts

Type: has_many

Related object: L<Emitria::Schema::Result::ListenerCount>

=cut

__PACKAGE__->has_many(
  listener_counts => 
  "Emitria::Schema::Result::ListenerCount",
  { "foreign.mount_name_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


=back

=cut


__PACKAGE__->meta()->make_immutable();

1;
