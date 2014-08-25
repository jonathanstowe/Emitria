use utf8;
package Emitria::Schema::Result::StreamSetting;


=head1 NAME

Emitria::Schema::Result::StreamSetting

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

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<stream_setting>

=cut

__PACKAGE__->table("stream_setting");

=head1 ACCESSORS

=head2 keyname

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 value

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 type

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=cut

__PACKAGE__->add_columns(
  "keyname",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "value",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "type",
  { data_type => "varchar", is_nullable => 0, size => 16 },
);

=head1 PRIMARY KEY

=over 4

=item * L</keyname>

=back

=cut

__PACKAGE__->set_primary_key("keyname");




__PACKAGE__->meta->make_immutable;
1;
