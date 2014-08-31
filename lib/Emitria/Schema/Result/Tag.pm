use utf8;

package Emitria::Schema::Result::Tag;


=head1 NAME

Emitria::Schema::Result::Tag

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "tag" that may be applied to
shows, files etc and so forth - it can be used to select for these things on
a more arbitrary basis than e.g. the file metadata or other things.

=head2 TABLE: C<tag>

=cut

__PACKAGE__->table("tag");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item name

This is the actual name of the "tag" it is some arbitrary text field.

  data_type:   'varchar',
  size:        255,
  is_nullable: 0

=item created_user_id

This is the foreign key to the user who first created it.

   data_type:  'integer',
   is_foreign_key:   1,
   is_nullable:   0,

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
   name => {
      data_type   => 'varchar',
      size        => 255,
      is_nullable => 0
   },
   created_user_id => {
      data_type      => "integer",
      is_foreign_jey => 1,
      is_nullable    => 0,
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

=item created_user

This is a relation to the L<Emitria::Schema::Result::User> that created this tag.

=cut

__PACKAGE__->belongs_to(created_user   => 'Emitria::Schema::Result::User', 'created_user_id');

=item file_tags

Relation to the L<Emitria::Schema::Result::File::Tag>s

=cut

__PACKAGE__->has_many(file_tags  => 'Emitria::Schema::Result::File::Tag', 'tag_id');

=item files

The many_to_many relation to the L<Emitria::Schema::Result::File>s with this tag.

=cut

__PACKAGE__->many_to_many(files   => 'file_tags', 'file');

=item show_tags

Relation to the L<Emitria::Schema::Result::Show::Tag>s

=cut

__PACKAGE__->has_many(show_tags  => 'Emitria::Schema::Result::Show::Tag', 'tag_id');

=item shows

The many_to_many relation to the L<Emitria::Schema::Result::Show>s with this tag.

=cut

__PACKAGE__->many_to_many(shows   => 'show_tags', 'show');

=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
