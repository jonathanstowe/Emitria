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

=item * L</keyname>

=back

=cut

__PACKAGE__->set_primary_key("keyname");




__PACKAGE__->meta()->make_immutable();

1;
