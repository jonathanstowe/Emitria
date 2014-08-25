use utf8;
package Emitria::Schema::Result::Blockcriteria;


=head1 NAME

Emitria::Schema::Result::Blockcriteria

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

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<blockcriteria>

=cut

__PACKAGE__->table("blockcriteria");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'blockcriteria_id_seq'

=head2 criteria

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 modifier

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 value

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=head2 extra

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 block_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "blockcriteria_id_seq",
  },
  "criteria",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "modifier",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "value",
  { data_type => "varchar", is_nullable => 0, size => 512 },
  "extra",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "block_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 block

Type: belongs_to

Related object: L<Emitria::Schema::Result::Block>

=cut

__PACKAGE__->belongs_to(
  "block",
  "Emitria::Schema::Result::Block",
  { id => "block_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta->make_immutable;
1;
