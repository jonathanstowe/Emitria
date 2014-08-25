use utf8;
package Emitria::Schema::Result::PlayoutHistoryTemplateField;


=head1 NAME

Emitria::Schema::Result::PlayoutHistoryTemplateField

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

=head2 TABLE: C<playout_history_template_field>

=cut

__PACKAGE__->table("playout_history_template_field");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item template_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=item label

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=item type

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=item is_file_md

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=item position

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   template_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0
   },
   name => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
   label => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
   type => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
   is_file_md => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 0
   },
   position => {
      data_type   => "integer",
      is_nullable => 0
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

=item template

Type: belongs_to

Related object: L<Emitria::Schema::Result::PlayoutHistoryTemplate>

=cut

__PACKAGE__->belongs_to(
  template =>
  "Emitria::Schema::Result::PlayoutHistoryTemplate",
  { id => "template_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta()->make_immutable();

1;
