use utf8;
package Emitria::Schema::Result::LiveLog;


=head1 NAME

Emitria::Schema::Result::LiveLog

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

=head2 TABLE: C<live_log>

=cut

__PACKAGE__->table("live_log");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item state

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=item start_time

  data_type: 'timestamp'
  is_nullable: 0

=item end_time

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   state      => { data_type => "varchar",   is_nullable => 0, size => 32 },
   start_time => { data_type => "timestamp", is_nullable => 0 },
   end_time   => { data_type => "timestamp", is_nullable => 1 },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


__PACKAGE__->meta()->make_immutable();

1;
