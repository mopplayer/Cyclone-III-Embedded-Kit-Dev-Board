derive_pll_clocks -create_base_clocks



## Setting up some handy PLL name aliases for the DDR SDRAM clocks, make sure this file is located below the constraint files for the DDR SDRAM interfaces (they will define the clock names as shown below)
set int_code_memory_clock inst|the_code|code_controller_phy_inst|alt_mem_phy_inst|code_phy_alt_mem_phy_ciii_inst|clk|pll|altpll_component|auto_generated|pll1|clk[0]
set int_frame_buffer_memory_clock inst|the_frame_buffer|frame_buffer_controller_phy_inst|alt_mem_phy_inst|frame_buffer_phy_alt_mem_phy_ciii_inst|clk|pll|altpll_component|auto_generated|pll1|clk[0]


## generate the clocks from the system PLL as well as the off-chip video clock (int = internal, ext = external)  These PLL clock names will be derived by the DDR SDRAM scripts (make sure this one is last in the list)
set int_system_clock inst2|altpll_component|auto_generated|pll1|clk[0]
set int_slow_clock inst2|altpll_component|auto_generated|pll1|clk[1]
set int_video_clock inst2|altpll_component|auto_generated|pll1|clk[2]
create_generated_clock -name ext_video_clock -source [get_pins inst2|altpll_component|auto_generated|pll1|clk[2]] [get_ports offchip_video_clk]
create_clock -period 20.000 -name virtual_slow_clock
create_clock -period 10.000 -name virtual_video_clock


## Cutting paths between the JTAG and all other paths
set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}



## Cutting paths for the slow I/O
set_false_path -to [get_ports {touch_panel_*}]
set_false_path -from [get_ports {touch_panel_*}]
set_false_path -to [get_ports {eeprom_*}]
set_false_path -from [get_ports {eeprom_dat}]
set_false_path -to [get_ports {lcd_i2c_*}]
set_false_path -from [get_ports {lcd_i2c_dat}]
set_false_path -to [get_ports {serial_clk}]
set_false_path -from [get_ports {push_buttons[*]}]


## Cutting paths for the JTAG tdo, tdi, and tms pins
set_false_path -to [get_ports altera_reserved_tdo]
set_false_path -from [get_ports altera_reserved_tdi]
set_false_path -from [get_ports altera_reserved_tms]


## Cutting the input reset path since SOPC Builder syncronizes the reset input
set_false_path -from [get_ports reset_n]



## Constraining the Flash interface (using worst case FPGA Tco, Th, and Tsu timing from the data sheet).
## Tsu = 3.491, Th = 2.783, and Tco is 4.311, adding 1ns of slack to each
set_output_delay -clock virtual_slow_clock -max [expr 20 - 5.311] [get_ports flash_*]
set_output_delay -clock virtual_slow_clock -min 0 [get_ports flash_*]
set_input_delay -clock virtual_slow_clock -max [expr 20 - 4.491] [get_ports flash_data[*]] -add_delay
set_input_delay -clock virtual_slow_clock -min [expr 0 + 3.783] [get_ports flash_data[*]] -add_delay



## Constraining the LCD interface (worst case Tsu = 1.549ns, Th = 0.298ns for the offchip video interface)
set_output_delay -clock ext_video_clock -max 2 [get_ports lcd_den]
set_output_delay -clock ext_video_clock -min -1 [get_ports lcd_den]
set_output_delay -clock ext_video_clock -max 2 [get_ports lcd_hd]
set_output_delay -clock ext_video_clock -min -1 [get_ports lcd_hd]
set_output_delay -clock ext_video_clock -max 2 [get_ports lcd_vd]
set_output_delay -clock ext_video_clock -min -1 [get_ports lcd_vd]
set_output_delay -clock ext_video_clock -max 2 [get_ports lcd_rgb[*]]
set_output_delay -clock ext_video_clock -min -1 [get_ports lcd_rgb[*]]
set_output_delay -clock virtual_video_clock 0 [get_ports offchip_video_clk]



## Cutting paths between reset blocks
set_false_path -from {system:inst|system_reset_code_phy_clk_out_domain_synch_module:system_reset_code_phy_clk_out_domain_synch|data_out*} -to {*}
set_false_path -from {system:inst|system_reset_frame_buffer_phy_clk_out_domain_synch_module:system_reset_frame_buffer_phy_clk_out_domain_synch|data_out*} -to {*}
set_false_path -from {system:inst|system_reset_system_clk_domain_synch_module:system_reset_system_clk_domain_synch|data_out*} -to {*}
set_false_path -from {system:inst|cpu:the_cpu|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|resetrequest*} -to {*}
set_false_path -from {system:inst|system_reset_slow_clk_domain_synch_module:system_reset_slow_clk_domain_synch|data_out*} -to {*}