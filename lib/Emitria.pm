package Emitria;

use 5.006;
use strict;
use warnings FATAL => 'all';

use Moose;

use Emitria::Schema;
use Emitria::Config;

=head1 NAME

Emitria - Core Emitria functionality in Perl

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS


    use Emitria;

    my $foo = Emitria->new();
    ...


=head1 DESCRIPTION


=head2 METHODS

=over 4

=item config

This returns an L<Emitria::Config> object.

=cut

has config  => (
                  is => 'ro',
                  isa   => 'Emitria::Config',
                  lazy  => 1,
                  default => sub { return Emitria::Config->new() },
                  handles  => [qw(db_dsn dbuser dbpass template_path)],
               );


=item connect_info

This returns a Hash Reference that is suitable to be passed as C<connect_info>
to e.g. a L<Catalyst::Model> config.

=cut

has connect_info  => (
                        is => 'ro',
                        isa   => 'HashRef',
                        lazy  => 1,
                        builder  => '_get_connect_info',
                     );

sub _get_connect_info
{
    my ( $self ) = @_;

    return {
               dsn   => $self->db_dsn(),
               user  => $self->dbuser(),
               password => $self->dbpass(),
           };

}

=item database

Returns the connected DBIx::Class::Schema object

=cut

has database   => (
                     is => 'ro',
                     isa   => 'Emitria::Schema',
                     lazy  => 1,
                     builder  => '_get_database',
                     handles  => [qw(resultset)],
                  );

sub _get_database
{
   my ( $self ) = @_;

   my $db = Emitria::Schema->connect($self->db_dsn(), 
                                     $self->dbuser(),
                                     $self->dbpass());

   return $db;
}

=back

=head1 AUTHOR

Jonathan Stowe, C<< <jns at gellyfish.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-airtime at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Emitria>.  I will
be notified, and then you'll automatically be notified of progress
on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Emitria


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Emitria>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Emitria>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Emitria>

=item * Search CPAN

L<http://search.cpan.org/dist/Emitria/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Jonathan Stowe.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Emitria
