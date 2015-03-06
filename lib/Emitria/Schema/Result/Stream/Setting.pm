use utf8;
package Emitria::Schema::Result::Stream::Setting;


=head1 NAME

Emitria::Schema::Result::Stream::Setting

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

=head2 TABLE: C<stream_setting>

=cut

__PACKAGE__->table("stream_setting");

=head2 METHODS

=over 4

=item keyname

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=item value

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item setting_type

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   stream_id   => {
      data_type      => 'integer',
      is_foreign_key => 1,
      is_nullable    => 0,
   },
   keyname => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 64
   },
   value => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   setting_type => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 16
   },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint(unq_stream_setting => [qw(stream_id keyname)]);

=head2 RELATIONS

=over 4

=item stream

The relation to the L<Emitria::Schema::Result::Stream> that this belongs to.

=cut

__PACKAGE__->belongs_to(stream   => 'Emitria::Schema::Result::Stream', 'stream_id', { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" });

=back

=cut




__PACKAGE__->meta()->make_immutable();

1;
