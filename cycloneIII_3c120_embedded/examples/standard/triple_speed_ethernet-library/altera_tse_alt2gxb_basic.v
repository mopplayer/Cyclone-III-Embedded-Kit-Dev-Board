// megafunction wizard: %ALT2GXB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt2gxb 

// ============================================================
// File Name: altera_tse_alt2gxb_basic.v
// Megafunction Name(s):
// 			alt2gxb
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Internal Build 78 11/25/2008 PN Full Version
// ************************************************************


//Copyright (C) 1991-2008 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// related_files : altera_tse_alt2gxb_basic.v
// ipfs_files : altera_tse_alt2gxb_basic.vo

// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module altera_tse_alt2gxb_basic (
	cal_blk_clk,
	gxb_powerdown,
	pll_inclk,
	rx_analogreset,
	rx_cruclk,
	rx_datain,
	rx_digitalreset,
	rx_seriallpbken,
	tx_datain,
	tx_digitalreset,
	rx_clkout,
	rx_dataout,
	rx_patterndetect,
	tx_clkout,
	tx_dataout);

	input	  cal_blk_clk;
	input	[0:0]  gxb_powerdown;
	input	  pll_inclk;
	input	[0:0]  rx_analogreset;
	input	[0:0]  rx_cruclk;
	input	[0:0]  rx_datain;
	input	[0:0]  rx_digitalreset;
	input	[0:0]  rx_seriallpbken;
	input	[9:0]  tx_datain;
	input	[0:0]  tx_digitalreset;
	output	[0:0]  rx_clkout;
	output	[9:0]  rx_dataout;
	output	[0:0]  rx_patterndetect;
	output	[0:0]  tx_clkout;
	output	[0:0]  tx_dataout;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	[0:0]  rx_cruclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [0:0] sub_wire0;
	wire [0:0] sub_wire1;
	wire [0:0] sub_wire2;
	wire [0:0] sub_wire3;
	wire [9:0] sub_wire4;
	wire [0:0] sub_wire5 = 1'h0;
	wire [0:0] rx_patterndetect = sub_wire0[0:0];
	wire [0:0] rx_clkout = sub_wire1[0:0];
	wire [0:0] tx_dataout = sub_wire2[0:0];
	wire [0:0] tx_clkout = sub_wire3[0:0];
	wire [9:0] rx_dataout = sub_wire4[9:0];

	alt2gxb	alt2gxb_component (
				.pll_inclk (pll_inclk),
				.gxb_powerdown (gxb_powerdown),
				.tx_datain (tx_datain),
				.rx_revbitorderwa (sub_wire5),
				.rx_cruclk (rx_cruclk),
				.cal_blk_clk (cal_blk_clk),
				.rx_seriallpbken (rx_seriallpbken),
				.rx_datain (rx_datain),
				.rx_analogreset (rx_analogreset),
				.rx_digitalreset (rx_digitalreset),
				.tx_digitalreset (tx_digitalreset),
				.rx_patterndetect (sub_wire0),
				.rx_clkout (sub_wire1),
				.tx_dataout (sub_wire2),
				.tx_clkout (sub_wire3),
				.rx_dataout (sub_wire4)
				// synopsys translate_off
				,
				.aeq_fromgxb (),
				.aeq_togxb (),
				.cal_blk_calibrationstatus (),
				.cal_blk_powerdown (),
				.coreclkout (),
				.debug_rx_phase_comp_fifo_error (),
				.debug_tx_phase_comp_fifo_error (),
				.fixedclk (),
				.gxb_enable (),
				.pipe8b10binvpolarity (),
				.pipedatavalid (),
				.pipeelecidle (),
				.pipephydonestatus (),
				.pipestatus (),
				.pll_inclk_alt (),
				.pll_inclk_rx_cruclk (),
				.pll_locked (),
				.pll_locked_alt (),
				.powerdn (),
				.reconfig_clk (),
				.reconfig_fromgxb (),
				.reconfig_fromgxb_oe (),
				.reconfig_togxb (),
				.rx_a1a2size (),
				.rx_a1a2sizeout (),
				.rx_a1detect (),
				.rx_a2detect (),
				.rx_bistdone (),
				.rx_bisterr (),
				.rx_bitslip (),
				.rx_byteorderalignstatus (),
				.rx_channelaligned (),
				.rx_coreclk (),
				.rx_cruclk_alt (),
				.rx_ctrldetect (),
				.rx_dataoutfull (),
				.rx_disperr (),
				.rx_enabyteord (),
				.rx_enapatternalign (),
				.rx_errdetect (),
				.rx_freqlocked (),
				.rx_invpolarity (),
				.rx_k1detect (),
				.rx_k2detect (),
				.rx_locktodata (),
				.rx_locktorefclk (),
				.rx_phfifooverflow (),
				.rx_phfifordenable (),
				.rx_phfiforeset (),
				.rx_phfifounderflow (),
				.rx_phfifowrdisable (),
				.rx_pll_locked (),
				.rx_powerdown (),
				.rx_recovclkout (),
				.rx_revbyteorderwa (),
				.rx_rlv (),
				.rx_rmfifoalmostempty (),
				.rx_rmfifoalmostfull (),
				.rx_rmfifodatadeleted (),
				.rx_rmfifodatainserted (),
				.rx_rmfifoempty (),
				.rx_rmfifofull (),
				.rx_rmfifordena (),
				.rx_rmfiforeset (),
				.rx_rmfifowrena (),
				.rx_runningdisp (),
				.rx_signaldetect (),
				.rx_syncstatus (),
				.tx_coreclk (),
				.tx_ctrlenable (),
				.tx_datainfull (),
				.tx_detectrxloop (),
				.tx_dispval (),
				.tx_forcedisp (),
				.tx_forcedispcompliance (),
				.tx_forceelecidle (),
				.tx_invpolarity (),
				.tx_phfifooverflow (),
				.tx_phfiforeset (),
				.tx_phfifounderflow (),
				.tx_revparallellpbken ()
				// synopsys translate_on
				);
	defparam
		alt2gxb_component.cmu_pll_inclock_period = 8000,
		alt2gxb_component.cmu_pll_loop_filter_resistor_control = 3,
		alt2gxb_component.digitalreset_port_width = 1,
		alt2gxb_component.en_local_clk_div_ctrl = "true",
		alt2gxb_component.equalizer_ctrl_a_setting = 0,
		alt2gxb_component.equalizer_ctrl_b_setting = 0,
		alt2gxb_component.equalizer_ctrl_c_setting = 0,
		alt2gxb_component.equalizer_ctrl_d_setting = 0,
		alt2gxb_component.equalizer_ctrl_v_setting = 0,
		alt2gxb_component.equalizer_dcgain_setting = 0,
		alt2gxb_component.intended_device_family = "Stratix II GX",
		alt2gxb_component.loopback_mode = "slb",
		alt2gxb_component.lpm_type = "alt2gxb",
		alt2gxb_component.number_of_channels = 1,
		alt2gxb_component.operation_mode = "duplex",
		alt2gxb_component.pll_legal_multiplier_list = "disable_4_5_mult_above_3125",
		alt2gxb_component.preemphasis_ctrl_1stposttap_setting = 0,
		alt2gxb_component.preemphasis_ctrl_2ndposttap_inv_setting = "false",
		alt2gxb_component.preemphasis_ctrl_2ndposttap_setting = 0,
		alt2gxb_component.preemphasis_ctrl_pretap_inv_setting = "false",
		alt2gxb_component.preemphasis_ctrl_pretap_setting = 0,
		alt2gxb_component.protocol = "3g_basic",
		alt2gxb_component.receiver_termination = "oct_100_ohms",
		alt2gxb_component.reconfig_dprio_mode = 0,
		alt2gxb_component.reverse_loopback_mode = "none",
		alt2gxb_component.rx_8b_10b_compatibility_mode = "false",
		alt2gxb_component.rx_8b_10b_mode = "none",
		alt2gxb_component.rx_align_loss_sync_error_num = 1,
		alt2gxb_component.rx_align_pattern = "0101111100",
		alt2gxb_component.rx_align_pattern_length = 10,
		alt2gxb_component.rx_allow_align_polarity_inversion = "false",
		alt2gxb_component.rx_allow_pipe_polarity_inversion = "false",
		alt2gxb_component.rx_bandwidth_mode = 1,
		alt2gxb_component.rx_bitslip_enable = "false",
		alt2gxb_component.rx_byte_ordering_mode = "none",
		alt2gxb_component.rx_channel_width = 10,
		alt2gxb_component.rx_common_mode = "0.9v",
		alt2gxb_component.rx_cru_inclock_period = 8000,
		alt2gxb_component.rx_cru_pre_divide_by = 1,
		alt2gxb_component.rx_datapath_protocol = "basic",
		alt2gxb_component.rx_data_rate = 1250,
		alt2gxb_component.rx_data_rate_remainder = 0,
		alt2gxb_component.rx_disable_auto_idle_insertion = "true",
		alt2gxb_component.rx_enable_bit_reversal = "false",
		alt2gxb_component.rx_enable_deep_align_byte_swap = "false",
		alt2gxb_component.rx_enable_lock_to_data_sig = "false",
		alt2gxb_component.rx_enable_lock_to_refclk_sig = "false",
		alt2gxb_component.rx_enable_self_test_mode = "false",
		alt2gxb_component.rx_enable_true_complement_match_in_word_align = "false",
		alt2gxb_component.rx_flip_rx_out = "false",
		alt2gxb_component.rx_force_signal_detect = "true",
		alt2gxb_component.rx_num_align_cons_good_data = 1,
		alt2gxb_component.rx_num_align_cons_pat = 1,
		alt2gxb_component.rx_ppmselect = 32,
		alt2gxb_component.rx_rate_match_fifo_mode = "none",
		alt2gxb_component.rx_run_length_enable = "false",
		alt2gxb_component.rx_signal_detect_threshold = 2,
		alt2gxb_component.rx_use_align_state_machine = "true",
		alt2gxb_component.rx_use_clkout = "true",
		alt2gxb_component.rx_use_coreclk = "false",
		alt2gxb_component.rx_use_cruclk = "true",
		alt2gxb_component.rx_use_deserializer_double_data_mode = "false",
		alt2gxb_component.rx_use_deskew_fifo = "false",
		alt2gxb_component.rx_use_double_data_mode = "false",
		alt2gxb_component.transmitter_termination = "oct_100_ohms",
		alt2gxb_component.tx_8b_10b_compatibility_mode = "false",
		alt2gxb_component.tx_8b_10b_mode = "none",
		alt2gxb_component.tx_allow_polarity_inversion = "false",
		alt2gxb_component.tx_analog_power = "1.5v",
		alt2gxb_component.tx_channel_width = 10,
		alt2gxb_component.tx_common_mode = "0.6v",
		alt2gxb_component.tx_data_rate = 1250,
		alt2gxb_component.tx_data_rate_remainder = 0,
		alt2gxb_component.tx_enable_bit_reversal = "false",
		alt2gxb_component.tx_enable_idle_selection = "false",
		alt2gxb_component.tx_enable_self_test_mode = "false",
		alt2gxb_component.tx_flip_tx_in = "false",
		alt2gxb_component.tx_force_disparity_mode = "false",
		alt2gxb_component.tx_refclk_divide_by = 1,
		alt2gxb_component.tx_transmit_protocol = "basic",
		alt2gxb_component.tx_use_coreclk = "false",
		alt2gxb_component.tx_use_double_data_mode = "false",
		alt2gxb_component.tx_use_serializer_double_data_mode = "false",
		alt2gxb_component.use_calibration_block = "true",
		alt2gxb_component.vod_ctrl_setting = 3;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ALT_SIMLIB_GEN STRING "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II GX"
// Retrieval info: PRIVATE: NUM_KEYS NUMERIC "71"
// Retrieval info: PRIVATE: RECONFIG_PROTOCOL STRING "BASIC"
// Retrieval info: PRIVATE: RECONFIG_SUBPROTOCOL STRING "none"
// Retrieval info: PRIVATE: RX_ENABLE_DC_COUPLING STRING "false"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIZ_DATA_RATE STRING "1250.00"
// Retrieval info: PRIVATE: WIZ_DPRIO_INCLK_FREQ_ARRAY STRING "312.500000 250.000000 156.250000 125.000000"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A STRING "2500"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B STRING "312.500000"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK0_FREQ STRING "125.0"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK0_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK1_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK1_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK2_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK2_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK3_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK3_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK4_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK4_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK5_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK5_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK6_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK6_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_ENABLE_EQUALIZER_CTRL NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_EQUALIZER_CTRL_SETTING NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_FORCE_DEFAULT_SETTINGS NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_INCLK_FREQ STRING "125.0"
// Retrieval info: PRIVATE: WIZ_INCLK_FREQ_ARRAY STRING "62.5 78.125 125.0 156.25 250.0 312.5"
// Retrieval info: PRIVATE: WIZ_INPUT_A STRING "1250.00"
// Retrieval info: PRIVATE: WIZ_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_INPUT_B STRING "125.0"
// Retrieval info: PRIVATE: WIZ_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_SUBPROTOCOL STRING "Serial Loopback"
// Retrieval info: PRIVATE: WIZ_WORD_ALIGN_FLIP_PATTERN STRING "0"
// Retrieval info: CONSTANT: CMU_PLL_INCLOCK_PERIOD NUMERIC "8000"
// Retrieval info: CONSTANT: CMU_PLL_LOOP_FILTER_RESISTOR_CONTROL NUMERIC "3"
// Retrieval info: CONSTANT: DIGITALRESET_PORT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: EN_LOCAL_CLK_DIV_CTRL STRING "true"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_A_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_B_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_C_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_D_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_CTRL_V_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: EQUALIZER_DCGAIN_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix II GX"
// Retrieval info: CONSTANT: LOOPBACK_MODE STRING "slb"
// Retrieval info: CONSTANT: LPM_TYPE STRING "alt2gxb"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "duplex"
// Retrieval info: CONSTANT: PLL_LEGAL_MULTIPLIER_LIST STRING "disable_4_5_mult_above_3125"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_1STPOSTTAP_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_2NDPOSTTAP_INV_SETTING STRING "false"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_2NDPOSTTAP_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_PRETAP_INV_SETTING STRING "false"
// Retrieval info: CONSTANT: PREEMPHASIS_CTRL_PRETAP_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: PROTOCOL STRING "3g_basic"
// Retrieval info: CONSTANT: RECEIVER_TERMINATION STRING "oct_100_ohms"
// Retrieval info: CONSTANT: RECONFIG_DPRIO_MODE NUMERIC "0"
// Retrieval info: CONSTANT: REVERSE_LOOPBACK_MODE STRING "none"
// Retrieval info: CONSTANT: RX_8B_10B_COMPATIBILITY_MODE STRING "false"
// Retrieval info: CONSTANT: RX_8B_10B_MODE STRING "none"
// Retrieval info: CONSTANT: RX_ALIGN_LOSS_SYNC_ERROR_NUM NUMERIC "1"
// Retrieval info: CONSTANT: RX_ALIGN_PATTERN STRING "0101111100"
// Retrieval info: CONSTANT: RX_ALIGN_PATTERN_LENGTH NUMERIC "10"
// Retrieval info: CONSTANT: RX_ALLOW_ALIGN_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_ALLOW_PIPE_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_BANDWIDTH_MODE NUMERIC "1"
// Retrieval info: CONSTANT: RX_BITSLIP_ENABLE STRING "false"
// Retrieval info: CONSTANT: RX_BYTE_ORDERING_MODE STRING "none"
// Retrieval info: CONSTANT: RX_CHANNEL_WIDTH NUMERIC "10"
// Retrieval info: CONSTANT: RX_COMMON_MODE STRING "0.9v"
// Retrieval info: CONSTANT: RX_CRU_INCLOCK_PERIOD NUMERIC "8000"
// Retrieval info: CONSTANT: RX_CRU_PRE_DIVIDE_BY NUMERIC "1"
// Retrieval info: CONSTANT: RX_DATAPATH_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RX_DATA_RATE NUMERIC "1250"
// Retrieval info: CONSTANT: RX_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: RX_DISABLE_AUTO_IDLE_INSERTION STRING "true"
// Retrieval info: CONSTANT: RX_ENABLE_BIT_REVERSAL STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_DEEP_ALIGN_BYTE_SWAP STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_DATA_SIG STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_REFCLK_SIG STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_SELF_TEST_MODE STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_TRUE_COMPLEMENT_MATCH_IN_WORD_ALIGN STRING "false"
// Retrieval info: CONSTANT: RX_FLIP_RX_OUT STRING "false"
// Retrieval info: CONSTANT: RX_FORCE_SIGNAL_DETECT STRING "true"
// Retrieval info: CONSTANT: RX_NUM_ALIGN_CONS_GOOD_DATA NUMERIC "1"
// Retrieval info: CONSTANT: RX_NUM_ALIGN_CONS_PAT NUMERIC "1"
// Retrieval info: CONSTANT: RX_PPMSELECT NUMERIC "32"
// Retrieval info: CONSTANT: RX_RATE_MATCH_FIFO_MODE STRING "none"
// Retrieval info: CONSTANT: RX_RUN_LENGTH_ENABLE STRING "false"
// Retrieval info: CONSTANT: RX_SIGNAL_DETECT_THRESHOLD NUMERIC "2"
// Retrieval info: CONSTANT: RX_USE_ALIGN_STATE_MACHINE STRING "true"
// Retrieval info: CONSTANT: RX_USE_CLKOUT STRING "true"
// Retrieval info: CONSTANT: RX_USE_CORECLK STRING "false"
// Retrieval info: CONSTANT: RX_USE_CRUCLK STRING "true"
// Retrieval info: CONSTANT: RX_USE_DESERIALIZER_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: RX_USE_DESKEW_FIFO STRING "false"
// Retrieval info: CONSTANT: RX_USE_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: TRANSMITTER_TERMINATION STRING "oct_100_ohms"
// Retrieval info: CONSTANT: TX_8B_10B_COMPATIBILITY_MODE STRING "false"
// Retrieval info: CONSTANT: TX_8B_10B_MODE STRING "none"
// Retrieval info: CONSTANT: TX_ALLOW_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: TX_ANALOG_POWER STRING "1.5v"
// Retrieval info: CONSTANT: TX_CHANNEL_WIDTH NUMERIC "10"
// Retrieval info: CONSTANT: TX_COMMON_MODE STRING "0.6v"
// Retrieval info: CONSTANT: TX_DATA_RATE NUMERIC "1250"
// Retrieval info: CONSTANT: TX_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: TX_ENABLE_BIT_REVERSAL STRING "false"
// Retrieval info: CONSTANT: TX_ENABLE_IDLE_SELECTION STRING "false"
// Retrieval info: CONSTANT: TX_ENABLE_SELF_TEST_MODE STRING "false"
// Retrieval info: CONSTANT: TX_FLIP_TX_IN STRING "false"
// Retrieval info: CONSTANT: TX_FORCE_DISPARITY_MODE STRING "false"
// Retrieval info: CONSTANT: TX_REFCLK_DIVIDE_BY NUMERIC "1"
// Retrieval info: CONSTANT: TX_TRANSMIT_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: TX_USE_CORECLK STRING "false"
// Retrieval info: CONSTANT: TX_USE_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: TX_USE_SERIALIZER_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: USE_CALIBRATION_BLOCK STRING "true"
// Retrieval info: CONSTANT: VOD_CTRL_SETTING NUMERIC "3"
// Retrieval info: USED_PORT: cal_blk_clk 0 0 0 0 INPUT NODEFVAL "cal_blk_clk"
// Retrieval info: USED_PORT: gxb_powerdown 0 0 1 0 INPUT NODEFVAL "gxb_powerdown[0..0]"
// Retrieval info: USED_PORT: pll_inclk 0 0 0 0 INPUT NODEFVAL "pll_inclk"
// Retrieval info: USED_PORT: rx_analogreset 0 0 1 0 INPUT NODEFVAL "rx_analogreset[0..0]"
// Retrieval info: USED_PORT: rx_clkout 0 0 1 0 OUTPUT NODEFVAL "rx_clkout[0..0]"
// Retrieval info: USED_PORT: rx_cruclk 0 0 1 0 INPUT GND "rx_cruclk[0..0]"
// Retrieval info: USED_PORT: rx_datain 0 0 1 0 INPUT NODEFVAL "rx_datain[0..0]"
// Retrieval info: USED_PORT: rx_dataout 0 0 10 0 OUTPUT NODEFVAL "rx_dataout[9..0]"
// Retrieval info: USED_PORT: rx_digitalreset 0 0 1 0 INPUT NODEFVAL "rx_digitalreset[0..0]"
// Retrieval info: USED_PORT: rx_patterndetect 0 0 1 0 OUTPUT NODEFVAL "rx_patterndetect[0..0]"
// Retrieval info: USED_PORT: rx_seriallpbken 0 0 1 0 INPUT NODEFVAL "rx_seriallpbken[0..0]"
// Retrieval info: USED_PORT: tx_clkout 0 0 1 0 OUTPUT NODEFVAL "tx_clkout[0..0]"
// Retrieval info: USED_PORT: tx_datain 0 0 10 0 INPUT NODEFVAL "tx_datain[9..0]"
// Retrieval info: USED_PORT: tx_dataout 0 0 1 0 OUTPUT NODEFVAL "tx_dataout[0..0]"
// Retrieval info: USED_PORT: tx_digitalreset 0 0 1 0 INPUT NODEFVAL "tx_digitalreset[0..0]"
// Retrieval info: CONNECT: rx_patterndetect 0 0 1 0 @rx_patterndetect 0 0 1 0
// Retrieval info: CONNECT: @rx_analogreset 0 0 1 0 rx_analogreset 0 0 1 0
// Retrieval info: CONNECT: @gxb_powerdown 0 0 1 0 gxb_powerdown 0 0 1 0
// Retrieval info: CONNECT: rx_dataout 0 0 10 0 @rx_dataout 0 0 10 0
// Retrieval info: CONNECT: @cal_blk_clk 0 0 0 0 cal_blk_clk 0 0 0 0
// Retrieval info: CONNECT: @tx_digitalreset 0 0 1 0 tx_digitalreset 0 0 1 0
// Retrieval info: CONNECT: @rx_revbitorderwa 0 0 1 0 GND 0 0 1 0
// Retrieval info: CONNECT: @rx_seriallpbken 0 0 1 0 rx_seriallpbken 0 0 1 0
// Retrieval info: CONNECT: rx_clkout 0 0 1 0 @rx_clkout 0 0 1 0
// Retrieval info: CONNECT: @rx_digitalreset 0 0 1 0 rx_digitalreset 0 0 1 0
// Retrieval info: CONNECT: tx_clkout 0 0 1 0 @tx_clkout 0 0 1 0
// Retrieval info: CONNECT: @rx_cruclk 0 0 1 0 rx_cruclk 0 0 1 0
// Retrieval info: CONNECT: @pll_inclk 0 0 0 0 pll_inclk 0 0 0 0
// Retrieval info: CONNECT: tx_dataout 0 0 1 0 @tx_dataout 0 0 1 0
// Retrieval info: CONNECT: @tx_datain 0 0 10 0 tx_datain 0 0 10 0
// Retrieval info: CONNECT: @rx_datain 0 0 1 0 rx_datain 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic.ppf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic.inc FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic.cmp FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic.bsf FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic_inst.v FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic_bb.v FALSE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altera_tse_alt2gxb_basic.vo TRUE FALSE
