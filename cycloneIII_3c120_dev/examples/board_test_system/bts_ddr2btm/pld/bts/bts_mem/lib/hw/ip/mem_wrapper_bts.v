/******************************************************************************
*Copyright © 2007 Altera Corporation. All rights reserved.  Altera products   *
*are protected under numerous U.S. and foreign patents, maskwork rights,      *
*copyrights and other intellectual property laws.                             *
*                                                                             *
*This reference design file, and your use thereof, is subject to and governed *
*by the terms and conditions of the applicable Altera Reference Design        *
*License Agreement.  By using this reference design file, you indicate your   *
*acceptance of such terms and conditions between you and Altera Corporation.  *
*In the event that you do not agree with such terms and conditions, you may   *
*not use the reference design file. Please promptly destroy any copies you    *
*have made.                                                                   *
*                                                                             *
*This reference design file being provided on an "as-is" basis and as an      *
*accommodation and therefore all warranties, representations or guarantees    *
*of any kind (whether express, implied or statutory) including, without       *
*limitation, warranties of merchantability, non-infringement, or fitness for  *
*a particular purpose, are specifically disclaimed.  By making this reference *
*design file available, Altera expressly does not recommend, suggest or       *
*require that this reference design file be used in combination with any      *
*other product not provided by Altera                                         */

/******************************************************************************
* NOTICE: The information contained in this file is proprietary   			  *
* to Altera and is being made available to Altera's customers     			  *
* under strict non-disclosure agreements.  Use or disclosure of   			  *
* this information is permissible only under the terms of         			  *
* existing non-disclosure agreements.                             			  *
*******************************************************************************/    

/*                  
-------------------------------------------------------------------------------------------
--                                                                                       --
-- Title:       mem_wrapper_bts.v                                                         --
-- Rev:         Rev 1                                                                    --
-- Modified:    March 27, 2007                                                          --
-- Author:      David Johnson                                                            --


--------------------------------------------------------------------------------------------  
--                                                                                       --
-- Revision History:                                                                     --  
--                                                                                       --
-- Rev 1:       Created                                                                  --
--                                                                                       --
--------------------------------------------------------------------------------------------
*/

module	mem_wrapper_bts
(     
	input											reset_n,                  // Asynchronous reset of module
	input											wr_pld_clk,	              // Transmit/Write PLD Clock                                                                       
	output	[local_data_width-1:0]					wr_datain,                // Transmit/Write Data     
	input											wr_ready,	              // Ready Signal for Transmit/Write data                
	input											rd_pld_clk,               // Receive/Read PLD Clock
	input											start_write,              // Start Write Data Generator
	input											start_read,				  // Start Read Data Generator
	input											create_error,             // Create Error in Transmit/Write Data Generator   
	input	[local_data_width-1:0]					rd_dataout,	              // Receive/Read Data
	input											rd_ready,                 // Ready Signal for Receive/Read Data
	output											error_latch,              // Persistently asserts on 1st Error detected
	output											data_error,               // Asserts on each error for 1 rd_pld_clk period
	output											pattern_sync_acquired,    // Asserts when receiver detects sync pattern
	output											test_complete,            // Asserts after RX side of BTS receives "test_length_bts" words  
	input	[local_data_width-1:0]					error_mask,               // Error mask -  mask bits for error detection - set  parameter to enable_error_mask = 1
	input	[local_data_width-1:0]					sync_mask,                // Sync mask - mask bits for pattern_sync_acquired - requires parameter to enable_sync_mask = 1
	input	[local_data_width-1:0]					aci_prs,                  // PRBS Seed
	input	[nios_width-1:0]						aci_prd,                  // PRBS Depth
	input	[local_data_width-1:0]					aci_prc,                  // PRBS Coefficients
	input	[local_data_width-1:0]					aci_cem,                  // Create Error Mask
	output	[(nios_width*tec_words)-1:0]			aci_ttc,                  // Transmitter / Write Transaction Counter
	output	[(nios_width*tec_words)-1:0]			aci_rtc,                  // Receiver / Read Transaction Counter
	output	[(nios_width*tec_words)-1:0]			aci_wec,                  // Word Error Counter
	output	[(nios_width*tec_words*num_lanes)-1:0] 	aci_lec,                  // Lane Error Counter
	input				  							aci_ips,                  // Initialize PRBS Seed
	output	reg			  							aci_pass,	              // Test passed					
	input											local_ready,	          // Memory Component Signals
	output	[local_addr_width-1 : 0] 				local_addr,				  // read/write shared address bus (eg DDR2 SDRAM), or write address (eg QDRII)    
	output	[local_addr_width-1 : 0] 				local_addr_q,			  // read address bus (eg QDRII).. unused for DDR2 SDRAM    
	output	[local_be_width-1 : 0]					local_be,				  
	output											local_read_req,			
	output	[local_size_width-1: 0]					local_size,	
	output											local_burst_begin,			
	output											local_write_req,	
	input											nios_clk,
	input	[nios_map_width-1:0]					nios_address,    
	input	      									nios_chipselect,
	input	      									nios_read,
	output	[nios_width-1:0]						nios_readdata,
	input	      									nios_reset_n,
	input	      	    		    				nios_write,
	input	[nios_width-1:0]						nios_writedata
	////output										nios_waitrequest    
);         
							
							
parameter	mem_widthad_a						=	1; // 9;							// Waveform memory address width 
parameter	sequencer_ptr_width					=	1; // 8;							// 2^sequencer_ptr_width is the sequencer memory size
parameter	waveform_select_width				=	1; // 3;							// Use to select math function or waveform
parameter	num_registers						=	1; // 256;							// Number of register in control module
parameter	mem_sequencer_base_address_write	=	1; // addrs_per_reg * num_registers;// Memory sequencer base address
parameter	mem_sequencer_base_address_read		=	1; // addrs_per_reg * num_registers;// Memory sequencer base address
parameter	sequencer_size						=	1;
parameter	addrs_per_seq_log2					=	1;
parameter	num_seq_regs_log2					=	1;
parameter	dgen_memory_base_address_write		=	1;
parameter	dgen_memory_base_address_read		=	1;
parameter	dgen_mem_nios_addr_size				=	1;
parameter	sequencer_burst_width				=	1; // 8;							// Memory bits for sequencer burst (2^sequencer_ptr_width <= max_sequencer_size)	
parameter	type_width							=	1; // 4;							// Memory bit usage for sequencer types 
parameter	local_data_width_log2       		=	1; // 8;
parameter	nios_width_log2						=	1; // 5;
parameter	nios_map_width						=	1;  
parameter	native_mode							=	1;                                      
parameter	local_size_width					=	1; // 2;  
parameter	local_size_max						=	1;                 
parameter	local_addr_width					=	1; // 24;
parameter	local_data_width					=	1; // 144; 
parameter	local_be_width						=	1; // 18;													                                  	
parameter	nios_width							=	32;		 					// NIOS Datapath Width For transaction counter
parameter	prbs_depth							=	32; 						// PRBS shift register depth
parameter	test_length_bts						=	'h20000;					// Number of data_gen_readdata to transmit before asserting test_complete
parameter	test_complete_ctr_width				=	16;							// > log2(test_length_bts)	  
parameter	tec_words							=	2;							// Transaction/Error Counter Nios words (eg tec_words=2, w
parameter	num_lanes							=	local_data_width / 8;		// serial_channels;			// eg: Set to 9 for 72 bits DDR2 with 9 byte lanes
parameter	component_type						=	"DDR2SDRAM";

reg		[local_data_width-1:0]					rd_out_bonded_le_pl1;	// Extra pipeline to meet timing (this is redundant - pipelined in channel aligner)
reg		[local_data_width-1:0]					rd_out_bonded_le_pl2;	// Pipeline for start of pattern detect                                       	
reg												data_gen_read;       
wire	[local_data_width-1:0]					data_gen_readdata; 
reg												data_actual_write;
reg												rd_ready_pl1;
reg												rd_ready_pl2;	 
reg												test_complete_prev;
reg												data_gen_start;
reg												data_actual_start;



assign	pattern_sync_acquired = data_actual_write;


defparam	pipeline_delay_rd_ready.data_width		=	1;
defparam	pipeline_delay_rd_ready.pipeline_depth	=	2;
defparam	pipeline_delay_rd_ready.reset_value		=	1'b0;					
pipeline_delay	pipeline_delay_rd_ready
(
	.reset_n	(reset_n),
	.clk		(rd_pld_clk),
	.datain		(rd_ready),
	.dataout  	(rd_ready_pl)
);




always	@(posedge rd_pld_clk or negedge reset_n)
begin
	if	(!reset_n)
	begin
		data_actual_write				<=	0;
		aci_pass						<=	0;
		rd_out_bonded_le_pl1			<=	0;  
		rd_out_bonded_le_pl2			<=	0;
		rd_ready_pl1					<=	0;
		rd_ready_pl2					<=	0;
		test_complete_prev				<=	0;
		data_actual_start				<=	0;
	end else begin
		if	(start_read)
		begin
			//if	(((rd_out_bonded_le_pl1 | sync_mask) == (aci_prs | sync_mask)) && rd_ready_pl1) // 1st valid non-zero data coming out of controller 
			if	(rd_ready_pl1)	// 1st rdata valid (no sync pattern required)
			begin
				data_actual_write	<=	1;
			end		
			data_actual_start	<=	1;			
		end 
		rd_out_bonded_le_pl1	<=	rd_dataout;	//   rd_out_bonded_le;
		rd_out_bonded_le_pl2	<=	rd_out_bonded_le_pl1;
		rd_ready_pl1			<=	rd_ready;
		rd_ready_pl2			<=	rd_ready_pl1;
		if (test_complete && (!test_complete_prev))
		begin
			aci_pass	<=	!error_latch;
		end
		test_complete_prev		<=	test_complete;
	end
end

always	@(posedge wr_pld_clk or negedge reset_n)
begin
	if	(!reset_n)
	begin
		data_gen_read				<=	0;
		data_gen_start				<=	0;
	end else begin
		if	(start_write)
		begin
			data_gen_read	<=	1;
			data_gen_start	<=	1;		
		end	
	end
end

									
defparam	altera_bts_mem_inst.nios_width							=	nios_width;		 	// For transaction counter
defparam	altera_bts_mem_inst.data_width							=	local_data_width;
defparam	altera_bts_mem_inst.data_width_log2      				=	local_data_width_log2      	;
defparam	altera_bts_mem_inst.prbs_depth							=	prbs_depth; 		// Use as seed for PRBS
defparam	altera_bts_mem_inst.test_length_bts						=	test_length_bts;
defparam	altera_bts_mem_inst.test_complete_ctr_width				=	test_complete_ctr_width;	// > log2(test_length_bts)	  
defparam	altera_bts_mem_inst.tec_words							=	tec_words;
defparam	altera_bts_mem_inst.num_lanes							=	num_lanes;
defparam	altera_bts_mem_inst.mem_widthad_a						=	mem_widthad_a				;
defparam	altera_bts_mem_inst.sequencer_ptr_width					=	sequencer_ptr_width			;
defparam	altera_bts_mem_inst.waveform_select_width				=	waveform_select_width		;
defparam	altera_bts_mem_inst.num_registers						=	num_registers				;
defparam	altera_bts_mem_inst.mem_sequencer_base_address_write	=	mem_sequencer_base_address_write	;
defparam	altera_bts_mem_inst.mem_sequencer_base_address_read		=	mem_sequencer_base_address_read		;
defparam	altera_bts_mem_inst.sequencer_size						=	sequencer_size;
defparam	altera_bts_mem_inst.addrs_per_seq_log2					=	addrs_per_seq_log2			;
defparam	altera_bts_mem_inst.num_seq_regs_log2					=	num_seq_regs_log2			;
defparam	altera_bts_mem_inst.dgen_memory_base_address_write		=	dgen_memory_base_address_write;
defparam	altera_bts_mem_inst.dgen_memory_base_address_read		=	dgen_memory_base_address_read;
defparam	altera_bts_mem_inst.dgen_mem_nios_addr_size				=	dgen_mem_nios_addr_size;
defparam	altera_bts_mem_inst.sequencer_burst_width				=	sequencer_burst_width		;
defparam	altera_bts_mem_inst.type_width							=	type_width					;
defparam	altera_bts_mem_inst.nios_width_log2						=	nios_width_log2				;
defparam	altera_bts_mem_inst.nios_map_width						=	nios_map_width				; 
defparam	altera_bts_mem_inst.native_mode							=	native_mode					;   
defparam	altera_bts_mem_inst.local_size_width					=	local_size_width            ;
defparam	altera_bts_mem_inst.local_size_max						=	local_size_max            	;
defparam	altera_bts_mem_inst.local_addr_width					=	local_addr_width            ;
defparam	altera_bts_mem_inst.local_be_width						=	local_be_width		        ;
defparam	altera_bts_mem_inst.component_type						=	component_type				;
altera_bts_mem	altera_bts_mem_inst
(   
	.data_gen_reset_n       	(reset_n             			),
	.data_gen_clk           	(wr_pld_clk             		),
	.data_gen_chipselect    	(1'b1 							), // (Unused) Required by Avalon
	.data_gen_read          	(data_gen_read && wr_ready		),
	.data_gen_start				(data_gen_start					),
	.data_gen_address       	(0    							), // (Unused) Required by Avalon
	.data_gen_readdata      	(wr_datain			   			),									
	.data_actual_reset_n		(reset_n						),                                                                                                                                                                        
	.data_actual_clk            (rd_pld_clk			   			),
	.data_actual_chipselect     (1'b1							), // (Unused) Required by Avalon
	//.data_actual_write          (data_actual_write && rd_ready_pl2	), 
	.data_actual_write          (data_actual_write && rd_ready_pl),
	.data_actual_start			(data_actual_start				),
	.data_actual_address        (0								), // (Unused) Required by Avalon     
	.data_actual_writedata      (rd_out_bonded_le_pl2 			),
	.data_actual_waitrequest    (	                  			),	
	.create_error				(create_error					),												 
	.error_latch                (error_latch         			),
	.data_error                 (data_error          			),
	.test_complete				(test_complete					),
	.error_mask					(error_mask						),
	.aci_prs                    (aci_prs						),
	.aci_prd                    (aci_prd						),
	.aci_prc                    (aci_prc						),
	.aci_cem					(aci_cem						),
	.aci_ttc                    (aci_ttc						),
	.aci_rtc                    (aci_rtc						),
	.aci_wec                    (aci_wec						),
	.aci_lec                    (aci_lec						),
	.aci_ips					(aci_ips						),
	.local_ready				(local_ready					),
	.local_addr                 (local_addr                     ),
	.local_addr_q               (local_addr_q                   ),	
	.local_be		            (local_be		                ),
	.local_read_req		        (local_read_req		            ),
	.local_size			        (local_size			            ),
	.local_burst_begin			(local_burst_begin				),
	.local_write_req	        (local_write_req	            ),
	.nios_clk                   (nios_clk                       ),
	.nios_address               (nios_address                   ),
	.nios_chipselect            (nios_chipselect                ),
	.nios_read                  (nios_read                      ),
	.nios_readdata              (nios_readdata                  ),
	.nios_reset_n               (nios_reset_n                   ),
	.nios_write                 (nios_write                     ),
	.nios_writedata             (nios_writedata                 )
); 

endmodule
