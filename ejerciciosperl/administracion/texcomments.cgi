#!/usr/bin/perl -wT

use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;

$CGI::POST_MAX = 1024 * 5000;
my $safe_filename_characters = "a-zA-Z0-9_.-";
my $upload_dir = "/var/www/administracion/download";

my $query = new CGI;
my $filename = $query->param("tex");

if ( !$filename )
{
	print $query->header ( );
	print "There was a problem uploading your photo (try a smaller file).";
	exit;
}

my ( $name, $path, $extension ) = fileparse ( $filename, '..*' );
$filename = $name . $extension;
$filename =~ tr/ /_/;
$filename =~ s/[^$safe_filename_characters]//g;

if ( $filename =~ /^([$safe_filename_characters]+)$/ )
{
	$filename = $1;
}
else
{
	die "Filename contains invalid characters";
}

my $upload_filehandle = $query->upload("tex");

open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> )
{
	print UPLOADFILE;
}

#my $r = CGI::Easy::Request->new();
#    my $h = CGI::Easy::Headers->new();

#my $data = send_file($r, $h, "$upload_dir/$filename");
#print $h->compose();
#print ${$data};

open(my $file, "/var/www/administracion/download/$filename");
my $newname = $filename;
$newname =~s/\./\.nocomment\./ig;

print "Content-type: application/x-gzip\n";
print "Content-Disposition: attachment; filename=$newname\n";
print "Content-Description: File to download\n\n";

#my $aux = <UPLOADFILE>;
#close(UPLOADFILE);
#my $aux = "Patata";


#my $aux = $newname;
#$aux = "The filename is" . $newname . "random";
my $auxiliar;
while(my $line = <$file>){
	#$auxiliar += $line;
	#$auxiliar += "The filename is" . $newname . "random";
	#my $aux += $line unless ($line =~/(^\s)*%.*/);
	#print $out $line unless ($line =~/(^[^%]*%)|(^\s)*%.*/); 
	#print "Here";
	#print $line;
	#print $line unless ($line =~/(^[^%]*%)|(^\s)*%.*/);
	#my $help = my $line;
	#if($help ~= m/([a-zA-Z0-9_]|\s)+%.*/){
	#	$help =~s/%+.*/''/i;
	#} 
	#my $a = $line;
	#if($a ~= m/patata/){
	#	print "A";
	#}
	print $line unless ($line =~/(^[^%]*%)|(^\s)*%.*/);
}

#$aux = $auxiliar;

#print $aux;


#close UPLOADFILE;

#print $query->header ( );
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thanks!</title>
<style type="text/css">
img {border: none;}
</style>
</head>
<body>
<p>Thanks for uploading your photo!</p>
<p>Your photo: $filename</p>
</body>
</html>
END_HTML
