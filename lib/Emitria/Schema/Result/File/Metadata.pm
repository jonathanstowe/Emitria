use utf8;

package Emitria::Schema::Result::File::Metadata;


=head1 NAME

Emitria::Schema::Result::File::Metadata

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a metadata item on a file.  This 
may have been determined from an incoming file, editied by a user or added to
a recorded file automatically.

=head2 TABLE: C<file_metadata>

=cut

__PACKAGE__->table("file_metadata");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item file_id

This is the foreign key to L<Emitria::Schema::Result::File> this belongs to.

   data_type:  'integer',
   is_nullable:   0,
   is_foreign_key:   1

=item metadata_type_id

This is a foreign key to the L<Emitria::Schema::Result::File::Metadata::Type> that
describes the actual file metadata tag.

   data_type:  'integer',
   is_nullable:   0,
   is_foreign_key:   1

=item value

This is the actual value of the metadata item. This is text because the ID3v2 doesn't
really specify a length for the tags, 'text' may be problematic for e,g image data on
databases that distinguish between text and other blobs.

   data_type:  'text',
   is_nullable:   0

=item last_synchronised

This is the date time that the data was last synchronised to the actual file.  This will
typically be set automatically by the "media manager" part on notification of the change.
It should not be null for items determined from imported files, but may be null for items
that were added by a user or for newly recorded files.

   data_type:  'datetime',
   is_nullable:   1,

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
   file_id => {
      data_type         => "integer",
      is_nullable       => 0,
      is_foreign_key    => 1,
   },
   metadata_type_id => {
      data_type         => "integer",
      is_nullable       => 0,
      is_foreign_key    => 1,
   },
   value => {
       data_type        => 'text',
       is_nullable      => 0,
   },
   last_synchronised => {
       data_type  => 'datetime',
       is_nullable   => 1,
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

=item file

This is the relation to the L<Emitria::Schema::Result::File> that this belongs to.

=cut


__PACKAGE__->belongs_to(file => 'Emitria::Schema::Result::File', 'file_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=item metadata_type

This is the relation to the L<Emitria::Schema::Result::File::Metadata::Type> that this
is an instance of.

=cut

# No cascade on this one as we don't want to delete a metadata that is being used.

__PACKAGE__->belongs_to(metadata_type => 'Emitria::Schema::Result::File::Metadata::Type', 'metadata_type_id', );


=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
