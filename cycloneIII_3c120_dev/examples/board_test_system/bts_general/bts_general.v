//
//  Nios2  Triple Speed Ethernet Reference Design top-level verilog module for 3C120 design variant.
//  
//

module bts_general
(
    input           clkin_50,
    input           clkin_125,

    input           cpu_reset_n,

    input           enet_led_link1000,
    output          enet_mdc,
    inout           enet_mdio,
    output          enet_resetn,
    input           enet_rx_clk,
    input           enet_rx_dv,
    input   [3:0]   enet_rxd,
    output          enet_gtx_clk,
    output          enet_tx_en,
    output  [3:0]   enet_txd,

    output          flash_cen,
    output          flash_oen,
    input           flash_rdybsyn,
    output          flash_resetn,
    output          flash_wen,
    output wire [24:0]  fsa,
    inout wire  [31:0]  fsd,
    
    output	[3:0]   sram_ben,
	output          sram_csn,
	output          sram_oen,
	output          sram_wen,
	

    input   [7:0]   user_dipsw,
    output  [7:0]   user_led,
    input   [3:0]   user_pb,
    
    output	[6:0]	ss_data,
    output	[4:1]	ss_sel,
   
    inout	[7:0]	LCD_data,
    output			LCD_E,
    output			LCD_RS,
    output			LCD_RW
    
    
);

//
// Declare a localparam for the number of reset sources that exist in this design.
// This parameter will be used by the global_reset_generator module.
//
	localparam RESET_SOURCES_COUNT = 2;

//
// define the wires required for the top level stitching
//

reg [(RESET_SOURCES_COUNT - 1):0]   resetn_sources;

wire            locked_from_the_enet_pll;

wire    [25:0]  address_to_the_cfi_flash_64m;

wire            mdio_oen_from_the_tse_mac;
wire            mdio_out_from_the_tse_mac;
wire            eth_mode_from_the_tse_mac;
wire            ena_10_from_the_tse_mac;
wire            enet_tx_125;
wire            enet_tx_25;
wire            enet_tx_2p5;

wire            tx_clk_to_the_tse_mac;
wire            global_resetn;

//
// Shift the flash byte address from the SOPC system down one bit for the 16-bit flash device.
//
assign fsa  =   address_to_the_cfi_flash_64m[25:1];
assign flash_resetn =   global_resetn;


//
// Ethernet interface assignments
//
assign enet_resetn  =   global_resetn;

altddio_out     altddio_out_component (
                    .outclock ( tx_clk_to_the_tse_mac ),
                    .dataout ( enet_gtx_clk ),
                    .aclr (!global_resetn),
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


assign tx_clk_to_the_tse_mac    =   (eth_mode_from_the_tse_mac) ? (enet_tx_125) :       // GbE Mode = 125MHz clock
                                    (ena_10_from_the_tse_mac) ? (enet_tx_2p5) :         // 10Mb Mode = 2.5MHz clock
                                    (enet_tx_25);                                       // 100Mb Mode = 25MHz clock
                        
assign enet_mdio    =   (!mdio_oen_from_the_tse_mac) ? (mdio_out_from_the_tse_mac) : (1'bz);


//
// Tie the reset sources from the system into the global_reset_generator module.
// The reset counter width of 16 should provide a 2^16 clock assertion of global reset
// which at 50MHz should be 1.31ms long.
//
    always @ (*) begin
        resetn_sources[(RESET_SOURCES_COUNT - 1)]   <=  cpu_reset_n;
        resetn_sources[(RESET_SOURCES_COUNT - 2)]   <=  locked_from_the_enet_pll;
        
    end

global_reset_generator 
#(
    .RESET_SOURCES_WIDTH  (RESET_SOURCES_COUNT),
    .RESET_COUNTER_WIDTH  (16)
) global_reset_generator_inst
(
    .clk            (clkin_50),
    .resetn_sources (resetn_sources),
    .global_resetn  (global_resetn),
    .pll_resetn     ()
);

//
// The SOPC system instantiation.
//
bts_general_sopc bts_general_sopc_inst
(
	.LCD_E_from_the_tristate_lcd           (LCD_E),
    .LCD_RS_from_the_tristate_lcd          (LCD_RS),
    .LCD_RW_from_the_tristate_lcd          (LCD_RW),
    .LCD_data_to_and_from_the_tristate_lcd (LCD_data),
   
    
    // 1) global signals:
    .clkin_50                                           (clkin_50),
    .clkin_125                                          (clkin_125),

    .enet_pll_c0_out                                    (enet_tx_125),
    .enet_pll_c1_out                                    (enet_tx_25),
    .enet_pll_c2_out                                    (enet_tx_2p5),
    .reset_n                                            (global_resetn),

    // the_user_led_pio_8out
    .out_port_from_the_led_pio                          (user_led),
	.in_port_to_the_dip_pio                      		(user_dipsw),
    .in_port_to_the_pb_pio                       		(user_pb),

    //Flash - Modified
    // the_cfi_flash_atb_avalon_slave

    .read_n_to_the_ext_flash	                        (flash_oen),
    .select_n_to_the_ext_flash	                        (flash_cen),
    .write_n_to_the_ext_flash	                        (flash_wen),
    .cfi_flash_atb_address 								(address_to_the_cfi_flash_64m),
    .cfi_flash_atb_data 								(fsd),
        
    .ssram_bwn_to_the_ssram32_0     					(sram_ben),
    .ssram_cen_to_the_ssram32_0     					(sram_csn),
    .ssram_oen_to_the_ssram32_0     					(sram_oen),
    .ssram_wen_to_the_ssram32_0     					(sram_wen),
 
    // the_enet_pll
    .areset_to_the_enet_pll                             (!global_resetn),
    .locked_from_the_enet_pll                           (locked_from_the_enet_pll),
    
    .ss_data_from_the_seven_seg_controller 				(ss_data),
    .ss_sel_from_the_seven_seg_controller  				(ss_sel),

    // the_tse_mac
    .ena_10_from_the_tse_mac                            (ena_10_from_the_tse_mac),
    .eth_mode_from_the_tse_mac                          (eth_mode_from_the_tse_mac),
    .mdc_from_the_tse_mac                               (enet_mdc),
    .mdio_in_to_the_tse_mac                             (enet_mdio),
    .mdio_oen_from_the_tse_mac                          (mdio_oen_from_the_tse_mac),
    .mdio_out_from_the_tse_mac                          (mdio_out_from_the_tse_mac),
    .rgmii_in_to_the_tse_mac                            (enet_rxd),
    .rgmii_out_from_the_tse_mac                         (enet_txd),
    .rx_clk_to_the_tse_mac                              (enet_rx_clk),
    .rx_control_to_the_tse_mac                          (enet_rx_dv),
    .set_1000_to_the_tse_mac                            (),
    .set_10_to_the_tse_mac                              (),
    .tx_clk_to_the_tse_mac                              (tx_clk_to_the_tse_mac),
    .tx_control_from_the_tse_mac                        (enet_tx_en)


);

endmodule
