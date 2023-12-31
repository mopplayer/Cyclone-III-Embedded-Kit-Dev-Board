  //Example instantiation for system 'cycloneIII_3c120_niosII_video_sopc'
  cycloneIII_3c120_niosII_video_sopc cycloneIII_3c120_niosII_video_sopc_inst
    (
      .DEN_from_the_lcd_sync_generator              (DEN_from_the_lcd_sync_generator),
      .HD_from_the_lcd_sync_generator               (HD_from_the_lcd_sync_generator),
      .MISO_to_the_touch_panel_spi                  (MISO_to_the_touch_panel_spi),
      .MOSI_from_the_touch_panel_spi                (MOSI_from_the_touch_panel_spi),
      .RGB_OUT_from_the_lcd_sync_generator          (RGB_OUT_from_the_lcd_sync_generator),
      .SCLK_from_the_touch_panel_spi                (SCLK_from_the_touch_panel_spi),
      .SS_n_from_the_touch_panel_spi                (SS_n_from_the_touch_panel_spi),
      .VD_from_the_lcd_sync_generator               (VD_from_the_lcd_sync_generator),
      .altpll_0_c0_out                              (altpll_0_c0_out),
      .altpll_0_c2_out                              (altpll_0_c2_out),
      .bidir_port_to_and_from_the_lcd_i2c_sdat      (bidir_port_to_and_from_the_lcd_i2c_sdat),
      .bidir_port_to_and_from_the_pio_id_eeprom_dat (bidir_port_to_and_from_the_pio_id_eeprom_dat),
      .clk                                          (clk),
      .clk_125                                      (clk_125),
      .cs_n_to_the_max2                             (cs_n_to_the_max2),
      .ddr2_sdram_1_aux_full_rate_clk_out           (ddr2_sdram_1_aux_full_rate_clk_out),
      .ddr2_sdram_1_aux_half_rate_clk_out           (ddr2_sdram_1_aux_half_rate_clk_out),
      .ddr2_sdram_1_phy_clk_out                     (ddr2_sdram_1_phy_clk_out),
      .ddr2_sdram_aux_full_rate_clk_out             (ddr2_sdram_aux_full_rate_clk_out),
      .ddr2_sdram_aux_half_rate_clk_out             (ddr2_sdram_aux_half_rate_clk_out),
      .ddr2_sdram_phy_clk_out                       (ddr2_sdram_phy_clk_out),
      .ena_10_from_the_tse_mac                      (ena_10_from_the_tse_mac),
      .eth_mode_from_the_tse_mac                    (eth_mode_from_the_tse_mac),
      .flash_tristate_bridge_address                (flash_tristate_bridge_address),
      .flash_tristate_bridge_data                   (flash_tristate_bridge_data),
      .global_reset_n_to_the_ddr2_sdram             (global_reset_n_to_the_ddr2_sdram),
      .global_reset_n_to_the_ddr2_sdram_1           (global_reset_n_to_the_ddr2_sdram_1),
      .gm_rx_d_to_the_tse_mac                       (gm_rx_d_to_the_tse_mac),
      .gm_rx_dv_to_the_tse_mac                      (gm_rx_dv_to_the_tse_mac),
      .gm_rx_err_to_the_tse_mac                     (gm_rx_err_to_the_tse_mac),
      .gm_tx_d_from_the_tse_mac                     (gm_tx_d_from_the_tse_mac),
      .gm_tx_en_from_the_tse_mac                    (gm_tx_en_from_the_tse_mac),
      .gm_tx_err_from_the_tse_mac                   (gm_tx_err_from_the_tse_mac),
      .in_port_to_the_button_pio                    (in_port_to_the_button_pio),
      .in_port_to_the_touch_panel_pen_irq_n         (in_port_to_the_touch_panel_pen_irq_n),
      .local_init_done_from_the_ddr2_sdram          (local_init_done_from_the_ddr2_sdram),
      .local_init_done_from_the_ddr2_sdram_1        (local_init_done_from_the_ddr2_sdram_1),
      .local_refresh_ack_from_the_ddr2_sdram        (local_refresh_ack_from_the_ddr2_sdram),
      .local_refresh_ack_from_the_ddr2_sdram_1      (local_refresh_ack_from_the_ddr2_sdram_1),
      .local_wdata_req_from_the_ddr2_sdram          (local_wdata_req_from_the_ddr2_sdram),
      .local_wdata_req_from_the_ddr2_sdram_1        (local_wdata_req_from_the_ddr2_sdram_1),
      .locked_from_the_altpll_0                     (locked_from_the_altpll_0),
      .m_rx_col_to_the_tse_mac                      (m_rx_col_to_the_tse_mac),
      .m_rx_crs_to_the_tse_mac                      (m_rx_crs_to_the_tse_mac),
      .m_rx_d_to_the_tse_mac                        (m_rx_d_to_the_tse_mac),
      .m_rx_en_to_the_tse_mac                       (m_rx_en_to_the_tse_mac),
      .m_rx_err_to_the_tse_mac                      (m_rx_err_to_the_tse_mac),
      .m_tx_d_from_the_tse_mac                      (m_tx_d_from_the_tse_mac),
      .m_tx_en_from_the_tse_mac                     (m_tx_en_from_the_tse_mac),
      .m_tx_err_from_the_tse_mac                    (m_tx_err_from_the_tse_mac),
      .mdc_from_the_tse_mac                         (mdc_from_the_tse_mac),
      .mdio_in_to_the_tse_mac                       (mdio_in_to_the_tse_mac),
      .mdio_oen_from_the_tse_mac                    (mdio_oen_from_the_tse_mac),
      .mdio_out_from_the_tse_mac                    (mdio_out_from_the_tse_mac),
      .mem_addr_from_the_ddr2_sdram                 (mem_addr_from_the_ddr2_sdram),
      .mem_addr_from_the_ddr2_sdram_1               (mem_addr_from_the_ddr2_sdram_1),
      .mem_ba_from_the_ddr2_sdram                   (mem_ba_from_the_ddr2_sdram),
      .mem_ba_from_the_ddr2_sdram_1                 (mem_ba_from_the_ddr2_sdram_1),
      .mem_cas_n_from_the_ddr2_sdram                (mem_cas_n_from_the_ddr2_sdram),
      .mem_cas_n_from_the_ddr2_sdram_1              (mem_cas_n_from_the_ddr2_sdram_1),
      .mem_cke_from_the_ddr2_sdram                  (mem_cke_from_the_ddr2_sdram),
      .mem_cke_from_the_ddr2_sdram_1                (mem_cke_from_the_ddr2_sdram_1),
      .mem_clk_n_to_and_from_the_ddr2_sdram         (mem_clk_n_to_and_from_the_ddr2_sdram),
      .mem_clk_n_to_and_from_the_ddr2_sdram_1       (mem_clk_n_to_and_from_the_ddr2_sdram_1),
      .mem_clk_to_and_from_the_ddr2_sdram           (mem_clk_to_and_from_the_ddr2_sdram),
      .mem_clk_to_and_from_the_ddr2_sdram_1         (mem_clk_to_and_from_the_ddr2_sdram_1),
      .mem_cs_n_from_the_ddr2_sdram                 (mem_cs_n_from_the_ddr2_sdram),
      .mem_cs_n_from_the_ddr2_sdram_1               (mem_cs_n_from_the_ddr2_sdram_1),
      .mem_dm_from_the_ddr2_sdram                   (mem_dm_from_the_ddr2_sdram),
      .mem_dm_from_the_ddr2_sdram_1                 (mem_dm_from_the_ddr2_sdram_1),
      .mem_dq_to_and_from_the_ddr2_sdram            (mem_dq_to_and_from_the_ddr2_sdram),
      .mem_dq_to_and_from_the_ddr2_sdram_1          (mem_dq_to_and_from_the_ddr2_sdram_1),
      .mem_dqs_to_and_from_the_ddr2_sdram           (mem_dqs_to_and_from_the_ddr2_sdram),
      .mem_dqs_to_and_from_the_ddr2_sdram_1         (mem_dqs_to_and_from_the_ddr2_sdram_1),
      .mem_odt_from_the_ddr2_sdram                  (mem_odt_from_the_ddr2_sdram),
      .mem_odt_from_the_ddr2_sdram_1                (mem_odt_from_the_ddr2_sdram_1),
      .mem_ras_n_from_the_ddr2_sdram                (mem_ras_n_from_the_ddr2_sdram),
      .mem_ras_n_from_the_ddr2_sdram_1              (mem_ras_n_from_the_ddr2_sdram_1),
      .mem_we_n_from_the_ddr2_sdram                 (mem_we_n_from_the_ddr2_sdram),
      .mem_we_n_from_the_ddr2_sdram_1               (mem_we_n_from_the_ddr2_sdram_1),
      .oe_n_to_the_max2                             (oe_n_to_the_max2),
      .out_port_from_the_lcd_i2c_en                 (out_port_from_the_lcd_i2c_en),
      .out_port_from_the_lcd_i2c_scl                (out_port_from_the_lcd_i2c_scl),
      .out_port_from_the_led_pio                    (out_port_from_the_led_pio),
      .out_port_from_the_pio_id_eeprom_scl          (out_port_from_the_pio_id_eeprom_scl),
      .phasedone_from_the_altpll_0                  (phasedone_from_the_altpll_0),
      .read_n_to_the_ext_flash                      (read_n_to_the_ext_flash),
      .reset_n                                      (reset_n),
      .reset_phy_clk_n_from_the_ddr2_sdram          (reset_phy_clk_n_from_the_ddr2_sdram),
      .reset_phy_clk_n_from_the_ddr2_sdram_1        (reset_phy_clk_n_from_the_ddr2_sdram_1),
      .rx_clk_to_the_tse_mac                        (rx_clk_to_the_tse_mac),
      .rxd_to_the_uart1                             (rxd_to_the_uart1),
      .select_n_to_the_ext_flash                    (select_n_to_the_ext_flash),
      .set_1000_to_the_tse_mac                      (set_1000_to_the_tse_mac),
      .set_10_to_the_tse_mac                        (set_10_to_the_tse_mac),
      .tx_clk_to_the_tse_mac                        (tx_clk_to_the_tse_mac),
      .txd_from_the_uart1                           (txd_from_the_uart1),
      .we_n_to_the_max2                             (we_n_to_the_max2),
      .write_n_to_the_ext_flash                     (write_n_to_the_ext_flash)
    );

