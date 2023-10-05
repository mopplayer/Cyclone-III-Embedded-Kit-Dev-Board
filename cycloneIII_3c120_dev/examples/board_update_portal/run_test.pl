#!/usr/bin/perl -w
# Regression Test Automation 
# Core System

# Developed by Michael Ooi
# version 0.6
# date: Sep 29, 2011

#============================================================================
# Change log:
# v0.4 - add qmegawiz -silent OPTIONAL_FILES=NONE (No optional files 
#		 are generated, and any existing optional files are deleted.
# v0.5 - add "error:" filter to replace "error" in timing analysis checking 
#        (my @timequest_error_lines = copy_multiple_match_line("$timequest_analyze_log", "error:"))
# v0.6 - Change flow --> Megawizard Update --> SOPC
#
#============================================================================

use RegTest;
use Carp;
use Readonly;
use TestUtils::SOPC;
use File::Copy;

reg_get_options ('entity=s' => \$entity);
print "entity = $entity\n"; 

&unzip_design;	#UNZIP design

# Global Variables Declaration
my $compile_error_exist = 0;
my $sopc_error_exist = 0;
my $timequest_error_exist = 0;

my $sopc_system_name = ""; 
$sopc_system_name = glob '*.sopc';  

my $proj_top = "";
my $updated_megawiz_log = "updated_megawiz_log.out";
my $sopc_generated_log = "sopc_generated_log.out";	
	
my $qpf_filename = glob '*.qpf';
chomp ($qpf_filename);

my $qsf_filename = glob '*.qsf';
chomp ($qsf_filename);





#Function
sub copy_first_match_line
{
   my $file_name = shift(@_) or croak("Missing required argument 'file_name'");
   my $matching_line = shift(@_) or croak("Missing required argument 'matching_line'");
   my $return_line = undef;
   unless(open(FILE, "< $file_name")) {
      die "Fatal Error: Can't open $file_name: $!\n";
   }
   while (my $line = <FILE>) {
      if ($line =~ m/$matching_line/i) {
         $return_line = $line;
         chomp $return_line;
         last
      }
   }
   close(FILE) or die "Can't close $file_name: $!";
   return $return_line;
}


sub copy_multiple_match_line
{
   my $file_name = shift(@_) or croak("Missing required argument 'file_name'");
   my $matching_line = shift(@_) or croak("Missing required argument 'matching_line'");
   my @return_line = undef;
   unless(open(FILE, "< $file_name")) {
      die "Fatal Error: Can't open $file_name: $!\n";
   }
   my $line_count = 0;
   while (my $line = <FILE>) {
      #$line =~ tr/A-Z/a-z/;
      if ($line =~ m/$matching_line/i) {
         $return_line[$line_count] = $line;
         chomp $return_line[$line_count];
         $line_count++;
      }
   }
   close(FILE) or die "Can't close $file_name: $!";
   return @return_line;
}


#--------------------------------------------------------------------------
# MAIN FLOW  
#--------------------------------------------------------------------------

&pre_process;	#pre-processing

&megawizard_generate; #megawizard generation

&sopc_generation;	#sopc generation

&search_qsf_pointer;	#search top level file

&full_compilation; 	#full compilation

&timequest_analyzer;	#timequest analyzer

#--------------------------------------------------------------------------
# UNZIP Design 
#--------------------------------------------------------------------------
sub unzip_design 
{
	print "\n************************************************************";
	print "\nExpanding Design ...";
	print "\n************************************************************\n";

	print "\nThis design ZIP filename = $entity.zip\n"; 
	system (`unzip -o $entity."zip"`);
}

#--------------------------------------------------------------------------
# Pre-Processing Files Design 
#--------------------------------------------------------------------------
sub pre_process 
{
	system (`rm -f *.qar`);	 #Remove old qar 
	system (`rm -f *.rpt`);	 #Remove old rpt 
	system (`rm -f *.jpg`);	 #Remove old jpg 
	system (`rm -f *.zip`);	 #Remove old zip 
	system (`rm -f *.rout`); #Remove old rout
	system (`rm -f *.sof`);	 #Remove old sof 
	system (`rm -f *.pof`);	 #Remove old pof 
	system (`rm -f *.out`);	 #Remove old out_log 	
	
	# To ensure that *.qsf is equal to *.qpf
	#print "\nStart Checking *.qsf vs *.qpf filename\n";
	#if ($qpf_filename ne $qsf_filename) {
	#	reg_put_to_reg_rout('$qpf_filename.qsf filename is not same as qsf_filename.qpf');
	#	reg_put_to_reg_rout('Please ensure $qpf_filename.qsf filename is same as qsf_filename.qpf');
	#}
}

#--------------------------------------------------------------------------
# SOPC Instantiate & Compilation 
#--------------------------------------------------------------------------
sub sopc_generation 
{
	print "\n************************************************************";
	print "\nSOPC Generation...";
	print "\n************************************************************\n";
	reg_put_to_reg_rout('-------------------------------------------------------------');
	reg_put_to_reg_rout('SOPC--->check the system has SOPC? is starting....');	
	
	if ($sopc_system_name) {
		print "\nThis design has SOPC system = $sopc_system_name\n";
		
		system("sopc_builder --generate $sopc_system_name --no_splash --cmd=save_system");
		copy("sopc_builder_log.txt","sopc_generated_log.out");
		
		#print "Info: el_camino_sd_card_controller: Actual Rate = 15000.0 kHz  Error: -25.0\n";								
		my @sopc_error_lines = copy_multiple_match_line("$sopc_generated_log", "error:");
			foreach $sopc_error_line (@sopc_error_lines) {
			   if (
					($sopc_error_line =~ m/error:/i) &&
					($sopc_error_line !~ m/stdout/i) &&
					($sopc_error_line !~ m/el_camino_sd_card_controller/i)	
				  )				  
				{
				  reg_put_to_reg_rout("$sopc_error_line");
				  $sopc_error_exist = 1;
			    }
			}
			reg_put_to_reg_rout('SOPC--->complete checking whether the system has SOPC');
	
	} else {
		print "\nThis design DO NOT have SOPC system\n"; 
		reg_put_to_reg_rout('SOPC--->complete checking whether the system has SOPC');
	}

}		


#---------------------------------------------------------------------------------------------------------
# Megawizard Instantiate & Update
# If design example has SOPC, do not regenerate megawizard as this will cause a crash to the SOPC system
#---------------------------------------------------------------------------------------------------------
sub megawizard_generate
{
	#if ($sopc_system_name) {
	#	print "\nThis design has SOPC system. Ignore Megawizard re-generation\n"; 
	#}
	#else {
		opendir(CURRDIR, '.');
			my $file = "";
			while (defined($file = readdir (CURRDIR))) {
				# List out all .v & .vhd files
				if (-f $file and $file =~ /(\.v|\.vhd)$/) {	
				#print "File is .v or .vhd  = $file\n";
					if ($file !~ (m/_bb|_inst|_syn/i)) {
						#print ".v & .vhd not end with _bb, _inst, _syn  = $file\n";
						$megawiz_v = 0;
					
						# Open input file in read mode
						open FILECONTENT, "<", $file;
					
						# Read the input file line by line
						while ($line_content = <FILECONTENT>) {
							if ($line_content =~ m/megafunction wizard: %Altera SOPC Builder%/i) {
								$megawiz_v = 0;
							}
							elsif ($line_content =~ m/megafunction wizard:/i) {
								$megawiz_v = 1;
							}
						}
						close FILECONTENT;
						if ($megawiz_v == 1) {
							print "Update this Megawizard file = $file\n";
							push(@all_megawiz_files, "$file"); 
							#update megawizard 
							system("qmegawiz -silent OPTIONAL_FILES=NONE $file");	
						} 
						elsif ($megawiz_v == 0) {
							print "This is not Megawizard file = $file\n";
						}
					}
			
				}
			}
		closedir(CURRDIR);

		#write updated megawiz into a txt
		open DA, ">>$updated_megawiz_log";
		foreach my $megawiz_file (@all_megawiz_files){
			print DA "$megawiz_file\n";
			}
		close(DA);
	#}
}

#---------------------------------------------------------------------------------------------------------	
# TOP LEVEL QSF
#---------------------------------------------------------------------------------------------------------
sub search_qsf_pointer {
	print "\n************************************************************";
	print "\nIdentify TOP_LEVEL_ENTITY ...";
	print "\n************************************************************\n";

	opendir(CURRDIR, '.') or die "Can't open directory, exiting.\n";
	my $file = "";
	while (defined($file = readdir (CURRDIR))) {
		if ($file =~ (m/.qpf/i)) {
			open QPF_FILE, "<", $file or die "Can't open $file, exiting.\n";
			
			# Read the input file line by line
			while ($line_content = <QPF_FILE>) {
				if ($line_content =~ m/PROJECT_REVISION =/i) {				
					  # read the fields in the current record into an array
					  @proj_revision = split("PROJECT_REVISION = ", $line_content);
					  $proj_top = $proj_revision[1];					
					  $proj_top =~ s/[^a-zA-Z0-9=_-]*//g;		#keep only A-Z a-Z 0-9 _ = - charactor
					  print "proj_top=$proj_top\n";	
				}
			}
			close QPF_FILE;													
		}
	}
	closedir(CURRDIR);
}	
#----------------------------------------------------------------------
# Full compilation flow
#----------------------------------------------------------------------
sub full_compilation
{
	print "\n************************************************************";
	print "\nFull Compilating Project ...";
	print "\n************************************************************\n";
	reg_put_to_reg_rout('-------------------------------------------------------------');
	reg_put_to_reg_rout('COMPILE--->Full Compile design flow is starting....');	

		if($sopc_error_exist == 1){
			reg_put_to_reg_rout('Failed to perform full compilation due to SOPC generationg ERROR');
		} 
		else {	
			#reg_quartus_standalone("$entity\_compile.out", "sh", "--flow compile $toplevel");
			system("quartus_sh --flow compile $proj_top >> $entity\_compile.out");	
		
			my @compile_error_lines = copy_multiple_match_line("$entity\_compile.out", "error:");
			foreach $compile_error_line (@compile_error_lines) {
			   if ($compile_error_line =~ m/error:/i) {
				  reg_put_to_reg_rout("$compile_error_line");
				  $compile_error_exist = 1;
			   }
			}
			if ($compile_error_exist == 0) {
			   reg_put_to_reg_rout('COMPILE--->Full Compile design flow PASSED');
			}
		}
}

#----------------------------------------------------------------------
# TimeQuest Analyzer flow
#----------------------------------------------------------------------
sub timequest_analyzer
{
	my $timequest_analyze_log = "timequest_analyze_log.out";
	my $timequest_validate_tcl = "timequest_validate.tcl";

	print "\n************************************************************";
	print "\nTimeQuest Analyzing Project ...";
	print "\n************************************************************\n";
	reg_put_to_reg_rout('-------------------------------------------------------------');
	reg_put_to_reg_rout('TIMEQUEST--->TimeQuest Analyzer flow is starting....');

		if ($compile_error_exist == 1 || $sopc_error_exist == 1) {
			reg_put_to_reg_rout('FAILED to perform TimeQuest Analyzer due to compilation error');
		}
		else {
			print "\nTimeQuest Analyzing using $timequest_validate_tcl\n";
			print "Currently checking the Top Failing Path only\n";

			system("quartus_sta -t $timequest_validate_tcl >> $timequest_analyze_log");

			# violated
			my @timequest_violated_lines = copy_multiple_match_line("$timequest_analyze_log", "violated");
			foreach $timequest_violated_line (@timequest_violated_lines) {
			   if ($timequest_violated_line =~ m/violated/i) {
				  reg_put_to_reg_rout("$timequest_violated_line");
				  $timequest_error_exist = 1;
			   }
			}
			
			# TIMEQUEST_TIMING_ANALYZER=OFF
			my @timequest_TQOFF_lines = copy_multiple_match_line("$timequest_analyze_log", "TIMEQUEST_TIMING_ANALYZER=OFF");
			foreach $timequest_TQOFF_line (@timequest_TQOFF_lines) {
			   if ($timequest_TQOFF_line =~ m/TIMEQUEST_TIMING_ANALYZER=OFF/i) {
				  reg_put_to_reg_rout("$timequest_TQOFF_line");
				  $timequest_error_exist = 2;
			   }
			}
			
			# error
			my @timequest_error_lines = copy_multiple_match_line("$timequest_analyze_log", "error:");
			foreach $timequest_error_line (@timequest_error_lines) {
			   if (
					($timequest_error_line !~ m/0 error/i) && 
			        ($timequest_error_line =~ m/error:/i) 
				  ) 
                {
					reg_put_to_reg_rout("$timequest_error_line");	
					$timequest_error_exist = 3;
				}   
			}
			
			print "timequest_error_exist =$timequest_error_exist\n";
			if ($timequest_error_exist == 0) {
			   reg_put_to_reg_rout('TIMEQUEST--->TimeQuest Analyzer flow PASSED');
			}
		}
}


#######################################################################
#----------------------------------------------------------------------
# Abandon Archive Function. Instead replace with ZIP format
#----------------------------------------------------------------------
sub archive_qar
{
reg_put_to_reg_rout('-------------------------------------------------------------');
reg_put_to_reg_rout('ARCHIVE-->Archive flow is starting....');

	if ($compile_error_exist == 1 || $sopc_error_exist == 1) {
		reg_put_to_reg_rout('FAILED to archive project QAR due to compilation error');	
	}
	else {
		print "\n************************************************************";
		print "\nAchiving Project ...";
		print "\n************************************************************\n";

		my $entity_project_name = glob '*.qpf';
		reg_quartus_standalone("$entity\_archive.out", "sh", "--archive $entity_project_name");
		
		my @archive_error_lines = copy_multiple_match_line("$entity\_archive.out", "error:");
		foreach $archive_error_line (@archive_error_lines) {
			if ($archive_error_line =~ m/error:/i) {
				reg_put_to_reg_rout("$archive_error_line");
				$archive_error_exist = 1;
			}
		}
		if ($archive_error_exist == 0) {
			reg_put_to_reg_rout('ARCHIVE-->Archive project QAR flow PASSED');
		}
	}
}
#------------------------------------------------------------------------------
# Abandon Restore Function. No longer checkin design example with .qar format
# Restore project
#------------------------------------------------------------------------------
sub restore_qar 
	{
	print "\n************************************************************";
	print "\nRestoring Project ...";
	print "\n************************************************************\n";
	reg_put_to_reg_rout('-------------------------------------------------------------');
	reg_put_to_reg_rout('RESTORE--->project QAR flow is starting....');
	reg_quartus_standalone("$entity\_restore.out", "sh", "--restore $entity_qar_name");

	my @restore_error_lines = copy_multiple_match_line("$entity\_restore.out", "error:");
	foreach $restore_error_line (@restore_error_lines) {
	   if ($restore_error_line =~ m/error:/i) {
		  reg_put_to_reg_rout("$restore_error_line");
		  $restore_error_exist = 1;
	   } 
	} if ($restore_error_exist == 0) {
	   reg_put_to_reg_rout('RESTORE--->project QAR flow PASSED');
	}
}
##########################################################################################
# Keep the "1;" line!
1;