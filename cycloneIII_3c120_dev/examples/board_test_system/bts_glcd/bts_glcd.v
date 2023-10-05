// Cyclone III FPGA Dev Kit Host Board Test System Top-Level
// bts_glcd.v

 /* Legal Notice: (C)2009 Altera Corporation. All rights reserved. Your
 use of Altera Corporation's design tools, logic functions and other
 software and tools, and its AMPP partner logic functions, and any
 output files any of the foregoing (including device programming or
 simulation files), and any associated documentation or information are
 expressly subject to the terms and conditions of the Altera Program
 License Subscription Agreement or other applicable license agreement,
 including, without limitation, that your use is for the sole purpose
 of programming logic devices manufactured by Altera and sold by Altera
 or its authorized distributors. Please refer to the applicable
 agreement for further details. */
 
module bts_glcd 		
(
	input			clkin_sys,	// input to osc_clk 50Mhz
	
	//Flash and SSRAM  
	output	[25:0]	fsm_a,		//flash & ssram address 	
	inout	[31:0]	fsm_d,		//flash & ssram data
	output			flash_oen,	//flash output enable
	output			flash_wen,	//flash write enable
	output			flash_cen,	//flash chip select
	output	[3:0]	ssram_bwn,	//ssram byte enable
	output			ssram_oen,	//ssram output enable 
	output			ssram_wen,	//ssram write enable
	output			ssram_cen,	//ssram chip select
	//output			max2_csn,
	
	//Graphic LCD
	output			lcd_csn,	//lcd chip select
	output			lcd_d_cn,	//lcd data/command select
	output			lcd_e_rdn,	//lcd read enable
	output			lcd_en,		
	output			lcd_rstn,	//lcd reset
	output			lcd_wen,	//lcd write enable
	output	[7:0]	lcd_data,	//lcd data
	
	//User LED, Push Button and DIP Swicth
	input	[3:0]	user_pb,	//user push button
	input	[7:0]	user_dip,	//user dip switch
	output	[7:0]	user_led,	//user led
	
	input			cpu_resetn	//system reset
);


  //Instantiation for system 'bts_glcd_sopc'
  bts_glcd_sopc bts_glcd_sopc_inst
    (
      //.LCD_E_from_the_character_lcd                (LCD_E_from_the_character_lcd),
      //.LCD_RS_from_the_character_lcd               (LCD_RS_from_the_character_lcd),
      //.LCD_RW_from_the_character_lcd               (LCD_RW_from_the_character_lcd),
      //.LCD_data_to_and_from_the_character_lcd      (LCD_data_to_and_from_the_character_lcd),
      .in_port_to_the_dip_pio                      (user_dip),
      .in_port_to_the_pb_pio                       (user_pb),
      .lcd_csn_from_the_graphic_lcd_driver         (lcd_csn),
      .lcd_d_cn_from_the_graphic_lcd_driver        (lcd_d_cn),
      .lcd_data_to_and_from_the_graphic_lcd_driver (lcd_data),
      .lcd_e_rdn_from_the_graphic_lcd_driver       (lcd_e_rdn),
      .lcd_en_from_the_graphic_lcd_driver          (lcd_en),
      .lcd_rstn_from_the_graphic_lcd_driver        (lcd_rstn),
      .lcd_wen_from_the_graphic_lcd_driver         (lcd_wen),
      .osc_clk                                     (clkin_sys),
      .out_port_from_the_led_pio                   (user_led),
      .read_n_to_the_ext_flash                     (flash_oen),
      .reset_n                                     (cpu_resetn),
      .select_n_to_the_ext_flash                   (flash_cen),
      //.ss_data_from_the_seven_seg_controller       (ss_data_from_the_seven_seg_controller),
      //.ss_sel_from_the_seven_seg_controller        (ss_sel_from_the_seven_seg_controller),
      .ssram_bwn_to_the_ssram32                    (ssram_bwn),
      .ssram_cen_to_the_ssram32                    (ssram_cen),
      .ssram_oen_to_the_ssram32                    (ssram_oen),
      .ssram_wen_to_the_ssram32                    (ssram_wen),
      //.sys_clk                                     (sys_clk),
      .tri_state_bridge_address                    (fsm_a),
      .tri_state_bridge_data                       (fsm_d),
      .write_n_to_the_ext_flash                    (flash_wen)
    );


endmodule



