#!/usr/bin/perl
use DBI;
#
#
if(!open(PLOT,"lists/plot.list")) {
   print "Could not open plot list\n";
   exit;
}
$dbh = DBI->connect('dbi:mysql:movies','root','root') or die "Connection Error: $DBI::errstr\n";

while($line = <PLOT>) {


	if($line =~ /MV: ([\w\W\d\D]+) \(([\w\W\d\D]+)\) \{([\w\W\d\D]+)\}/) {
	    $title = $1;
	    $year = $2;
	    $episode = $3;
	    $title =~ s/\"//g;
	} elsif($line =~ /MV: ([\w\W\d\D]+) \(([\w\W\d\D]+)\)/) {
	    $title = $1;
	    $year = $2;
	    $title =~ s/\"//g;
	#} elsif($line =~ /^PL:/) {
	#  do {
	#	$plot .= <PLOT>;
	#   } while ($plot != /^MV:/);
	} 

	


#	$sql = "INSERT into movie (title,year,episode) values(?,?,?)";
#	$sth = $dbh->prepare($sql);
#	$sth->execute($title,$year,$episode);
	#if($plot) {
	  print "$title, $year, $episode ($plot)\n";	
	#  $plot = '';
	#}
}
	
#MV: !Women Art Revolution (2010)
#
#PL: Through intimate interviews, provocative art, and rare, historical film and
#PL: video footage, this feature documentary reveals how art addressing
#PL: political consequences of discrimination and violence, the Feminist Art
#PL: Revolution radically transformed the art and culture of our times.
#
#BY: Anonymous
#
#-------------------------------------------------------------------------------
#MV: "$#*! My Dad Says" (2010) {Code Ed (#1.4)}

