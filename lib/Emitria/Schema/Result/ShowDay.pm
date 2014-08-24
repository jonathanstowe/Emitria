use utf8;
package Emitria::Schema::Result::ShowDay;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Emitria::Schema::Result::ShowDay

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

=head1 TABLE: C<show_days>

=cut

__PACKAGE__->table("show_days");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'show_days_id_seq'

=head2 first_show

  data_type: 'date'
  is_nullable: 0

=head2 last_show

  data_type: 'date'
  is_nullable: 1

=head2 start_time

  data_type: 'time'
  is_nullable: 0

=head2 timezone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 duration

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 day

  data_type: 'smallint'
  is_nullable: 1

=head2 repeat_type

  data_type: 'smallint'
  is_nullable: 0

=head2 next_pop_date

  data_type: 'date'
  is_nullable: 1

=head2 show_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 record

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "show_days_id_seq",
  },
  "first_show",
  { data_type => "date", is_nullable => 0 },
  "last_show",
  { data_type => "date", is_nullable => 1 },
  "start_time",
  { data_type => "time", is_nullable => 0 },
  "timezone",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "duration",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "day",
  { data_type => "smallint", is_nullable => 1 },
  "repeat_type",
  { data_type => "smallint", is_nullable => 0 },
  "next_pop_date",
  { data_type => "date", is_nullable => 1 },
  "show_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "record",
  { data_type => "smallint", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 show

Type: belongs_to

Related object: L<Emitria::Schema::Result::Show>

=cut

__PACKAGE__->belongs_to(
  "show",
  "Emitria::Schema::Result::Show",
  { id => "show_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-30 17:33:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cn+QvRcEKdd8tiW9nrqgLQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
