

module nios_bts_port_ddr2_x40_top (
	input          		reset_n,
	input				start_pb,
	input				create_error_pb,           				
	input				plls_in_locked,				
	output		    	plls_locked, 
	output				pattern_sync_acquired,
	output				test_complete,
	output				error_latch,
	output				error_irq,
	input				nios_clk,
	input	[nios_map_width-1:0]	nios_address,
  	input	      					nios_chipselect,
  	input	      					nios_read,
  	output	[nios_width-1:0]		nios_readdata,
  	input	      					nios_reset_n,
  	input	      	    			nios_write,
 	input	[nios_width-1:0]		nios_writedata,
	output							nios_waitrequest,
	input	[7:0]					avalon_pb,
	input	[7:0]					avalon_dip,
	output	[7:0]					avalon_led,  
	input							local_clk,
	output	[local_addr_width-1:0] 	local_addr,
	output	[local_be_width-1:0]	local_be,			
	input							local_init_done,
	input	[local_data_width-1:0]	local_rdata,		
	input							local_rdata_valid,	
	input							local_rdvalid_in_n,	
	output							local_read_req,		
	input							local_ready,		
	output	[local_size_width-1:0]	local_size,	
	output							local_burst_begin,		
	output	[local_data_width-1:0]	local_wdata,		
	input							local_wdata_req,	
	output							local_write_req,
	output							local_reset_n	
);                          	
                                                                                          


parameter	mem_widthad_a					=	9;								// Waveform memory address width 
parameter	sequencer_ptr_width				=	5;								// 2^sequencer_ptr_width is the sequencer memory size
parameter	num_seq_regs_log2				=	5;
parameter	waveform_select_width			=	3;								// Use to select math function or waveform
parameter	addrs_per_seq_log2				=	12;	
parameter	sequencer_burst_width			=	8;	
parameter	type_width						=	4;								// Memory bit usage for sequencer types 
parameter	local_data_width_log2       	=	8;   
parameter	nios_width_log2					=	5;
parameter	native_mode						=	0;
parameter	local_size_width				=	1;                             //
parameter	local_size_max					=	1;
parameter	local_addr_width				=	23;                            //
parameter	local_data_width				=	160;                          //
parameter	local_be_width					=	20;                            //
parameter	component_type					=	"DDR2SDRAM";
parameter	nios_width						=	32;
parameter	debounce_prd					=	100000;
parameter	test_length_bts					=	'h800000;			// Number of data_gen_readdata to transmit before asserting testcomplete
parameter	test_complete_ctr_width			=	24;					// > log2(test_length_bts)	  
parameter	io_width						=	160; 				// Width of serial or parallel bus 
parameter	prbs_depth						=	20;					// data_width should be an integer multiple of prbs_depth
parameter	prbs_coeff_param				=	{20{8'h1d}}; 		// Should equal data_width   {16{8'h1d}}; 
parameter	prbs_seed_param					=	160'h01234567_89ABCDEF_10111213_45118917_10111213; 	
parameter	nios_map_width					=	20;         
parameter	addrs_per_reg_log2				=	9; 				// Set to log2(addresses per register in the Avalon Control Interface)
parameter	num_registers_log2				=	8;				// Set to log2(maximum # of registers in the Avalon Control Interface)  
parameter	tec_words					=	1;				// Transaction/Error Counter Nios words
parameter	num_lanes					=	20;				// Typically set to local_be_width
															// Number of error lanes (eg 9 for 72 bit DDR2 with 9 byte lanes)
parameter	ssd_bits					=	8;				// Number of bits per SSD
parameter	num_ssds					=	4;				// Number of Seven Segment Display addresses
parameter	bts_id1						=	1<<addrs_per_reg_log2; // 32'h0000_0001;		// Set lower bits to addres_per_reg
parameter	bts_id2						=	32'h0000_0002;
parameter	bts_id3						=	32'h0000_0003;
parameter	bts_id4						=	32'h0000_0004;
parameter	bts_id5						=	32'hffff_fffc;
parameter	bts_id6						=	32'hffff_fffd;
parameter	bts_id7						=	32'hffff_fffe;
parameter	bts_id8						=	32'hace1_ace2;
parameter	board_id	    			=	"Cyclone III 3C120               ";
parameter	port_id						=	"Bank 7 x16 DDR2 SDRAM           ";
parameter	generic_id					=	"NIOS II Board Test System       ";
parameter	id_words	    			=	8;  
                    
 
defparam	nios_bts_port_core_mem_i.mem_widthad_a				=	mem_widthad_a;					// Waveform memory address width 
defparam	nios_bts_port_core_mem_i.sequencer_ptr_width		=	sequencer_ptr_width;	    	// 2^sequencer_ptr_width is the sequencer memory size
defparam	nios_bts_port_core_mem_i.num_seq_regs_log2			=	num_seq_regs_log2;		
defparam	nios_bts_port_core_mem_i.waveform_select_width		=	waveform_select_width;			// Use to select math function or waveform
defparam	nios_bts_port_core_mem_i.addrs_per_seq_log2			=	addrs_per_seq_log2;
defparam	nios_bts_port_core_mem_i.sequencer_burst_width		=	sequencer_burst_width;	
defparam	nios_bts_port_core_mem_i.type_width					=	type_width;						// Memory bit usage for sequencer types 
defparam	nios_bts_port_core_mem_i.local_data_width_log2     	=	local_data_width_log2;      
defparam	nios_bts_port_core_mem_i.nios_width_log2			=	nios_width_log2;			
defparam	nios_bts_port_core_mem_i.native_mode				=	native_mode;
defparam	nios_bts_port_core_mem_i.local_size_width			=	local_size_width; 
defparam	nios_bts_port_core_mem_i.local_size_max				=	local_size_max; 
defparam	nios_bts_port_core_mem_i.local_addr_width			=	local_addr_width;
defparam	nios_bts_port_core_mem_i.local_data_width			=	local_data_width;
defparam	nios_bts_port_core_mem_i.local_be_width				=	local_be_width;
defparam	nios_bts_port_core_mem_i.component_type				=	component_type				;
defparam	nios_bts_port_core_mem_i.nios_width					=	nios_width					;	
defparam	nios_bts_port_core_mem_i.debounce_prd				=	debounce_prd				;
defparam	nios_bts_port_core_mem_i.test_length_bts			=	test_length_bts				;	
defparam	nios_bts_port_core_mem_i.test_complete_ctr_width	=	test_complete_ctr_width		;	
defparam	nios_bts_port_core_mem_i.io_width					=	io_width					;
defparam	nios_bts_port_core_mem_i.prbs_depth					=	prbs_depth					;	
defparam	nios_bts_port_core_mem_i.prbs_coeff_param			=	prbs_coeff_param			;
defparam	nios_bts_port_core_mem_i.prbs_seed_param			=	prbs_seed_param				;	
defparam	nios_bts_port_core_mem_i.nios_map_width				=	nios_map_width				;	
defparam	nios_bts_port_core_mem_i.addrs_per_reg_log2			=	addrs_per_reg_log2			;	
defparam	nios_bts_port_core_mem_i.num_registers_log2			=	num_registers_log2			;			
defparam	nios_bts_port_core_mem_i.tec_words					=	tec_words					;
defparam	nios_bts_port_core_mem_i.num_lanes					=	num_lanes					;
defparam	nios_bts_port_core_mem_i.ssd_bits					=	ssd_bits					;
defparam	nios_bts_port_core_mem_i.num_ssds					=	num_ssds					;
defparam	nios_bts_port_core_mem_i.bts_id1					=	bts_id1						;	
defparam	nios_bts_port_core_mem_i.bts_id2					=	bts_id2						;	
defparam	nios_bts_port_core_mem_i.bts_id3					=	bts_id3						;	
defparam	nios_bts_port_core_mem_i.bts_id4					=	bts_id4						;	
defparam	nios_bts_port_core_mem_i.bts_id5					=	bts_id5						;	
defparam	nios_bts_port_core_mem_i.bts_id6					=	bts_id6						;	
defparam	nios_bts_port_core_mem_i.bts_id7					=	bts_id7						;	
defparam	nios_bts_port_core_mem_i.bts_id8					=	bts_id8						;	
defparam	nios_bts_port_core_mem_i.board_id	    			=	board_id	    			;
defparam	nios_bts_port_core_mem_i.port_id					=	port_id						;	
defparam	nios_bts_port_core_mem_i.generic_id					=	generic_id					;	
defparam	nios_bts_port_core_mem_i.id_words	    			=	id_words	    			;      
                                                                                     

nios_bts_port_core_mem	nios_bts_port_core_mem_i
(
    .reset_n                            (reset_n                ), 

	.start_pb                           (start_pb               ),
	.create_error_pb           			(create_error_pb        ),

	.plls_in_locked			            (plls_in_locked	        ),  
	.plls_locked                        (plls_locked            ),
	.pattern_sync_acquired              (pattern_sync_acquired  ),
	.test_complete                      (test_complete          ),
	.error_latch                        (error_latch            ),
	.error_irq                          (error_irq              ), 
	.nios_clk	                        (nios_clk	            ),
	.nios_address                       (nios_address           ),
  	.nios_chipselect                    (nios_chipselect        ),
  	.nios_read                          (nios_read              ),
  	.nios_readdata                      (nios_readdata          ),
  	.nios_reset_n                       (nios_reset_n           ),
  	.nios_write                         (nios_write             ),
 	.nios_writedata	                    (nios_writedata	        ),
	.nios_waitrequest					(nios_waitrequest		),
	.avalon_pb                          (avalon_pb              ),
	.avalon_dip                         (avalon_dip             ),
	.avalon_led							(avalon_led				),
	.local_clk							(local_clk				),
	.local_addr                         (local_addr             ),
	.local_be 			                (local_be			    ),
	.local_init_done                    (local_init_done        ),
	.local_rdata 		                (local_rdata		    ),
	.local_rdata_valid 	                (local_rdata_valid	    ),
	.local_rdvalid_in_n 	            (local_rdvalid_in_n	    ),
	.local_read_req 		            (local_read_req		    ),
	.local_ready 		                (local_ready		    ),
	.local_size 			            (local_size			    ),
	.local_burst_begin					(local_burst_begin		),
	.local_wdata		                (local_wdata		    ), 
	.local_wdata_req 	                (local_wdata_req	    ),
	.local_write_req		            (local_write_req		),
	.local_reset_n						(local_reset_n			) 
);  



endmodule