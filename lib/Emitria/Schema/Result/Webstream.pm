use utf8;
package Emitria::Schema::Result::Webstream;


=head1 NAME

Emitria::Schema::Result::Webstream

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

=head1 TABLE: C<webstream>

=cut

__PACKAGE__->table("webstream");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 url

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=head2 length

  data_type: 'interval'
  default_value: '00:00:00'
  is_nullable: 0

=head2 creator_id

  data_type: 'integer'
  is_nullable: 0

=head2 mtime

  data_type: 'timestamp'
  is_nullable: 0

=head2 utime

  data_type: 'timestamp'
  is_nullable: 0

=head2 lptime

  data_type: 'timestamp'
  is_nullable: 1

=head2 mime

  data_type: 'varchar'
  is_nullable: 1
  size: 255

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
      size        => 255
   },
   description => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 255
   },
   url => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 512
   },
   length => {
      data_type     => "interval",
      default_value => "00:00:00",
      is_nullable   => 0
   },
   creator_id => {
      data_type   => "integer",
      is_nullable => 0
   },
   mtime => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   utime => {
      data_type   => "timestamp",
      is_nullable => 0
   },
   lptime => {
      data_type   => "timestamp",
      is_nullable => 1
   },
   mime => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 schedules

Type: has_many

Related object: L<Emitria::Schema::Result::Schedule>

=cut

__PACKAGE__->has_many(
  schedules =>
  "Emitria::Schema::Result::Schedule",
  { "foreign.stream_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);




__PACKAGE__->meta()->make_immutable();

1;
