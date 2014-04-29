#!/usr/bin/perl

my($day, $mon, $year) = (localtime)[3..5];
$year+=1900;
$mon++;
print "Content-type: text/html\n\n";
print <<HTML;
<html>

<head><h1>Hello, world!</h1>
<title>Hello, World!</title>
</head>
<body>
<p>Hello, World, today is $mon, $day, $year</p>
</body
HTML
exit;


