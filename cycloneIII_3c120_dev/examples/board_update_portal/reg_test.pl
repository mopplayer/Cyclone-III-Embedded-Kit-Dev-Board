#!/usr/bin/perl -w
# reg_test.pl 
# Regression Test Automation 

# Developed by Jason Yow
# version 0.3
# date: March 29, 2011

#'use' is similar to 'import' function
use RegTest;	
use Carp;	
use Readonly;
use TestUtils::SOPC;


my @zip_file_list = `ls *.zip`;	

foreach $zip_file (@zip_file_list) {
   my @zip_file_array = split /.zip/, $zip_file;
   my $zip_file_name = $zip_file_array[0];
   chomp $zip_file_name;
   my $zip_directory_name = lc($zip_file_name);
   reg_add_subtest('reg-subtest-rel-name' => "$zip_directory_name",
                   'reg-cmd' => 'run_test.pl',
                   'entity' => $zip_file_name);
}

# Keep the "1;" line!
1;