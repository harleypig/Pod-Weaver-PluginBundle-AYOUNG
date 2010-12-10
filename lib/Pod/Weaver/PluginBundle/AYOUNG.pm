package Pod::Weaver::PluginBundle::AYOUNG;

# ABSTRACT: AYOUNG's default Pod::Weaver config

use strict;
use warnings;

use Pod::Weaver::Config::Assembler;

# VERSION

sub _exp { Pod::Weaver::Config::Assembler->expand_package( $_[ 0 ] ) }

sub mvp_bundle_config {

  my @plugins;

  push @plugins, (
    [ 'CorePrep',     _exp('@CorePrep'),    {} ],
    [ 'Name',         _exp('Name'),         {} ],
    [ 'Version',      _exp('Version'),      {} ],
    [ 'Synopsis',     _exp('Generic'),      { 'header' => 'SYNOPSIS'    } ],
    [ 'Description',  _exp('Generic'),      { 'header' => 'DESCRIPTION' } ],
    [ 'Attributes',   _exp('Collect'),      { 'header' => 'ATTRIBUTES', 'command' => 'attributes' } ],
    [ 'Methods',      _exp('Collect'),      { 'header' => 'METHODS',    'command' => 'method' } ],
    [ 'Leftovers',    _exp('Leftovers'),    {} ],
    [ 'Installation', _exp('Installation'), {} ],
    [ 'SeeAlso',      _exp('SeeAlso'),      {} ],
    [ 'Authors',      _exp('Authors'),      {} ],
    [ 'Legal',        _exp('Legal'),        {} ],
    [ 'List',         _exp('-Transformer'), { 'transformer' => 'List' } ],
  );

  # Make sure this list is unique
  $_->[ 0 ] =~ s!^!\@AYOUNG/! for @plugins;

  return @plugins;
}

1;

=for Pod::Coverage mvp_bundle_config

=head1 DESCRIPTION

Roughly equivalent to:

=over 4

=item *

[@CorePrep]

=item *

[Name]

=item *

[Version]

=item *

[Generic / SYNOPSIS]

=item *

[Generic / DESCRIPTION]

=item *

[Collect / ATTRIBUTES]

=item *

[Collect / METHODS]

=item *

[Leftovers]

=item *

[Installation]

=item *

[SeeAlso]

=item *

[Authors]

=item *

[Legal]

=item *

[-Transformers / List]

transformer = List

=back

=head1 SEEALSO

Any of the bundles found in the

L<Pod::Weaver::PluginBundle>

namespace.

=cut
