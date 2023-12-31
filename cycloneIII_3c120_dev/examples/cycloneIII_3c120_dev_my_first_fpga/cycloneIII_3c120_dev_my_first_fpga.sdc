###########################################################################
#
# Generated by : Version 7.2 Internal Build 86 06/10/2007 SJ Full Version
#
# Project      : cycloneIII_3c120_dev_myfirstfpga
# Revision     : cycloneIII_3c120_dev_myfirstfpga
#
# Date         : Thu Jun 14 18:16:50 PDT 2007
#
###########################################################################
#cycloneIII_3c120_dev_myfirstfpga.sdc 


# Original Clock Setting Name: clkin_50
create_clock -period "20.000 ns" \
             -name {clkin_50} {clkin_50}
# ---------------------------------------------

# ------------------------------------------
#
# Create generated clocks based on PLLs
derive_pll_clocks -use_tan_name
#
# ------------------------------------------

# ** Clock Latency
#    -------------

# ** Clock Uncertainty
#    -----------------

# ** Multicycles
#    -----------
# ** Cuts
#    ----

# ** Input/Output Delays
#    -------------------
set_output_delay -clock [get_clocks {pll:inst1|altpll:altpll_component|pll_altpll:auto_generated|wire_pll1_clk[0]}] \
                 -max 10 [get_ports user_led*]
set_output_delay -clock [get_clocks {pll:inst1|altpll:altpll_component|pll_altpll:auto_generated|wire_pll1_clk[0]}] \
                 -min 1 [get_ports user_led*]

# ** Set False paths
#    ---------------  
#user_pb[0] is asycronouse and therefore we will not analyze its timing
#so it is set as a false path
set_false_path -from [get_ports {user_pb[0]}]

# ** Tpd requirements
#    ----------------

# ** Setup/Hold Relationships
#    ------------------------

# ** Tsu/Th requirements
#    -------------------


# ** Tco/MinTco requirements
#    -----------------------

#
# Entity Specific Timing Assignments found in
# the Timing Analyzer Settings report panel
#


# ---------------------------------------------

