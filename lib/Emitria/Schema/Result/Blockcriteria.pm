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


__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

L<DBIx::Class::ResultSource>

=head2 TABLE: C<blockcriteria>

=cut

__PACKAGE__->table("blockcriteria");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item criteria

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=item modifier

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=item value

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=item extra

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item block_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   criteria => { data_type => "varchar", is_nullable => 0, size => 32 },
   modifier => { data_type => "varchar", is_nullable => 0, size => 16 },
   value    => { data_type => "varchar", is_nullable => 0, size => 512 },
   extra    => { data_type => "varchar", is_nullable => 1, size => 512 },
   block_id => { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=item block

Type: belongs_to

Related object: L<Emitria::Schema::Result::Block>

=cut

__PACKAGE__->belongs_to(
   block => "Emitria::Schema::Result::Block",
   { id            => "block_id" },
   { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta()->make_immutable();

1;
