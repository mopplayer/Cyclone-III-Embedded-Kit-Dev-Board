/*
cycloneIII_3c120_dev_niosII_standard.v
This is a top level wrapper file that instanciates the
nios2 sopc builder system
*/

module cycloneIII_3c120_dev_niosII_standard(

               // global signals:
                clkin_50,
                clkin_125,
                user_resetn,

                ddr2bot_a,
                ddr2bot_ba,
                ddr2bot_casn,
                ddr2bot_cke,
                ddr2_ck_n,
                ddr2_ck_p,
                ddr2bot_csn,
                ddr2_dm,
                ddr2_dq,
                ddr2_dqs,
                ddr2bot_rasn,
                ddr2bot_wen,
                ddr2bot_odt,

               // the_lcd
                lcd_wen,
                lcd_data,
                lcd_en,
                lcd_d_cn,
   
               // the_button_pio
                user_pb,

               // the_flash_tristate_bridge_avalon_slave
                fsa,
                fsd,
                flash_oen,
                flash_cen,
                flash_wen,
                flash_resetn,

               // the_led_pio
                user_led,
               
               // ethernet interface
                enet_mdc,
                enet_mdio,
                enet_rx_clk,
                enet_tx_en,
                enet_gtx_clk,
                enet_rxd,
                enet_txd,
                enet_rx_dv,
                enet_resetn
         //     enet_led_link1000
	 
);


  output           lcd_wen;
  inout   [7:  0]  lcd_data;
  output           lcd_en;
  output           lcd_d_cn;
  output  [ 24: 0] fsa;
  inout   [ 31: 0] fsd;
  output  [ 12: 0] ddr2bot_a;
  output  [  1: 0] ddr2bot_ba;
  output           ddr2bot_casn;
  output           ddr2bot_cke;
  output           ddr2bot_odt;
  inout   [  2: 0] ddr2_ck_n;
  inout   [  2: 0] ddr2_ck_p;
  output           ddr2bot_csn;
  output  [  1: 0] ddr2_dm;
  inout   [ 15: 0] ddr2_dq;
  inout   [  1: 0] ddr2_dqs;
  output           ddr2bot_rasn;
  output           ddr2bot_wen;
  output  [  7: 0] user_led;
  output           flash_oen;
  output           flash_cen;
  output           flash_wen;
  output           flash_resetn;
  input            clkin_50;
  input            clkin_125;
  input   [  3: 0] user_pb;
  input            user_resetn;
  output           enet_mdc;
  inout            enet_mdio;
  input   [  3: 0] enet_rxd;
  output  [  3: 0] enet_txd;
  input            enet_rx_clk;
  output           enet_tx_en;
  output           enet_gtx_clk;
  input            enet_rx_dv;
  output           enet_resetn;
  //input            enet_led_link1000

  wire    [ 25: 0] fsa_alignment;
  wire             mdio_out;
  wire             mdio_oen;
  wire             mdio_in;
  wire             tx_clk_to_the_tse_mac;
  wire             ena_10_from_the_tse_mac;
  wire             eth_mode_from_the_tse_mac;
  wire             eth_wire;
  wire    [1:0]    eth_speed;	 //rgmii clock select

// Code ////////////////////////////////////////////////
  // enet  mdio code 
  assign mdio_in = enet_mdio;
  assign enet_mdio = (mdio_oen == 1'b0) ? mdio_out : 1'bz;

  // flash
  assign fsa[24:0] = fsa_alignment[25:1]; //The A0 on the 16 bit fsa bus is dropped
  assign flash_resetn = user_resetn;

  // PHY interface: reset and clocking
    // reset
    reg [15:0] epcount;
    always @(posedge clkin_50)
    begin 
      if (user_resetn == 1'b0)
        epcount <= 16'b0;
      else
      if (epcount[15] == 1'b0)
        epcount <= epcount +1;
      else
        epcount <= epcount;
    end
    assign enet_resetn = !epcount[14];

    // clocking ethernet
    // first the clocks for ethernet speed using external verilog code
    assign eth_speed = {eth_mode_from_the_tse_mac, ena_10_from_the_tse_mac};
  
    rgmii_clk_div U_CLK_DIV2(
      .reset(0),
      .clk(clkin_125),
      .eth_speed(eth_speed),
      .mac_clk(tx_clk_to_the_tse_mac));

    // now for clocking the phy
    ddr_o phy_ckgen( 
      .datain_h(1'b1),
      .datain_l(1'b0),
      .outclock(tx_clk_to_the_tse_mac), 
      .dataout(enet_gtx_clk));



//  The NIOS
	cycloneIII_3c120_dev_niosII_standard_sopc this_cycloneIII_3c120_dev_niosII_standard_SOPC
	(
      .LCD_E_from_the_lcd_display(lcd_en),
      .LCD_RS_from_the_lcd_display(lcd_d_cn),
      .LCD_RW_from_the_lcd_display(lcd_wen),
      .LCD_data_to_and_from_the_lcd_display(lcd_data),
		.address_to_the_ext_flash(fsa_alignment),
		.data_to_and_from_the_ext_flash(fsd),
		.mem_addr_from_the_altmemddr(ddr2bot_a),
		.mem_ba_from_the_altmemddr(ddr2bot_ba),
		.mem_cas_n_from_the_altmemddr(ddr2bot_casn),
		.mem_cke_from_the_altmemddr(ddr2bot_cke),
		.mem_clk_n_to_and_from_the_altmemddr(ddr2_ck_n),
		.mem_clk_to_and_from_the_altmemddr(ddr2_ck_p),
		.mem_cs_n_from_the_altmemddr(ddr2bot_csn),
		.mem_dm_from_the_altmemddr(ddr2_dm),
		.mem_dq_to_and_from_the_altmemddr(ddr2_dq),
		.mem_dqs_to_and_from_the_altmemddr(ddr2_dqs),
		.mem_ras_n_from_the_altmemddr(ddr2bot_rasn),
		.mem_we_n_from_the_altmemddr(ddr2bot_wen),
		.mem_odt_from_the_altmemddr(ddr2bot_odt),
		.out_port_from_the_led_pio(user_led),
		.read_n_to_the_ext_flash(flash_oen),
		.select_n_to_the_ext_flash(flash_cen),
		.write_n_to_the_ext_flash(flash_wen),
		.osc_clk(clkin_50),
		.osc_clk_1(clkin_125),
		.global_reset_n_to_the_altmemddr(user_resetn),
		.in_port_to_the_button_pio(user_pb),
		.reset_n(user_resetn),
      //probably for the tse adding in
      .ena_10_from_the_tse_mac              (ena_10_from_the_tse_mac),
      .eth_mode_from_the_tse_mac            (eth_mode_from_the_tse_mac),
      .mdc_from_the_tse_mac                 (enet_mdc),
      .mdio_in_to_the_tse_mac               (mdio_in),
      .mdio_oen_from_the_tse_mac            (mdio_oen),
      .mdio_out_from_the_tse_mac            (mdio_out),
      .rgmii_in_to_the_tse_mac              (enet_rxd),
      .rgmii_out_from_the_tse_mac           (enet_txd),
      .rx_clk_to_the_tse_mac                (enet_rx_clk),
      .rx_control_to_the_tse_mac            (enet_rx_dv),
      //.set_1000_to_the_tse_mac              (),
      //.set_10_to_the_tse_mac                (),
      //.tx_clk_to_the_tse_mac                (enet_gtx_clk),
      .tx_clk_to_the_tse_mac                (tx_clk_to_the_tse_mac),
      .tx_control_from_the_tse_mac          (enet_tx_en),
      //new or misunderstood
      //.altmemddr_aux_full_rate_clk_out      (),
      //.altmemddr_aux_half_rate_clk_out      (),
      //.altmemddr_phy_clk_out                (),
      //.local_init_done_from_the_altmemddr   (),
      //.local_refresh_ack_from_the_altmemddr (),
      //.local_wdata_req_from_the_altmemddr   (),
      //.reset_phy_clk_n_from_the_altmemddr   (),
      //.system_clk                           ()
	);

endmodule
