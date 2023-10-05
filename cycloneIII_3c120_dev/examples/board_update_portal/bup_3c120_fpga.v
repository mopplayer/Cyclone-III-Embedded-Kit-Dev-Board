//
//  Nios2  Triple Speed Ethernet Reference Design top-level verilog module for 3C120 design variant.
//  

module bup_3c120_fpga
(
    input           clkin_50,
    input           cpu_reset_n,
    
    output          flash_cen,
    output          flash_oen,
    output          flash_resetn,
    output          flash_wen,
    output  [25:0]  fsa,
    inout   [31:0]  fsd,    

    output	[3:0]   sram_ben,
	 output          sram_csn,
	 output          sram_oen,
	 output          sram_wen,
	
    output  [7:0]   user_led,

//    input           enet_led_link1000,
    output          enet_mdc,
    inout           enet_mdio,
    output          enet_resetn,
    input           enet_rx_clk,
    input           enet_rx_dv,
    input   [3:0]   enet_rxd,
    output          enet_gtx_clk,
    output          enet_tx_en,
    output  [3:0]   enet_txd,    
   
    inout	[7:0]	LCD_data,
    output			LCD_E,
    output			LCD_RS,
    output			LCD_RW
      
);

wire        mdio_in;
wire        mdio_oen;
wire        mdio_out;
wire			eth_mode;
wire			ena_10;
wire 			tx_clk;
wire        enet_tx_125;
wire        enet_tx_25;
wire        enet_tx_2p5;

parameter MSB = 20; // PHY interface: need minimum 10ms delay for POR

    reg [MSB:0] epcount; // MSB was 15, now 19
    
    always @(posedge clkin_50)
    begin 
     if (cpu_reset_n == 1'b0)
        epcount <= MSB + 1'b0;
      else
		if (epcount[MSB] == 1'b0)
			epcount <= epcount + 1;
		else
			epcount <= epcount;
    end
    
assign enet_resetn = !epcount[MSB-1];

assign flash_resetn = cpu_reset_n; 
assign mdio_in = enet_mdio;
assign enet_mdio = mdio_oen == 0 ? mdio_out : 1'bz;

altddio_out     altddio_out_component (
                    .outclock ( tx_clk ),
                    .dataout ( enet_gtx_clk ),
                    .aclr (!cpu_reset_n),
                    .datain_h (1'b1),
                    .datain_l (1'b0),
                    .outclocken (1'b1),
                    .aset (1'b0),
                    .sclr (1'b0),
                    .sset (1'b0),
                    .oe_out (),
                    .oe (1'b1)
                    );
        defparam
                altddio_out_component.extend_oe_disable = "UNUSED",
                altddio_out_component.intended_device_family = "Cyclone III",
                altddio_out_component.invert_output = "OFF",
                altddio_out_component.lpm_type = "altddio_out",
                altddio_out_component.oe_reg = "UNUSED",
                altddio_out_component.width = 1;


assign tx_clk    =   (eth_mode) ? (enet_tx_125) :       // GbE Mode = 125MHz clock
                     (ena_10) ? (enet_tx_2p5) :         // 10Mb Mode = 2.5MHz clock
                     (enet_tx_25);                      // 100Mb Mode = 25MHz clock

// TX PLL 100 => 125, 25, 2.5
tx_clk_pll tx_clk_inst
(
	.areset (!cpu_reset_n),
	.inclk0 (clkin_50), //  sent to tx_clk_to_the_tse_mac
	.c0     (enet_tx_125),
	.c1     (enet_tx_25),
	.c2     (enet_tx_2p5),
	.locked ()
);


//
// The SOPC system instantiation.
//
bup_3c120_fpga_sopc bup_3c120_fpga_sopc_inst
(
	.LCD_E_from_the_lcd           		(LCD_E),
    .LCD_RS_from_the_lcd          		(LCD_RS),
    .LCD_RW_from_the_lcd          		(LCD_RW),
    .LCD_data_to_and_from_the_lcd 		(LCD_data),
   
    .osc_clk                            (clkin_50),
    .reset_n                            (cpu_reset_n),
    .out_port_from_the_led_pio          (user_led),

    .read_n_to_the_ext_flash	        (flash_oen),
    .select_n_to_the_ext_flash	     (flash_cen),
    .write_n_to_the_ext_flash	        (flash_wen),
    .flash_tristate_bridge_address 	  (fsa),
    .flash_tristate_bridge_data 		  (fsd),
        
    .ssram_bwn_to_the_ssram     			(sram_ben),
    .ssram_cen_to_the_ssram     			(sram_csn),
    .ssram_oen_to_the_ssram     			(sram_oen),
    .ssram_wen_to_the_ssram     			(sram_wen),
    
    .ena_10_from_the_tse_mac            (ena_10),
    .eth_mode_from_the_tse_mac          (eth_mode),
    .mdc_from_the_tse_mac               (enet_mdc),
    .mdio_in_to_the_tse_mac             (enet_mdio),
    .mdio_oen_from_the_tse_mac          (mdio_oen),
    .mdio_out_from_the_tse_mac          (mdio_out),
    .rgmii_in_to_the_tse_mac            (enet_rxd),
    .rgmii_out_from_the_tse_mac         (enet_txd),
    .rx_clk_to_the_tse_mac              (enet_rx_clk),
    .rx_control_to_the_tse_mac          (enet_rx_dv),
    .set_1000_to_the_tse_mac            (),
    .set_10_to_the_tse_mac              (),
    .tx_clk_to_the_tse_mac              (tx_clk),
    .tx_control_from_the_tse_mac        (enet_tx_en)

);

endmodule
