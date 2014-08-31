use utf8;
package Emitria::Schema::Result::Show::Instance;


=head1 NAME

Emitria::Schema::Result::Show::Instance

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

=head2 TABLE: C<show_instances>

=cut

__PACKAGE__->table("show_instances");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item starts

  data_type: 'timestamp'
  is_nullable: 0

=item ends

  data_type: 'timestamp'
  is_nullable: 0

=item show_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=item record

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=item rebroadcast

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=item instance_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item file_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item time_filled

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 1

=item created

  data_type: 'timestamp'
  is_nullable: 0

=item last_scheduled

  data_type: 'timestamp'
  is_nullable: 1

=item modified_instance

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

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head2 RELATIONS

=over 4


=item playout_histories

Type: has_many

Related object: L<Emitria::Schema::Result::Playout::History>

=cut

__PACKAGE__->has_many(
  playout_histories =>
  "Emitria::Schema::Result::Playout::History",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item schedules

Type: has_many

Related object: L<Emitria::Schema::Result::Schedule>

=cut

__PACKAGE__->has_many(
  schedules =>
  "Emitria::Schema::Result::Schedule",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item show_instances

Type: has_many

Related object: L<Emitria::Schema::Result::Show::Instance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::Show::Instance",
  { "foreign.instance_id" => "self.id" },
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

Related object: L<Emitria::Schema::Result::Show::Instance>

=cut

__PACKAGE__->belongs_to(
  instance =>
  "Emitria::Schema::Result::Show::Instance",
  { id => "instance_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

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
