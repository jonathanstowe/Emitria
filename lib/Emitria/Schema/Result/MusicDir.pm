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

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<music_dirs>

=cut

__PACKAGE__->table("music_dirs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 directory

  data_type: 'text'
  is_nullable: 1

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 dir_exists

  data_type: 'boolean'
  default_value: true
  is_nullable: 1

=head2 watched

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
   directory => {
      data_type   => "text",
      is_nullable => 1
   },
   type => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   dir_exists => {
      data_type     => "boolean",
      default_value => \"true",
      is_nullable   => 1
   },
   watched => {
      data_type     => "boolean",
      default_value => \"true",
      is_nullable   => 1
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<music_dir_unique>

=over 4

=item * L</directory>

=back

=cut

__PACKAGE__->add_unique_constraint("music_dir_unique", ["directory"]);

=head1 RELATIONS

=head2 files

Type: has_many

Related object: L<Emitria::Schema::Result::File>

=cut

__PACKAGE__->has_many(
  files =>
  "Emitria::Schema::Result::File",
  { "foreign.directory" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);




__PACKAGE__->meta()->make_immutable();

1;
