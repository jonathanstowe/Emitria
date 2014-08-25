use utf8;
package Emitria::Schema::Result::ServiceRegister;


=head1 NAME

Emitria::Schema::Result::ServiceRegister

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

=head1 TABLE: C<service_register>

=cut

__PACKAGE__->table("service_register");

=head1 ACCESSORS

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 18

=cut

__PACKAGE__->add_columns(
  name => { 
      data_type => "varchar", is_nullable => 0, size => 32 },
  ip => { 
      data_type => "varchar", is_nullable => 0, size => 18 },
);

=head1 PRIMARY KEY

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->set_primary_key("name");




__PACKAGE__->meta()->make_immutable();

1;
