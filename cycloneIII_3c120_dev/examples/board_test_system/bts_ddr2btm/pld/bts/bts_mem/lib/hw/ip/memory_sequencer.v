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
-- Title:       memory_sequencer.v                                          --
-- Rev:         Rev 1                                                       --
-- Modified:    April 3, 2007                                               --
-- Author:      David Johnson                                               --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Description: Altera Board Test System II Memory Sequencer                --
--																			--
------------------------------------------------------------------------------
--                                                                          --
-- Revision History:                                                        --
-- Rev 1 - Original code                                                    --
------------------------------------------------------------------------------
*/  

module	memory_sequencer
(
	// NIOS II Avalon Interface:                
	input										nios_reset_n        		,
	input										nios_clk            		,
	input										nios_chipselect     		,
	input										nios_write          		,
	input										nios_read           		,
	input		[nios_map_width-1:0]			nios_address        		,
	input		[nios_width-1:0]				nios_writedata      		,
	output		[nios_width-1:0]				nios_readdata				,
	// Local Signals (At Speed)
	input										local_clk					,
	input										reset_n						,
	input										start						,
	// Datagen Sequence Controller
	output	reg									prbs_chipselect				,
	output	reg									mem_chipselect				,
	output	reg									math_chipselect				,
	output	reg	[waveform_select_width-1:0]		waveform_select				,	// Selects math or waveform memory
	output	reg									reset_ptr					,   // Periodic reset indicator
	output	reg	[waveform_ptr_width-1:0]		waveform_ptr				,
	input										dgen_chipselect				,
	input										dgen_read					,                                                                                                                                                          
	// Local Memory Sequence Controller
	output	reg [local_addr_width-1 : 0] 		local_addr					,	// Local Controller Address
	//output	reg [local_be_width-1 : 0]		local_be					,	// Not implemented (Not on DDR2 read)
	//input										local_init_done				,	// Unused
	output	reg									local_read_req				,	// DDR2 - Provide base address of burst read
	input										local_ready					,	// avl_wait_request_rd (from local_ready for DDR2)
	output	reg [local_size_width-1: 0]			local_size					,	// Burst Size for DDR2 Memory
	output	reg									local_burst_begin			,
	output	reg									local_write_req				,	// avl_write.  DDR2 - Provide base address of burst write
	output	reg									sequencer_complete			,	// Sequencer continues after this signal asserts
	output										local_transaction_seq_next		// Use for QDRII to start read addr/cmd sequencer
);
	
	parameter		component_type				=	"DDR2SDRAM";
	parameter		native_mode					=	1;	// For Native Mode, 1 address provided for full burst 
														// Set to 0 for Avalon Mode
	parameter		local_size_width			=	2;
	parameter		local_size_max				=	2;
	parameter		local_addr_width			=	24;	// eg 10 cols - 1 + 13 rows + 2 banks (-1 since 72 to 144 local bus
	parameter		waveform_select_width		=	3;	// Use to select math function or waveform
	parameter		waveform_ptr_width			=	6;
	parameter		nios_width					=	32;  
	parameter		nios_map_width				=	16;						// Address width
	parameter		addrs_per_seq				=	1<<addrs_per_seq_log2; 	// Maximum number of byte addresses per sequencer >> sequencer_depth!
	parameter		addrs_per_seq_log2			=	'h4;						// Upper limit on sequencer depth (so don't need new memory map for each memory size)
	parameter		nah							=	nios_map_width-1; 		
	parameter		nal							=	addrs_per_seq_log2;  // In address mux/demux below, to simplify rtl, nal is used as the lower address limit,
	// To simplify, make sequencer depth a power of 2
	parameter		sequencer_depth				=	1<<sequencer_ptr_width;						// 1<<sequencer_ptr_width;	// Memory size of sequencer
	parameter		sequencer_ptr_width			=	8;				
	parameter		sequencer_ptr_max			=	{sequencer_ptr_width{1'b1}};
	parameter		sequencer_burst_width		=	8;						// Sequencer burst length
	parameter		type_width					=	4;				
	// RW Types:
	parameter		NONE						=	0;
	parameter		WRITE						=	1;	// Write Only (eg Initialize memory, SSN, QDRII Write Interface)
	parameter		READ						=	2;	// Read Only  (eg QDRII Read Interface) if instantiation multiple memory sequencers
	parameter		WVR							=	3;	// Write verify Read (Typical DDR2, SRAM)
	// Address Sequence Types   				
	parameter		UP_BURST					=	1;
	parameter		UP_INC						=	2;
	parameter		DOWN_BURST					=	3;
	parameter		DOWN_DEC					=	4;
	parameter		SHIFT_RT					=	5;
	parameter		SHIFT_LT					=	6; 
	parameter		ROTATE_RT					=	7;
	parameter		ROTATE_LT					=	8;
	// Data Select Types        				
	parameter		PRBS						=	1;
	parameter		MEMORY						=	2;
	parameter		MATH						=	3;
	parameter		rw_type_init				=	WVR;
	parameter		seq_burst_length_init		=	8; // 1<<(sequencer_burst_width-1);	
	parameter		d_q_bus_type				=	0; // 0=shared dq (ddr2, ddr3) 1=separate d & q (qdrii)												   // Set=0 for no sequencer bursting
	
	parameter		sequencer_burst_length_addr		=	'h00 * addrs_per_seq;
	parameter		local_addr_start_addr			=	'h01 * addrs_per_seq;
	parameter		local_burst_length_addr			=	'h02 * addrs_per_seq;
	parameter		local_transaction_length_addr	=	'h03 * addrs_per_seq;
	parameter		rw_type_addr					=	'h04 * addrs_per_seq;
	parameter		address_type_addr				=	'h05 * addrs_per_seq;
	parameter		data_type_addr					=	'h06 * addrs_per_seq;
	parameter		waveform_selector_addr			=	'h07 * addrs_per_seq;
	parameter		waveform_periodor_addr			=	'h08 * addrs_per_seq;	
	parameter		step_nwr						=	1; // None/Write/Read
	parameter		step_wvr						=	2; // Write/Verify Read
	parameter		transactions_a_max				=	(2-d_q_bus_type) * (1<<local_addr_width) / local_size_max; // Safe value for QDRII, set <= full memory
																												   // since local_transaction_seq_next==1 or 0 starts QDRII addr/cmd read sequencer
																												   // *2 for shared bus (DDR2/DDR3/RLDRAM) since wvr take 2 transactions per local address

// Internal data structures:
reg	[sequencer_ptr_width-1:0]		sequencer_ptr_a;	
reg	[sequencer_ptr_width-1:0]		sequencer_ptr_d;

// Memory Sequencer:
reg	[sequencer_burst_width-1:0]		sequencer_burst_length  	[0:sequencer_depth-1]	; 	// Set >0 if rw_type=WVR, otherwise set to 0.			       	
	// Local Memory Sequence Controller
reg [local_addr_width-1 : 0] 		local_addr_start			[0:sequencer_depth-1]	;	// Memory component start address		
reg	[local_size_width-1:  0]		local_burst_length			[0:sequencer_depth-1]	;	// Memory component local burst length
reg	[nios_width-1:0]				local_transaction_length	[0:sequencer_depth-1]	;	// # of local write burst and read burst requests on memory controller 
																						// (Provided with address)
reg	[type_width-1:0]				rw_type						[0:sequencer_depth-1]	;   // READ, WRITE, WVR (Read verify Wrive)
reg	[type_width-1:0]				address_type				[0:sequencer_depth-1]	;	// Up, Down, Toggle, PRBS 
reg	[type_width-1:0]				data_type					[0:sequencer_depth-1]	;	// Selects PRBS, Waveform Mem, Math1, Math2, Data=Addr .. 																						// Because data can be 1000's
reg	[waveform_select_width-1:0]		waveform_selector			[0:sequencer_depth-1]	;	// Select data waveform
reg	[waveform_ptr_width-1:0]		waveform_periodor			[0:sequencer_depth-1]	;	// Waveform period

reg	[waveform_ptr_width-1:0]		waveform_period; // Period is (waveform_period+1)
reg									sequencer_start_a;
reg									sequencer_start_d;
reg	[local_addr_width-1 : 0]		local_address_seq_acc_reg;
reg	[sequencer_burst_width-1:0]		sequencer_burst_length_reg_a;
reg	[sequencer_burst_width-1:0]		sequencer_burst_length_ctr_a;
reg	[nios_width-1:0]				local_transaction_length_ctr_a;
reg	[local_size_width-1:0]			local_size_ctr_a;
reg	[type_width-1:0]				rw_type_reg_a;
reg	[type_width-1:0]				address_type_reg_a;

reg	[nios_width-1:0]				local_transaction_length_ctr_d;
reg	[local_size_width-1:0]			local_size_ctr_d;
reg	[local_size_width-1:0]			local_size_reg_d;
reg	[type_width-1:0]				rw_type_reg_d;
reg [local_addr_width-1 : 0] 		next_local_addr_w;

reg	[local_size_width-1:0]			local_burst_ctr;

assign	nios_readdata		=	0;
//assign	nios_waitrequest	=	0; 

// Use for QDRII - to start read address sequencer trailing write address sequencer
assign	local_transaction_seq_next	=	(local_transaction_length_ctr_a == 1) ||	// Next Sequence
										(local_transaction_length_ctr_a == 0);		// Current sequence forever

always	@(posedge local_clk or negedge reset_n)
begin
	if	(!reset_n)
	begin
		sequencer_start_a				<=	0;
		sequencer_start_d				<=	0;
		sequencer_ptr_a					<=	0;
		sequencer_ptr_d					<=	0;
		update_sequence_a(0,0)				;	// Don't assert read_req or write_req on initialization
		update_sequence_d(0,0)				;
		sequencer_complete				<=	0;
	end else begin
		// address portion:
		// local_read = controller ready for new address & command (read_req or write_req)
		if	(local_ready)
		begin		
			// last term allows init memory with bursting below before handing off to sequencer
			if	(start && (sequencer_start_a == 0))
			begin
				sequencer_start_a		<=	1;
				next_sequence_a;
			end else if	(sequencer_start_a)	
			begin
				address_sequencer;
			end else if (native_mode == 0) // if (rw_type_reg_a == WVR)  -- for native mode, don't have wdata_req pulsing 
										   // until 1st data is written (don't init memory)
			begin	// Init memory after reset, use local burst = 1
				local_size			<=	1;
				local_write_req		<=	1;
				local_burst_begin	<=	1;
				local_addr			<=	local_addr + 1; // update_sequence_a initializes local_addr & local_size			
			end			
		end	
		// data portion:
		//	eg ddr2 dimm  after start pb:
		//					read:	dgen_read	= rdata_valid (avalon or native mode)
		//					write:	dgen_read	= wdata_req (native mode)
		//										= write_req & mem_local_ready (avalon mode)
		//
		if	(dgen_read && dgen_chipselect) 
		begin	
			if	(sequencer_start_d == 0)	// Start sequencer 
			begin	
				next_sequence_d;
				sequencer_start_d		<=	1;
			end else if	(sequencer_start_d)	
			begin
				case	(rw_type_reg_d)	// For WVR, write sequencer provides r & w for addresses but only write data.
					WRITE:				data_generator_select(step_nwr);	// Write all/Read all (should only update during write all)
					WVR:				data_generator_select(step_wvr);
					default:			data_generator_select(step_nwr);
				endcase
			end		
		end	
	end
end

task	address_sequencer;
	begin
		// To simply, require local_transaction_length / (local_size * 2 * sequencer_burst_length)
		// be an integer.  2 for WVR
		// # memory controller data accesses  = # memory controller address accesses * local_size
		if ((local_size_ctr_a != 1) && (native_mode == 0) && (local_write_req == 1))	// local bursting on write - avalon mode
		begin
			local_size_ctr_a	<=	local_size_ctr_a - 1;
			local_burst_begin	<=	0;
		end else begin
			if	(local_transaction_length_ctr_a == 1)				
			begin
				next_sequence_a;
			end else begin			
				local_size_ctr_a	<=	local_size;
				local_burst_begin	<=	(rw_type_reg_a != NONE);
				address_transaction;
			end			
		end	
	end
endtask

task address_transaction;
	begin
			if	(local_transaction_length_ctr_a != 0) // 0 is forever	
			begin		
				local_transaction_length_ctr_a	<=	local_transaction_length_ctr_a - 1;
			end
			if	((sequencer_burst_length_ctr_a != 1) || (sequencer_burst_length_reg_a == 0)) // set to 0 to disable sequencer bursting
			begin
				sequencer_burst_length_ctr_a	<=	sequencer_burst_length_ctr_a - 1;
				local_addr						<=	next_local_addr_w;			
			end else begin
				sequencer_burst_length_ctr_a	<=	sequencer_burst_length_reg_a;
				case	(rw_type_reg_a)
					WVR:	begin
								case	({local_read_req,local_write_req})
									2'b01:		begin
													local_read_req				<=	1;
													local_write_req				<=	0;
													local_addr					<=	local_address_seq_acc_reg;
												end
									2'b10:		begin
													local_read_req				<=	0;
													local_write_req				<=	1;
													local_addr					<=	next_local_addr_w;
													local_address_seq_acc_reg	<=	next_local_addr_w;
												end	
									default;
								endcase
							end
					default;
				endcase		
			end
		end	
endtask


always	@(address_type_reg_a or local_addr or local_size)
begin
	case	(address_type_reg_a)	
		NONE:		next_local_addr_w	=	local_addr;
		UP_BURST:	next_local_addr_w	=	local_addr + local_size;
		UP_INC:		next_local_addr_w	=	local_addr + 1;	// Use with caution due to bursting
		DOWN_BURST:	next_local_addr_w	=	local_addr - local_size;
		DOWN_DEC:	next_local_addr_w	=	local_addr - 1;	// Use with caution due to bursting
		SHIFT_RT:	next_local_addr_w	=	{1'b0,local_addr[local_addr_width-1:1]};
		SHIFT_LT:	next_local_addr_w	=	{local_addr[local_addr_width-2:0],1'b0};        
		ROTATE_RT:	next_local_addr_w	=	{local_addr[0],local_addr[local_addr_width-1:1]};
		ROTATE_LT:	next_local_addr_w	=	{local_addr[local_addr_width-2:0],local_addr[local_addr_width-1]};   							
		default:	next_local_addr_w	=	local_addr;
	endcase
end


// Next Address Sequence
task	next_sequence_a;
	begin
		update_sequence_a(sequencer_ptr_a,1);
		if	(sequencer_ptr_a == sequencer_ptr_max)
		begin
			sequencer_ptr_a		<=	0;	// Repeat forever				
		end	else begin
			sequencer_ptr_a		<=	sequencer_ptr_a + 1;						
		end		
	end
endtask

task	update_sequence_a;
input	[sequencer_ptr_width-1:0]		sequencer_ptr_a;
input									rw_req;
	begin
		sequencer_burst_length_reg_a	<=	sequencer_burst_length[sequencer_ptr_a];
		sequencer_burst_length_ctr_a	<=	sequencer_burst_length[sequencer_ptr_a];
		local_addr						<=	local_addr_start[sequencer_ptr_a];
		local_address_seq_acc_reg		<=	local_addr_start[sequencer_ptr_a];
		local_size						<=	local_burst_length[sequencer_ptr_a];			
		local_size_ctr_a				<=	local_burst_length[sequencer_ptr_a];
		local_transaction_length_ctr_a	<=	local_transaction_length[sequencer_ptr_a];
		address_type_reg_a				<=	address_type[sequencer_ptr_a];
		rw_type_reg_a					<=	rw_type[sequencer_ptr_a];
		case	(rw_type[sequencer_ptr_a])
			NONE:		begin
							local_read_req		<=	0;
							local_write_req		<=	0;
							local_burst_begin	<=	0;
						end		
			READ:		begin
							local_read_req		<=	rw_req;	// Don't access memory during initialization
							local_write_req		<=	0;
							local_burst_begin	<=	rw_req;
						end
			WVR,WRITE:	begin
							local_read_req		<=	0;
							local_write_req		<=	rw_req;
							local_burst_begin	<=	rw_req;						
						end
			default:	;
		endcase
	end
endtask

task	data_generator_select;
	input	[7:0]	step;
	begin				
		if	((local_transaction_length_ctr_d == step) && (local_size_ctr_d == 1))
		begin
			next_sequence_d;
		end else begin 
			if	(waveform_period != 0) // Pipelined reset indicator
			begin
				if	(waveform_ptr == waveform_period)
				begin
					waveform_ptr	<=	0;
					reset_ptr		<=	1;
				end else begin
					waveform_ptr	<=	waveform_ptr + 1;
					reset_ptr		<=	0;
				end
			end	else begin			// waveform period=0 means not periodic
				reset_ptr	<=	0;
			end
			// # memory controller data accesses  = # memory controller address accesses * local_size
			if (local_size_ctr_d != 1)
			begin
				local_size_ctr_d	<=	local_size_ctr_d - 1;
			end else begin
				local_size_ctr_d	<=	local_size_reg_d;
				if	(local_transaction_length_ctr_d != 0) // 0 is forever
				begin
					local_transaction_length_ctr_d	<=	local_transaction_length_ctr_d - step;
				end
			end	
		end
	end
endtask	

// If d_q_bus_type=1 or the next rw_type is WRITE or WVR,
// increment sequencer by 1, else increment by 2 (skip the NONE or READ)
// Supported write-verify read are WVR, or WRITE Sequence N, READ Sequence N+1
task	next_sequence_d;
	begin
		update_sequence_d(sequencer_ptr_d,sequencer_start_d);
		if	(d_q_bus_type == 1) 
		begin
			if	(sequencer_ptr_d == sequencer_ptr_max)
			begin
				sequencer_ptr_d		<=	0;
				sequencer_complete	<=	1;
			end else begin
				sequencer_ptr_d		<=	sequencer_ptr_d + 1;
			end
		end else begin
			if	(sequencer_ptr_d == sequencer_ptr_max)
			begin
				sequencer_complete	<=	1;
				if	((rw_type[0] == WRITE) || (rw_type[0] == WVR))
				begin
					sequencer_ptr_d		<=	0;
				end else begin
					sequencer_ptr_d		<=	1;
				end 			
			end else begin
				if	((rw_type[sequencer_ptr_d+1] == WRITE) || (rw_type[sequencer_ptr_d+1] == WVR))
				begin
					sequencer_ptr_d	<=	sequencer_ptr_d + 1;
				end else begin
					if (sequencer_ptr_d == sequencer_ptr_max-1)
					begin
						sequencer_ptr_d		<=	0;
						sequencer_complete	<=	1;
					end else begin
						sequencer_ptr_d	<=	sequencer_ptr_d + 2;
					end
				end 
			end
		end
	end
endtask

task	update_sequence_d;
input	[sequencer_ptr_width-1:0]		sequencer_ptr_d;
input									reset_ptr_init_n;
	begin
		local_transaction_length_ctr_d		<=	local_transaction_length[sequencer_ptr_d];		
		local_size_reg_d					<=	local_burst_length[sequencer_ptr_d];	
		local_size_ctr_d					<=	local_burst_length[sequencer_ptr_d];
		rw_type_reg_d						<=	rw_type[sequencer_ptr_d];
		case	(data_type[sequencer_ptr_d])
			PRBS:		{prbs_chipselect,mem_chipselect,math_chipselect}	<=	3'b100;
			MEMORY:		{prbs_chipselect,mem_chipselect,math_chipselect}	<=	3'b010;
			MATH:		{prbs_chipselect,mem_chipselect,math_chipselect}	<=	3'b001;
			default:	;
		endcase
		waveform_select	<=	waveform_selector[sequencer_ptr_d];
		waveform_period	<=	waveform_periodor[sequencer_ptr_d];
		waveform_ptr	<=	0;
		if	(reset_ptr_init_n == 0) // Unneeded - see dgen_init
		begin
			reset_ptr		<=	1; // Startup, initialize PRBS & Math functions
		end else begin             // during dgen_read_pulse
			reset_ptr		<=	(waveform_periodor[sequencer_ptr_d] != 0); 
		end
	end
endtask

	// NIOS Write to Sequencer
	integer	A;
	always	@(posedge nios_clk or negedge nios_reset_n)
	begin
		if	(!nios_reset_n)
		begin   
			for (A=0; A<sequencer_depth; A=A+1)
			begin
				sequencer_burst_length[A]	<=	seq_burst_length_init;
				local_addr_start[A]			<=	0;
				local_burst_length[A]		<=	local_size_max;
				local_transaction_length[A]	<=	transactions_a_max;
				rw_type[A]					<=	rw_type_init;
				address_type[A]				<=	UP_BURST;
				data_type[A]				<=	PRBS;
				waveform_selector[A]		<=	0;
				waveform_periodor[A]		<=	0; // {waveform_ptr_width{1'b1}};	// 0 is non-periodic for math & PRBS
			end			
		end else begin 
			if	(nios_chipselect)
			begin
				if	(nios_write)
				begin
					case	(nios_address[nah:nal])	  // synthesis full_case 
						sequencer_burst_length_addr[nah:nal]:	sequencer_burst_length[nios_address[nal-1:2]]	<=	nios_writedata;
						local_addr_start_addr[nah:nal]:         local_addr_start[nios_address[nal-1:2]]			<=	nios_writedata;
						local_burst_length_addr[nah:nal]:       local_burst_length[nios_address[nal-1:2]]		<=	nios_writedata;
						local_transaction_length_addr[nah:nal]: local_transaction_length[nios_address[nal-1:2]]	<=	nios_writedata;
						rw_type_addr[nah:nal]:                  rw_type[nios_address[nal-1:2]]					<=	nios_writedata;
						address_type_addr[nah:nal]:             address_type[nios_address[nal-1:2]]				<=	nios_writedata;
						data_type_addr[nah:nal]:                data_type[nios_address[nal-1:2]]				<=	nios_writedata;
						waveform_selector_addr[nah:nal]:		waveform_selector[nios_address[nal-1:2]]		<=	nios_writedata;
						waveform_periodor_addr[nah:nal]:		waveform_periodor[nios_address[nal-1:2]]		<=	nios_writedata;
						default;
					endcase				
				end
			end
		end
	end                                        
endmodule       
