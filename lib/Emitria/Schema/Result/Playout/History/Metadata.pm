use utf8;
package Emitria::Schema::Result::Playout::History::Metadata;


=head1 NAME

Emitria::Schema::Result::Playout::History::Metadata

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

=head2 TABLE: C<playout_history_metadata>

=cut

__PACKAGE__->table("playout_history_metadata");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item history_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item key

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=item value

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   history_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0
   },
   key => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
   value => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
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


=item history

Type: belongs_to

Related object: L<Emitria::Schema::Result::Playout::History>

=cut

__PACKAGE__->belongs_to(
  history =>
  "Emitria::Schema::Result::Playout::History",
  { id => "history_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta()->make_immutable();

1;
