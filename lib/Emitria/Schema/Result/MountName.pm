use utf8;
package Emitria::Schema::Result::MountName;


=head1 NAME

Emitria::Schema::Result::MountName

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

=head1 TABLE: C<mount_name>

=cut

__PACKAGE__->table("mount_name");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 mount_name

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
   mount_name => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 listener_counts

Type: has_many

Related object: L<Emitria::Schema::Result::ListenerCount>

=cut

__PACKAGE__->has_many(
  listener_counts => 
  "Emitria::Schema::Result::ListenerCount",
  { "foreign.mount_name_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);




__PACKAGE__->meta()->make_immutable();

1;
