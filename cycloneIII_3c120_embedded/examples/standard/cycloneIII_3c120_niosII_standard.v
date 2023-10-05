//Legal Notice: (C)2008 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_niosII_standard (
                                          // inputs:
                                           top_button,
                                           top_clkin_125,
                                           top_clkin_50,
                                           top_enet_rx_clk,
                                           top_enet_rx_dv,
                                           top_enet_rxd,
                                           top_reset_n,

                                          // outputs:
                                           top_cs_n_to_the_max2,
                                           top_ddr2_ck_n,
                                           top_ddr2_ck_p,
                                           top_ddr2bot_a,
                                           top_ddr2bot_ba,
                                           top_ddr2bot_casn,
                                           top_ddr2bot_cke,
                                           top_ddr2bot_csn,
                                           top_ddr2bot_dm,
                                           top_ddr2bot_dq,
                                           top_ddr2bot_dqs,
                                           top_ddr2bot_odt,
                                           top_ddr2bot_rasn,
                                           top_ddr2bot_wen,
                                           top_enet_gtx_clk,
                                           top_enet_mdc,
                                           top_enet_mdio,
                                           top_enet_resetn,
                                           top_enet_tx_en,
                                           top_enet_txd,
                                           top_flash_cen,
                                           top_flash_oen,
                                           top_flash_resetn,
                                           top_flash_wen,
                                           top_fsa,
                                           top_fsd,
                                           top_led,
                                           top_oe_n_to_the_max2,
                                           top_we_n_to_the_max2
                                        )
;

  output           top_cs_n_to_the_max2;
  inout   [  1: 0] top_ddr2_ck_n;
  inout   [  1: 0] top_ddr2_ck_p;
  output  [ 12: 0] top_ddr2bot_a;
  output  [  1: 0] top_ddr2bot_ba;
  output           top_ddr2bot_casn;
  output           top_ddr2bot_cke;
  output           top_ddr2bot_csn;
  output  [  1: 0] top_ddr2bot_dm;
  inout   [ 15: 0] top_ddr2bot_dq;
  inout   [  1: 0] top_ddr2bot_dqs;
  output           top_ddr2bot_odt;
  output           top_ddr2bot_rasn;
  output           top_ddr2bot_wen;
  output           top_enet_gtx_clk;
  output           top_enet_mdc;
  inout            top_enet_mdio;
  output           top_enet_resetn;
  output           top_enet_tx_en;
  output  [  3: 0] top_enet_txd;
  output           top_flash_cen;
  output           top_flash_oen;
  output           top_flash_resetn;
  output           top_flash_wen;
  output  [ 24: 0] top_fsa;
  inout   [ 31: 0] top_fsd;
  output  [  7: 0] top_led;
  output           top_oe_n_to_the_max2;
  output           top_we_n_to_the_max2;
  input   [  3: 0] top_button;
  input            top_clkin_125;
  input            top_clkin_50;
  input            top_enet_rx_clk;
  input            top_enet_rx_dv;
  input   [  3: 0] top_enet_rxd;
  input            top_reset_n;

  wire             top_HSMB_LCD_NCLK;
  wire             top_clk_to_tse_pll;
  reg     [ 22: 0] top_counter /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  wire             top_cs_n_to_the_max2;
  wire    [  1: 0] top_ddr2_ck_n;
  wire    [  1: 0] top_ddr2_ck_p;
  wire             top_ddr2_sdram_aux_full_rate_clk_out;
  wire             top_ddr2_sdram_aux_half_rate_clk_out;
  wire             top_ddr2_sdram_phy_clk_out;
  wire    [ 12: 0] top_ddr2bot_a;
  wire    [  1: 0] top_ddr2bot_ba;
  wire             top_ddr2bot_casn;
  wire             top_ddr2bot_cke;
  wire             top_ddr2bot_csn;
  wire    [  1: 0] top_ddr2bot_dm;
  wire    [ 15: 0] top_ddr2bot_dq;
  wire    [  1: 0] top_ddr2bot_dqs;
  wire             top_ddr2bot_odt;
  wire             top_ddr2bot_rasn;
  wire             top_ddr2bot_wen;
  wire             top_ena_10_from_the_tse_mac;
  wire             top_enet_gtx_clk;
  wire             top_enet_mdc;
  wire             top_enet_mdio;
  wire             top_enet_resetn;
  wire             top_enet_tx_clk_core;
  wire             top_enet_tx_clk_phy;
  wire             top_enet_tx_en;
  wire    [  3: 0] top_enet_txd;
  wire             top_eth_mode_from_the_tse_mac;
  wire             top_flash_cen;
  wire             top_flash_oen;
  wire             top_flash_resetn;
  wire             top_flash_wen;
  wire    [ 24: 0] top_fsa;
  wire    [ 25: 0] top_fsa_alignment;
  wire    [ 31: 0] top_fsd;
  wire             top_generated_reset_n;
  wire    [  3: 0] top_in_port_to_the_button_pio;
  wire             top_ini_delayed_reset_n;
  wire             top_internal_reset_n;
  wire    [  7: 0] top_led;
  wire             top_local_init_done_from_the_ddr2_sdram;
  wire             top_local_refresh_ack_from_the_ddr2_sdram;
  wire             top_local_wdata_req_from_the_ddr2_sdram;
  wire             top_locked_from_the_pll;
  wire             top_locked_from_the_tse_pll;
  wire             top_locked_from_the_tse_tx_pll;
  wire             top_mdc_from_the_tse_mac;
  wire             top_mdio_in;
  wire             top_mdio_in_to_the_tse_mac;
  wire             top_mdio_oen;
  wire             top_mdio_oen_from_the_tse_mac;
  wire             top_mdio_out;
  wire             top_mdio_out_from_the_tse_mac;
  wire             top_oe_n_to_the_max2;
  wire             top_pll_c2_out;
  wire             top_pll_c3_out;
  wire             top_pll_c4_out;
  wire             top_reset_phy_clk_n_from_the_ddr2_sdram;
  wire    [  3: 0] top_rgmii_in_to_the_tse_mac;
  wire    [  3: 0] top_rgmii_out_from_the_tse_mac;
  wire             top_rx_clk_to_the_tse_mac;
  wire             top_rx_control_to_the_tse_mac;
  wire             top_set_1000_to_the_tse_mac;
  wire             top_set_10_to_the_tse_mac;
  wire             top_tse_pll_c0_out;
  wire             top_tse_tx_pll_c0_out;
  wire             top_tse_tx_pll_c1_out;
  wire             top_tse_tx_pll_c2_out;
  wire             top_tse_tx_pll_c3_out;
  wire             top_tx_clk_to_the_tse_mac;
  wire             top_tx_control_from_the_tse_mac;
  wire             top_we_n_to_the_max2;
  cycloneIII_3c120_niosII_standard_sopc cycloneIII_3c120_niosII_standard_sopc_instance
    (
      .clk (top_clkin_50),
      .clk_125 (top_clkin_125),
      .clk_to_tse_pll (top_clk_to_tse_pll),
      .cs_n_to_the_max2 (top_cs_n_to_the_max2),
      .ddr2_sdram_aux_full_rate_clk_out (top_ddr2_sdram_aux_full_rate_clk_out),
      .ddr2_sdram_aux_half_rate_clk_out (top_ddr2_sdram_aux_half_rate_clk_out),
      .ddr2_sdram_phy_clk_out (top_ddr2_sdram_phy_clk_out),
      .ena_10_from_the_tse_mac (top_ena_10_from_the_tse_mac),
      .eth_mode_from_the_tse_mac (top_eth_mode_from_the_tse_mac),
      .flash_tristate_bridge_address (top_fsa_alignment),
      .flash_tristate_bridge_data (top_fsd),
      .global_reset_n_to_the_ddr2_sdram (top_internal_reset_n),
      .in_port_to_the_button_pio (top_in_port_to_the_button_pio),
      .local_init_done_from_the_ddr2_sdram (top_local_init_done_from_the_ddr2_sdram),
      .local_refresh_ack_from_the_ddr2_sdram (top_local_refresh_ack_from_the_ddr2_sdram),
      .local_wdata_req_from_the_ddr2_sdram (top_local_wdata_req_from_the_ddr2_sdram),
      .locked_from_the_pll (top_locked_from_the_pll),
      .locked_from_the_tse_pll (top_locked_from_the_tse_pll),
      .locked_from_the_tse_tx_pll (top_locked_from_the_tse_tx_pll),
      .mdc_from_the_tse_mac (top_mdc_from_the_tse_mac),
      .mdio_in_to_the_tse_mac (top_mdio_in_to_the_tse_mac),
      .mdio_oen_from_the_tse_mac (top_mdio_oen_from_the_tse_mac),
      .mdio_out_from_the_tse_mac (top_mdio_out_from_the_tse_mac),
      .mem_addr_from_the_ddr2_sdram (top_ddr2bot_a),
      .mem_ba_from_the_ddr2_sdram (top_ddr2bot_ba),
      .mem_cas_n_from_the_ddr2_sdram (top_ddr2bot_casn),
      .mem_cke_from_the_ddr2_sdram (top_ddr2bot_cke),
      .mem_clk_n_to_and_from_the_ddr2_sdram (top_ddr2_ck_n[0]),
      .mem_clk_to_and_from_the_ddr2_sdram (top_ddr2_ck_p[0]),
      .mem_cs_n_from_the_ddr2_sdram (top_ddr2bot_csn),
      .mem_dm_from_the_ddr2_sdram (top_ddr2bot_dm),
      .mem_dq_to_and_from_the_ddr2_sdram (top_ddr2bot_dq),
      .mem_dqs_to_and_from_the_ddr2_sdram (top_ddr2bot_dqs),
      .mem_odt_from_the_ddr2_sdram (top_ddr2bot_odt),
      .mem_ras_n_from_the_ddr2_sdram (top_ddr2bot_rasn),
      .mem_we_n_from_the_ddr2_sdram (top_ddr2bot_wen),
      .oe_n_to_the_max2 (top_oe_n_to_the_max2),
      .out_port_from_the_led_pio (top_led),
      .pll_c0_out (top_HSMB_LCD_NCLK),
      .pll_c2_out (top_pll_c2_out),
      .pll_c3_out (top_pll_c3_out),
      .pll_c4_out (top_pll_c4_out),
      .read_n_to_the_ext_flash (top_flash_oen),
      .reset_n (top_internal_reset_n),
      .reset_phy_clk_n_from_the_ddr2_sdram (top_reset_phy_clk_n_from_the_ddr2_sdram),
      .rgmii_in_to_the_tse_mac (top_rgmii_in_to_the_tse_mac),
      .rgmii_out_from_the_tse_mac (top_rgmii_out_from_the_tse_mac),
      .rx_clk_to_the_tse_mac (top_rx_clk_to_the_tse_mac),
      .rx_control_to_the_tse_mac (top_rx_control_to_the_tse_mac),
      .select_n_to_the_ext_flash (top_flash_cen),
      .set_1000_to_the_tse_mac (top_set_1000_to_the_tse_mac),
      .set_10_to_the_tse_mac (top_set_10_to_the_tse_mac),
      .tse_pll_c0_out (top_tse_pll_c0_out),
      .tse_tx_pll_c0_out (top_tse_tx_pll_c0_out),
      .tse_tx_pll_c1_out (top_tse_tx_pll_c1_out),
      .tse_tx_pll_c2_out (top_tse_tx_pll_c2_out),
      .tse_tx_pll_c3_out (top_tse_tx_pll_c3_out),
      .tx_clk_to_the_tse_mac (top_tx_clk_to_the_tse_mac),
      .tx_control_from_the_tse_mac (top_tx_control_from_the_tse_mac),
      .we_n_to_the_max2 (top_we_n_to_the_max2),
      .write_n_to_the_ext_flash (top_flash_wen)
    );


  assign top_fsa = top_fsa_alignment[25 : 1];
  assign top_flash_resetn = top_internal_reset_n;
  assign top_internal_reset_n = top_reset_n;
  assign top_in_port_to_the_button_pio = top_button;
  assign top_mdio_in_to_the_tse_mac = top_mdio_in;
  assign top_mdio_out = top_mdio_out_from_the_tse_mac;
  assign top_mdio_oen = top_mdio_oen_from_the_tse_mac;
  assign top_mdio_in = top_enet_mdio;
  assign top_enet_mdio = (~top_mdio_oen)? top_mdio_out :
    1'bz;

  assign top_ini_delayed_reset_n = top_counter[22];
  assign top_generated_reset_n = top_ini_delayed_reset_n & top_internal_reset_n;
  assign top_enet_mdc = top_mdc_from_the_tse_mac;
  assign top_set_1000_to_the_tse_mac = 1'b0;
  assign top_set_10_to_the_tse_mac = 1'b0;
  assign top_enet_resetn = top_generated_reset_n;
  assign top_enet_tx_en = top_tx_control_from_the_tse_mac;
  assign top_enet_txd = top_rgmii_out_from_the_tse_mac;
  assign top_rx_control_to_the_tse_mac = top_enet_rx_dv;
  assign top_rgmii_in_to_the_tse_mac = top_enet_rxd;
  assign top_tx_clk_to_the_tse_mac = top_enet_tx_clk_core;
  assign top_rx_clk_to_the_tse_mac = top_tse_pll_c0_out;
  assign top_clk_to_tse_pll = top_enet_rx_clk;
  assign top_enet_tx_clk_core = top_eth_mode_from_the_tse_mac ? top_tse_tx_pll_c2_out: (top_ena_10_from_the_tse_mac ? top_pll_c3_out: top_tse_tx_pll_c0_out);
  assign top_enet_tx_clk_phy = top_eth_mode_from_the_tse_mac ? top_tse_tx_pll_c3_out: (top_ena_10_from_the_tse_mac ? top_pll_c4_out: top_tse_tx_pll_c1_out);
  always @(posedge top_clkin_50 or negedge top_internal_reset_n)
    begin
      if (top_internal_reset_n == 0)
          top_counter <= 0;
      else if (top_counter[22] == 1'b0)
          top_counter <= top_counter + 1;
    end


  ddr_o ddr_o_instance
    (
      .datain_h (1'b1),
      .datain_l (1'b0),
      .dataout (top_enet_gtx_clk),
      .outclock (top_enet_tx_clk_phy)
    );



endmodule

