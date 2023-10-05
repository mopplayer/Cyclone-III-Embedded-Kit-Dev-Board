## Generated SDC file "cycloneIII_3c120_dev_niosII_standard.sdc"

## Copyright (C) 1991-2007 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 7.2 Internal Build 127 08/06/2007 SJ Full Version"

## DATE    "Tue Aug 14 09:53:56 2007"

##
## DEVICE  "EP3C120F780C8"
##

#derive_pll_clocks

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3


#**************************************************************
# Create Clock
#**************************************************************

create_clock -period 20 -name clkin_50 [get_ports {clkin_50}]
create_clock -period 100 -name tck [get_ports {altera_reserved_tck}]

#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name this_cycloneIII_3c120_dev_niosII_standard_SOPC|the_sys_pll|the_pll|altpll_component|auto_generated|pll1|clk[0] -source [get_ports {clkin_50}] -divide_by 10 -multiply_by 17 this_cycloneIII_3c120_dev_niosII_standard_SOPC|the_sys_pll|the_pll|altpll_component|auto_generated|pll1|clk[0] -add

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -exclusive -group this_cycloneIII_3c120_dev_niosII_standard_SOPC|the_sys_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]
set_clock_groups -exclusive -group clkin_50
set_clock_groups -exclusive -group tck

#**************************************************************
# Set False Path
#**************************************************************


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************

