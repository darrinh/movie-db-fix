#!/usr/bin/perl
use DBI;
#
#
if(!open(MOVIES,"lists/movies.list")) {
   print "Could not open movies list\n";
   exit;
}

$dbh = DBI->connect('dbi:mysql:movies','root','root') or die "Connection Error: $DBI::errstr\n";

while($line = <MOVIES>) {
	if($line =~ /([\w\W\d\D]+) \(([\w\W\d\D]+)\) \{([\w\W\d\D]+)\}/) {
	    $title = $1;
	    $year = $2;
	    $episode = $3;
	    $title =~ s/\"//g;
	} elsif($line =~ /([\w\W\d\D]+) \(([\w\W\d\D]+)\)/) {
	    $title = $1;
	    $year = $2;
	    $title =~ s/\"//g;
	} else {
	   print "No Match for ($line)\n";
	   next;
	}

	$sql = "INSERT into movie (title,year,episode) values(?,?,?)";
	$sth = $dbh->prepare($sql);
	$sth->execute($title,$year,$episode);
	print "Inserted ( $title )\n";	
}

