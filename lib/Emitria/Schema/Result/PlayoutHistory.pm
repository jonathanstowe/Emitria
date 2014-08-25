use utf8;
package Emitria::Schema::Result::PlayoutHistory;


=head1 NAME

Emitria::Schema::Result::PlayoutHistory

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

=head2 TABLE: C<playout_history>

=cut

__PACKAGE__->table("playout_history");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item starts

  data_type: 'timestamp'
  is_nullable: 0

=item ends

  data_type: 'timestamp'
  is_nullable: 1

=item instance_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   file_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   starts => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   ends => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   instance_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=item playout_history_metadatas

Type: has_many

Related object: L<Emitria::Schema::Result::PlayoutHistoryMetadata>

=cut

__PACKAGE__->has_many(
  playout_history_metadatas =>
  "Emitria::Schema::Result::PlayoutHistoryMetadata",
  { "foreign.history_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item file

Type: belongs_to

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->belongs_to(
  file =>
  "Emitria::Schema::Result::File",
  { id => "file_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=item instance

Type: belongs_to

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->belongs_to(
  instance =>
  "Emitria::Schema::Result::ShowInstance",
  { id => "instance_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta()->make_immutable();

1;
