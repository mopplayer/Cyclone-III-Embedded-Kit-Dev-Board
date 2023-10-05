  //Example instantiation for system 'bup_3c120_fpga_sopc'
  bup_3c120_fpga_sopc bup_3c120_fpga_sopc_inst
    (
      .LCD_E_from_the_lcd            (LCD_E_from_the_lcd),
      .LCD_RS_from_the_lcd           (LCD_RS_from_the_lcd),
      .LCD_RW_from_the_lcd           (LCD_RW_from_the_lcd),
      .LCD_data_to_and_from_the_lcd  (LCD_data_to_and_from_the_lcd),
      .ena_10_from_the_tse_mac       (ena_10_from_the_tse_mac),
      .eth_mode_from_the_tse_mac     (eth_mode_from_the_tse_mac),
      .flash_tristate_bridge_address (flash_tristate_bridge_address),
      .flash_tristate_bridge_data    (flash_tristate_bridge_data),
      .mdc_from_the_tse_mac          (mdc_from_the_tse_mac),
      .mdio_in_to_the_tse_mac        (mdio_in_to_the_tse_mac),
      .mdio_oen_from_the_tse_mac     (mdio_oen_from_the_tse_mac),
      .mdio_out_from_the_tse_mac     (mdio_out_from_the_tse_mac),
      .osc_clk                       (osc_clk),
      .out_port_from_the_led_pio     (out_port_from_the_led_pio),
      .read_n_to_the_ext_flash       (read_n_to_the_ext_flash),
      .reset_n                       (reset_n),
      .rgmii_in_to_the_tse_mac       (rgmii_in_to_the_tse_mac),
      .rgmii_out_from_the_tse_mac    (rgmii_out_from_the_tse_mac),
      .rx_clk_to_the_tse_mac         (rx_clk_to_the_tse_mac),
      .rx_control_to_the_tse_mac     (rx_control_to_the_tse_mac),
      .select_n_to_the_ext_flash     (select_n_to_the_ext_flash),
      .set_1000_to_the_tse_mac       (set_1000_to_the_tse_mac),
      .set_10_to_the_tse_mac         (set_10_to_the_tse_mac),
      .ssram_bwn_to_the_ssram        (ssram_bwn_to_the_ssram),
      .ssram_cen_to_the_ssram        (ssram_cen_to_the_ssram),
      .ssram_oen_to_the_ssram        (ssram_oen_to_the_ssram),
      .ssram_wen_to_the_ssram        (ssram_wen_to_the_ssram),
      .tx_clk_to_the_tse_mac         (tx_clk_to_the_tse_mac),
      .tx_control_from_the_tse_mac   (tx_control_from_the_tse_mac),
      .write_n_to_the_ext_flash      (write_n_to_the_ext_flash)
    );
