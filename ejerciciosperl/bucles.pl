#!/usr/bin/env perl
#Un simple ejemplo utilizando bucles en Perl

$var;
while($var < 10){
	$var++;
	print $var;
}
print "\n";
print "Lo mismo, pero con until\n";
$var=0;
until($var >= 10){
	$var++;
	print $var;
}
print "\n" . "Lo mismo, pero con do" . "\n";
$var = 0;
do{
	$var++;
	print $var;
}until($var >= 10);
print "\n";
print "Lo mismo, pero con for\n";
for($var=1;$var<=10;$var++){
	print $var;
}
print "\n";
print "Lo mismo, pero con foreach\n";
@numeros = (1,2,3,4,5,6,7,8,9,10);
foreach (@numeros){
	print $_;
}
print "\n";
