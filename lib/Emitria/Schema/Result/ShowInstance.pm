use utf8;
package Emitria::Schema::Result::ShowInstance;


=head1 NAME

Emitria::Schema::Result::ShowInstance

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

=head1 TABLE: C<show_instances>

=cut

__PACKAGE__->table("show_instances");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 starts

  data_type: 'timestamp'
  is_nullable: 0

=head2 ends

  data_type: 'timestamp'
  is_nullable: 0

=head2 show_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 record

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=head2 rebroadcast

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=head2 instance_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 time_filled

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  is_nullable: 0

=head2 last_scheduled

  data_type: 'timestamp'
  is_nullable: 1

=head2 modified_instance

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   starts => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   ends => {
      data_type   => "timestamp",
      is_nullable => 0
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
   rebroadcast => {
      data_type     => "smallint",
      default_value => 0,
      is_nullable   => 1
   },
   instance_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   file_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   time_filled => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 1
   },
   created => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   last_scheduled => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   modified_instance => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 0
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 playout_histories

Type: has_many

Related object: L<Emitria::Schema::Result::PlayoutHistory>

=cut

__PACKAGE__->has_many(
  playout_histories =>
  "Emitria::Schema::Result::PlayoutHistory",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 schedules

Type: has_many

Related object: L<Emitria::Schema::Result::Schedule>

=cut

__PACKAGE__->has_many(
  schedules =>
  "Emitria::Schema::Result::Schedule",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 show_instances

Type: has_many

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::ShowInstance",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 file

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

=head2 instance

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
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 show

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
