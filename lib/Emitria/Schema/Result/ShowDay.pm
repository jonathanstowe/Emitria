use utf8;
package Emitria::Schema::Result::ShowDay;


=head1 NAME

Emitria::Schema::Result::ShowDay

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

=head2 TABLE: C<show_days>

=cut

__PACKAGE__->table("show_days");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item first_show

  data_type: 'date'
  is_nullable: 0

=item last_show

  data_type: 'date'
  is_nullable: 1

=item start_time

  data_type: 'time'
  is_nullable: 0

=item timezone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=item duration

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=item day

  data_type: 'smallint'
  is_nullable: 1

=item repeat_type

  data_type: 'smallint'
  is_nullable: 0

=item next_pop_date

  data_type: 'date'
  is_nullable: 1

=item show_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item record

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   first_show => {
      data_type   => "date",
      is_nullable => 0
   },
   last_show => {
      data_type   => "date",
      is_nullable => 1
   },
   start_time => {
      data_type   => "time",
      is_nullable => 0
   },
   timezone => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
   duration => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
   day => {
      data_type   => "smallint",
      is_nullable => 1
   },
   repeat_type => {
      data_type   => "smallint",
      is_nullable => 0
   },
   next_pop_date => {
      data_type   => "date",
      is_nullable => 1
   },
   show_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0
   },
   record => {
      data_type     => "smallint",
      default_value => 0,
      is_nullable   => 1
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


=item show

Type: belongs_to

Related object: L<Emitria::Schema::Result::Show>

=cut

__PACKAGE__->belongs_to(
  show =>
  "Emitria::Schema::Result::Show",
  { id => "show_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta()->make_immutable();

1;
