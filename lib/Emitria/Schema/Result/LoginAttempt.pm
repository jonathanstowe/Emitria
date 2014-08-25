use utf8;
package Emitria::Schema::Result::LoginAttempt;


=head1 NAME

Emitria::Schema::Result::LoginAttempt

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

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<login_attempts>

=cut

__PACKAGE__->table("login_attempts");

=head1 ACCESSORS

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 attempts

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "attempts",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ip>

=back

=cut

__PACKAGE__->set_primary_key("ip");




__PACKAGE__->meta->make_immutable;
1;
