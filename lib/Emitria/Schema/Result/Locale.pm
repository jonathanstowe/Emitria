use utf8;
package Emitria::Schema::Result::Locale;


=head1 NAME

Emitria::Schema::Result::Locale

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

=head2 TABLE: C<locale>

=cut

__PACKAGE__->table("locale");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item locale_code

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=item locale_lang

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   locale_code => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 16
   },
   locale_lang => {
      data_type   => "varchar",
      is_nullable => 0,
      size        => 128
   },
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
