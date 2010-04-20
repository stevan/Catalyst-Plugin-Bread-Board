package Catalyst::Plugin::Bread::Board;
use Moose;

our $VERSION   = '0.01';
our $AUTHORITY = 'cpan:STEVAN';

sub setup {
    my $c = shift;
    $c->config(
        $c->config
          ->{'Plugin::Bread::Board'}
          ->{'container'}
          ->as_catalyst_config
    );
    $c->next::method( @_ )
}


__PACKAGE__->meta->make_immutable;

no Moose; 1;

__END__

=pod

=head1 NAME

Catalyst::Plugin::Bread::Board - Use Bread::Board to configure your Catalyst app

=head1 SYNOPSIS

  package My::App;
  use Moose;

  use Catalyst qw[
      Bread::Board
  ];

  __PACKAGE__->config(
      'Plugin::Bread::Board' => {
          container => My::App::Container->new(
              name     => 'My::App',
              app_root => __PACKAGE__->path_to('.')
          )
      }
  );

=head1 DESCRIPTION

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan.little@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010 Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
