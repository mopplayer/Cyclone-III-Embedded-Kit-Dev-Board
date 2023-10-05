// megafunction wizard: %LPM_MUX%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_MUX 

// ============================================================
// File Name: clk_mux.v
// Megafunction Name(s):
// 			LPM_MUX
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 11.0 Build 157 04/27/2011 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2011 Altera Corporation
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


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module clk_mux (
	data0,
	data1,
	data2,
	data3,
	sel,
	result);

	input	  data0;
	input	  data1;
	input	  data2;
	input	  data3;
	input	[1:0]  sel;
	output	  result;

	wire [0:0] sub_wire0;
	wire  sub_wire6 = data3;
	wire  sub_wire5 = data2;
	wire  sub_wire4 = data1;
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  result = sub_wire1;
	wire  sub_wire2 = data0;
	wire [3:0] sub_wire3 = {sub_wire6, sub_wire5, sub_wire4, sub_wire2};

	lpm_mux	LPM_MUX_component (
				.data (sub_wire3),
				.sel (sel),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		LPM_MUX_component.lpm_size = 4,
		LPM_MUX_component.lpm_type = "LPM_MUX",
		LPM_MUX_component.lpm_width = 1,
		LPM_MUX_component.lpm_widths = 2;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: new_diagram STRING "0"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_SIZE NUMERIC "4"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "2"
// Retrieval info: USED_PORT: data0 0 0 0 0 INPUT NODEFVAL "data0"
// Retrieval info: USED_PORT: data1 0 0 0 0 INPUT NODEFVAL "data1"
// Retrieval info: USED_PORT: data2 0 0 0 0 INPUT NODEFVAL "data2"
// Retrieval info: USED_PORT: data3 0 0 0 0 INPUT NODEFVAL "data3"
// Retrieval info: USED_PORT: result 0 0 0 0 OUTPUT NODEFVAL "result"
// Retrieval info: USED_PORT: sel 0 0 2 0 INPUT NODEFVAL "sel[1..0]"
// Retrieval info: CONNECT: @data 0 0 1 0 data0 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 1 1 data1 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 1 2 data2 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 1 3 data3 0 0 0 0
// Retrieval info: CONNECT: @sel 0 0 2 0 sel 0 0 2 0
// Retrieval info: CONNECT: result 0 0 0 0 @result 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL clk_mux.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL clk_mux.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clk_mux.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clk_mux.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clk_mux_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clk_mux_bb.v FALSE