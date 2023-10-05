/*
Copyright © 2007 Altera Corporation. All rights reserved.  Altera products 
are protected under numerous U.S. and foreign patents, maskwork rights, 
copyrights and other intellectual property laws.  

This reference design file, and your use thereof, is subject to and governed
by the terms and conditions of the applicable Altera Reference Design 
License Agreement.  By using this reference design file, you indicate your
acceptance of such terms and conditions between you and Altera Corporation.
In the event that you do not agree with such terms and conditions, you may
not use the reference design file. Please promptly destroy any copies you 
have made.

This reference design file being provided on an "as-is" basis and as an 
accommodation and therefore all warranties, representations or guarantees
of any kind (whether express, implied or statutory) including, without 
limitation, warranties of merchantability, non-infringement, or fitness for
a particular purpose, are specifically disclaimed.  By making this reference
design file available, Altera expressly does not recommend, suggest or 
require that this reference design file be used in combination with any 
other product not provided by Altera
*/
  
/*******************************************************************  
* NOTICE: The information contained in this file is proprietary    *
* to Altera and is being made available to Altera's customers      *
* under strict non-disclosure agreements.  Use or disclosure of    *
* this information is permissible only under the terms of          *
* existing non-disclosure agreements.                              *
********************************************************************/  

/*----------------------------------------------------------------------------
--                                                                          --
-- Title:       altera_bts_mem.v                                            --
-- Rev:         Rev 1                                                       --
-- Modified:    April 6, 2007                                               --
-- Author:      David Johnson                                               --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Description: Altera Board Test System for the BTS Memory Component       --
-- Data Generator / Data Comparator with Avalon control bus for NIOS,       --
-- The high speed data path is Avalon Compliant, but will be connected      --
-- externally for faster datarates.  Includes a memory sequencer for        --
-- address sequencings and data type, and data types of PRBS, Waveform      --
-- memory, and math functions                                               --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Revision History:                                                        --
-- Rev 1 - Original code                                                    --
------------------------------------------------------------------------------
*/                                                                                
module	altera_bts_mem                                                                                   
(
	input												data_gen_reset_n,
	input												data_gen_clk,
	input												data_gen_chipselect,
	input												data_gen_read,	
	input												data_gen_start,
	input												data_gen_address,          
	output	[data_width-1:0]							data_gen_readdata,
	input												data_actual_reset_n,                                                                                                                                                                                
	input												data_actual_clk,
	input												data_actual_chipselect,
	input												data_actual_write,
	input												data_actual_start,
	input												data_actual_address,             
	input	[data_width-1:0]							data_actual_writedata,
	output												data_actual_waitrequest,
	input												create_error,															        		     
	output	reg											error_latch,
	output	reg											data_error,  
	output	reg											test_complete,
	input		[data_width-1:0]						error_mask,        
	input		[data_width-1:0]						aci_prs,
	input		[nios_width-1:0]						aci_prd,
	input		[data_width-1:0]						aci_prc,
	input		[data_width-1:0]						aci_cem,
	output		[aci_tectr_width-1:0]					aci_ttc,
	output		[aci_tectr_width-1:0]					aci_rtc,
	output	reg	[aci_tectr_width-1:0]					aci_wec,
	output	reg	[(aci_tectr_width*num_lanes)-1:0] 		aci_lec, 
	input												aci_ips,
	
	// Altera BTS Memory Component Signals
	input												local_ready,
	output		[local_addr_width-1 : 0] 				local_addr,               // Memory Component Signals
	output		[local_addr_width-1 : 0] 				local_addr_q,             // Memory Component Signals
	output		[local_be_width-1 : 0]					local_be,		
	output												local_read_req,			
	output		[local_size_width-1: 0]					local_size,		
	output												local_burst_begin,		
	output												local_write_req,	
	input												nios_clk,
	input		[nios_map_width-1:0]					nios_address,    
	input		      									nios_chipselect,
	input		      									nios_read,
	output		[nios_width-1:0]						nios_readdata,
	input		      									nios_reset_n,
	input		      	    		    				nios_write,
	input		[nios_width-1:0]						nios_writedata	
);   
     
	assign	aci_ttc	=	data_gen_transaction_ctr;
	assign	aci_rtc	=	data_actual_transaction_ctr;
	               
	parameter	component_type						=	"DDR2SDRAM";
	parameter	data_width							=	256;
	parameter	nios_width							=	32;
	parameter	test_length_bts						=	100000;
	parameter	test_complete_ctr_width				=	64;		// > log2(test_length_bts)	                        			         
	parameter	tec_words							=	2;      // # of NIO Words for tranaction and error counters
	parameter	num_lanes							=	8;      // Number of error lanes - Scalable up to 64 lanes, due to memory reset      
	parameter	lane_width							=	data_width / num_lanes;
	parameter	aci_tectr_width						=	tec_words * nios_width;	// Transaction and Error counter width 
	parameter	prbs_depth							=	8;                 	    
	parameter	mem_widthad_a						=	1;
	parameter	sequencer_ptr_width					=	1;
	parameter	waveform_select_width				=	1; 
	parameter	num_registers						=	1;
	parameter	mem_sequencer_base_address_read		=	1; 
	parameter	mem_sequencer_base_address_write	=	1; 
	parameter	sequencer_size						=	1;
	parameter	addrs_per_seq_log2	           		=	1; 
	parameter	num_seq_regs_log2					=	1;
	parameter	dgen_memory_base_address_write		=	1;
	parameter	dgen_memory_base_address_read		=	1;
	parameter	dgen_mem_nios_addr_size				=	1;
	parameter	sequencer_burst_width				=	1;
	parameter	type_width							=	1;
	parameter	data_width_log2       				=	1;
	parameter	nios_width_log2						=	1;
	parameter	nios_map_width						=	1; 
	parameter	native_mode							=	1;   
	parameter	local_size_width					=	1;
	parameter	local_size_max						=	1;
	parameter	local_addr_width					=	1;
	parameter	local_be_width						=	1;
	parameter	waveform_ptr_width					=	mem_widthad_a - waveform_select_width; 	// Pointer for selected waveform   
	parameter	nios_map_width_seq					=	addrs_per_seq_log2 + num_seq_regs_log2;
	
	wire		[aci_tectr_width-1:0]				data_gen_transaction_ctr;
	wire		[aci_tectr_width-1:0]				data_actual_transaction_ctr;
	wire		[data_width-1:0]					data_actual_readdata;
	wire											data_actual_read; 
	reg			[aci_tectr_width-1:0]				aci_wec_rg1;	
	reg			[num_lanes-1:0]						lane_err;
   // Internal data structures
	reg			[data_width-1:0]					data_actual_writedata_pl1;
	reg												data_actual_write_pl1;
	reg												data_actual_chipselect_pl1;
	reg			[test_complete_ctr_width-1:0]		test_complete_ctr;     
	wire		[waveform_select_width-1:0]			data_gen_waveform_select;
 	wire		[waveform_select_width-1:0]			data_actual_waveform_select;
	wire		[waveform_ptr_width-1:0]			data_gen_waveform_ptr;
 	wire		[waveform_ptr_width-1:0]			data_actual_waveform_ptr;    
// Due to generate statements below, wires are optimized away unless they are declared here:
	wire											data_gen_reset_ptr;			// resets the pointer inside datagen
	wire											data_gen_prbs_chipselect;
	wire											data_gen_mem_chipselect;
	wire											data_gen_math_chipselect;
	wire											dgen_write_data_req; 	                                                                  
	wire											sequencer_complete_write;
 	wire											data_actual_reset_ptr; 	
	wire											data_actual_prbs_chipselect;
	wire											data_actual_mem_chipselect;
	wire											data_actual_math_chipselect;
	wire											dgen_read_data_req;
	wire											sequencer_complete_read;
	wire											sequencer_complete_read_addr_readreq;
	wire											data_gen_start_addr_readreq;


// Note: For QDRII memory, use a separate address sequencer for the write and read
assign	nios_chipselect_seq_write		=	nios_chipselect && ((nios_address >= mem_sequencer_base_address_write) && (nios_address < (mem_sequencer_base_address_write + sequencer_size))); 
assign	nios_chipselect_seq_read		=	nios_chipselect && ((nios_address >= mem_sequencer_base_address_read)  && (nios_address < (mem_sequencer_base_address_read  + sequencer_size)));     
//assign	nios_chipselect_seq_read		=	nios_chipselect_seq_write;	// For DDR2, Both Sequencers are programmed identically
        
assign	local_be	=	{local_be_width{1'b1}};	// Test full width of databus.
                  

// NOTE! -- These parameters must match the values in memory_sequencer,
//          and also in the driver software.  Note that software can overwrite
//          the rw_type_init value in sequencer memory, this code is for 
//          bringing up a high performance test without requiring NIOS to setup the sequencer
parameter		NONE						=	0;
parameter		WRITE						=	1;	// Write Only (eg Initialize memory, SSN, QDRII Write Interface)
parameter		READ						=	2;	// Read Only  (eg QDRII Read Interface) if instantiation multiple memory sequencers
parameter		WVR							=	3;	// Write verify Read (Typical DDR2, SRAM)

generate
	if	(component_type == "QDRII")
	begin
		// High performance QDRII (separate d and q buses) 
		// Use separate read & write address sequencers for QDRII
		// Generate Address sequences from Memory, and controls such as waveform for the Data Generator.
		defparam		memory_sequencer_write_i.native_mode				=	native_mode				;
		defparam		memory_sequencer_write_i.local_size_width			=	local_size_width		;
		defparam		memory_sequencer_write_i.local_size_max				=	local_size_max			;
		defparam		memory_sequencer_write_i.local_addr_width			=	local_addr_width		;
		defparam		memory_sequencer_write_i.waveform_select_width		=	waveform_select_width	;
		defparam		memory_sequencer_write_i.waveform_ptr_width			=	waveform_ptr_width		;
		defparam		memory_sequencer_write_i.nios_width					=	nios_width			    ;
		defparam		memory_sequencer_write_i.nios_map_width				=	nios_map_width_seq		;
		defparam		memory_sequencer_write_i.addrs_per_seq_log2			=	addrs_per_seq_log2	    ;
		defparam		memory_sequencer_write_i.sequencer_ptr_width		=	sequencer_ptr_width	    ;
		defparam		memory_sequencer_write_i.sequencer_burst_width		=	sequencer_burst_width	;
		defparam		memory_sequencer_write_i.type_width					=	type_width			    ;    
		defparam		memory_sequencer_write_i.component_type				=	component_type			; 
		defparam		memory_sequencer_write_i.rw_type_init				=	WRITE					;
		defparam		memory_sequencer_write_i.seq_burst_length_init		=	0						;
		defparam		memory_sequencer_write_i.d_q_bus_type				=	1						;
		memory_sequencer	memory_sequencer_write_i
		(
			.nios_reset_n        		(nios_reset_n          					),
			.nios_clk            		(nios_clk              					),
			.nios_chipselect     		(nios_chipselect_seq_write  			),
			.nios_write          		(nios_write            					),
			.nios_read           		(nios_read             					),
			.nios_address        		(nios_address          					),
			.nios_writedata      		(nios_writedata        					),
			.nios_readdata		 		(					    				),
			.local_clk			 		(data_gen_clk		    				),
			.reset_n			 		(data_gen_reset_n		 				),
			.start				 		(data_gen_start	    					),
			.prbs_chipselect	 		(data_gen_prbs_chipselect				),
			.mem_chipselect		 		(data_gen_mem_chipselect				),
			.math_chipselect	 		(data_gen_math_chipselect				),
			.waveform_select	 		(data_gen_waveform_select				),
			.reset_ptr					(data_gen_reset_ptr						),
			.waveform_ptr				(data_gen_waveform_ptr					),
			.dgen_chipselect			(data_gen_chipselect					),	
			.dgen_read			 		(dgen_write_data_req					), 	                                                                  
			.local_addr			 		(local_addr								),
			.local_read_req		 		(										),
			.local_ready		 		(local_ready		    				),
			.local_size			 		(local_size								),
			.local_burst_begin			(local_burst_begin						),
			.local_write_req	 		(local_write_req	    				),
			.sequencer_complete  		(sequencer_complete_write     			),
			.local_transaction_seq_next	(ltsn_mem_seq_w							)
		);	

		
		// Delay address sequencer for read side (unneeded, but confirms memory actually is
		// storing data for a few clocks: 
		// Use this, or use the write transaction counter = 1 (or 0) to start qdrii read addr/cmd sequencer
		defparam	pipeline_delay_qdrii_addr_readreq.data_width		=	1;
		defparam	pipeline_delay_qdrii_addr_readreq.pipeline_depth	=	2; // For short bursts;
		defparam	pipeline_delay_qdrii_addr_readreq.reset_value		=	1'b0;					
		pipeline_delay	pipeline_delay_qdrii_addr_readreq
		(
			.reset_n	(data_gen_reset_n),
			.clk		(data_gen_clk),
			.datain		(data_gen_start),
			.dataout  	(data_gen_start_addr_readreq)
		);
		
		// Generate read address and local_read_req for q portion of QDRII-II
		// Delay read 1 clock from write, so no simultaneous read & write to same address
		reg	data_gen_start_addr_readreq_0;
		always @(posedge data_gen_clk or negedge data_gen_reset_n)
		begin
			if	(!data_gen_reset_n)
			begin
				data_gen_start_addr_readreq_0	<=	0;
			end else begin
				data_gen_start_addr_readreq_0	<=	data_gen_start;
			end
		end
		
		
		// on the local bus
		defparam		memory_sequencer_read_addr_readreq_i.native_mode			=	native_mode				;
		defparam		memory_sequencer_read_addr_readreq_i.local_size_width		=	local_size_width		;
		defparam		memory_sequencer_read_addr_readreq_i.local_size_max			=	local_size_max			;
		defparam		memory_sequencer_read_addr_readreq_i.local_addr_width		=	local_addr_width		;
		defparam		memory_sequencer_read_addr_readreq_i.waveform_select_width	=	waveform_select_width	;
		defparam		memory_sequencer_read_addr_readreq_i.waveform_ptr_width		=	waveform_ptr_width		;
		defparam		memory_sequencer_read_addr_readreq_i.nios_width				=	nios_width			    ;
		defparam		memory_sequencer_read_addr_readreq_i.nios_map_width			=	nios_map_width_seq		;
		defparam		memory_sequencer_read_addr_readreq_i.addrs_per_seq_log2		=	addrs_per_seq_log2	    ;
		defparam		memory_sequencer_read_addr_readreq_i.sequencer_ptr_width	=	sequencer_ptr_width	    ;
		defparam		memory_sequencer_read_addr_readreq_i.sequencer_burst_width	=	sequencer_burst_width	;
		defparam		memory_sequencer_read_addr_readreq_i.type_width				=	type_width			    ;    
		defparam		memory_sequencer_read_addr_readreq_i.component_type			=	component_type			; 
		defparam		memory_sequencer_read_addr_readreq_i.rw_type_init			=	READ					; 
		defparam		memory_sequencer_read_addr_readreq_i.seq_burst_length_init	=	0						;
		defparam		memory_sequencer_read_addr_readreq_i.d_q_bus_type			=	0						;
		memory_sequencer	memory_sequencer_read_addr_readreq_i
		(
			.nios_reset_n        		(nios_reset_n          					),
			.nios_clk            		(nios_clk              					),
			.nios_chipselect     		(nios_chipselect_seq_read	  			),	// Address and read_req for read
			.nios_write          		(nios_write            					),	// Yet is input on local bus
			.nios_read           		(nios_read             					),
			.nios_address        		(nios_address          					),
			.nios_writedata      		(nios_writedata        					),
			.nios_readdata		 		(					    				),
			.local_clk			 		(data_gen_clk		    				),
			.reset_n			 		(data_gen_reset_n		 				),
			//.start				 	(data_gen_start && ltsn_mem_seq_w		), 	// Q address output simultaneous with D address
			//.start				 	(data_gen_start_addr_readreq			),	// Local controller 
			.start						(data_gen_start_addr_readreq_0			),
			.prbs_chipselect	 		(										),
			.mem_chipselect		 		(										),
			.math_chipselect	 		(										),
			.waveform_select	 		(										),
			.reset_ptr					(										),
			.waveform_ptr				(										),
			.dgen_chipselect			(data_gen_chipselect					),	
			.dgen_read			 		(1'b0									), 	// Data select portion unused                                                                  
			.local_addr			 		(local_addr_q							),
			.local_read_req		 		(local_read_req							),
			.local_ready		 		(local_ready		    				),
			.local_size			 		(										),
			.local_burst_begin			(										),
			.local_write_req	 		(	    								),
			.sequencer_complete  		(sequencer_complete_read_addr_readreq	),
			.local_transaction_seq_next	(										)
		); 	
		
		defparam		memory_sequencer_read_i.native_mode					=	native_mode				;
		defparam		memory_sequencer_read_i.local_size_width			=	local_size_width		;
		defparam		memory_sequencer_read_i.local_size_max				=	local_size_max			;
		defparam		memory_sequencer_read_i.local_addr_width			=	local_addr_width		;
		defparam		memory_sequencer_read_i.waveform_select_width		=	waveform_select_width	;
		defparam		memory_sequencer_read_i.waveform_ptr_width			=	waveform_ptr_width		;
		defparam		memory_sequencer_read_i.nios_width					=	nios_width			    ;
		defparam		memory_sequencer_read_i.nios_map_width				=	nios_map_width_seq		;
		defparam		memory_sequencer_read_i.addrs_per_seq_log2			=	addrs_per_seq_log2	    ;
		defparam		memory_sequencer_read_i.sequencer_ptr_width			=	sequencer_ptr_width	    ;
		defparam		memory_sequencer_read_i.sequencer_burst_width		=	sequencer_burst_width	;
		defparam		memory_sequencer_read_i.type_width					=	type_width			    ; 
		defparam		memory_sequencer_read_i.component_type				=	component_type			;  
		defparam		memory_sequencer_read_i.rw_type_init				=	READ					;
		defparam		memory_sequencer_read_i.seq_burst_length_init		=	0						;
		defparam		memory_sequencer_read_i.d_q_bus_type				=	1						;
		memory_sequencer	memory_sequencer_read_i
		(
			.nios_reset_n        		(nios_reset_n          							),
			.nios_clk            		(nios_clk              							),
			.nios_chipselect     		(nios_chipselect_seq_read   					),
			.nios_write          		(nios_write            							),
			.nios_read           		(nios_read             							),
			.nios_address        		(nios_address          							),
			.nios_writedata      		(nios_writedata        							),
			.nios_readdata		 		(					    						),
			.local_clk			 		(data_actual_clk	    						),
			.reset_n			 		(data_actual_reset_n							),
			.start				 		(data_actual_start		    					),
			.prbs_chipselect	 		(data_actual_prbs_chipselect					),
			.mem_chipselect		 		(data_actual_mem_chipselect						),
			.math_chipselect	 		(data_actual_math_chipselect					),
			.waveform_select	 		(data_actual_waveform_select					),
			.reset_ptr					(data_actual_reset_ptr							),
			.waveform_ptr				(data_actual_waveform_ptr						),
			.dgen_chipselect			(data_actual_chipselect							),
			.dgen_read					(dgen_read_data_req								),
			.local_addr			 		(												),
			.local_be			 		(												),
			.local_init_done	 		(												),
			.local_read_req		 		(												),
			.local_ready		 		(1'b0											), // only read data select portion
			.local_size			 		(												), // address sequencer is unused
			.local_burst_begin			(												),
			.local_write_req	 		(												),
			.sequencer_complete  		(sequencer_complete_read						),
			.local_transaction_seq_next	(												)
		); 		
		
	end else begin
		// DDR2, DDR3, RLD, shared dq memories:
		// Generate Address sequences from Memory, and controls such as waveform for the Data Generator.
		defparam		memory_sequencer_write_i.native_mode				=	native_mode				;
		defparam		memory_sequencer_write_i.local_size_width			=	local_size_width		;
		defparam		memory_sequencer_write_i.local_size_max				=	local_size_max			;
		defparam		memory_sequencer_write_i.local_addr_width			=	local_addr_width		;
		defparam		memory_sequencer_write_i.waveform_select_width		=	waveform_select_width	;
		defparam		memory_sequencer_write_i.waveform_ptr_width			=	waveform_ptr_width		;
		defparam		memory_sequencer_write_i.nios_width					=	nios_width			    ;
		defparam		memory_sequencer_write_i.nios_map_width				=	nios_map_width_seq		;
		defparam		memory_sequencer_write_i.addrs_per_seq_log2			=	addrs_per_seq_log2	    ;
		defparam		memory_sequencer_write_i.sequencer_ptr_width		=	sequencer_ptr_width	    ;
		defparam		memory_sequencer_write_i.sequencer_burst_width		=	sequencer_burst_width	;
		defparam		memory_sequencer_write_i.type_width					=	type_width			    ;    
		defparam		memory_sequencer_write_i.component_type				=	component_type			;     
		defparam		memory_sequencer_write_i.rw_type_init				=	WVR						;     
		defparam		memory_sequencer_write_i.seq_burst_length_init		=	8						; //<=  1<<(sequencer_burst_width-1);    
		defparam		memory_sequencer_write_i.d_q_bus_type				=	0						;
		memory_sequencer	memory_sequencer_write_i
		(
			.nios_reset_n        		(nios_reset_n          					),
			.nios_clk            		(nios_clk              					),
			.nios_chipselect     		(nios_chipselect_seq_write  			),
			.nios_write          		(nios_write            					),
			.nios_read           		(nios_read             					),
			.nios_address        		(nios_address          					),
			.nios_writedata      		(nios_writedata        					),
			.nios_readdata		 		(					    				),
			.local_clk			 		(data_gen_clk		    				),
			.reset_n			 		(data_gen_reset_n		 				),
			.start				 		(data_gen_start	    					),
			.prbs_chipselect	 		(data_gen_prbs_chipselect				),
			.mem_chipselect		 		(data_gen_mem_chipselect				),
			.math_chipselect	 		(data_gen_math_chipselect				),
			.waveform_select	 		(data_gen_waveform_select				),
			.reset_ptr					(data_gen_reset_ptr						),
			.waveform_ptr				(data_gen_waveform_ptr					),
			.dgen_chipselect			(data_gen_chipselect					),	
			.dgen_read			 		(dgen_write_data_req					), 	                                                                  
			.local_addr			 		(local_addr								),
			.local_read_req		 		(local_read_req							),
			.local_ready		 		(local_ready		    				),
			.local_size			 		(local_size								),
			.local_burst_begin			(local_burst_begin						),
			.local_write_req	 		(local_write_req	    				),
			.sequencer_complete  		(sequencer_complete_write     			),
			.local_transaction_seq_next	(										)
		);	
		assign	local_addr_q	=	local_addr; // Unused, unless using this sequencer in WVR mode for QDRII
												// Prefer to use the high performance QDRII case with separate sequencers	

		defparam		memory_sequencer_read_i.native_mode					=	native_mode				;
		defparam		memory_sequencer_read_i.local_size_width			=	local_size_width		;
		defparam		memory_sequencer_read_i.local_size_max				=	local_size_max			;
		defparam		memory_sequencer_read_i.local_addr_width			=	local_addr_width		;
		defparam		memory_sequencer_read_i.waveform_select_width		=	waveform_select_width	;
		defparam		memory_sequencer_read_i.waveform_ptr_width			=	waveform_ptr_width		;
		defparam		memory_sequencer_read_i.nios_width					=	nios_width			    ;
		defparam		memory_sequencer_read_i.nios_map_width				=	nios_map_width_seq		;
		defparam		memory_sequencer_read_i.addrs_per_seq_log2			=	addrs_per_seq_log2	    ;
		defparam		memory_sequencer_read_i.sequencer_ptr_width			=	sequencer_ptr_width	    ;
		defparam		memory_sequencer_read_i.sequencer_burst_width		=	sequencer_burst_width	;
		defparam		memory_sequencer_read_i.type_width					=	type_width			    ;      
		defparam		memory_sequencer_read_i.component_type				=	component_type			;     
		defparam		memory_sequencer_read_i.rw_type_init				=	WVR						;     
		defparam		memory_sequencer_read_i.seq_burst_length_init		=	8						; //<=  1<<(sequencer_burst_width-1);    
		defparam		memory_sequencer_read_i.d_q_bus_type				=	0						;
		memory_sequencer	memory_sequencer_read_i
		(
			.nios_reset_n        		(nios_reset_n          							),
			.nios_clk            		(nios_clk              							),
			.nios_chipselect     		(nios_chipselect_seq_read   					),
			.nios_write          		(nios_write            							),
			.nios_read           		(nios_read             							),
			.nios_address        		(nios_address          							),
			.nios_writedata      		(nios_writedata        							),
			.nios_readdata		 		(					    						),
			.local_clk			 		(data_actual_clk	    						),
			.reset_n			 		(data_actual_reset_n							),
			.start				 		(data_actual_start		    					),
			.prbs_chipselect	 		(data_actual_prbs_chipselect					),
			.mem_chipselect		 		(data_actual_mem_chipselect						),
			.math_chipselect	 		(data_actual_math_chipselect					),
			.waveform_select	 		(data_actual_waveform_select					),
			.reset_ptr					(data_actual_reset_ptr							),
			.waveform_ptr				(data_actual_waveform_ptr						),
			.dgen_chipselect			(data_actual_chipselect							),
			.dgen_read					(dgen_read_data_req								),
			.local_addr			 		(												),
			.local_be			 		(												),
			.local_init_done	 		(												),
			.local_read_req		 		(												),
			.local_ready		 		(0												), // Address portion unused, set local_ready=0
			.local_size			 		(												),
			.local_burst_begin			(												),
			.local_write_req	 		(												),
			.sequencer_complete  		(sequencer_complete_read						),
			.local_transaction_seq_next	(												)
		); 		
	end
endgenerate
                                      

assign	nios_chipselect_dgen_write	=	nios_chipselect && ((nios_address >= dgen_memory_base_address_write) &&  (nios_address < (dgen_memory_base_address_write + dgen_mem_nios_addr_size))); 
assign	nios_chipselect_dgen_read	=	nios_chipselect && ((nios_address >= dgen_memory_base_address_read)	 &&  (nios_address < (dgen_memory_base_address_read  + dgen_mem_nios_addr_size))); 

defparam	data_generator_write.data_width					=	data_width				;		
defparam	data_generator_write.data_width_log2			=	data_width_log2			;	                                                            
defparam	data_generator_write.nios_width					=	nios_width				;
defparam	data_generator_write.nios_width_log2			=	nios_width_log2		    ;
defparam	data_generator_write.prbs_depth					=	prbs_depth				;     
defparam	data_generator_write.tec_words					=	tec_words				;
defparam	data_generator_write.mem_widthad_a 				= 	mem_widthad_a 			;
defparam	data_generator_write.waveform_select_width		=	waveform_select_width	;
defparam	data_generator_write.lane_width					=	lane_width;
data_generator	data_generator_write
(
	.nios_clk                  (nios_clk            				),
	.nios_address              (nios_address        				),
	.nios_chipselect	       (nios_chipselect_dgen_write			),
	.nios_read                 (nios_read           				),
	.nios_readdata             (				       				),
	.nios_reset_n              (nios_reset_n        				),
	.nios_write                (nios_write          				),
	.nios_writedata            (nios_writedata      				),
	.dgen_reset_n              (data_gen_reset_n && (!aci_ips)		),
	.dgen_clk                  (data_gen_clk       			  		),
	.prbs_chipselect           (data_gen_prbs_chipselect	 		),
	.mem_chipselect            (data_gen_mem_chipselect      		),
	.waveform_select           (data_gen_waveform_select     		),
	.reset_ptr				   (data_gen_reset_ptr					),
	.waveform_ptr			   (data_gen_waveform_ptr				),	
	.math_chipselect           (data_gen_math_chipselect     		),
	.dgen_read                 (data_gen_read						),                                                                                                                                       
	.dgen_address              (data_gen_address   					),
	.dgen_readdata             (data_gen_readdata	  				),
	.dgen_transaction_ctr      (data_gen_transaction_ctr			),
	.prbs_coeff                (aci_prc								),
	.prbs_seed                 (aci_prs								),
	.create_error			   (create_error						),
	.aci_cem				   (aci_cem								),
	.dgen_data_req			   (dgen_write_data_req					)		
);    

defparam	data_generator_read.data_width					=	data_width				;		
defparam	data_generator_read.data_width_log2				=	data_width_log2			;	                                                            
defparam	data_generator_read.nios_width					=	nios_width				;
defparam	data_generator_read.nios_width_log2				=	nios_width_log2		    ;
defparam	data_generator_read.prbs_depth					=	prbs_depth				;     
defparam	data_generator_read.tec_words					=	tec_words				;
defparam	data_generator_read.mem_widthad_a 				= 	mem_widthad_a 			;
defparam	data_generator_read.waveform_select_width		=	waveform_select_width	;
defparam	data_generator_read.lane_width					=	lane_width;
data_generator	data_generator_read
(
	.nios_clk                  (nios_clk            						),
	.nios_address              (nios_address        						),
	.nios_chipselect	       (nios_chipselect_dgen_read					),
	.nios_read                 (nios_read           						),
	.nios_readdata             (				       						),
	.nios_reset_n              (nios_reset_n        						),
	.nios_write                (nios_write          						),
	.nios_writedata            (nios_writedata      						),
	.dgen_reset_n              (data_actual_reset_n && (!aci_ips)			),
	.dgen_clk                  (data_actual_clk       						),
	.prbs_chipselect           (data_actual_prbs_chipselect					),
	.mem_chipselect            (data_actual_mem_chipselect      			),
	.waveform_select           (data_actual_waveform_select     			),
	.reset_ptr				   (data_actual_reset_ptr						),
	.waveform_ptr			   (data_actual_waveform_ptr					),	
	.math_chipselect           (data_actual_math_chipselect					),
	.dgen_read                 (data_actual_write 							),                                                                                                                                       
	.dgen_address              (data_actual_address   						),
	.dgen_readdata             (data_actual_readdata 						),
	.dgen_transaction_ctr      (data_actual_transaction_ctr		  			),
	.prbs_coeff                (aci_prc										),
	.prbs_seed                 (aci_prs										),
	.create_error			   (0											),	
	.aci_cem				   (0											),
	.dgen_data_req		  	   (dgen_read_data_req							)	
);  



// Comparator
always	@(posedge data_actual_clk or negedge data_actual_reset_n)
begin
	if	(!data_actual_reset_n)
	begin
		error_latch					<=	0;	
		data_error					<=	0;   
		data_actual_writedata_pl1	<=	0;
		data_actual_write_pl1		<=	0;
		data_actual_chipselect_pl1	<=	0;
		test_complete_ctr			<=	test_length_bts;
		test_complete				<=	0; 
		aci_wec_rg1					<=	0;				 
		aci_wec						<=	0; 	// Pipeline to line up with aci_lec 
		aci_lec						<=	0;
		lane_err					<=	0;
	end else begin
		if	(data_actual_write_pl1 && data_actual_chipselect_pl1)
		begin
			if	(test_complete_ctr == 0)
			begin
				test_complete		<=	1;
			end else begin
				test_complete_ctr	<=	test_complete_ctr - 1;
			end
			data_error				<=	((data_actual_readdata | error_mask) != (data_actual_writedata_pl1 | error_mask));
			if	((data_actual_readdata | error_mask) != (data_actual_writedata_pl1 | error_mask))
			begin                                                                         
				error_latch				<=	1;
			end	
			// Word error counter:
			if	((data_actual_readdata | error_mask) != (data_actual_writedata_pl1 | error_mask))
			begin   
				//if	(aci_wec_rg1 != {aci_tectr_width{1'b1}})	// Don't rollover
				begin	
					aci_wec_rg1			<=	aci_wec_rg1 + 1;
				end
			end	     
			lane_error_counter;
		end
		aci_wec						<=	aci_wec_rg1;	// Pipeline to match aci_lec
		data_actual_writedata_pl1	<=	data_actual_writedata;
		data_actual_write_pl1		<=	data_actual_write;
		data_actual_chipselect_pl1	<=	data_actual_chipselect;
	end
end

task	lane_error_counter;
	integer											A,B,C,D,E;
	integer											MPTR1;
	integer											MPTR2;
	reg			[aci_tectr_width-1:0]				aci_lec_reg;   
	reg			[num_lanes-1:0]						lane_err_w;			
	begin
		// Lane error counter 
		lane_err_w	=	0; 
		// Detect Error 
		lane_err_w = 0;
		for (A=0; A<num_lanes; A=A+1)
		begin
			for (B=A*lane_width; B<(A+1)*lane_width; B=B+1)
			begin
				if ((data_actual_readdata[B] | error_mask[B]) != (data_actual_writedata_pl1[B] | error_mask[B]))
				begin						
					 lane_err_w[A]	=	1;
				end																				
			end	
		end					
		lane_err	<=	lane_err_w;	// Pipeline  
		MPTR1		=	0;
		MPTR2		=	0;
		for (C=0; C<num_lanes; C=C+1)
		begin  
			for (D=0; D<aci_tectr_width; D=D+1)     
			begin 
				aci_lec_reg[D]	=	aci_lec[MPTR1];
				MPTR1			=	MPTR1 + 1;
			end  
			if	(lane_err[C]==1) // ((lane_err[C]==1) && (aci_lec_reg != {aci_tectr_width{1'b1}}))	// Don't rollover
			begin
				aci_lec_reg	=	aci_lec_reg + 1;
			end						
			for (E=0; E<aci_tectr_width; E=E+1)     
			begin 
				aci_lec[MPTR2]	<=	aci_lec_reg[E];
				MPTR2			=	MPTR2 + 1;
			end 
		end
	end		 
endtask

endmodule       
