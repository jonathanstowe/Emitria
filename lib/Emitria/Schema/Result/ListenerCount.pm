use utf8;
package Emitria::Schema::Result::ListenerCount;


=head1 NAME

Emitria::Schema::Result::ListenerCount

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

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<listener_count>

=cut

__PACKAGE__->table("listener_count");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 timestamp_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 mount_name_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 listener_count

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "timestamp_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "mount_name_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "listener_count",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 mount_name

Type: belongs_to

Related object: L<Emitria::Schema::Result::MountName>

=cut

__PACKAGE__->belongs_to(
  "mount_name",
  "Emitria::Schema::Result::MountName",
  { id => "mount_name_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 timestamp

Type: belongs_to

Related object: L<Emitria::Schema::Result::Timestamp>

=cut

__PACKAGE__->belongs_to(
  "timestamp",
  "Emitria::Schema::Result::Timestamp",
  { id => "timestamp_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta->make_immutable;
1;
