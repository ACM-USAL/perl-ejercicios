#!/usr/bin/env perl
use warnings;
open $log, '<',$ARGV[0] or die "Error en la apertura del fichero";
while(my $line = <$log>){
	unless($line =~ /[a-zA-Z][a-zA-Z0-9]+:.*:\d+:\d+:.*:\/.*:\/.*/){
		print "El archivo no está íntegro\n";
		close $log;	
		exit;	
	}	
}
print "El archivo está íntegro\n"; 
close $log;

