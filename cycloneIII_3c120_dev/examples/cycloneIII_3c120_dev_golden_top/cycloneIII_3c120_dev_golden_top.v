/* cycloneIII_3c120_dev_golden_top.v
 This is a top level wrapper file that instanciates the
 golden top project

*/
module cycloneIII_3c120_dev_golden_top(

// global signals:
output	speaker_out,
input	cpu_resetn,
output	max_csn,
output	max_oen,
output	max_wen,
output	max2_clk,
input	clkin_50,
input	clkin_125,
input	clkin_sma,
output	clkout_sma,
// input	ALTERA_DCLK,
// input	ALTERA_DATA0,

// ethernet
output	enet_mdc,
inout	enet_mdio,
input	enet_rx_clk,
output	enet_tx_en,
output	enet_gtx_clk,
input	[3:0]	enet_rxd,
output	[3:0]	enet_txd,
input	enet_rx_dv,
input	enet_resetn,
input	enet_led_link1000,

// Dip switch, push button, led, LCD and 7 segment 
	
input	[7:0]	user_led,				
input	[3:0]	user_pb,
input	[7:0]	user_dipsw,
output	[4:1]	seven_seg_sel,
output	seven_seg_a,
output	seven_seg_b,
output	seven_seg_c,
output	seven_seg_d,
output	seven_seg_e,
output	seven_seg_f,
output	seven_seg_g,
output	seven_seg_dp,
output	seven_seg_minus,
input	lcd_rstn,
output	lcd_wen,
output	lcd_e_rdn,
output	[7:0]	lcd_data,
output	lcd_en,
output	lcd_csn,
output	lcd_d_cn,


// USB signal
input	[7:0]	usb_fd,
input	usb_ifclk,
input	usb_cmd_data,
input	usb_ren,
input	usb_wen,
input	usb_empty,
input	usb_full,	
					
/*												              
// ddr2 is disable due to bank sharing with other components (flash, dipsw & PB), uncomment to enable DDR2
output	ddr2top_wen,
output	ddr2top_rasn,
output	ddr2top_casn,
output	ddr2top_cke,
output	ddr2top_csn,
output	ddr2top_odt,
output	ddr2bot_wen,
output	ddr2bot_rasn,
output	ddr2bot_casn,
output	ddr2bot_cke,
output	ddr2bot_csn,
output	ddr2bot_odt,
inout	[71:0]	ddr2_dq,
inout	[8:0]	ddr2_dqs,
inout	[8:0]	ddr2_dm,
output	[2:0]	ddr2_ck_p,
output	[2:0]	ddr2_ck_n,
output	[15:0]	ddr2top_a,
output	[2:0]	ddr2top_ba,
output	[15:0]	ddr2bot_a,
output	[2:0]	ddr2bot_ba,
output	ddr2bot_active,
output	ddr2top_active,
*/

                 
// flash/ssram shared bus  
output	flash_oen,
output	flash_wen,
output	flash_cen,
input	flash_rdybsyn,
output	flash_resetn,
output	[24:0]	fsa,
inout	[31:0]	fsd,
output	sram_advn,
output	[3:0]	sram_ben,
output	sram_clk,
output	sram_csn,
output	sram_oen,
output	sram_wen,
input	[1:0]	sram_wait,
output	sram_psn               
        
               
// hsmc (hsmb & hsma), uncomment this to enable HSMA and HSMB
/*
input	[2:1]	hsmb_clk_in_p,
input	[2:1]	hsmb_clk_in_n,
output	[2:1]	hsmb_clk_out_p,
output	[2:1]	hsmb_clk_out_n,
inout	[3:0]	hsmb_d,
inout	[16:0]	hsmb_rx_d_p,
inout	[16:0]	hsmb_rx_d_n,
inout	[16:0]	hsmb_tx_d_p,
inout	[16:0]	hsmb_tx_d_n,

input	[2:1]	hsma_clk_in_p,
input	[2:1]	hsma_clk_in_n,
output	[2:1]	hsma_clk_out_p,
output	[2:1]	hsma_clk_out_n,
inout	[3:0]	hsma_d,
inout	[16:0]	hsma_rx_d_p,
inout	[16:0]	hsma_rx_d_n,
inout	[16:0]	hsma_tx_d_p,
inout	[16:0]	hsma_tx_d_n
*/

//DSP_Kit replaces HSMA uncomment this section if using hsma

/*
output	pclk0p,
output	pclk0n,
output	pclk1p,
output	pclk1n,
inout	[13:0]	ada_d,
inout	[13:0]	adb_d,
inout	ada_oe,
inout	ada_dco,
inout	ada_or,
inout	ada_cs,
inout	adb_oe
inout	adb_dco
inout	adb_or
inout	adb_cs
inout	[13:0]	da,
inout	[13:0]	db,
*/	

	
);  

endmodule
