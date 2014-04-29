#!/usr/bin/perl -wT

use DBI;
use Passwd::Unix;
#use Digest::md5;
my $dbh = DBI->connect('DBI:mysql:test', 'perl', 'camello') or die "Error: " . DBI->errstr;
my $sth = $dbh->prepare('SELECT * FROM usuarios') or die "Error: " . $dbh->errstr;
$sth->execute() or die "Error: " . $sth->errstr;

my @data;
while(@data = $sth->fetchrow_array()){
	my $pu = Passwd::Unix->new();
	my $err = $pu->user($data[0], $data[1], $pu->maxuid + 1, 10, $data[0], "/home/$data[0]", "/bin/rbash" );
	$test = $dbh->do("DELETE FROM usuarios WHERE login=?",undef,$data[0]) or die "Error: " . $dbh->errstr;
}

$sth->finish;

$dbh->disconnect;

exit;
