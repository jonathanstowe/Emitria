use utf8;
package Emitria::Schema::Result::Show;


=head1 NAME

Emitria::Schema::Result::Show

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

=head1 TABLE: C<show>

=cut

__PACKAGE__->table("show");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 255

=head2 genre

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 color

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=head2 background_color

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=head2 live_stream_using_airtime_auth

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=head2 live_stream_using_custom_auth

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=head2 live_stream_user

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 live_stream_pass

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 linked

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 is_linkable

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
   is_linkable =>
     { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 show_days

Type: has_many

Related object: L<Emitria::Schema::Result::ShowDay>

=cut

__PACKAGE__->has_many(
  show_days =>
  "Emitria::Schema::Result::ShowDay",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 show_hosts

Type: has_many

Related object: L<Emitria::Schema::Result::ShowHost>

=cut

__PACKAGE__->has_many(
  show_hosts =>
  "Emitria::Schema::Result::ShowHost",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 show_instances

Type: has_many

Related object: L<Emitria::Schema::Result::ShowInstance>

=cut

__PACKAGE__->has_many(
  show_instances =>
  "Emitria::Schema::Result::ShowInstance",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 show_rebroadcasts

Type: has_many

Related object: L<Emitria::Schema::Result::ShowRebroadcast>

=cut

__PACKAGE__->has_many(
  show_rebroadcasts =>
  "Emitria::Schema::Result::ShowRebroadcast",
  { "foreign.show_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);




__PACKAGE__->meta()->make_immutable();

1;
