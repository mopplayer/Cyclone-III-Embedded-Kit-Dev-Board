## Generated SDC file "bts_general.sdc"

## Copyright (C) 1991-2011 Altera Corporation
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
## VERSION "Version 11.1 Build 173 11/01/2011 SJ Full Version"

## DATE    "Mon Nov 14 14:42:28 2011"

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

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {clk_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clkin_50}]
create_clock -name {clk_125} -period 8.000 -waveform { 0.000 4.000 } [get_ports {clkin_125}]
create_clock -name {enet_rx_clk} -period 8.000 -waveform { 2.000 6.000 } [get_ports {enet_rx_clk}]
create_clock -name {virtual_phy_clk} -period 8.000 -waveform { 0.000 4.000 } 


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {enet_pll_125} -source [get_ports {clkin_125}] -master_clock {clk_125} [get_pins -compatibility_mode {*|the_enet_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {enet_pll_25} -source [get_ports {clkin_125}] -divide_by 5 -master_clock {clk_125} [get_pins -compatibility_mode {*|the_enet_pll|the_pll|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {enet_pll_2p5} -source [get_ports {clkin_125}] -divide_by 50 -master_clock {clk_125} [get_pins -compatibility_mode {*|the_enet_pll|the_pll|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {tx_clk_125} -source [get_pins {*|the_enet_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] -master_clock {enet_pll_125} [get_nets {tx_clk_to_the_tse_mac}] -add
create_generated_clock -name {tx_clk_25} -source [get_pins {*|the_enet_pll|the_pll|altpll_component|auto_generated|pll1|clk[1]}] -master_clock {enet_pll_25} [get_nets {tx_clk_to_the_tse_mac}] -add
create_generated_clock -name {tx_clk_2p5} -source [get_pins {*|the_enet_pll|the_pll|altpll_component|auto_generated|pll1|clk[2]}] -master_clock {enet_pll_2p5} [get_nets {tx_clk_to_the_tse_mac}] -add
create_generated_clock -name {enet_gtx_clk_125} -source [get_nets {tx_clk_to_the_tse_mac}] -master_clock {tx_clk_125} [get_ports {enet_gtx_clk}] -add
create_generated_clock -name {enet_gtx_clk_25} -source [get_nets {tx_clk_to_the_tse_mac}] -master_clock {tx_clk_25} [get_ports {enet_gtx_clk}] -add
create_generated_clock -name {enet_gtx_clk_2p5} -source [get_nets {tx_clk_to_the_tse_mac}] -master_clock {tx_clk_2p5} [get_ports {enet_gtx_clk}] -add


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_50}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_50}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_50}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_50}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_125}] -setup 0.080 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_125}] -hold 0.110 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_125}] -setup 0.080 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_125}] -hold 0.110 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_25}] -setup 0.080 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_25}] -hold 0.110 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_25}] -setup 0.080 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_25}] -hold 0.110 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_2p5}] -setup 0.080 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_2p5}] -hold 0.110 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_2p5}] -setup 0.080 
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_2p5}] -hold 0.110 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_125}] -setup 0.080 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_125}] -hold 0.110 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_125}] -setup 0.080 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_125}] -hold 0.110 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_25}] -setup 0.080 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_25}] -hold 0.110 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_25}] -setup 0.080 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_25}] -hold 0.110 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_2p5}] -setup 0.080 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {tx_clk_2p5}] -hold 0.110 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_2p5}] -setup 0.080 
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {tx_clk_2p5}] -hold 0.110 
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -rise_to [get_clocks {clk_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -fall_to [get_clocks {clk_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -rise_to [get_clocks {clk_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -fall_to [get_clocks {clk_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {enet_rx_clk}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {enet_rx_clk}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {enet_rx_clk}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {enet_rx_clk}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {enet_pll_125}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {enet_pll_125}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {enet_pll_125}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {enet_pll_125}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {tx_clk_125}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {tx_clk_125}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_gtx_clk_125}]  0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_gtx_clk_125}]  0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {tx_clk_125}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {tx_clk_125}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_gtx_clk_125}]  0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_gtx_clk_125}]  0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {tx_clk_25}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {tx_clk_25}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_gtx_clk_25}]  0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_gtx_clk_25}]  0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {tx_clk_25}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {tx_clk_25}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_gtx_clk_25}]  0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_gtx_clk_25}]  0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {tx_clk_2p5}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {tx_clk_2p5}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_gtx_clk_2p5}]  0.110 
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_gtx_clk_2p5}]  0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_rx_clk}] -setup 0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_rx_clk}] -hold 0.080 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_pll_125}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {tx_clk_2p5}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {tx_clk_2p5}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_gtx_clk_2p5}]  0.110 
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_gtx_clk_2p5}]  0.110 


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[0]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[0]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[0]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[0]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[1]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[1]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[1]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[1]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[2]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[2]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[2]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[2]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[3]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[3]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  0.450 [get_ports {enet_rxd[3]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.450 [get_ports {enet_rxd[3]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[0]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[1]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[2]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -1.650 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -2.350 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -9.650 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -10.350 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -99.650 [get_ports {enet_txd[3]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -100.350 [get_ports {enet_txd[3]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -exclusive -group [get_clocks {clk_50}] -group [get_clocks {clk_125}] -group [get_clocks {enet_pll_125}] -group [get_clocks {enet_pll_25}] -group [get_clocks {enet_pll_2p5}] 
set_clock_groups -exclusive -group [get_clocks {clk_50}] -group [get_clocks {tx_clk_125}] -group [get_clocks {tx_clk_25}] -group [get_clocks {tx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {clk_50}] -group [get_clocks {clk_125}] -group [get_clocks {tx_clk_125}] -group [get_clocks {tx_clk_25}] -group [get_clocks {tx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_125}] -group [get_clocks {enet_gtx_clk_25 enet_gtx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_25}] -group [get_clocks {enet_gtx_clk_125 enet_gtx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_2p5}] -group [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -setup -rise_from  [get_clocks {virtual_phy_clk}]  -fall_to  [get_clocks {enet_rx_clk}]
set_false_path -setup -fall_from  [get_clocks {virtual_phy_clk}]  -rise_to  [get_clocks {enet_rx_clk}]
set_false_path -hold -rise_from  [get_clocks {virtual_phy_clk}]  -rise_to  [get_clocks {enet_rx_clk}]
set_false_path -hold -fall_from  [get_clocks {virtual_phy_clk}]  -fall_to  [get_clocks {enet_rx_clk}]
set_false_path -setup -rise_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -fall_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -setup -fall_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -rise_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -hold -rise_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -rise_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -hold -fall_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -fall_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path  -from  [get_clocks {enet_pll_125}]  -to  [get_clocks {enet_rx_clk}]
set_false_path  -from  [get_clocks {enet_pll_125}]  -to  [get_clocks {tx_clk_125}]
set_false_path  -from  [get_clocks {enet_pll_125}]  -to  [get_clocks {tx_clk_2p5}]
set_false_path  -from  [get_clocks {enet_pll_125}]  -to  [get_clocks {tx_clk_25}]
set_false_path  -from  [get_clocks {enet_rx_clk}]  -to  [get_clocks {enet_pll_125}]
set_false_path  -from  [get_clocks {enet_rx_clk}]  -to  [get_clocks {enet_rx_clk}]
set_false_path  -from  [get_clocks {tx_clk_25}]  -to  [get_clocks {enet_pll_125}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}]
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_pins -nocase -compatibility_mode {*altera_tse_reset_synchronizer_chain*|clrn}]
set_false_path -to [get_ports {altera_reserved_tdo}]
set_false_path -from [get_ports {altera_reserved_tdi}] 
set_false_path -from [get_ports {altera_reserved_tms}] 
set_false_path -from [get_ports {cpu_reset_n}] 
set_false_path -to [get_ports {enet_gtx_clk}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_break:the_cpu_nios2_oci_break|break_readreg*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|*resetlatch}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr[33]}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_ready}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr[0]}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_error}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr[34]}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_ocimem:the_cpu_nios2_ocimem|*MonDReg*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_sysclk:the_cpu_jtag_debug_module_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_sysclk:the_cpu_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_go}]
set_false_path -from [get_registers {*altera_jtag_src_crosser:*|sink_data_buffer*}] -to [get_registers {*altera_jtag_src_crosser:*|src_data*}]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_writedata_d1*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_address*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_byteenable*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_nativeaddress_d1*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_readdata_p1*}] -to [get_registers *]
set_false_path -from [get_keepers -nocase {*the*clock*|slave_readdata_p1*}] -to [get_registers *]
set_false_path -from [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_write~0}] -to [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_writedata[20]}]
set_false_path -from [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_write~0}] -to [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_read}]
set_false_path -from [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_write~0}] -to [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_write~0}]
set_false_path -from [get_clocks {tx_clk_2p5}] -to [get_clocks { enet_pll_125 }]
set_false_path -from [get_clocks {tx_clk_125}] -to [get_clocks { enet_pll_125 }]

#set_false_path -from [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_write~0}] -to [get_keepers {bts_general_sopc:bts_general_sopc_inst|cpu:the_cpu|d_write~0}] -to [bts_general_sopc:bts_general_sopc_inst|tse_mac:the_tse_mac|altera_tse_mac:altera_tse_mac_inst|altera_tse_top_gen_host:top_gen_host_inst|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_dpram_8x32:U_ARRAY_2|altsyncram:altsyncram_component|altsyncram_e2k1:auto_generated|q_b[0]]

#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}] 0
set_multicycle_path -hold -end -from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}] -1
set_multicycle_path -setup -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*}] -to [get_registers *] 5
set_multicycle_path -setup -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] -to [get_registers *] 5
set_multicycle_path -setup -end -from [get_registers *] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] 5
set_multicycle_path -hold -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*}] -to [get_registers *] 5
set_multicycle_path -hold -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] -to [get_registers *] 5
set_multicycle_path -hold -end -from [get_registers *] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] 5


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|dout_reg_sft*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|eop_sft*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|sop_reg*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000


#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

