package Emitria::Role::ShareDir;

use Moose::Role;

use File::Spec::Functions qw(catfile catdir rel2abs curdir);
use File::ShareDir qw(dist_dir);
use File::HomeDir;
use File::Basename qw(dirname);
use Path::Class;
use Carp qw(croak);

=head1 NAME

Emitria::Role::ShareDir

=head1 DESCRIPTION

Methods to get the shared directory.

=head2 METHODS

=item share_dir

This returns the path to the shared data directory.

=cut

has share_dir  => (
                     is    => 'rw',
                     isa   => 'Str',
                     lazy  => 1,
                     builder  => '_get_share_dir',
                  );

sub _get_share_dir
{
   my ($self) = @_;
   my $share_dir = ".";
   my $blib_share_dir = dir( curdir, 'blib', 'lib', 'auto', 'share', 'dist', 'Emitria' );

   if ( -d $blib_share_dir )
   {
      $share_dir = $blib_share_dir->stringify();
   }
   elsif ( -d dist_dir('Emitria') )
   {
      $share_dir = dist_dir('Emitria');
   }

   return $share_dir;
}

=back

=cut

1;
