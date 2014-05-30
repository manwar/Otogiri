package Otogiri;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.11";

use DBIx::Otogiri;

sub new {
    my ($class, %opts) = @_;
    DBIx::Otogiri->new(%opts);
}

1;
__END__

=encoding utf-8

=head1 NAME

Otogiri - A lightweight medicine for using database

=head1 SYNOPSIS

    use Otogiri;
    my $db = Otogiri->new(connect_info => ['dbi:SQLite:...', '', '']);
    
    $db->insert(book => {title => 'mybook1', author => 'me', ...});

    my $book_id = $db->last_insert_id;
    my $row = $db->single(book => {id => $book_id});

    print 'Title: '. $row->{title}. "\n";
    
    my @rows = $db->select(book => {price => {'>=' => 500}});
    for my $r (@rows) {
        printf "Title: %s \nPrice: %s yen\n", $r->{title}, $r->{price};
    }
    
    $db->update(book => [author => 'oreore'], {author => 'me'});
    
    $db->delete(book => {author => 'me'});
    
    ### using transaction
    do {
        my $txn = $db->txn_scope;
        $db->insert(book => ...);
        $db->insert(store => ...);
        $txn->commit;
    };

=head1 DESCRIPTION

Otogiri is a thing that like as ORM. A slogan is "Schema-less, Fat-less".

=head1 ATTRIBUTES

Please see ATTRIBUTES section of L<DBIx::Otogiri> documentation.

=head1 METHODS

=head2 new

    my $db = Otogiri->new( connect_info => [$dsn, $dbuser, $dbpass] );

Instantiate and connect to db. Then, it returns L<DBIx::Otogiri> object.

Please see ATTRIBUTE section.

=head1 INFORMATION ABOUT INCOMPATIBILITY

=head2 version 0.11

=over 4

=item An insert() method is removed, and it was become a synonym of fast_insert() method.

  If you want to use previous style insert() method, please try L<Otogiri::Plugin::InsertAndFetch> .

=back

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=head1 SEE ALSO

L<DBIx::Otogiri>

L<DBIx::Sunny>

L<SQL::Maker>

=cut

