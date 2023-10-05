create_clock -name clkin_50 -period 20 [get_ports clkin_50]
create_clock -name enet_rx_clk -period 8.00 [get_ports enet_rx_clk]

derive_pll_clocks

# Providing easier to use clock names
set System_Clock         {clkin_50}
set tx_clk_pll_125       {tx_clk_inst|altpll_component|auto_generated|pll1|clk[0]}
set tx_clk_pll_25        {tx_clk_inst|altpll_component|auto_generated|pll1|clk[1]}
set tx_clk_pll_2p5       {tx_clk_inst|altpll_component|auto_generated|pll1|clk[2]}

# Asynchronous I/O
set_false_path -from [get_ports cpu_reset_n] 
set_false_path -from [get_ports flash_resetn] 
#set_false_path -from [get_ports {user_pb[*]}] -to *
set_false_path -from * -to [get_ports {user_led[*]}]
#set_false_path -from * -to [get_ports {max2_*}]
set_false_path -from * -to [get_ports {LCD_*}]
set_false_path -from [get_ports {LCD_data[*]}] -to * 

# Flash
set_min_delay  2 -from * -to [get_ports {fsa[*] fsd[*] flash_oen flash_cen flash_wen sram_ben[*] sram_csn sram_oen sram_wen}]
set_max_delay 10 -from * -to [get_ports {fsa[*] fsd[*] flash_oen flash_cen flash_wen sram_ben[*] sram_csn sram_oen sram_wen}]

set_min_delay -2 -from [get_ports {fsd[*]}] -to *
set_max_delay  6 -from [get_ports {fsd[*]}] -to *


# TSE MAC 
set_min_delay  2 -from * -to [get_ports {enet_mdc enet_mdio enet_resetn}]
set_max_delay 10 -from * -to [get_ports {enet_mdc enet_mdio enet_resetn}]

set_min_delay  0 -from [get_ports {enet_mdio}] -to *
set_max_delay  6 -from [get_ports {enet_mdio}] -to *

# JTAG
set_min_delay 0 -from * -to [get_ports altera_reserved_tdo]
set_max_delay 20 -from * -to [get_ports altera_reserved_tdo]

set_min_delay 0 -from [get_ports {altera_reserved_tdi altera_reserved_tms}] -to *
set_max_delay 20 -from [get_ports {altera_reserved_tdi altera_reserved_tms}] -to *


# TSE

# Define the clocks that can appear on the output of the TX clock mux
# Create the 125MHz mux output
create_generated_clock -name tx_clk_125 -source [get_pins ${tx_clk_pll_125}] -add [get_nets tx_clk]
create_generated_clock -name enet_gtx_clk_125 -source [get_nets {tx_clk}] -master_clock {tx_clk_125} -add [get_ports {enet_gtx_clk}]

# Create the 25MHz mux output
create_generated_clock -name tx_clk_25  -source [get_pins ${tx_clk_pll_25}] -add [get_nets tx_clk]
create_generated_clock -name enet_gtx_clk_25 -source [get_nets {tx_clk}] -master_clock {tx_clk_25} -add [get_ports {enet_gtx_clk}]
   
# Create the 2.5MHz mux output
create_generated_clock -name tx_clk_2p5 -source [get_pins ${tx_clk_pll_2p5}] -add [get_nets tx_clk]
create_generated_clock -name enet_gtx_clk_2p5 -source [get_nets {tx_clk}] -master_clock {tx_clk_2p5} -add [get_ports {enet_gtx_clk}]
   
# This is a clock output, I/O constraints are not needed for output pin 
set_false_path -from * -to [get_ports enet_gtx_clk]

# Cutting all the paths between clocks going into TSE, TSE provides clock crossing logic
set_clock_groups -exclusive \
    -group [get_clocks ${System_Clock} ] \
    -group [get_clocks {tx_clk_125 enet_gtx_clk_125} ] \
    -group [get_clocks {tx_clk_25  enet_gtx_clk_25 } ] \
    -group [get_clocks {tx_clk_2p5 enet_gtx_clk_2p5} ] \
	-group [get_clocks enet_rx_clk ]
	
#**************************************************************
# Output Delay Constraints (Edge Aligned, Same Edge Capture)
#**************************************************************   
# max delay = tsu (-0.9) + skew (0.075) 
# min delay = -th ( 2.7) - skew (0.075)   
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_125] -max -0.825 [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_125] -min -2.775 [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_125] -max -clock_fall -0.825 [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_125] -min -clock_fall -2.775 [get_ports {enet_tx_en enet_txd*}]
    
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_25] -max -0.825  [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_25] -min -2.775 [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_25] -max -clock_fall -0.825  [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_25] -min -clock_fall -2.775 [get_ports {enet_tx_en enet_txd*}]

set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_2p5] -max -0.825  [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_2p5] -min -2.775 [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_2p5] -max -clock_fall -0.825  [get_ports {enet_tx_en enet_txd*}]
set_output_delay -add_delay -clock [get_clocks enet_gtx_clk_2p5] -min -clock_fall -2.775 [get_ports {enet_tx_en enet_txd*}]

derive_clock_uncertainty

# On same edge capture DDR interface the paths from RISE to FALL and
# from FALL to RISE on not valid for setup analysis
set_false_path -setup \
    -rise_from [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}] \
    -fall_to [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]

set_false_path -setup \
    -fall_from [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}] \
    -rise_to [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]

# On same edge capture DDR interface the paths from RISE to RISE and
# FALL to FALL are not valid for hold analysis
set_false_path -hold \
    -rise_from [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}] \
    -rise_to [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]

set_false_path -hold \
    -fall_from [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}] \
    -fall_to [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]


#**************************************************************
# Input Delay Constraints (Center aligned, Same Edge Analysis)
#**************************************************************
# max delay = tco (-1.2) + skew (0.075)
# min delay = tcomin (-2.8) - skew (0.075)

# Constraint the path to the rising edge of the phy clock
set_input_delay -add_delay -clock enet_rx_clk -max -1.125 [get_ports {enet_rx_dv enet_rxd*}]
set_input_delay -add_delay -clock enet_rx_clk -min -2.875 [get_ports {enet_rx_dv enet_rxd*}]

# Constraint the path to the falling edge of the phy clock
set_input_delay -add_delay -clock enet_rx_clk -max -clock_fall -1.125 [get_ports {enet_rx_dv enet_rxd*}]
set_input_delay -add_delay -clock enet_rx_clk -min -clock_fall -2.875 [get_ports {enet_rx_dv enet_rxd*}]


# On a same edge capture DDR interface the paths from RISE to FALL and
# from FALL to RISE on not valid for setup analysis
set_false_path -setup \
    -rise_from [get_clocks {enet_rx_clk}] \
    -fall_to [get_clocks {enet_rx_clk}]

set_false_path -setup \
    -fall_from [get_clocks {enet_rx_clk}] \
    -rise_to [get_clocks {enet_rx_clk}]

# On a same edge capture DDR interface the paths from RISE to RISE and
# FALL to FALL are not avlid for hold analysis
set_false_path -hold \
    -rise_from [get_clocks {enet_rx_clk}] \
    -rise_to [get_clocks {enet_rx_clk}]

set_false_path -hold \
    -fall_from [get_clocks {enet_rx_clk}] \
    -fall_to [get_clocks {enet_rx_clk}]   
