Overview:

- This design is based on the Nios II/f core and provides a typical mix of 
  peripherals and memories as well as a video pipeline. The SOPC Builder system
  provides an interface to each hardware component on the embedded evaluation 
  kit board, such as DDR SDRAM, LEDs, RS-232 connector, and the Ethernet 
  MAC/10/100 PHY as well as the 800 x 240 pixel RGB LCD. There is also a video 
  pipeline which provides high bandwidth memory access that allows for flicker 
  free display on the color LCD.

- This is a list of the components available in the system along with a brief 
  description:
  cpu Nios2/f
  pipeline_bridge_before_tristate_bridge
  flash_ssram_tristate_bridge
  ext_flash parallel flash
  ssram 1 MByte synchronous SRAM for board 3c25
  ddr_sdram for board 3c25
  ddr2_sdram for board 3c120
  cpu_ddr_clock_bridge

- These bridges are here for two reasons:
  1) Clock cross between two components that are clocked at a different 
     frequency.
     * sdhc_ddr_clock_bridge
     * tse_ddr_clock_bridge
     * tse_ssram_clock_bridge for board 3c25

  2) To offset addresses so that the entire memory model is flat. 
     (Every master sees every slave at the same address). 
     * descriptor_offset_bridge

- The triple speed Ethernet components (for board 3c25, those components are on slow_peripheral_bridge):
    * tse_mac
    * sgdma_tx
    * sgdma_rx
    * descriptor_memory
    
- The Cyclone III 3c120 dev kit Max II interface component is used to access the Max II device on 3c120
  developoment board, for reconfiguration purpose. Please refer to the readme file of the component for 
  further detail.

Components on the slow peripheral bridge
=========================================
- Components listed here are partitioned off by the use of the 
  slow_peripheral_bridge. This allows non-fmax critical components to be 
  clocked at a slower clock rate to give better fitting for components that 
  are fmax-critical.

  - The Bridge
    * slow_peripheral_bridge

  - The rest of the components on the slow_peripheral_bridge
    * sys_clk_timer 
    * performance_counter
    * jtag_uart
    * sysid
    * pll
    * button_pio
    * led_pio
    * pio_id_eeprom_dat 
    * pio_id_eeprom_scl used to access EEProm
    * remote_update for board 3c25

  - The following components are used to communicate with the touch panel 
    * touch_panel_spi
    * touch_panel_pen_irq_n

  - The sd card solution is provided under license agreement with El Camino 
    (http://www.elcamino.de)
    * el_camino_sd_card_controller

The video pipeline:
===================
- The following i2c pins are used to configure the lcd panel for brightness and
  gamma curves
  * lcd_i2c_scl
  * lcd_i2c_en
  * lcd_i2c_sdat

- The rest of the components that make up the video pipeline:
  * lcd_sgdma
  * lcd_ta_sgdma_to_fifo
  * lcd_pixel_fifo
  * lcd_ta_fifo_to_dfa
  * lcd_64_to_32_bits_dfa
  * lcd_pixel_converter
  * lcd_32_to_8_bits_dfa
  * lcd_sync_generator

Further Notes:
==============
- For board 3c25, the design contains a PLL that produces a phase-shifted clock to feed the 
  SSRAM. The phase shift is board-dependent, and may be different if this 
  design is retargeted to a different board.

- This Quartus II project contains assignments that match the port names 
  produced by SOPC Builder. If you add or modify SOPC Builder components, the 
  pin assignments may no longer be valid.  To view the Assignment Editor in the
  Quartus II software, in the Assignments menu, click "Assignment Editor".

- This design contains the DDR memory components.  Any design containing these cores must be re-generated in SOPC Builder before to re-compiling
  it in Quartus, if it the installation path to the Altera toolchain has changed since it was last generated.  This is because these cores 
  make use of RTL libraries that are referenced using absolute paths.  The re-generation process will update these absolute paths.
  Attempting to recompile in Quartus II without regenerating will result in an error of the following form during Quartus II Analysis and 
  Synthesis:
  Error: Node instance "ddr_control" instantiates undefined entity "auk_ddr_controller"

- For board 3c25, DDR memory is the main memory of the system, however SSRAM has a faster 
  access speed (when using the same clock frequencies). 
  
- For board 3c120, dual bank DDR memory is used as program and data memory

- The current version of the Nios II EDS hardware design example uses an HDL 
  file as the top level of the design hierarchy.  If you would like to use a 
  schematic-based top level instead (BDF), follow the steps listed below.  
    1) In the Quartus II software, open the top-level HDL file (.v or .vhd) for
       the design.
    2) Create a symbol for the HDL file by clicking 
       File -> Create/Update -> Create Symbol Files for Current File
    3) Create a new BDF file by clicking 
       File -> New -> Block Diagram/Schematic File.
    4) Instantiate the symbol in the BDF by double-clicking in the empty space
       of the BDF file and selecting "Project -> <symbol filename>"
    5) Instantiate pins in the BDF by double-clicking empty space, then 
       typing "input", "output", or "bidir".
    6) Rename the pins and connect them to the appropriate ports on the symbol.
    7) Save the BDF as a unique filename.
    8) Set the BDF as your top level entity by clicking:
       Project -> Set as Top-Level Entity
    9) Recompile the Quartus II project.

- For board 3c120, SLS SD Host Controller is used to access the sd card content. You need
  to acquire the license in order to use the IP core. You need to enable the component in 
  SOPC Builder and re-generate the design. Then map the corresponding sd controller pins 
  in the top-level HDL file as in the application_selector design, and run Quartus II 
  compilation again. The required port mapping in top-level HDL file is listed below:
  	SD_Busy_from_the_sls_sdhc         -	top_SD_Busy_from_the_sls_sdhc
	SD_CLK_from_the_sls_sdhc          -	top_HSMB_SD_CLK
	SD_CMD_to_and_from_the_sls_sdhc   -	top_HSMB_SD_CMD
	SD_DAT0_to_and_from_the_sls_sdhc  -	top_HSMB_SD_DAT0
	SD_DAT1_to_and_from_the_sls_sdhc  -	top_HSMB_SD_DAT1
	SD_DAT2_to_and_from_the_sls_sdhc  -	top_HSMB_SD_DAT2
	SD_DAT3_to_and_from_the_sls_sdhc  -	top_HSMB_SD_DAT3
	SD_In_to_the_sls_sdhc             -	1'b1
	SD_Wp_to_the_sls_sdhc             -	1'b0

- To compile this software in Nios II IDE, you need to append this Project directory or the directory
  that contains the altera_avalon_sd_mmc_spi component to the "SOPC_BUILDER_PATH" Environment Variable, 
  so that the build tools will be able to locate the drivers for the SD controller.

  For more information and details, refer to the Nios II Embedded Design Suite 
  Release Note.
