use utf8;

package Emitria::Schema::Result::Show;


=head1 NAME

Emitria::Schema::Result::Show

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

L<DBIx::Class::ResultSource>

=head2 TABLE: C<show>

=cut

__PACKAGE__->table("show");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item station_id

Foreign key to the L<Emitria::Schema::Result::Station>

  data_type: 'integer'
  is_nullable: 0

=item name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=item url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 255

=item genre

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 255

=item description

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=item color

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=item background_color

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=item live_stream_using_airtime_auth

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=item live_stream_using_custom_auth

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=item live_stream_user

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item live_stream_pass

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item linked

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=item is_linkable

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   station_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0,
   },
   name => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 0,
      size          => 255
   },
   url => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 1,
      size          => 255
   },
   genre => {
      data_type     => "varchar",
      default_value => "",
      is_nullable   => 1,
      size          => 255
   },
   description => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 512
   },
   color => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 6
   },
   background_color => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 6
   },
   live_stream_using_airtime_auth => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   live_stream_using_custom_auth => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 1
   },
   live_stream_user => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   live_stream_pass => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   linked => {
      data_type     => "boolean",
      default_value => \"false",
      is_nullable   => 0
   },
   is_linkable => {
      data_type     => "boolean",
      default_value => \"true",
      is_nullable   => 0
   },
   date_created => {
      data_type     => 'datetime',
      set_on_create => 1,
      is_nullable   => 0,
   },
   last_modified => {
      data_type     => 'datetime',
      set_on_update => 1,
      set_on_create => 0,
      is_nullable   => 1,
   }
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


=over 4


=item station

This is the radio station that the show belongs to.

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item show_days

Type: has_many

Related object: L<Emitria::Schema::Result::Show::Day>

=cut

__PACKAGE__->has_many(
  show_days =>
  "Emitria::Schema::Result::Show::Day",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item show_hosts

Type: has_many

Related object: L<Emitria::Schema::Result::Show::Host>

=cut

__PACKAGE__->has_many(
  show_hosts =>
  "Emitria::Schema::Result::Show::Host",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item show_instances

Type: has_many

Related object: L<Emitria::Schema::Result::Show::Instance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::Show::Instance",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item show_rebroadcasts

Type: has_many

Related object: L<Emitria::Schema::Result::Show::Rebroadcast>

=cut

__PACKAGE__->has_many(
  show_rebroadcasts =>
  "Emitria::Schema::Result::Show::Rebroadcast",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=item tag_references

A relation to the L<Emitria::Schema::Result::Show::Tag>s

=cut

__PACKAGE__->has_many(tag_references   => 'Emitria::Schema::Result::Show::Tag', 'show_id', { cascade_copy => 0, cascade_delete => 0 });

=item tags

The relation to the actual tags.

=cut

__PACKAGE__->many_to_many(tags => 'tag_references', 'tag');

=back

=cut



__PACKAGE__->meta()->make_immutable();

1;
