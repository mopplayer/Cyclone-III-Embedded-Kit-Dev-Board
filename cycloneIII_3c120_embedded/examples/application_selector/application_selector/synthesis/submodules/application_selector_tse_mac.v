// megafunction wizard: %Triple Speed Ethernet v11.0%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			altera_tse_mac
// ============================================================
// Generated by Triple Speed Ethernet 11.0 [Altera, IP Toolbench 1.3.0 Build 157]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2011 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.


module application_selector_tse_mac (
	ff_tx_data,
	ff_tx_eop,
	ff_tx_err,
	ff_tx_mod,
	ff_tx_sop,
	ff_tx_wren,
	ff_tx_clk,
	ff_rx_rdy,
	ff_rx_clk,
	address,
	read,
	writedata,
	write,
	clk,
	reset,
	gm_rx_d,
	gm_rx_dv,
	gm_rx_err,
	m_rx_d,
	m_rx_en,
	m_rx_err,
	m_rx_col,
	m_rx_crs,
	tx_clk,
	rx_clk,
	set_10,
	set_1000,
	mdio_in,
	ff_tx_rdy,
	ff_rx_data,
	ff_rx_dval,
	ff_rx_eop,
	ff_rx_mod,
	ff_rx_sop,
	rx_err,
	readdata,
	waitrequest,
	gm_tx_d,
	gm_tx_en,
	gm_tx_err,
	m_tx_d,
	m_tx_en,
	m_tx_err,
	ena_10,
	eth_mode,
	mdio_out,
	mdio_oen,
	mdc);


	input	[31:0]	ff_tx_data;
	input		ff_tx_eop;
	input		ff_tx_err;
	input	[1:0]	ff_tx_mod;
	input		ff_tx_sop;
	input		ff_tx_wren;
	input		ff_tx_clk;
	input		ff_rx_rdy;
	input		ff_rx_clk;
	input	[7:0]	address;
	input		read;
	input	[31:0]	writedata;
	input		write;
	input		clk;
	input		reset;
	input	[7:0]	gm_rx_d;
	input		gm_rx_dv;
	input		gm_rx_err;
	input	[3:0]	m_rx_d;
	input		m_rx_en;
	input		m_rx_err;
	input		m_rx_col;
	input		m_rx_crs;
	input		tx_clk;
	input		rx_clk;
	input		set_10;
	input		set_1000;
	input		mdio_in;
	output		ff_tx_rdy;
	output	[31:0]	ff_rx_data;
	output		ff_rx_dval;
	output		ff_rx_eop;
	output	[1:0]	ff_rx_mod;
	output		ff_rx_sop;
	output	[5:0]	rx_err;
	output	[31:0]	readdata;
	output		waitrequest;
	output	[7:0]	gm_tx_d;
	output		gm_tx_en;
	output		gm_tx_err;
	output	[3:0]	m_tx_d;
	output		m_tx_en;
	output		m_tx_err;
	output		ena_10;
	output		eth_mode;
	output		mdio_out;
	output		mdio_oen;
	output		mdc;


	altera_tse_mac	altera_tse_mac_inst(
		.ff_tx_data(ff_tx_data),
		.ff_tx_eop(ff_tx_eop),
		.ff_tx_err(ff_tx_err),
		.ff_tx_mod(ff_tx_mod),
		.ff_tx_sop(ff_tx_sop),
		.ff_tx_wren(ff_tx_wren),
		.ff_tx_clk(ff_tx_clk),
		.ff_rx_rdy(ff_rx_rdy),
		.ff_rx_clk(ff_rx_clk),
		.address(address),
		.read(read),
		.writedata(writedata),
		.write(write),
		.clk(clk),
		.reset(reset),
		.gm_rx_d(gm_rx_d),
		.gm_rx_dv(gm_rx_dv),
		.gm_rx_err(gm_rx_err),
		.m_rx_d(m_rx_d),
		.m_rx_en(m_rx_en),
		.m_rx_err(m_rx_err),
		.m_rx_col(m_rx_col),
		.m_rx_crs(m_rx_crs),
		.tx_clk(tx_clk),
		.rx_clk(rx_clk),
		.set_10(set_10),
		.set_1000(set_1000),
		.mdio_in(mdio_in),
		.ff_tx_rdy(ff_tx_rdy),
		.ff_rx_data(ff_rx_data),
		.ff_rx_dval(ff_rx_dval),
		.ff_rx_eop(ff_rx_eop),
		.ff_rx_mod(ff_rx_mod),
		.ff_rx_sop(ff_rx_sop),
		.rx_err(rx_err),
		.readdata(readdata),
		.waitrequest(waitrequest),
		.gm_tx_d(gm_tx_d),
		.gm_tx_en(gm_tx_en),
		.gm_tx_err(gm_tx_err),
		.m_tx_d(m_tx_d),
		.m_tx_en(m_tx_en),
		.m_tx_err(m_tx_err),
		.ena_10(ena_10),
		.eth_mode(eth_mode),
		.mdio_out(mdio_out),
		.mdio_oen(mdio_oen),
		.mdc(mdc));

	defparam
		altera_tse_mac_inst.ENABLE_MAGIC_DETECT = 1,
		altera_tse_mac_inst.ENABLE_MDIO = 1,
		altera_tse_mac_inst.ENABLE_SHIFT16 = 1,
		altera_tse_mac_inst.ENABLE_SUP_ADDR = 1,
		altera_tse_mac_inst.CORE_VERSION = 16'h0b00,
		altera_tse_mac_inst.CRC32GENDELAY = 6,
		altera_tse_mac_inst.MDIO_CLK_DIV = 40,
		altera_tse_mac_inst.ENA_HASH = 1,
		altera_tse_mac_inst.USE_SYNC_RESET = 1,
		altera_tse_mac_inst.STAT_CNT_ENA = 1,
		altera_tse_mac_inst.ENABLE_EXTENDED_STAT_REG = 0,
		altera_tse_mac_inst.ENABLE_HD_LOGIC = 1,
		altera_tse_mac_inst.REDUCED_INTERFACE_ENA = 0,
		altera_tse_mac_inst.CRC32S1L2_EXTERN = 0,
		altera_tse_mac_inst.ENABLE_GMII_LOOPBACK = 1,
		altera_tse_mac_inst.CRC32DWIDTH = 8,
		altera_tse_mac_inst.CUST_VERSION = 0,
		altera_tse_mac_inst.RESET_LEVEL = 8'h01,
		altera_tse_mac_inst.CRC32CHECK16BIT = 8'h00,
		altera_tse_mac_inst.ENABLE_MAC_FLOW_CTRL = 0,
		altera_tse_mac_inst.ENABLE_MAC_TXADDR_SET = 1,
		altera_tse_mac_inst.ENABLE_MAC_RX_VLAN = 0,
		altera_tse_mac_inst.ENABLE_MAC_TX_VLAN = 0,
		altera_tse_mac_inst.SYNCHRONIZER_DEPTH = 3,
		altera_tse_mac_inst.EG_FIFO = 1024,
		altera_tse_mac_inst.EG_ADDR = 10,
		altera_tse_mac_inst.ING_FIFO = 1024,
		altera_tse_mac_inst.ENABLE_ENA = 32,
		altera_tse_mac_inst.ING_ADDR = 10,
		altera_tse_mac_inst.RAM_TYPE = "AUTO",
		altera_tse_mac_inst.INSERT_TA = 1,
		altera_tse_mac_inst.ENABLE_MACLITE = 0,
		altera_tse_mac_inst.MACLITE_GIGE = 0;
endmodule

// =========================================================
// Triple Speed Ethernet Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, Triple Speed Ethernet Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="Triple Speed Ethernet MegaCore Function"  version="11.0"  build="157"  iptb_version="1.3.0 Build 157"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION class="altera.ipbu.flowbase.netlist.model.TSEMVCModel"  active_core="altera_tse_mac" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "atlanticSinkClockRate" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "atlanticSinkClockSource" value="unassigned"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "atlanticSourceClockRate" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "atlanticSourceClockSource" value="unassigned"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "avalonSlaveClockRate" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "avalonSlaveClockSource" value="unassigned"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "avalonStNeighbours" value="unassigned=unassigned"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "channel_count" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "core_variation" value="MAC_ONLY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "core_version" value="2816"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "crc32dwidth" value="8"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "crc32gendelay" value="6"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "crc32s1l2_extern" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "cust_version" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "dataBitsPerSymbol" value="8"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "dev_version" value="2816"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "deviceFamily" value="CYCLONEIII"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "deviceFamilyName" value="Cyclone III"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "eg_addr" value="10"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "eg_fifo" value="1024"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "ena_hash" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_alt_reconfig" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_clk_sharing" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_ena" value="32"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_fifoless" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_gmii_loopback" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_hd_logic" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_mac_flow_ctrl" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_mac_txaddr_set" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_mac_vlan" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_maclite" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_magic_detect" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_multi_channel" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_pkt_class" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_pma" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_reg_sharing" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_sgmii" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_shift16" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_sup_addr" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_use_internal_fifo" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "export_calblkclk" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "export_pwrdn" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "ext_stat_cnt_ena" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "gigeAdvanceMode" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "ifGMII" value="MII_GMII"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ifPCSuseEmbeddedSerdes" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "ing_addr" value="10"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "ing_fifo" value="1024"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "insert_ta" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "maclite_gige" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "max_channels" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "mdio_clk_div" value="40"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "phy_identifier" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ramType" value="AUTO"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "sopcSystemTopLevelName" value="system"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_number" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "stat_cnt_ena" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "timingAdapterName" value="timingAdapter"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "toolContext" value="SOPC_BUILDER"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "transceiver_type" value="GXB"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiEgFIFOSize" value="1024 x 32 Bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiHostClockFrequency" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiIngFIFOSize" value="1024 x 32 Bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiMACFIFO" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiMACOptions" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiMDIOFreq" value="0.0 MHz"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiMIIInterfaceOptions" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCSInterface" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCSInterfaceOptions" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "useLvds" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "useMAC" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "useMDIO" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "usePCS" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "use_sync_reset" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="VERILOG"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "gb_enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "testbench">
// Retrieval info:      <PRIVATE name = "variation_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "project_name" value="application_selector"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "output_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "tool_context" value="SOPC_BUILDER"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "constraint_file_generator">
// Retrieval info:      <PRIVATE name = "variation_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "instance_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "output_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "modelsim_script_generator">
// Retrieval info:      <PRIVATE name = "variation_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "instance_name" value="application_selector_tse_mac"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "plugin_worker" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "europa_executor">
// Retrieval info:      <PRIVATE name = "plugin_worker" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "use_alt_top" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "family" value="Cyclone III"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "filename" value="application_selector_tse_mac.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "modelsim_wave_script_plugin">
// Retrieval info:      <PRIVATE name = "plugin_worker" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "nativelink">
// Retrieval info:      <PRIVATE name = "plugin_worker" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "filename" value="application_selector_tse_mac_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <PORTS/>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
