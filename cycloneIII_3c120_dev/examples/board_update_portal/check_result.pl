#!/usr/bin/perl -w
# Reporting Tool for Dev Kit Regression Test 

# Developed by Jason Yow
# version 0.2
# date: Nov 09, 2010


use Cwd;



# dev kit folder declaration
my $current_devkit_jpg = glob '*.jpg';
my $current_devkit_report = "devkit_report.html";

@current_devkit_array = split(".jpg", $current_devkit_jpg);
print "top 0 = $current_devkit_array[0]\n";	
$current_devkit = $current_devkit_array[0];


# starting flow message
print "\n************************************************************";
print "\nRegression Test Reporting Tool";
print "\n************************************************************\n";
print "\nWelcome to \"$current_devkit\" Reporting Tool\n";
print "To view report, click on the following \"$current_devkit_report\"\n\n";


# Remove old reports.html
system ("rm -f $current_devkit_report");	

# Main classes
open OUT, ">$current_devkit_report" or die "Can't open html file: $!\n";
	&printhead();
	&processfiles();
	&printtail();


# sub classes 
sub printhead {
#	my $curr = cwd();
#	print "\ncurrent directory = $curr\n";
	print OUT "<html>\n<head>\n";
	print OUT "<title>$current_devkit Regression Test Report</title>\n";
	print OUT "</head>\n<body>\n";
	print OUT "<h1 align=\"center\"><font color=\"#000000\">Welcome to the </h1>\n";
	print OUT "<h1 align=\"center\"><font color=\"#000000\">Regression Test Reporting Tool</h1>\n";
	print OUT "<hr>";
	print OUT"<p class=\"side\"><img height=\"250\" hspace=\"0\" src=\"$current_devkit.jpg\" width=405 border=0></p>";
	print OUT "<h1><font color=\"#000000\">Regression Test Report:<font color =\"#0000ff\"> $current_devkit</font></h1>\n";
	print OUT "<p>";
}



sub processfiles {

	# First, it reads the directory. 
	# Since map expects a list, readdir returns a list of all files in the directory. 
	# "map" generates a list with the name of each file which is a directory (or undef if the -d test fails). 
	# "sort" puts the list in ASCII-betical order. 
	# "reverse" reverses the list.
	opendir (SUBDIR, '.'), or die "Can't read this directory, where am I?\n";
	my @all_sub_dir = reverse sort map { -d $_ ? $_ : () } readdir (SUBDIR);
	closedir (SUBDIR);
	#print "All available sub-directories are=@all_sub_dir\n";
	
	$number_of_subdir = @all_sub_dir;				# return total number of sub-dir + 2
	#print "Total have $number_of_subdir minus 2 of sub-directory\n";
	
	$counter = 0;
#	while ($counter < ($number_of_subdir -2))	{	# MUST '-2'. The last 2 sub-dir is ' & ''
	while ($counter < $number_of_subdir)	{		# MUST '-2'. The last 2 sub-dir is ' & ''	
		# change to the 1st sub-dir inside @all_sub_dir[0]
		chdir "$all_sub_dir[$counter]";				
		# already inside sub-dir
		#my $sub_dir = cwd();						
		#print "\nInsert data for $sub_dir\n";			
		
		# check this design PASS or FAIL
		my @all_pass_fail = glob("*pass *fail");
		foreach my $pass_fail (@all_pass_fail) {
			if ($pass_fail eq "pass") {
					print OUT "<font color=\"#000000\" size=\"5\"><strong>Subtest: <font color =\"#0000ff\">$all_sub_dir[$counter]</strong></font></p>\n";
					print OUT "<p><font color=\"#008040\" size=5\"\"><strong> Result: $pass_fail </strong></font></p>\n";		
				}
			elsif ($pass_fail eq "fail") {
					print OUT "<font color=\"#000000\" size=\"5\"><strong>Subtest: <font color =\"#0000ff\">$all_sub_dir[$counter]</strong></font></p>\n";
					print OUT "<p><font color=\"#ff0000\" size=\"5\"><strong> Result: $pass_fail </strong></font></p>\n";
				}
			else { 
					#print "Not fail nor pass. Please re-run the reg_exe\n";
				}
		}
		
		# start seaching files inside each sub-dir, list them in html 
		opendir(CURRDIR_TOP, '.') or die "Can't open directory, exiting.\n";
		my $file = "";
		while (defined($file = readdir (CURRDIR_TOP))) {
				# print Quartus Version Info
				if ($file =~ (m/map.summary/i)) {
					open VERSIONOUT, "<", $file or die "Can't open restore.log, exiting.\n";
				
					# Read the input file line by line
					while ($line_content = <VERSIONOUT>) {
						if ($line_content =~ m/Build/i) {
							print OUT "<h1><font color=\"#000000\" size=4>Evaluated with Quartus version:<font color =\"#0000ff\"> $line_content</font></h1>\n";
						}
					}
					close VERSIONOUT;													
				}
				
				# updated .sof link
				if ($file =~ (m/.sof/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> Updated .sof: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file\">$file</a><br /></font>\n";							
				}	

				# updated .qar link
				if ($file =~(m/.qar/i)) {
					if ($file =~(m/.qarlog/i)) {
						#print OUT "<strong><font color=\"#000000\" size=3> Updated .qar Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file\">$file</a><br /></font>\n";							
					} else {
							print OUT "<strong><font color=\"#000000\" size=3> Updated .qar: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file\">$file</a><br /></font>\n";							
						}
				}

				# reg.rout link
				elsif ($file =~ (m/reg.rout/i)) {	
					print OUT "<strong><font color=\"#000000\" size=3> Summary (reg.rout): </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file\">$file</a><br /></font>\n";							
				}

				
		}
		closedir(CURRDIR_TOP);
		print OUT "<p>";
		
		# start seaching files inside each sub-dir, list them in html 
		opendir(CURRDIR, '.') or die "Can't open directory, exiting.\n";
		my $file2 = "";
		while (defined($file2 = readdir (CURRDIR))) {
		
				# reg.rout link
	#		if ($file2 =~ (m/reg.rout/i)) {	
	#				print OUT "<strong><font color=\"#000000\" size=3> Summary (reg.rout): </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
	#			}
				
				# _restore.out link
				if ($file2 =~ (m/_restore.out/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> Restore Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
				}
				
				# _compile.out link
				if ($file2 =~ (m/_compile.out/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> Compile Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
				}
				
				# _archive.out link
				if ($file2 =~ (m/_archive.out/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> Archive Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
				}
				
				# sopc_generated_log.out link
				if ($file2 =~ (m/sopc_generated_log.out/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> SOPC generated Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
				}
				
				# updated_megawiz_log.out link
				if ($file2 =~ (m/updated_megawiz_log.out/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> List of updated Megawizard Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
				}
				
				# timequest_analyze_log.out link
				if ($file2 =~ (m/timequest_analyze_log.out/i)) {
					print OUT "<strong><font color=\"#000000\" size=3> TimeQuest Analyzer Log: </strong></font><font color=\"#0000ff\" size=3><a href=\"$all_sub_dir[$counter]/$file2\">$file2</a><br /></font>\n";							
				}				
		}
		closedir(CURRDIR);
		print OUT "<p>\&nbsp;</p>\n";
		chdir "..";		# change back to parant directory
		$counter++;	
		sleep (0);		# delay 0 sec
	}
}


sub printtail {
	print OUT "</p></body></html>\n";
	close OUT;
}

##################################################################
