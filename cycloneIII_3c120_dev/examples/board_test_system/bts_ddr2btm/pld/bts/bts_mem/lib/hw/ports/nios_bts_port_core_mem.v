//--------------------------------------------------------------------------//
// Title:       nios_bts_port_core_mem.v                                    //
// Rev:         Rev 1                                                       //
// Author       David Johnson                                               //
//--------------------------------------------------------------------------//
// Description: NIOS BTS Port For Memory                                    //
//----------------------------------------------------------------------------
//Copyright © 2006 Altera Corporation. All rights reserved.  Altera products
//are protected under numerous U.S. and foreign patents, maskwork rights,
//copyrights and other intellectual property laws.
//                                                                                                     
//This reference design file, and your use thereof, is subject to and
//governed by the terms and conditions of the applicable Altera Reference
//Design License Agreement.  By using this reference design file, you
//indicate your acceptance of such terms and conditions between you and
//Altera Corporation.  In the event that you do not agree with such terms and
//conditions, you may not use the reference design file. Please promptly                         
//destroy any copies you have made.
//                                                      
//This reference design file being provided on an "as-is" basis and as an
//accommodation and therefore all warranties, representations or guarantees
//of any kind (whether express, implied or statutory) including, without
//limitation, warranties of merchantability, non-infringement, or fitness for
//a particular purpose, are specifically disclaimed.  By making this
//reference design file available, Altera expressly does not recommend,
//suggest or require that this reference design file be used in combination 
//with any other product not provided by Altera

module nios_bts_port_core_mem (
    input          								reset_n,
	input										start_pb,
	input										create_error_pb,           				
	input										plls_in_locked,			// Input clocks are locked
	output		    							plls_locked, 
	output										pattern_sync_acquired,
	output										test_complete,
	output										error_latch,
	output										error_irq,
	input										nios_clk,
	input	[nios_map_width-1:0]				nios_address,    		// For multiple interfaces, add bits for address decoder to select the avalon slave
  	input	      								nios_chipselect,
  	input	      								nios_read,
  	output	[nios_width-1:0]					nios_readdata,
  	input	      								nios_reset_n,
  	input	      	    		    			nios_write,
 	input	[nios_width-1:0]					nios_writedata,
	output										nios_waitrequest,
	input	[7:0]								avalon_pb,
	input	[7:0]								avalon_dip,
	output	[7:0]								avalon_led,	
	input										local_clk,			// write side clock
	input										local_clk_q,		// read side clock
	output	[local_addr_width-1 : 0] 			local_addr,			// read+write for DDR2 SDRAM, write for QDRII+
	output	[local_addr_width-1 : 0] 			local_addr_q,		// unused for DDR2 SDRAM, read for QDRII+
	output	[local_be_width-1 : 0]				local_be,		
	input										local_init_done,	// unconnected / unused
	input	[local_data_width-1 : 0]			local_rdata,		
	input										local_rdata_valid,	
	input										local_rdvalid_in_n,	// unconnected / unused
	output										local_read_req,			
	input										local_ready,		
	output	 [local_size_width-1: 0]			local_size,	
	output										local_burst_begin,		
	output	 [local_data_width-1: 0]			local_wdata,		
	input										local_wdata_req,	
 	output										local_write_req,	
	output										local_reset_n
	
);  

parameter	common_rw_clocks					=	1;	// 0= separate R/W clocks, 1=same R/W clock
// Data Generator Waveform Memory & Sequencer Parameters:
parameter	mem_widthad_a						=	1; // 9;						// Waveform memory address width 
parameter	sequencer_ptr_width					=	1; // 8;						// 2^sequencer_ptr_width is the sequencer memory size
parameter	sequencer_size						=	1<<(num_seq_regs_log2+addrs_per_seq_log2);
parameter	num_seq_regs_log2					=	1;
parameter	waveform_select_width				=	1; // 3;						// Use to select math function or waveform
//parameter	mem_sequencer_base_address_write	=	addrs_per_reg * num_registers;	// Memory sequencer base address
parameter	mem_sequencer_base_address_write	=	sequencer_size;	// max(sequencer_size,addrs_per_reg * num_register)
parameter	mem_sequencer_base_address_read		=	mem_sequencer_base_address_write + sequencer_size;
parameter	addrs_per_seq_log2					=	1;
parameter	dgen_mem_nios_addr_size				=	1<<(mem_widthad_a + local_data_width_log2 - nios_width_log2 + 2); // eg 9 bits to access 512 deep memory, 3 bits to access 144 bit data bus = 12 then +2 for word access 			                                  



parameter	dgen_memory_base_address_write		=	mem_sequencer_base_address_read + sequencer_size; // Data Generator waveform memory base address
parameter	dgen_memory_base_address_read		=	dgen_memory_base_address_write + dgen_mem_nios_addr_size; // Data Generator waveform memory base address
parameter	sequencer_burst_width				=	1; // 8;						// Memory bits for sequencer burst (2^sequencer_ptr_width <= max_sequencer_size)	
parameter	type_width							=	1; // 4;						// Memory bit usage for sequencer types 
parameter	local_data_width_log2     			=	1; // 8;
parameter	nios_width_log2						=	1; // 5;
parameter	native_mode							=	1;
parameter	local_size_width					=	2;  
parameter	local_size_max						=	2;        
parameter	local_addr_width					=	24;
parameter	local_data_width					=	144;
parameter	local_be_width						=	18;
parameter	component_type						=	"DDR2SDRAM";
parameter	nios_width							=	32;
parameter	io_width							= 	1; //// serial_channels;						// Set to channel_width for parallel loopback tests
parameter	prbs_depth							=	32;					// data_width should be an integer multiple of prbs_depth
parameter	prbs_coeff_param					=	1; //// {serial_channels{32'hc000_0401}}; // Should equal data_width
parameter	prbs_seed_param						=	1; //// 192'hace1_ace2_2233_f7a5_5555_2138_2128_3003_bc21_1c32_1242_e2c1; // prbs_seed192_param 	
// Avalon Control Interface 
parameter	avalon_control_interface_size		=	num_registers * addrs_per_reg;	
parameter	nios_map_width						=	20;         
parameter	num_registers_log2					=	1; // 256;						// Number of register in control module
parameter	addrs_per_reg_log2					=	8;   
parameter	tec_words							=	2;					// Transaction/Error Counter Nios words
parameter	num_lanes							=	1; 					// local_data_width / byte_width Number of error lanes (eg 9 for 72 bit DDR2 with 9 byte lanes)
parameter	ssd_bits							=	8;					// Number of bits per SSD
parameter	num_ssds							=	4;					// Number of Seven Segment Display addresses
parameter	bts_id1								=	32'h0000_0000;
parameter	bts_id2								=	32'h0000_0001;
parameter	bts_id3								=	32'h0000_0002;
parameter	bts_id4								=	32'h0000_0003;
parameter	bts_id5								=	32'hffff_fffc;
parameter	bts_id6								=	32'hffff_fffd;
parameter	bts_id7								=	32'hffff_fffe;
parameter	bts_id8								=	32'hffff_ffff;
parameter	board_id	    					=	"Stratix II GX PCI Express Board ";
parameter	port_id								=	"DDR2 x72 SDRAM                  ";
parameter	generic_id							=	"NIOS Board Test System          ";
parameter	id_words	    					=	8;  
parameter	addrs_per_reg						=	1<<addrs_per_reg_log2;
parameter	num_registers						=	1<<num_registers_log2;
parameter	nios_map_width_aci					=	num_registers_log2 + addrs_per_reg_log2;

// Switch debouncers, metastabilizers, etc
`ifdef simulation
	parameter	debounce_prd			=	4;
	parameter	test_length_bts			=	10;					// Number of data_gen_readdata to transmit before asserting testcomplete
	parameter	test_complete_ctr_width	=	4;					// > log2(test_length_bts)	  
`else                       
	parameter	debounce_prd			=	100000;
 	parameter	test_length_bts			=	'h800000;			// Number of data_gen_readdata to transmit before asserting testcomplete
	parameter	test_complete_ctr_width	=	24;					// > log2(test_length_bts)	  
`endif		

 
wire								bts_start_sync;
wire								create_error_sync; 
wire								wr_pld_clk;
wire								rd_pld_clk; 
wire								wr_ready;
wire								rd_ready;

assign	plls_locked			=	plls_in_locked;



wire		[local_data_width-1:0]				rd_dataout_sig;
wire		[local_data_width-1:0]				wr_datain_sig;


generate
	if	(common_rw_clocks == 1)
	begin
		assign		wr_pld_clk			=	local_clk;
		assign		rd_pld_clk			=	local_clk;
	end else begin
		assign		wr_pld_clk			=	local_clk;
		assign		rd_pld_clk			=	local_clk_q;	
	end
endgenerate

assign		local_wdata			=	wr_datain_sig;
assign		rd_dataout_sig		=	local_rdata;
assign		wr_ready			=	local_wdata_req;	
assign		rd_ready			=	local_rdata_valid;

switch_debouncer	#(0,debounce_prd)	switch_debouncer_xcvr_bts_start		(.reset_n(local_reset_n),.clk(wr_pld_clk),.data_in(start),.data_out(bts_start_sync));
switch_debouncer	#(0,debounce_prd)	switch_debouncer_xcvr_create_error	(.reset_n(local_reset_n),.clk(wr_pld_clk),.data_in(create_error),.data_out(create_error_sync)); 
// 1st parameter enables positive edge detect
// 2nd parameter enables negative edge detect
// 3rd parameter is pulse polarity (1=positive, 0=negative)
// Creates single clock pulse from edge
edge_detector		#(1,0,1)				edge_detector_create_single_error(.reset_n(local_reset_n),.clk(wr_pld_clk),.data_in(create_error_sync),.data_out(create_single_error)); // Single error event
                           	
defparam	mem_wrapper_bts_i.nios_width						=	nios_width;		 			// For transaction counter
defparam	mem_wrapper_bts_i.prbs_depth						=	prbs_depth; 				// Use as seed for PRBS                                            	                        		
defparam	mem_wrapper_bts_i.test_length_bts					=	test_length_bts;			// Number of data_gen_readdata to transmit before asserting testcomplete
defparam	mem_wrapper_bts_i.test_complete_ctr_width			=	test_complete_ctr_width;	// > log2(test_length_bts)	                               	
defparam	mem_wrapper_bts_i.native_mode						=	native_mode;
defparam	mem_wrapper_bts_i.local_size_width					=	local_size_width;
defparam	mem_wrapper_bts_i.local_size_max					=	local_size_max;
defparam	mem_wrapper_bts_i.local_addr_width					=	local_addr_width;
defparam	mem_wrapper_bts_i.local_data_width					=	local_data_width; 
defparam	mem_wrapper_bts_i.local_be_width					=	local_be_width;                                                 
defparam	mem_wrapper_bts_i.mem_widthad_a						=	mem_widthad_a;				
defparam	mem_wrapper_bts_i.sequencer_ptr_width				=	sequencer_ptr_width;		
defparam	mem_wrapper_bts_i.waveform_select_width				=	waveform_select_width;		
defparam	mem_wrapper_bts_i.num_registers						=	num_registers;				
defparam	mem_wrapper_bts_i.mem_sequencer_base_address_write	=	mem_sequencer_base_address_write;
defparam	mem_wrapper_bts_i.mem_sequencer_base_address_read	=	mem_sequencer_base_address_read;
defparam	mem_wrapper_bts_i.addrs_per_seq_log2	        	=	addrs_per_seq_log2; 
defparam	mem_wrapper_bts_i.num_seq_regs_log2					=	num_seq_regs_log2;
defparam	mem_wrapper_bts_i.dgen_memory_base_address_write	=	dgen_memory_base_address_write;
defparam	mem_wrapper_bts_i.dgen_memory_base_address_read		=	dgen_memory_base_address_read;	
defparam	mem_wrapper_bts_i.sequencer_size					=	sequencer_size;
defparam	mem_wrapper_bts_i.dgen_mem_nios_addr_size			=	dgen_mem_nios_addr_size;
defparam	mem_wrapper_bts_i.sequencer_burst_width				=	sequencer_burst_width;		
defparam	mem_wrapper_bts_i.type_width						=	type_width;				
defparam	mem_wrapper_bts_i.local_data_width_log2       		=	local_data_width_log2;
defparam	mem_wrapper_bts_i.nios_width_log2					=	nios_width_log2;
defparam	mem_wrapper_bts_i.nios_map_width					=	nios_map_width;
defparam	mem_wrapper_bts_i.tec_words							=	tec_words;					// Transaction/Error Counter Nios width words  
defparam	mem_wrapper_bts_i.num_lanes							=	num_lanes;   
defparam	mem_wrapper_bts_i.component_type					=	component_type;
mem_wrapper_bts	mem_wrapper_bts_i
(
	.reset_n				    		(local_reset_n), 
	.wr_pld_clk							(wr_pld_clk),             	
	.wr_datain							(wr_datain_sig),           	
	.wr_ready							(wr_ready),                    	
	.rd_pld_clk							(rd_pld_clk),             	
	.rd_dataout							(rd_dataout_sig),            
	.rd_ready							(rd_ready),
	.start_write						(bts_start_sync),
	.start_read							(bts_start_sync),	// Currently use same clock for read & write
	.create_error						(create_single_error),
	.error_latch			    		(error_latch),
	.data_error							(data_error),
	.pattern_sync_acquired				(pattern_sync_acquired),                           
	.test_complete						(test_complete),
	.error_mask                         (aci_edm), 
	.sync_mask                          (aci_sdm),
	.aci_prs                         	(aci_prs),
	.aci_prd                         	(aci_prd),
	.aci_prc                         	(aci_prc),
	.aci_cem                         	(aci_cem),
	.aci_ttc                         	(aci_ttc),        
	.aci_rtc                         	(aci_rtc),
	.aci_wec                         	(aci_wec),
	.aci_lec                         	(aci_lec),
	.aci_ips						 	(aci_ips),
	.aci_pass						 	(aci_pass),
	.local_ready						(local_ready),
	.local_addr							(local_addr),	
	.local_addr_q						(local_addr_q),
	.local_be							(local_be),
	.local_read_req						(local_read_req),
	.local_size							(local_size),
	.local_burst_begin					(local_burst_begin),
	.local_write_req					(local_write_req),	
	.nios_clk                           (nios_clk), 
	.nios_address                       (nios_address),
  	.nios_chipselect     				(nios_chipselect),
  	.nios_read                          (nios_read),
  	.nios_readdata                      (),							// If reading, combine with control module
  	.nios_reset_n                       (nios_reset_n),
  	.nios_write                         (nios_write),
 	.nios_writedata                     (nios_writedata)
);                            
 		                                                         
						
//wire	[nios_width-1:0]								aci_bcr;	// Signals are connected individually
wire	[local_data_width-1:0]							aci_prs;
wire	[nios_width-1:0]								aci_prd;
wire	[local_data_width-1:0]							aci_prc;
wire	[local_data_width-1:0]							aci_edm;
wire	[local_data_width-1:0]							aci_sdm;    
wire	[local_data_width-1:0]							aci_cem; 
wire	[(nios_width*tec_words)-1:0]					aci_ttc;
wire	[(nios_width*tec_words)-1:0]					aci_rtc;
wire	[(nios_width*tec_words)-1:0]					aci_wec;   // Use wec for accurate system error rate
wire	[(nios_width*tec_words*num_lanes)-1:0]			aci_lec;   // Individual Lane Error Counter, width of earch error counter is nios_width
wire	[nios_width-1:0]								aci_pfa;
wire	[(num_ssds*ssd_bits)-1:0] 						aci_ssd;	// Number of seven segment displays                      	                		
wire													aci_pass;
wire													aci_eirq;
wire													aci_ips;   
 

assign		nios_chipselect_aci	=	nios_chipselect && ((nios_address >= 0) &&  (nios_address < (0 + avalon_control_interface_size))); 
//defparam    avalon_control_interface_nios_bts_mem_i.data_width 							=	local_data_width;
defparam    avalon_control_interface_nios_bts_mem_i.tec_words 							=	tec_words;
defparam    avalon_control_interface_nios_bts_mem_i.num_lanes 							=	num_lanes; // eg: Set to 9 for 72 bit DDR2 with 9 byte lanes                
defparam    avalon_control_interface_nios_bts_mem_i.ssd_bits 							=	ssd_bits; 
defparam    avalon_control_interface_nios_bts_mem_i.num_ssds 							=	num_ssds; 
defparam    avalon_control_interface_nios_bts_mem_i.nios_width 							=	nios_width; 
defparam	avalon_control_interface_nios_bts_mem_i.prbs_depth_init						=	prbs_depth; 				// Use as seed for PRBS
defparam	avalon_control_interface_nios_bts_mem_i.prbs_seed_init						=	prbs_seed_param;
defparam	avalon_control_interface_nios_bts_mem_i.prbs_coeff_init						=	prbs_coeff_param;
defparam	avalon_control_interface_nios_bts_mem_i.nios_map_width						=	nios_map_width_aci;
defparam	avalon_control_interface_nios_bts_mem_i.addrs_per_reg						=	addrs_per_reg;		
defparam	avalon_control_interface_nios_bts_mem_i.addrs_per_reg_log2					=	addrs_per_reg_log2; 
defparam	avalon_control_interface_nios_bts_mem_i.bts_id1								=	bts_id1;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id2								=	bts_id2;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id3								=	bts_id3;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id4								=	bts_id4;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id5								=	bts_id5;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id6								=	bts_id6;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id7								=	bts_id7;		
defparam	avalon_control_interface_nios_bts_mem_i.bts_id8								=	bts_id8;		
defparam	avalon_control_interface_nios_bts_mem_i.board_id	    					=	board_id;	
defparam	avalon_control_interface_nios_bts_mem_i.port_id								=	port_id;		
defparam	avalon_control_interface_nios_bts_mem_i.generic_id							=	generic_id;	
defparam	avalon_control_interface_nios_bts_mem_i.id_words	    					=	id_words;
defparam	avalon_control_interface_nios_bts_mem_i.mem_widthad_a						=	mem_widthad_a						;
defparam	avalon_control_interface_nios_bts_mem_i.sequencer_ptr_width					=	sequencer_ptr_width					;
defparam	avalon_control_interface_nios_bts_mem_i.waveform_select_width				=	waveform_select_width				;
defparam	avalon_control_interface_nios_bts_mem_i.mem_sequencer_base_address_write	=	mem_sequencer_base_address_write	;
defparam	avalon_control_interface_nios_bts_mem_i.mem_sequencer_base_address_read		=	mem_sequencer_base_address_read		;
defparam	avalon_control_interface_nios_bts_mem_i.dgen_memory_base_address_write		=	dgen_memory_base_address_write		;
defparam	avalon_control_interface_nios_bts_mem_i.dgen_memory_base_address_read		=	dgen_memory_base_address_read		;
defparam	avalon_control_interface_nios_bts_mem_i.sequencer_burst_width				=	sequencer_burst_width				;
defparam	avalon_control_interface_nios_bts_mem_i.type_width							=	type_width							;
defparam	avalon_control_interface_nios_bts_mem_i.local_size_width					=	local_size_width					;
defparam	avalon_control_interface_nios_bts_mem_i.local_size_max						=	local_size_max						;
defparam	avalon_control_interface_nios_bts_mem_i.local_addr_width					=	local_addr_width					;
defparam	avalon_control_interface_nios_bts_mem_i.local_data_width					=	local_data_width					;
defparam	avalon_control_interface_nios_bts_mem_i.local_be_width						=	local_be_width						;
defparam	avalon_control_interface_nios_bts_mem_i.component_type						=	component_type						;
defparam	avalon_control_interface_nios_bts_mem_i.addrs_per_seq_log2					=	addrs_per_seq_log2					;
   
avalon_control_interface_nios_bts_mem	avalon_control_interface_nios_bts_mem_i
  (
      .avalon_create_error           (avalon_create_error		),
      .avalon_dip                    (avalon_dip				),                    	
      .avalon_error_latch            (error_latch				),
	  .avalon_data_error			 (data_error				),
      .avalon_led                    (avalon_led				),
      .avalon_pattern_sync_acquired  (pattern_sync_acquired		),
      .avalon_pb                     (avalon_pb					),
      .avalon_plls_locked            (plls_locked				),
      .avalon_reset_n                (avalon_reset_n			),  
      .avalon_start                  (avalon_start				),
      .avalon_test_complete          (test_complete				),
	  .aci_ips						 (aci_ips					),
	  .aci_pass						 (aci_pass					),
	  .aci_eirq						 (aci_eirq					),
	  .aci_prs						 (aci_prs					),
	  .aci_prd						 (aci_prd					),
	  .aci_prc						 (aci_prc					),
      .aci_edm						 (aci_edm					),
	  .aci_sdm						 (aci_sdm					),
	  .aci_cem						 (aci_cem					),
	  .aci_ttc						 (aci_ttc					),
	  .aci_rtc						 (aci_rtc					),
	  .aci_wec						 (aci_wec					),
	  .aci_lec						 (aci_lec					),
	  .aci_ssd						 (aci_ssd					),
	  .aci_pfa						 (aci_pfa					),
      .nios_address                  (nios_address   			), 
      .nios_chipselect               (nios_chipselect_aci		), 
      .nios_clk                      (nios_clk       			), 
      .nios_read                     (nios_read      			), 
      .nios_readdata                 (nios_readdata  			), 
      .nios_reset_n                  (nios_reset_n   			), 
      .nios_write                    (nios_write     			), 
      .nios_writedata                (nios_writedata 			),
	  .nios_waitrequest				 (nios_waitrequest			),
	  .wr_pld_clk					 (wr_pld_clk				),
	  .rd_pld_clk					 (rd_pld_clk				)
    );                                                                                                                                                                                                            
 	
	assign	error_irq									=	0; // aci_eirq;   Disable interrupts for now by setting to 0       
	assign	local_reset_n								=	avalon_reset_n		&	reset_n;
	wire	start										=	avalon_start		|	start_pb;
	wire	create_error								=	avalon_create_error	|	create_error_pb;
  
endmodule