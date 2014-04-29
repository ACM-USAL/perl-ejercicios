#!/usr/bin/perl -wT

use DBI;
my $dbh = DBI->connect('DBI:mysql:test', 'perl', 'camello') or die "Error: " . DBI->errstr;

my $consulta = $dbh->prepare('SELECT * FROM usuarios') or die 'Error: ' .DBI->errstr;

$consulta->execute() or die "Error: " . $consulta->errstr;
my @usuarios;

if($consulta->rows() == 0)
{
	print "Aún no hay usuarios"."\n";
}

while(@usuarios = $consulta->fetchrow_array())
{
	print $usuarios[0] . ", " . $usuarios[2] . "\n";
}

$consulta->finish;

$dbh->disconnect;
