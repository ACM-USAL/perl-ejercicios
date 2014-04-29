#!/usr/bin/perl -wT

#use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;
use DBI;

$CGI::POST_MAX = 1024 * 5000;

my $query = new CGI;
my $login = $query->param("login");
my $pass = $query->param("pass");
my $email = $query->param("email");


my $dbh = DBI->connect('DBI:mysql:test', 'perl', 'camello') or die "Error: " . DBI->errstr;



my $test = $dbh->do("INSERT INTO usuarios (LOGIN, PASSWORD, EMAIL) VALUES (?,?,?)", undef,$login,$pass,$email) or die "Error: " . $dbh->errstr;

$dbh->disconnect;

exit;