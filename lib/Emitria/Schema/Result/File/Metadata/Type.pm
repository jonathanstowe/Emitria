use utf8;

package Emitria::Schema::Result::File::Metadata::Type;


=head1 NAME

Emitria::Schema::Result::File::Metadata::Type

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a file metadata tag (i.e. ID3 etc)

This probably isn't comprehensive.

=head2 TABLE: C<file_metadata_type>

=cut

__PACKAGE__->table("file_metadata_type");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item version

The ID3 version this is for (e.g. ID3v1, ID3v2_2 etc) as a tring

  data_type: 'varchar'
  size:  20
  is_nullable: 0

=item index_1

For ID3v1 tags this is the index into the header.  For other versions it
is unused (probably use the name anyway.)

  data_type:   'integer',
  is_nullable: 1

=item tag_id

for ID3v2+ tags this is that id of the tag in the header. (the length is 10
but there may only be tags shorter than 6.

  data_type:   'varchar',
  size:        10,
  is_nullable: 1

=item tag_name

This is the tagname supplied by the specification. It is present for all types.

   data_type   'varchar',
   size     255
   is_nullable:   0

=item display_name

This is an optional display name that may be used when it gets shown to the user.
Otherwise its use the tag_name.

   data_type   'varchar'
   size:       255
   is_nullable 1

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
   version  => {
      data_type   => 'varchar',
      size        => 20,
      is_nullable => 0,
   },
   index_1  => {
      data_type   =>  'integer',
      is_nullable =>    1
   },
   tag_id   => {
      data_type   => 'varchar',
      size        => 10,
      is_nullable => 1
   },
   tag_name => {
      data_type   => 'varchar',
      size        => 255,
      is_nullable => 0,
   },
   display_name   => {
      data_type   => 'varchar',
      size        => 255,
      is_nullable => 1,
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

=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
