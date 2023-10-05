derive_pll_clocks -create_base_clocks

########### Cyclone III 3C120 Development Board ##########################

# DDR timing is taken care of by megawizard generated SDC scripts

################ Flash ######################
set_min_delay 4.0 -from * -to [get_ports {top_fsa[*] top_fsd[*] top_flash_cen top_flash_oen top_flash_wen top_flash_resetn}]
set_max_delay 12.0 -from * -to [get_ports {top_fsa[*] top_fsd[*] top_flash_cen top_flash_oen top_flash_wen top_flash_resetn}]

set_min_delay -4.0 -from [get_ports {top_fsd[*]}] -to *
set_max_delay 2.0 -from [get_ports {top_fsd[*]}] -to *

################# Asynchronous ###########################
# Buttons
set_false_path -from [get_ports {top_button[*]}] -to *
# Reset
set_false_path -from [get_ports {top_reset_n}] -to *
# LEDS
set_false_path -from * -to [get_ports {top_led[*]}] 

# resets/irqs that cross clock boundaries
set_false_path -from {*_domain_synch|data_out} -to {*}
set_false_path -from {*the_pll|count_done} -to {*}
set_false_path -from {*oci_debug|resetrequest} -to {*}
set_false_path -from {*|lcd_sgdma:the_lcd_sgdma|lcd_sgdma_chain:the_lcd_sgdma_chain|control_status_slave_which_resides_within_lcd_sgdma:the_control_status_slave_which_resides_within_lcd_sgdma|csr_irq} -to {*|cpu_data_master_arbitrator:the_cpu_data_master|lcd_sgdma_csr_irq_from_sa_clock_crossing_cpu_data_master_module:lcd_sgdma_csr_irq_from_sa_clock_crossing_cpu_data_master|data_in_d1}

#################### JTAG ################################
# JTAG Constraints copied directly from TimeQuest Cookbook
# constrain the TCK port
create_clock -name tck -period "10MHz" [get_ports altera_reserved_tck] -add
#cut all paths to and from tck
set_clock_groups -group [get_clocks tck] -exclusive
#constrain the TDI port
set_input_delay -clock tck 20 [get_ports altera_reserved_tdi]
#constrain the TMS port
set_input_delay -clock tck 20 [get_ports altera_reserved_tms]
#constrain the TDO port
set_output_delay -clock tck 20 [get_ports altera_reserved_tdo]

################# HSMC Connector ##########################
# LCD
create_generated_clock -name video_clk -source [get_pins {*|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] [get_ports top_HSMB_LCD_NCLK]

set_max_delay 9.0 -from [get_pins {*|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] -to [get_ports {top_HSMB_LCD_NCLK}]
set_min_delay 4.0 -from [get_pins {*|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] -to [get_ports {top_HSMB_LCD_NCLK}]

set_output_delay -clock [get_clocks {video_clk}] -min 2 [get_ports {top_HSMB_LCD_DATA[*] top_HSMB_DEN top_HSMB_VSYNC top_HSMB_HSYNC}]
set_output_delay -clock [get_clocks {video_clk}] -max 7 [get_ports {top_HSMB_LCD_DATA[*] top_HSMB_DEN top_HSMB_VSYNC top_HSMB_HSYNC}]

# I/O not associated with a clock
# This is just to make sure the timing doesn't change between versions

# HC_ADC
set_min_delay 0.0 -from [get_ports {top_HSMB_ADC_DOUT top_HSMB_ADC_PENIRQ_N}] -to *
set_max_delay 3.0 -from [get_ports {top_HSMB_ADC_DOUT top_HSMB_ADC_PENIRQ_N}] -to *

set_min_delay 5.0 -from * -to [get_ports {top_HSMB_ADC_CS_N top_HSMB_ADC_DCLK top_HSMB_ADC_DIN}]
set_max_delay 13.0 -from * -to [get_ports {top_HSMB_ADC_CS_N top_HSMB_ADC_DCLK top_HSMB_ADC_DIN}]

# HC_I2
set_min_delay 0.0 -from [get_ports {top_HSMB_ID_I2CDAT}] -to *
set_max_delay 4.0 -from [get_ports {top_HSMB_ID_I2CDAT}] -to *

set_min_delay 4.0 -from * -to [get_ports {top_HSMB_SCEN top_HSMB_ID_I2CDAT top_HSMB_ID_I2CSCL}]
set_max_delay 12.0 -from * -to [get_ports {top_HSMB_SCEN top_HSMB_ID_I2CDAT top_HSMB_ID_I2CSCL}]

# HC_SD
# This should be a generated clock, but core is encrypted and can't find the source
create_clock -period 60 -name SLS_SD_CLK {cycloneIII_3c120_niosII_application_selector_sopc:cycloneIII_3c120_niosII_application_selector_sopc_instance|sls_sdhc:the_sls_sdhc|sls_sdhc_top:sls_sdhc|sls_sdhc_cntrl:sls_sdhc_cntrl|sls_sdhc_clkgen:sls_sdhc_clkgen|SD_CLK}
set_multicycle_path -from [get_clocks {SLS_SD_CLK}] -to [get_clocks {cycloneIII_3c120_niosII_application_selector_sopc_instance|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] -setup -end 6
set_multicycle_path -from [get_clocks {SLS_SD_CLK}] -to [get_clocks {cycloneIII_3c120_niosII_application_selector_sopc_instance|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}] -hold -end 6

set_min_delay -1.0 -from [get_ports {top_HSMB_SD_DAT0 top_HSMB_SD_DAT1 top_HSMB_SD_DAT2 top_HSMB_SD_DAT3 top_HSMB_SDAT top_HSMB_SD_CMD}] -to *
set_max_delay 4.0 -from [get_ports {top_HSMB_SD_DAT0 top_HSMB_SD_DAT1 top_HSMB_SD_DAT2 top_HSMB_SD_DAT3 top_HSMB_SDAT top_HSMB_SD_CMD}] -to *

set_min_delay 4.0 -from * -to [get_ports {top_HSMB_SD_DAT0 top_HSMB_SD_DAT1 top_HSMB_SD_DAT2 top_HSMB_SD_DAT3 top_HSMB_SDAT top_HSMB_SD_CMD top_HSMB_SD_CLK}]
set_max_delay 12.0 -from * -to [get_ports {top_HSMB_SD_DAT0 top_HSMB_SD_DAT1 top_HSMB_SD_DAT2 top_HSMB_SD_DAT3 top_HSMB_SDAT top_HSMB_SD_CMD top_HSMB_SD_CLK}]

# HC_MDIO
set_min_delay -1.0 -from [get_ports {top_HSMB_MDIO}] -to *
set_max_delay 4.0 -from [get_ports {top_HSMB_MDIO}] -to *

set_min_delay 4.0 -from * -to [get_ports {top_HSMB_MDC top_HSMB_MDIO}]
set_max_delay 12.0 -from * -to [get_ports {top_HSMB_MDC top_HSMB_MDIO}]

#UART
set_min_delay 0.0 -from  [get_ports {top_HSMB_UART_RXD}] -to *
set_max_delay 4.0 -from  [get_ports {top_HSMB_UART_RXD}] -to *

set_min_delay 4.0 -from * -to [get_ports {top_HSMB_UART_TXD}]
set_max_delay 12.0 -from * -to [get_ports {top_HSMB_UART_TXD}]

# Max2 Interface
set_min_delay 4.0 -from * -to [get_ports {top_cs_n_to_the_max2 top_oe_n_to_the_max2 top_we_n_to_the_max2}]
set_max_delay 12.0 -from * -to [get_ports {top_cs_n_to_the_max2 top_oe_n_to_the_max2 top_we_n_to_the_max2}]

# Ethernet MAC
set_min_delay 0.0 -from [get_ports { top_HSMB_RX_COL top_HSMB_RX_CRS top_HSMB_RX_D[*] top_HSMB_RX_DV top_HSMB_RX_ERR}] -to *
set_max_delay 4.0 -from [get_ports { top_HSMB_RX_COL top_HSMB_RX_CRS top_HSMB_RX_D[*] top_HSMB_RX_DV top_HSMB_RX_ERR}] -to *
                                   
set_min_delay 3.0 -from * -to [get_ports {top_HSMB_TX_D[*] top_HSMB_TX_EN}]
set_max_delay 12.0 -from * -to [get_ports {top_HSMB_TX_D[*] top_HSMB_TX_EN}]

# we are adding the clock assignments here because of the I/O names are different than the defaults
# You could just edit tse_mac_constraints.sdc with the name of the clock pins name/frequencies
# we still use tse_max_constraints.sdc for other constraints
create_clock -period "125MHz" -name TX_CLK [ get_ports top_HSMB_TX_CLK]
create_clock -period "125MHz" -name RX_CLK [ get_ports top_HSMB_RX_CLK]

set_clock_groups -exclusive -group [get_clocks TX_CLK]
set_clock_groups -exclusive -group [get_clocks RX_CLK]



