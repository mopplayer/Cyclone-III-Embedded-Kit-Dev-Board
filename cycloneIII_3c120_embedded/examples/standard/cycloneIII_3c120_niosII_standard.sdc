# Create generated clocks based on PLLs.

# Usually the next two steps are required but in this case, we're sourcing the ddr sdram constraint file before sourcing this file, so it's been done for us.

## Defining the external clock frequency from the oscillator
create_clock -period 20.000 -name top_clkin_50 [get_ports {top_clkin_50}]
create_clock -period 8.000 -name top_clkin_125 [get_ports {top_clkin_125}]

## Deriving pll clocks
#derive_pll_clocks

## Creating and setting variables for clock paths to make code look cleaner
set System_Clock_int *|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]
set SSRAM_Clock_ext *|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[1]
set Slow_Clock_int *|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[2]
set TSE_Enet_Ten_Base_Core_Clock *|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[3]
set TSE_Enet_Ten_Base_Phy_Clock *|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[4]

set TSE_Enet_Hundred_Base_Core_Clock *|the_tse_tx_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]
set TSE_Enet_Giga_Bit_Core_Clock *|the_tse_tx_pll|the_pll|altpll_component|auto_generated|pll1|clk[2]

set DDR_Local_Clock *|the_ddr2_sdram|ddr2_sdram_controller_phy_inst|alt_mem_phy_inst|*|clk|pll|altpll_component|auto_generated|pll1|clk[1]
set DDR_Controller_Clock *|the_ddr2_sdram|ddr2_sdram_controller_phy_inst|alt_mem_phy_inst|*|clk|pll|altpll_component|auto_generated|pll1|clk[0]

set System_Pll_Clock *|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[*]
set TSE_Pll_Clock *|the_tse_pll|the_pll|altpll_component|auto_generated|pll1|clk[*]
set TSE_Tx_Pll_Clock *|the_tse_tx_pll|the_pll|altpll_component|auto_generated|pll1|clk[*]

## Cutting the paths between the external clock source
set_false_path -from [get_clocks {top_clkin_50}] -to [get_clocks {top_clkin_125}]
set_false_path -from [get_clocks {top_clkin_125}] -to [get_clocks {top_clkin_50}]

## Cutting the paths between the pll clock
set_false_path -from [get_clocks $TSE_Tx_Pll_Clock] -to [get_clocks $System_Pll_Clock]
set_false_path -from [get_clocks $TSE_Tx_Pll_Clock] -to [get_clocks $TSE_Pll_Clock]
set_false_path -from [get_clocks $TSE_Pll_Clock] -to [get_clocks $System_Pll_Clock]

## Cutting the paths between the external clock source and system clock
set_false_path -from [get_clocks {top_clkin_50}] -to [get_clocks $System_Clock_int]
set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks {top_clkin_50}]

set_false_path -from [get_clocks {top_clkin_125}] -to [get_clocks $System_Clock_int]
set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks {top_clkin_125}]

## Cutting the paths between the external clock and slow peripheral clock
set_false_path -from [get_clocks {top_clkin_50}] -to [get_clocks $Slow_Clock_int]
set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks {top_clkin_50}]

set_false_path -from [get_clocks {top_clkin_125}] -to [get_clocks $Slow_Clock_int]
set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks {top_clkin_125}]

## Cutting the paths between the external clock and ddr clock
set_false_path -from [get_clocks {top_clkin_50}] -to [get_clocks $DDR_Controller_Clock]
set_false_path -from [get_clocks $DDR_Controller_Clock] -to [get_clocks {top_clkin_50}]

set_false_path -from [get_clocks {top_clkin_50}] -to [get_clocks $DDR_Local_Clock]
set_false_path -from [get_clocks $DDR_Local_Clock] -to [get_clocks {top_clkin_50}]

set_false_path -from [get_clocks {top_clkin_125}] -to [get_clocks $DDR_Controller_Clock]
set_false_path -from [get_clocks $DDR_Controller_Clock] -to [get_clocks {top_clkin_125}]

set_false_path -from [get_clocks {top_clkin_125}] -to [get_clocks $DDR_Local_Clock]
set_false_path -from [get_clocks $DDR_Local_Clock] -to [get_clocks {top_clkin_125}]

## Cutting the paths between the system clock and slow peripheral clock
set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks $Slow_Clock_int]
set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks $System_Clock_int]

## Cutting the paths between the system clock and ddr clock
set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks $DDR_Controller_Clock]
set_false_path -from [get_clocks $DDR_Controller_Clock] -to [get_clocks $System_Clock_int]

set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks $DDR_Local_Clock]
set_false_path -from [get_clocks $DDR_Local_Clock] -to [get_clocks $System_Clock_int]

## Cutting the paths between the slow peripheral clock and ddr clock
set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks $DDR_Controller_Clock]
set_false_path -from [get_clocks $DDR_Controller_Clock] -to [get_clocks $Slow_Clock_int]

set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks $DDR_Local_Clock]
set_false_path -from [get_clocks $DDR_Local_Clock] -to [get_clocks $Slow_Clock_int]

## Cutting the paths between the tse pll clock and system clock
set_false_path -from [get_clocks $System_Pll_Clock] -to [get_clocks $TSE_Pll_Clock]
set_false_path -from [get_clocks $System_Pll_Clock] -to [get_clocks $TSE_Tx_Pll_Clock]

set_false_path -from [get_clocks $TSE_Enet_Hundred_Base_Core_Clock] -to [get_clocks $TSE_Enet_Giga_Bit_Core_Clock]
set_false_path -from [get_clocks $TSE_Enet_Giga_Bit_Core_Clock] -to [get_clocks $TSE_Enet_Hundred_Base_Core_Clock]

set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks $TSE_Enet_Ten_Base_Core_Clock]
set_false_path -from [get_clocks $TSE_Enet_Ten_Base_Core_Clock] -to [get_clocks $System_Clock_int]

#TSE constraints

#Constrain MAC network-side interface clocks
create_clock -period "125 MHz" -name top_tx_clk_to_the_tse_mac [ get_keepers top_enet_tx_clk]
create_clock -period "125 MHz" -name top_rx_clk_to_the_tse_mac [ get_keepers top_enet_rx_clk]

set_false_path -from [get_clocks {top_rx_clk_to_the_tse_mac}] -to [get_clocks $DDR_Local_Clock]
set_false_path -from [get_clocks $DDR_Local_Clock] -to [get_clocks {top_rx_clk_to_the_tse_mac}]

set_false_path -from [get_clocks {top_tx_clk_to_the_tse_mac}] -to [get_clocks $DDR_Local_Clock]
set_false_path -from [get_clocks $DDR_Local_Clock] -to [get_clocks {top_tx_clk_to_the_tse_mac}]

#Cut the timing path betweeen unrelated clock domains
set_clock_groups -exclusive -group {top_rx_clk_to_the_tse_mac} -group {top_tx_clk_to_the_tse_mac}
set_clock_groups -exclusive -group {top_tx_clk_to_the_tse_mac} -group {top_rx_clk_to_the_tse_mac}

set_false_path -from [get_clocks top_tx_clk_to_the_tse_mac] -to [get_clocks $System_Clock_int]
set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks top_tx_clk_to_the_tse_mac]

set_false_path -from [get_clocks top_rx_clk_to_the_tse_mac] -to [get_clocks $System_Clock_int]
set_false_path -from [get_clocks $System_Clock_int] -to [get_clocks top_rx_clk_to_the_tse_mac]

set_false_path -from [get_clocks top_tx_clk_to_the_tse_mac] -to [get_clocks $Slow_Clock_int]
set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks top_tx_clk_to_the_tse_mac]

set_false_path -from [get_clocks top_rx_clk_to_the_tse_mac] -to [get_clocks $Slow_Clock_int]
set_false_path -from [get_clocks $Slow_Clock_int] -to [get_clocks top_rx_clk_to_the_tse_mac]

#Constrain timing for half duplex logic
set_multicycle_path -setup 4 -from [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*] -to [ get_keepers *]
set_multicycle_path -setup 4 -from [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*] -to [ get_keepers *]
set_multicycle_path -setup 4 -from [ get_keepers *] -to [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*]
set_multicycle_path -setup 4 -from [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|half_duplex_ena_reg2] -to [ get_keepers *]
set_multicycle_path -hold 4 -from [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*] -to [ get_keepers *]
set_multicycle_path -hold 4 -from [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*] -to [ get_keepers *]
set_multicycle_path -hold 4 -from [ get_keepers *] -to [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*]
set_multicycle_path -hold 4 -from [ get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|half_duplex_ena_reg2] -to [ get_keepers *]
set_max_delay 7 -from [get_registers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|dout_reg_sft*] -to [get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*]
set_max_delay 7 -from [get_registers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|eop_sft*] -to [get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*]
set_max_delay 7 -from [get_registers *|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|sop_reg*] -to [get_keepers *|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*]

# Slow asynchrounous pins
set_false_path -to [get_ports {top_led[*]}]
set_false_path -from [get_ports {top_button[*]}]

## Cutting paths between the JTAG and other clocks
create_clock -period 100.00 -name JTAG_clk [get_ports altera_reserved_tck]
set_clock_groups -asynchronous -group {JTAG_clk}
set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

## Cutting paths for the JTAG tdo, tdi, and tms pins
set_false_path -to [get_ports altera_reserved_tdo]
set_false_path -from [get_ports altera_reserved_tdi]
set_false_path -from [get_ports altera_reserved_tms]

## Cutting the input reset path since SOPC Builder syncronizes the reset input
set_false_path -from [get_ports top_reset_n]


