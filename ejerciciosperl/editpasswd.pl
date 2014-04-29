#!/usr/bin/perl -wT

use DBI;
#use Unix::Passwd::File;
use Passwd::Unix;
my $dbh = DBI->connect('DBI:mysql:test', 'perl', 'camello') or die "Error: " . DBI->errstr;
my $sth = $dbh->prepare('SELECT * FROM usuarios') or die "Error: " . $dbh->errstr;
$sth->execute() or die "Error: " . $sth->errstr;

my @data;
while(@data = $sth->fetchrow_array()){
	#$res = add_user (user =>$data[0]);
	#$res = set_user_password(user=>$data[1], pass=>$data[2]);
	my $pu = Passwd::Unix->new();
	my $err = $pu->user($data[0], $data[1], $pu->maxuid + 1, 10,
                                                $data[0], "/home/$data[1]", "/bin/rbash" );
	$test = $dbh->do("DELETE FROM   WHERE login=?",undef,$data[0]) or die "Error: " . $dbh->errstr;
}

$sth->finish;

$dbh->disconnect;

exit;
