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

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<locale>

=cut

__PACKAGE__->table("locale");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 locale_code

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 locale_lang

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "locale_code",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "locale_lang",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");




__PACKAGE__->meta->make_immutable;
1;
