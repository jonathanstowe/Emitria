use utf8;
package Emitria::Schema::Result::Webstream::Metadata;


=head1 NAME

Emitria::Schema::Result::Webstream::Metadata

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

=head2 TABLE: C<webstream_metadata>

=cut

__PACKAGE__->table("webstream_metadata");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item instance_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item start_time

  data_type: 'timestamp'
  is_nullable: 0

=item liquidsoap_data

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   instance_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0
   },
   start_time => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   liquidsoap_data => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 1024
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


=item instance

Type: belongs_to

Related object: L<Emitria::Schema::Result::Schedule>

=cut

__PACKAGE__->belongs_to(
  instance =>
  "Emitria::Schema::Result::Schedule",
  { id => "instance_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=back

=cut


__PACKAGE__->meta()->make_immutable();
1;
