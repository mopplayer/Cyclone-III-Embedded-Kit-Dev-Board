## Generated SDC file "cycloneIII_3c120_dev_power.sdc"

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
## VERSION "Version 7.1 Internal Build 138 03/20/2007 TO Full Version"

## DATE    "Fri Mar 30 07:06:00 2007"

##
## DEVICE  "EP3C120F780C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {i_clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {i_clk}] -add

#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {cgen|pll|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {cgen|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -master_clock {i_clk} [get_pins {cgen|pll|altpll_component|auto_generated|pll1|clk[0]}] -add
create_generated_clock -name {cgen|pll|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {cgen|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -divide_by 3 -master_clock {i_clk} [get_pins {cgen|pll|altpll_component|auto_generated|pll1|clk[1]}] -add
create_generated_clock -name {cgen|pll|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {cgen|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -divide_by 3 -master_clock {i_clk} [get_pins {cgen|pll|altpll_component|auto_generated|pll1|clk[2]}] -add
create_generated_clock -name {cgen|pll|altpll_component|auto_generated|pll1|clk[3]} -source [get_pins {cgen|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 4 -master_clock {i_clk} [get_pins {cgen|pll|altpll_component|auto_generated|pll1|clk[3]}] -add

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

set_clock_groups -exclusive -group [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[1] cgen|pll|altpll_component|auto_generated|pll1|clk[2]}]
set_clock_groups -exclusive -group [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[0] cgen|pll|altpll_component|auto_generated|pll1|clk[2]}]
set_clock_groups -exclusive -group [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[0] cgen|pll|altpll_component|auto_generated|pll1|clk[1]}]

#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[3]}]  -to  [get_clocks {cgen|pll|altpll_component|auto_generated|pll1|clk[0] cgen|pll|altpll_component|auto_generated|pll1|clk[1] cgen|pll|altpll_component|auto_generated|pll1|clk[2]}]
set_false_path -from [get_ports {i_nfreq_next i_noutput_ena i_nperc_next i_nrst i_noutput_ena_next}] -to *
set_false_path -from * -to [get_ports {o_outputs[0] o_outputs[1] o_outputs[2] o_outputs[3] o_outputs[4] o_outputs[5] o_outputs[6] o_outputs[7] o_outputs[8] o_outputs[9] o_outputs[10] o_outputs[11] o_outputs[12] o_outputs[13] o_outputs[14] o_outputs[15] o_outputs[16] o_outputs[17] o_outputs[18] o_outputs[19] o_outputs[20] o_outputs[21] o_outputs[22] o_outputs[23] o_outputs[24] o_outputs[25] o_outputs[26] o_outputs[27] o_outputs[28] o_outputs[29] o_outputs[30] o_outputs[31] o_outputs[32] o_outputs[33] o_outputs[34] o_outputs[35] o_outputs[36] o_outputs[37] o_outputs[38] o_outputs[39] o_outputs[40] o_outputs[41] o_outputs[42] o_outputs[43] o_outputs[44] o_outputs[45] o_outputs[46] o_outputs[47] o_outputs[48] o_outputs[49] o_outputs[50] o_outputs[51] o_outputs[52] o_outputs[53] o_outputs[54] o_outputs[55] o_outputs[56] o_outputs[57] o_outputs[58] o_outputs[59] o_outputs[60] o_outputs[61] o_outputs[62] o_outputs[63] o_outputs[64] o_outputs[65] o_outputs[66] o_outputs[67] o_outputs[68] o_outputs[69] o_outputs[70] o_outputs[71] o_outputs[72] o_outputs[73] o_outputs[74] o_outputs[75] o_outputs[76] o_outputs[77] o_outputs[78] o_outputs[79] o_outputs[80] o_outputs[81] o_outputs[82] o_outputs[83] o_outputs[84] o_outputs[85] o_outputs[86] o_outputs[87] o_outputs[88] o_outputs[89] o_outputs[90] o_outputs[91] o_outputs[92] o_outputs[93] o_outputs[94] o_outputs[95] o_outputs[96] o_outputs[97] o_outputs[98] o_outputs[99] o_outputs[100] o_outputs[101] o_outputs[102] o_outputs[103] o_outputs[104] o_outputs[105] o_outputs[106] o_outputs[107] o_outputs[108] o_outputs[109] o_outputs[110] o_outputs[111] o_outputs[112] o_outputs[113] o_outputs[114] o_outputs[115] o_outputs[116] o_outputs[117] o_outputs[118] o_outputs[119] o_outputs[120] o_outputs[121] o_outputs[122] o_outputs[123] o_outputs[124] o_outputs[125] o_outputs[126] o_outputs[127] o_outputs[128] o_outputs[129] o_outputs[130] o_outputs[131] o_outputs[132] o_outputs[133] o_outputs[134] o_outputs[135] o_outputs[136] o_outputs[137] o_outputs[138] o_outputs[139] o_outputs[140] o_outputs[141] o_outputs[142] o_outputs[143] o_outputs[144] o_outputs[145] o_outputs[146] o_outputs[147] o_outputs[148] o_outputs[149] o_outputs[150] o_outputs[151]}]
set_false_path -from * -to [get_ports {o_nfreq_state[0] o_nfreq_state[1] o_nperc_state[0] o_nperc_state[1] o_nperc_state[2] o_nperc_state[3] o_nperc_state[4] o_noutput_ena_state}]

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

