use utf8;

package Emitria::Schema::Result::Show::Tag;


=head1 NAME

Emitria::Schema::Result::Show::Tag

=cut

use strict;
use warnings;

use Moose;
extends 'DBIx::Class::Core';

use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes the tags on a show.

=head2 TABLE: C<show_tag>

=cut

__PACKAGE__->table("show_tag");

=head2 METHODS

=over 4

=item id

The primary key.

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item show_id

The foreign key to a L<Emitra::Schema::Result::Show>

  data_type: 'integer',
  is_nullable: 0,
  is_foreign_key: 1

=item tag_id

The foreign key to a L<Emitra::Schema::Result::Tag>

  data_type: 'integer',
  is_nullable: 0,
  is_foreign_key: 1

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
   show_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 0,
   },
   tag_id => {
      data_type      => "integer",
      is_foreign_key => 1,
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

__PACKAGE__->add_unique_constraint(unq_show_tag => [qw(show_id tag_id)]);

=head2 RELATIONS

=over 4

=item show

The relation to the L<Emitria::Schema::Result::Show>

=cut

__PACKAGE__->belongs_to(show => 'Emitria::Schema::Result::Show', 'show_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });


=item tag

The relation to the L<Emitria::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(tag => 'Emitria::Schema::Result::Tag', 'tag_id', );

__PACKAGE__->meta()->make_immutable();

=back

=cut

1;
