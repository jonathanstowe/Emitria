use utf8;
package Emitria::Schema::Result::MusicDir;


=head1 NAME

Emitria::Schema::Result::MusicDir

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

=head2 TABLE: C<music_dirs>

=cut

__PACKAGE__->table("music_dir");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item station_id

  data_type: 'integer'
  is_nullable: 0

=item directory

  data_type: 'text'
  is_nullable: 1

=item type

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item dir_exists

  data_type: 'boolean'
  default_value: true
  is_nullable: 1

=item watched

  data_type: 'boolean'
  default_value: true
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   station_id => {
      data_type         => "integer",
      is_foreign_key     => 1,
      is_nullable       => 0,
   },
   directory => {
      data_type   => "text",
      is_nullable => 1
   },
   directory_type => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   dir_exists => {
      data_type     => "boolean",
      default_value => 1,
      is_nullable   => 1
   },
   watched => {
      data_type     => "boolean",
      default_value => 1,
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


=head2 UNIQUE CONSTRAINTS

=over 4


=item C<music_dir_unique>

=over 4

=item * L</directory>

=back

=cut

__PACKAGE__->add_unique_constraint("music_dir_unique", ["directory"]);

=back

=head2 RELATIONS

=over 4

=item station

This is the radio station that the directory belongs to. 

Type: belongs_to

Related object: L<Emitria::Schema::Result::Station>

=cut

__PACKAGE__->belongs_to(station  => 'Emitria::Schema::Result::Station', 'station_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });


=item files

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  files =>
  "Emitria::Schema::Result::File",
  { "foreign.directory" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=back

=cut


__PACKAGE__->meta()->make_immutable();

1;
