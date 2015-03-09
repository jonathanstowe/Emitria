use utf8;
package Emitria::Schema::Result::Playout::History::Template;


=head1 NAME

Emitria::Schema::Result::Playout::History::Template

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

=head2 TABLE: C<playout_history_template>

=cut

__PACKAGE__->table("playout_history_template");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=item template_type

  data_type: 'varchar'
  is_nullable: 0
  size: 35

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   station_id  => {
      data_type      => 'integer',
      is_foreign_key => 1,
      is_nullable    => 0,
   },
   name => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
   template_type => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 35
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

=item station

This is the radio station that the template belongs to.

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item playout_history_template_fields

Type: has_many

Related object: L<Emitria::Schema::Result::Playout::History::Template::Field>

=cut

__PACKAGE__->has_many(
  playout_history_template_fields =>
  "Emitria::Schema::Result::Playout::History::Template::Field",
  { "foreign.template_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=back

=cut



__PACKAGE__->meta()->make_immutable();

1;
