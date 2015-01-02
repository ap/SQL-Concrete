use 5.012;
use warnings;

package SQL::Concrete::Dollars;

# ABSTRACT: use SQL::Concrete with dollar placeholders

use SQL::Concrete ':noncore';
BEGIN { our @ISA = 'SQL::Concrete' } # inherit import()

sub sql_render { SQL::Concrete::Renderer->new( dollars => 1 )->render( @_ ) }

1;

__END__

=head1 SYNOPSIS

 use SQL::Concrete::Dollars ':all';

=head1 DESCRIPTION

This module is just like L<SQL::Concrete>, except that automatically generated
placeholders will use numbered placeholder syntax instead of the more common
question mark syntax (i.e. C<$, $2, $3> instead of C<?, ?, ?>).

If for some reason you wish to use both forms and want to be able to choose on
a per-query basis, you can export C<sql_render> from this module with a prefix:

 use SQL::Concrete ':all';
 use SQL::Concrete::Dollars _prefix => 'pg', ':core';
 
 # you can now use either sql_render or pgsql_render
 # depending on the form of placeholders you want

For all further details, please refer to the L<SQL::Concrete> documentation.
