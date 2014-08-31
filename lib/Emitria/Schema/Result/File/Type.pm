use utf8;

package Emitria::Schema::Result::File::Type;


=head1 NAME

Emitria::Schema::Result::File::Type

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "file type".

=head2 TABLE: C<file_type>

=cut

__PACKAGE__->table("file_type");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item name

The name of the file type.  A unique key.

  data_type: 'string'
  is_nullable: 0

=item display_name

A more human readable name for the file type (e,g, "E-Mail Address")

  data_type: 'string'
  is_nullable: 1

=item public

A boolean to indicate whether files of this type are to made available
to the public interface.

  data_type: 'boolean'
  is_nullable: 0
  default_value:  true

=item date_created

Auto populated when the row is created.

  data_type: 'datetime'
  is_auto_increment: 1
  is_nullable: 0

=item last_modified

Auto populated when the row is updated.

  data_type: 'datetime'
  is_auto_increment: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   name  => {
       data_type        => 'varchar',
       size             => 255,
       is_nullable      => 0,
   },
   display_name  => {
       data_type        => 'varchar',
       size             => 255,
       is_nullable      => 1,
   },
   public     => {
       data_type        => 'boolean',
       is_nullable      => 0,
       default_value    => 1,
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

__PACKAGE__->add_unique_constraint(unq_file_type   => [qw(name)]);

=head2 RELATIONS

=over 4

=item files

The L<Emitria::Schema::Result::File>s  of this type.

=cut

__PACKAGE__->has_many(files => 'Emitria::Schema::Result::File', 'file_type_id');


=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
