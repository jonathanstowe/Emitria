use utf8;
package Emitria::Schema::Result::Timestamp;


=head1 NAME

Emitria::Schema::Result::Timestamp

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

=head2 TABLE: C<timestamp>

=cut

__PACKAGE__->table("timestamp");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item timestamp

  data_type: 'timestamp'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   timestamp => { data_type => "timestamp", is_nullable => 0 },
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


=item listener_counts

Type: has_many

Related object: L<Emitria::Schema::Result::ListenerCount>

=cut

__PACKAGE__->has_many(
   listener_counts => "Emitria::Schema::Result::ListenerCount",
   { "foreign.timestamp_id" => "self.id" },
   { cascade_copy           => 0, cascade_delete => 0 },
);




__PACKAGE__->meta()->make_immutable();

1;
