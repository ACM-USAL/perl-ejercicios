#!/usr/bin/perl -wT
#use Crypt;
#use strict;
use DBI;
use Digest::MD5;
my $dbh = DBI->connect('DBI:mysql:test', 'perl', 'camello') or die "Error: " . DBI->errstr;
my $ejec = $dbh->prepare("INSERT INTO usuarios VALUES (?,?,?)") or die "Error: " . $dbh->errstr;

while($line = <STDIN>){

#chomp $line;
@valores = split(',',$line);
#my $hashed = Crypt::Password::password($valores[1], undef, "sha512");
$hashed = Digest::MD5::md5($valores[1]);
$ejec->execute($valores[0],$hashed,$valores[2]);
}

#$ejec->commit;
$ejec->finish;
$dbh->disconnect;
