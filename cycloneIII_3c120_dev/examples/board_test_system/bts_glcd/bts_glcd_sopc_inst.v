  //Example instantiation for system 'bts_glcd_sopc'
  bts_glcd_sopc bts_glcd_sopc_inst
    (
      .LCD_E_from_the_character_lcd                (LCD_E_from_the_character_lcd),
      .LCD_RS_from_the_character_lcd               (LCD_RS_from_the_character_lcd),
      .LCD_RW_from_the_character_lcd               (LCD_RW_from_the_character_lcd),
      .LCD_data_to_and_from_the_character_lcd      (LCD_data_to_and_from_the_character_lcd),
      .in_port_to_the_dip_pio                      (in_port_to_the_dip_pio),
      .in_port_to_the_pb_pio                       (in_port_to_the_pb_pio),
      .lcd_csn_from_the_graphic_lcd_driver         (lcd_csn_from_the_graphic_lcd_driver),
      .lcd_d_cn_from_the_graphic_lcd_driver        (lcd_d_cn_from_the_graphic_lcd_driver),
      .lcd_data_to_and_from_the_graphic_lcd_driver (lcd_data_to_and_from_the_graphic_lcd_driver),
      .lcd_e_rdn_from_the_graphic_lcd_driver       (lcd_e_rdn_from_the_graphic_lcd_driver),
      .lcd_en_from_the_graphic_lcd_driver          (lcd_en_from_the_graphic_lcd_driver),
      .lcd_rstn_from_the_graphic_lcd_driver        (lcd_rstn_from_the_graphic_lcd_driver),
      .lcd_wen_from_the_graphic_lcd_driver         (lcd_wen_from_the_graphic_lcd_driver),
      .osc_clk                                     (osc_clk),
      .out_port_from_the_led_pio                   (out_port_from_the_led_pio),
      .read_n_to_the_ext_flash                     (read_n_to_the_ext_flash),
      .reset_n                                     (reset_n),
      .select_n_to_the_ext_flash                   (select_n_to_the_ext_flash),
      .ss_data_from_the_seven_seg_controller       (ss_data_from_the_seven_seg_controller),
      .ss_sel_from_the_seven_seg_controller        (ss_sel_from_the_seven_seg_controller),
      .ssram_bwn_to_the_ssram32                    (ssram_bwn_to_the_ssram32),
      .ssram_cen_to_the_ssram32                    (ssram_cen_to_the_ssram32),
      .ssram_oen_to_the_ssram32                    (ssram_oen_to_the_ssram32),
      .ssram_wen_to_the_ssram32                    (ssram_wen_to_the_ssram32),
      .sys_clk                                     (sys_clk),
      .tri_state_bridge_address                    (tri_state_bridge_address),
      .tri_state_bridge_data                       (tri_state_bridge_data),
      .write_n_to_the_ext_flash                    (write_n_to_the_ext_flash)
    );

