use utf8;
package Emitria::Schema::Result::PlayoutHistoryTemplate;


=head1 NAME

Emitria::Schema::Result::PlayoutHistoryTemplate

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

=head1 TABLE: C<playout_history_template>

=cut

__PACKAGE__->table("playout_history_template");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 type

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
   name => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
   type => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 35
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 playout_history_template_fields

Type: has_many

Related object: L<Emitria::Schema::Result::PlayoutHistoryTemplateField>

=cut

__PACKAGE__->has_many(
  playout_history_template_fields =>
  "Emitria::Schema::Result::PlayoutHistoryTemplateField",
  { "foreign.template_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);




__PACKAGE__->meta->make_immutable;

1;
