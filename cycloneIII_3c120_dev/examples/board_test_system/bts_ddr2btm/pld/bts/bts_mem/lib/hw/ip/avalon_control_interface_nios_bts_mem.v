/*
Copyright © 2006 Altera Corporation. All rights reserved.  Altera products 
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
-- Title:       avalon_control_interface_nios_bts_mem.v                     --
-- Rev:         Rev 1                                                       --
-- Modified:    April 20, 2007                                             --
-- Author:      David Johnson                                               --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Description: Altera Board Test System II Avalon Control Interface        --
--				BTS Memory Component Control & Status Module                --
--                                                                          --   
-- Module is synchronous with nios_clk.                                     -- 
-- Communications asynchonous with nios_clk must be taken care of via       --
-- appropriate delays and handshakes in hardware and/or NIOS software       --   
------------------------------------------------------------------------------
--                                                                          --
-- Revision History:                                                        --
-- Rev 1 - Original code                                                    --
------------------------------------------------------------------------------
*/  

module	avalon_control_interface_nios_bts_mem
(
	// NIOS II Avalon Interface:                	
	input														nios_reset_n                            ,
	input														nios_clk                                ,
	input														nios_chipselect                         ,
	input														nios_write                              ,
	input														nios_read                               ,
	input		[nios_map_width-1:0]							nios_address                            ,
	input		[nios_width-1:0]								nios_writedata                          ,
	output	reg	[nios_width-1:0]								nios_readdata		                    ,
	output	reg													nios_waitrequest						,
	// External Interface:  									                 
	input														wr_pld_clk								,
	input														rd_pld_clk								,
	output	reg													avalon_reset_n     		                ,  
	input		[7:0]											avalon_pb              			        ,
	input		[7:0]											avalon_dip                              ,
	output	reg	[7:0]											avalon_led                              ,
	output	reg													avalon_start                  			,	
	output	reg													avalon_create_error           			,	
	input														avalon_plls_locked            			,	
	input														avalon_pattern_sync_acquired  			,	
	input														avalon_test_complete          			,	
	input														avalon_error_latch            			,
	input														avalon_data_error						,
	output	reg	[(ssd_bits*num_ssds)-1:0]						aci_ssd									,  
	output	reg													aci_ips									,
	input														aci_pass								,
	output	reg													aci_eirq								,
	output	reg	[data_width-1:0]								aci_prs									,   
	output	reg	[nios_width-1:0]  								aci_prd									,  
	output	reg	[data_width-1:0]								aci_prc									,	
	output	reg	[data_width-1:0]			  					aci_edm									,	
	output	reg	[data_width-1:0]  								aci_sdm									,	
	output	reg	[data_width-1:0]  								aci_cem									,	
	input		[aci_tectr_width-1:0] 							aci_ttc									,	
	input		[aci_tectr_width-1:0] 							aci_rtc									,	
	input		[aci_tectr_width-1:0] 							aci_wec									,	
	input		[lec_width-1:0]									aci_lec									,	
	output	reg	[nios_width-1:0]		  						aci_pfa	
);        
                                                            
	parameter		data_width							=	local_data_width;
	parameter		tec_words							=	2;		// Transaction & Word Error Counter width = nios_width * tec_words
	parameter		num_lanes							=	1;		// serial_channels;	// eg: Set to 9 for 72 bit DDR2 with 9 byte lanes
	parameter		nios_width							=	32;
	parameter		byte_width							=	8;
	parameter		prbs_depth_init						=	byte_width;
	parameter		prbs_seed_init						=	{num_bytes{8'ha5}};
	parameter		prbs_coeff_init						=	{num_bytes{8'h1d}};
	parameter		num_bytes							=	data_width / 8;
	parameter		aci_tectr_width						=	tec_words * nios_width;	// Transaction and Error counter width 
	parameter		lec_width							=	aci_tectr_width * num_lanes;
	parameter		ssd_bits							=	8;
	parameter		num_ssds							=	4;
                                            			
	parameter		bts_id1								=	32'h0000_0000;
	parameter		bts_id2								=	32'h0000_0001;
	parameter		bts_id3								=	32'h0000_0002;
	parameter		bts_id4								=	32'h0000_0003;
	parameter		bts_id5								=	32'hffff_fffc;
	parameter		bts_id6								=	32'hffff_fffd;
	parameter		bts_id7								=	32'hffff_fffe;
	parameter		bts_id8								=	32'hffff_ffff;
	parameter		board_id							=	"Cyclone III F780 Dev Kit        ";
	parameter		port_id								=	"DDR2 Device x72 Memory          ";
	parameter		generic_id							=	"NIOS Board Test System          ";
	parameter		id_words							=	8;  
	
	parameter		mem_widthad_a					    =	1;
	parameter		sequencer_ptr_width				    =	1;
	parameter		waveform_select_width			    =	1;
	parameter		mem_sequencer_base_address_write    =	1;
	parameter		mem_sequencer_base_address_read	    =	1;
	parameter		dgen_memory_base_address_write	    =	1;
	parameter		dgen_memory_base_address_read	    =	1;
	parameter		sequencer_burst_width			    =	1;
	parameter		type_width						    =	1;
	parameter		local_size_width				    =	1;
	parameter		local_size_max						=	1;
	parameter		local_addr_width				    =	1;
	parameter		local_data_width				    =	1;
	parameter		local_be_width					    =	1;
	parameter		component_type					    =	1;
	parameter		addrs_per_seq_log2					=	1;
	
/*   
  BCR - Base Control Register
  PRS – PRBS Seed Register
  PRD – PRBS Depth
  PRC – PRBS Coefficients
  EDM – Error Detector Mask
  SDM – Sync Detector Mask
  CEM – Create Error Mask
  TTC – Transmitter/Write Transaction Counter
  RTC – Receiver/Read Transaction Counter
  WEC – Word Error Counter
  LEC – Lane Error Counter
  BIO – Board I/O
  SSD - Display
  PFA – PLL Frequency Adjust
*/                                                            
	
// Address Map   
	parameter		nios_map_width				= 8;		// Address width
	parameter		addrs_per_reg				= 'h10; 	// Maximum number of byte addresses per reg	
	parameter		addrs_per_reg_log2			= 'h4;	
	parameter		nah							= nios_map_width-1; 
	parameter		nal							= addrs_per_reg_log2;  // In address mux/demux below, to simplify rtl, nal is used as the lower address limit,
																	   // Software must only write to valid addresss for packed registers 

	parameter		bts_id1_a							=	'h00 * addrs_per_reg;
	parameter		bts_id2_a							=	'h01 * addrs_per_reg;
	parameter		bts_id3_a							=	'h02 * addrs_per_reg;
	parameter		bts_id4_a							=	'h03 * addrs_per_reg;
	parameter		bts_id5_a							=	'h04 * addrs_per_reg;
	parameter		bts_id6_a							=	'h05 * addrs_per_reg;
	parameter		bts_id7_a							=	'h06 * addrs_per_reg;
	parameter		bts_id8_a							=	'h07 * addrs_per_reg;
	parameter		board_id_a							=	'h08 * addrs_per_reg;
	parameter		port_id_a							=	'h09 * addrs_per_reg;
	parameter		generic_id_a						=	'h0A * addrs_per_reg;
	parameter		addrs_per_reg_a						=	'h0B * addrs_per_reg;	 
	parameter		id_words_a							=	'h0C * addrs_per_reg; 
	parameter	 	num_lanes_a           				=	'h11 * addrs_per_reg;
	parameter		tec_words_a           				=	'h12 * addrs_per_reg;
	parameter		num_ssds_a            				=	'h13 * addrs_per_reg;
	parameter		ssd_bits_a            				=	'h14 * addrs_per_reg;
	parameter		bcr_a								=	'h15 * addrs_per_reg;                                                                  
	parameter		prs_a								=	'h16 * addrs_per_reg;         
	parameter		prd_a								=	'h17 * addrs_per_reg;
	parameter		prc_a								=	'h18 * addrs_per_reg;
	parameter		edm_a								=	'h19 * addrs_per_reg;
	parameter		sdm_a								=	'h1A * addrs_per_reg;
	parameter		cem_a								=	'h1B * addrs_per_reg;   
	parameter		ttc_a								=	'h1E * addrs_per_reg;
	parameter		rtc_a								=	'h1F * addrs_per_reg;   
	parameter		wec_a								=	'h20 * addrs_per_reg;
	parameter		lec_a								=	'h21 * addrs_per_reg; 
	parameter		bio_a								=	'h22 * addrs_per_reg;
	parameter		ssd_a								=	'h23 * addrs_per_reg;
	parameter		pfa_a								=	'h24 * addrs_per_reg;        
  // Parameters related to the memory component    
	parameter		mem_widthad_a_a					    =	'h40 * addrs_per_reg;
	parameter		sequencer_ptr_width_a				=	'h41 * addrs_per_reg;
	parameter		waveform_select_width_a			    =	'h42 * addrs_per_reg;
	parameter		mem_sequencer_base_address_write_a  =	'h43 * addrs_per_reg;
	parameter		mem_sequencer_base_address_read_a	=	'h44 * addrs_per_reg;
	parameter		dgen_memory_base_address_write_a	=	'h45 * addrs_per_reg;
	parameter		dgen_memory_base_address_read_a	    =	'h46 * addrs_per_reg;
	parameter		sequencer_burst_width_a			    =	'h47 * addrs_per_reg;
	parameter		type_width_a						=	'h48 * addrs_per_reg;
	parameter		local_size_width_a				    =	'h49 * addrs_per_reg;
	parameter		local_addr_width_a				    =	'h4A * addrs_per_reg;
	parameter		local_data_width_a				    =	'h4B * addrs_per_reg;
	parameter		local_be_width_a					=	'h4C * addrs_per_reg;
	parameter		component_type_a					=	'h4D * addrs_per_reg;
	parameter		addrs_per_seq_log2_a				=	'h4E * addrs_per_reg;
	parameter		local_size_max_a					=	'h4F * addrs_per_reg;
	
	parameter		last_a								=	{nios_map_width{1'b1}};	// Slaves use word addresses {{nios_map_width-2{1'b1}},2'b00};
// Internal data structures 
	reg										nios_waitrequest1;		// For crossing clock domains
	reg										nios_waitrequest2;		// For crossing clock domains
	reg										nios_waitrequest_rd;	// For read
	reg				[aci_tectr_width-1:0] 	aci_ttc_tc;	
	reg				[aci_tectr_width-1:0] 	aci_rtc_rc;	
	reg				[aci_tectr_width-1:0] 	aci_wec_rc;	
	reg				[lec_width-1:0]			aci_lec_rc;	
	reg										aci_eirq_wr_set;
	reg										aci_eirq_rd_clr;
	wire									aci_eirq_sync;
// Pointer for HDL
	integer									ptr;                                                        
  
	// NIOS read or write accesses to packed addresses should me made to valid address locations only 

	// All signals below are either pseudo-static, asynchonous resets, have metastabilizers inside the bts hdl,
	// or tsu/th is controlled by software.  No SOPC builder clock crossing hardware is required.
	// OK to place this on the nios_clk domain.
	always	@(posedge nios_clk or negedge nios_reset_n)
	begin
		if	(!nios_reset_n)
		begin   
			// Status & Control:
			avalon_reset_n			    <=	1'b1;
			avalon_start                <=	1'b0;
			avalon_create_error         <=	1'b0;                                 
			avalon_led					<=	8'b1111_1111;
			aci_prs                     <=	prbs_seed_init;
			aci_prd                     <=	prbs_depth_init;
			aci_prc                     <=	prbs_coeff_init;
			aci_edm                     <=	0;
			aci_sdm                     <=	0;
			aci_cem                     <=	{data_width{1'b1}};
			aci_pfa						<=	0;
			aci_ssd						<=	0;
			aci_ips						<=	0;
			nios_readdata				<=	0;	
			nios_waitrequest1			<=	0;
			nios_waitrequest2			<=	0;
			nios_waitrequest_rd			<=	1;			
		end else begin 
			if	(nios_chipselect)
			begin
				if	(nios_write)
				begin
					case	(nios_address[nah:nal])	  // synthesis full_case 
						bcr_a[nah:nal]:					begin // These signals are asynchonous resets or have metastability synchonizers inside the BTS hardware (no clock domain crossing circuitry required by NIOS)        
													avalon_reset_n					<=	nios_writedata[0];    	                                                                    
													avalon_start            		<=	nios_writedata[3]; 	
													avalon_create_error     		<=	nios_writedata[4]; 	
													aci_ips							<=	nios_writedata[9];
												end  
						prs_a[nah:nal]:					begin
													nios_write_packed_reg(aci_prs);
												end
						prd_a[nah:nal]:					begin
													aci_prd	<=	nios_writedata;	
												end
						prc_a[nah:nal]:					begin
													nios_write_packed_reg(aci_prc);
												end	
						edm_a[nah:nal]:					begin
													nios_write_packed_reg(aci_edm);
												end	
						sdm_a[nah:nal]:					begin
													nios_write_packed_reg(aci_sdm);
												end	
						cem_a[nah:nal]:					begin
													nios_write_packed_reg(aci_cem);
												end
						pfa_a[nah:nal]:					begin
													aci_pfa	<=	nios_writedata;	
												end	
                                                                                                    
 						bio_a[nah:nal]:					begin
 													avalon_led						<=	nios_writedata[23:16];  						
												end 
						ssd_a[nah:nal]:					begin
													for	(ptr=0; ptr<ssd_bits; ptr=ptr+1)     
														aci_ssd[(nios_address[nal-1:2]*ssd_bits) + ptr]	<=	nios_writedata[ptr];
												end                                                                                                                                         
						default:	      				;
					endcase
					nios_waitrequest_rd	<=	1;					
				end else if	(nios_read) begin
					case	(nios_address[nah:nal])     // synthesis full_case                
						bts_id1_a[nah:nal]:				begin   
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id1;  
												end
						bts_id2_a[nah:nal]:				begin 
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id2; 
												end
						bts_id3_a[nah:nal]:				begin
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id3;   
												end
						bts_id4_a[nah:nal]:				begin 
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id4;  
												end
						bts_id5_a[nah:nal]:				begin
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id5;
												end
						bts_id6_a[nah:nal]:				begin  
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id6; 
												end
						bts_id7_a[nah:nal]:				begin 
													nios_waitstate_read;
													nios_readdata	              		<=	bts_id7;
												end
						bts_id8_a[nah:nal]:				begin   
													nios_waitstate_read;
													nios_readdata		          	<=	bts_id8;      
												end
						board_id_a[nah:nal]:			    	begin  
													nios_waitstate_read;
													for	(ptr=0; ptr<nios_width; ptr=ptr+1)
														nios_readdata[ptr]		<=		board_id[(nios_address[nal-1:2]*nios_width) + ptr];
												end
						port_id_a[nah:nal]:				begin  
													nios_waitstate_read;
								                           		for	(ptr=0; ptr<nios_width; ptr=ptr+1)
								                           			nios_readdata[ptr]		<=		port_id[(nios_address[nal-1:2]*nios_width) + ptr];
								                           	end
						generic_id_a[nah:nal]:			   	begin  
													nios_waitstate_read;
								                           		for	(ptr=0; ptr<nios_width; ptr=ptr+1)
								                           			nios_readdata[ptr]		<=		generic_id[(nios_address[nal-1:2]*nios_width) + ptr];
								                           	end  
						component_type_a[nah:nal]:		   	begin  
													nios_waitstate_read;
						                                                	for	(ptr=0; ptr<nios_width; ptr=ptr+1)
						                                                		nios_readdata[ptr]		<=		component_type[(nios_address[nal-1:2]*nios_width) + ptr];
												end  
						addrs_per_reg_a[nah:nal]:			begin  
													nios_waitstate_read;
													nios_readdata		        <=	   addrs_per_reg;
												end
						addrs_per_seq_log2_a[nah:nal]:			begin   
													nios_waitstate_read;
													nios_readdata		        <=	   addrs_per_seq_log2;  
												end
						id_words_a[nah:nal]:				begin  
													nios_waitstate_read;
													nios_readdata	                <=	   id_words;	
												end
 						num_lanes_a[nah:nal]:           		begin   
													nios_waitstate_read;
													nios_readdata	                <=	   num_lanes; 
												end
						tec_words_a[nah:nal]:           		begin    
													nios_waitstate_read;
													nios_readdata	                <=	   tec_words;  
												end
						num_ssds_a[nah:nal]:            		begin      
													nios_waitstate_read;
													nios_readdata	                <=	   num_ssds;  
												end
						ssd_bits_a[nah:nal]:            		begin    
													nios_waitstate_read;
													nios_readdata	                <=	   ssd_bits;	
												end
						mem_widthad_a_a[nah:nal]:                       begin    
													nios_waitstate_read;
													nios_readdata	                <=	   mem_widthad_a; 
												end
						sequencer_ptr_width_a[nah:nal]:                 begin    
													nios_waitstate_read;
													nios_readdata	                <=	   sequencer_ptr_width;            
												end
						waveform_select_width_a[nah:nal]:               begin   
													nios_waitstate_read;
													nios_readdata	                <=	   waveform_select_width;       
												end
						mem_sequencer_base_address_write_a[nah:nal]:    begin    
													nios_waitstate_read;
													nios_readdata	                <=	   mem_sequencer_base_address_write; 
												end
						mem_sequencer_base_address_read_a[nah:nal]:     begin    
													nios_waitstate_read;
													nios_readdata	                <=	   mem_sequencer_base_address_read;   
												end
						dgen_memory_base_address_write_a[nah:nal]:      begin        
													nios_waitstate_read;
													nios_readdata	                <=	   dgen_memory_base_address_write;
												end
						dgen_memory_base_address_read_a[nah:nal]:       begin      
													nios_waitstate_read;
													nios_readdata	                <=	   dgen_memory_base_address_read;
												end
						sequencer_burst_width_a[nah:nal]:               begin        
													nios_waitstate_read;
													nios_readdata	                <=	   sequencer_burst_width;      
												end                                                                   
						type_width_a[nah:nal]:                          begin      
													nios_waitstate_read;
													nios_readdata	                <=	   type_width;
												end
						local_size_width_a[nah:nal]:                    begin   
													nios_waitstate_read;
													nios_readdata	                <=	   local_size_width;  
												end
						local_size_max_a[nah:nal]:                    	begin      
													nios_waitstate_read;
													nios_readdata	                <=	   local_size_max;  
												end
						local_addr_width_a[nah:nal]:                    begin     
													nios_waitstate_read;
													nios_readdata	                <=	   local_addr_width;    
												end
						local_data_width_a[nah:nal]:                    begin   
													nios_waitstate_read;
													nios_readdata	                <=	   local_data_width;
												end
						local_be_width_a[nah:nal]:                      begin     
													nios_waitstate_read;
													nios_readdata	                <=	   local_be_width;  
												end
						bcr_a[nah:nal]:					begin     
													nios_waitstate_read;
													nios_readdata[0]                <=	avalon_reset_n					;	
													nios_readdata[1]                <=	0; // avalon_en_cdet					;	
													nios_readdata[2]                <=	0; // avalon_channel_bond   			;	
													nios_readdata[3]                <=	avalon_start            		;
													nios_readdata[4]                <=	avalon_create_error				;            
													nios_readdata[5]		<=	0; // avalon_dprio_read				;
													nios_readdata[6]		<=	0; // avalon_dprio_write_all			;
													nios_readdata[7]		<=	0; // avalon_dprio_busy               ;
													nios_readdata[8]		<=	0; // avalon_dprio_data_valid      	;
													nios_readdata[9]		<=	aci_ips							;																			
													nios_readdata[22]		<=	0; // aci_cls							;  // Placeholder for future as an interrupt
													nios_readdata[23]		<=	0; // aci_cla							;
													nios_readdata[24]		<=	0; // aci_pllr						;
													nios_readdata[25]		<=	0; // aci_pllt						;
													nios_readdata[26]               <=	avalon_plls_locked          	;
													nios_readdata[27]               <=	avalon_pattern_sync_acquired	;
													nios_readdata[28]               <=	avalon_test_complete        	;
													nios_readdata[29]               <=	avalon_error_latch          	; 
													nios_readdata[31]		<=	aci_pass						;
													nios_readdata[30]		<=	aci_eirq_sync					;	
													nios_readdata[21:10]		<=	0								;
												end
						prs_a[nah:nal]:					begin  
													nios_waitstate_read;
													nios_read_packed_reg(aci_prs);
												end
						prd_a[nah:nal]:					begin  
													nios_waitstate_read;
													nios_readdata			<=	aci_prd;	
												end
						prc_a[nah:nal]:					begin   
													nios_waitstate_read;
													nios_read_packed_reg(aci_prc);
												end	
						edm_a[nah:nal]:					begin   
													nios_waitstate_read;
													nios_read_packed_reg(aci_edm);
												end	
						sdm_a[nah:nal]:					begin    
													nios_waitstate_read;
													nios_read_packed_reg(aci_sdm);
												end	
						cem_a[nah:nal]:					begin      
													nios_waitstate_read;
													nios_read_packed_reg(aci_cem);
												end		
						pfa_a[nah:nal]:					begin    
													nios_waitstate_read;
													nios_readdata			<=	aci_pfa;	
												end															
						bio_a[nah:nal]:					begin    
													nios_waitstate_read;
													nios_readdata[ 7: 0]	<=	avalon_pb;	
													nios_readdata[15: 8]    <=	avalon_dip;
													nios_readdata[23:16]	<=	avalon_led; 
													nios_readdata[31:24]	<=	8'b0000_0000;
												end
						ssd_a[nah:nal]:					begin    
													nios_waitstate_read;
													for	(ptr=0; ptr<ssd_bits; ptr=ptr+1)
														nios_readdata[ptr]	<=	aci_ssd[(nios_address[nal-1:2]*ssd_bits) + ptr];
													nios_readdata[nios_width-1:ssd_bits] <= 0;	// Pad upper bits with 0
												end	
						ttc_a[nah:nal]:					begin    
													if	(nios_waitrequest_tc2nc)
													begin  
														nios_waitrequest1	<=	0;
														for	(ptr=0; ptr<nios_width; ptr=ptr+1)
															nios_readdata[ptr]	<=	aci_ttc_tc[(nios_address[nal-1:2]*nios_width) + ptr];    
													end else begin  
														nios_waitrequest1	<=	1;																
													end
													nios_waitrequest2		<=	nios_waitrequest1;	// Add 1 nios clock to read the data before releasing
												end
						rtc_a[nah:nal]:					begin   
													if	(nios_waitrequest_rc2nc)
													begin
														nios_waitrequest1	<=	0;		
 														for	(ptr=0; ptr<nios_width; ptr=ptr+1)
															nios_readdata[ptr]	<=	aci_rtc_rc[(nios_address[nal-1:2]*nios_width) + ptr]; 																	
													end else begin
														nios_waitrequest1	<=	1; 
													end 
													nios_waitrequest2		<=	nios_waitrequest1;	// Add 1 nios clock to read the data before releasing
												end
						wec_a[nah:nal]:					begin  
													if	(nios_waitrequest_rc2nc)
													begin     																		
														nios_waitrequest1	<=	0;   
														for	(ptr=0; ptr<nios_width; ptr=ptr+1)
															nios_readdata[ptr]	<=	aci_wec_rc[(nios_address[nal-1:2]*nios_width) + ptr]; 																	
													end else begin 
														nios_waitrequest1	<=	1; 																
													end 
													nios_waitrequest2		<=	nios_waitrequest1;	// Add 1 nios clock to read the data before releasing
												end	
						lec_a[nah:nal]:					begin
													if	(nios_waitrequest_rc2nc)
													begin	
														nios_waitrequest1	<=	0;  
														for	(ptr=0; ptr<nios_width; ptr=ptr+1)
															nios_readdata[ptr]	<=	aci_lec_rc[(nios_address[nal-1:2]*nios_width) + ptr];																	
													end else begin  
														nios_waitrequest1	<=	1;  																
													end 
													nios_waitrequest2		<=	nios_waitrequest1;	// Add 1 nios clock to read the data before releasing
												end   
						last_a:						begin	// Make SOPC Builder create the full address range  
													nios_waitstate_read;
													nios_readdata	<=	~nios_writedata;
												end 
						default:			               	begin             
													nios_waitstate_read;
													nios_readdata	<=	0;
												end
					endcase
				end else begin
					nios_waitrequest_rd	<=	1;
				end  
			end else begin
				nios_waitrequest_rd	<=	1;
			end 
		end
	end         
	
	task	nios_waitstate_read;
		begin   
			if	(nios_waitrequest_rd)
			begin
				nios_waitrequest_rd	<=	0;	
			end else begin
				nios_waitrequest_rd	<=	1;
			end
		end
	endtask    	
	
	task	nios_write_packed_reg;
		output	[data_width-1:0]	aci_write_reg;
		begin
			for	(ptr=0; ptr<nios_width; ptr=ptr+1) // lower 2 bits ignored, since 32 bit nios word addressing  
			begin
				if	(((nios_address[nal-1:2]*nios_width) + ptr) < data_width) 				// May not pack evenly, don't write the unused  bits  
				begin                                                 				 				// (eg 17 LVDS * 8 = 136 bits, requires 5 NIOS write (160 bits), 24 bits don't exist   
					aci_write_reg[(nios_address[nal-1:2]*nios_width) + ptr]	<=	nios_writedata[ptr];
				end
			end	
		end    
	endtask  
	
	task	nios_read_packed_reg;
		input	[data_width-1:0]	aci_read_reg;
		begin
			for	(ptr=0; ptr<nios_width; ptr=ptr+1) // lower 2 bits ignored, since 32 bit nios word addressing  
			begin
				if	(((nios_address[nal-1:2]*nios_width) + ptr) < data_width) 				// May not pack evenly, don't write the unused  bits  
				begin                                                 				 				// (eg 17 LVDS * 8 = 136 bits, requires 5 NIOS write (160 bits), 24 bits don't exist   
					nios_readdata[ptr]	<=	aci_read_reg[(nios_address[nal-1:2]*nios_width) + ptr];
				end else begin
					nios_readdata[ptr]	<=	1'b0;
				end
			end
		end
	endtask	
	
	// Waitstate Controller for reads crossing rx_pld_clk to nios_clk clock domains 
	always	@(*)
	begin
		if	(nios_read && nios_chipselect)
		begin
			case	(nios_address[nah:nal])
				rtc_a[nah:nal]:     nios_waitrequest	=	!((!nios_waitrequest1) && nios_waitrequest2);
				wec_a[nah:nal]:     nios_waitrequest	=	!((!nios_waitrequest1) && nios_waitrequest2);
				lec_a[nah:nal]:     nios_waitrequest	=	!((!nios_waitrequest1) && nios_waitrequest2);
				ttc_a[nah:nal]:		nios_waitrequest	=	!((!nios_waitrequest1) && nios_waitrequest2);
				default:			nios_waitrequest	=	nios_waitrequest_rd;
			endcase
		end else begin
			nios_waitrequest	=	0;
		end
	end
		
           
	// Read operation clock crossing between pld_clk & nios_clk domains       
	// 1) On read assert nios_waitrequest1
	// 2) After 1 nios clock plus nc2tc/rc synchronizer pld_clks , freeze pld_clk domain data
	// 3) After tc/rc2nc nios_clks, deassert nios_waitrequest1.
	//	  The delay in Step 3 determines tSU = the # nios clocks determined by the tc/rc2nc synchronizer depth
	// 4) After 1 nios clock plus nc2tc/rc pld_clks, start updating pld_clk domain data.
	// 	  The delay in Step 4 determins tHOLD = 1 nios clock + the # pld clocks determined by the nc2tc/rc synchronizer depth

	// 1st parameter is synchonizer depth, 2nd parameter is preset value) 
	synchronizer	#(4,0)		synchonizer_waitrequest_nc2tc	(.reset_n(nios_reset_n),.clk(wr_pld_clk),.data_in(nios_waitrequest2),.data_out(nios_waitrequest_nc2tc));
    synchronizer	#(4,0)		synchonizer_waitrequest_tc2nc	(.reset_n(nios_reset_n),.clk(nios_clk),.data_in(nios_waitrequest_nc2tc),.data_out(nios_waitrequest_tc2nc));
	// wr_pld_clk clock domain - SOPC Builder will add automatically clock crossing domain circuitry.
	always	@(posedge wr_pld_clk or negedge nios_reset_n)
	begin
		if	(!nios_reset_n)
		begin    
			aci_ttc_tc	<=	0;
		end else begin  
			if	(!nios_waitrequest_nc2tc)
			begin
				aci_ttc_tc	<=	aci_ttc;  
			end
		end
	end    
                                                	
 	// tc2nc - delay in deasserting waitrequest 
	// 1st parameter is synchonizer depth, 2nd parameter is preset value) 
	synchronizer	#(4,0)		synchonizer_waitrequest_nc2rc	(.reset_n(nios_reset_n),.clk(rd_pld_clk),.data_in(nios_waitrequest2),.data_out(nios_waitrequest_nc2rc));
	synchronizer	#(4,0)		synchonizer_waitrequest_rc2nc	(.reset_n(nios_reset_n),.clk(nios_clk),.data_in(nios_waitrequest_nc2rc),.data_out(nios_waitrequest_rc2nc));	
	// rd_pld_clk clock domain - SOPC Builder will add automatically clock crossing domain circuitry.
	always	@(posedge rd_pld_clk or negedge nios_reset_n)
	begin
		if	(!nios_reset_n)
		begin    
			aci_rtc_rc	<=	0;
			aci_wec_rc	<=	0;
			aci_lec_rc	<=	0;
		end else begin  
			if	(!nios_waitrequest_nc2rc)
			begin
				aci_rtc_rc	<=	aci_rtc;
				aci_wec_rc	<=	aci_wec;  
				aci_lec_rc	<=	aci_lec;  
				
			end
		end
	end    

	
	// Error IRQ Interrupts:	
	synchronizer	#(4,0)		synchonizer_eirq	(.reset_n(nios_reset_n),.clk(nios_clk),.data_in(aci_eirq),.data_out(aci_eirq_sync));

	// Error Interrupts:
     
	always	@(negedge nios_reset_n or posedge avalon_data_error or posedge aci_eirq_wr_set or posedge aci_eirq_rd_clr)
	begin
		if	(!nios_reset_n)
		begin
			aci_eirq	<=	0;
		end else if (avalon_data_error)
		begin
			aci_eirq	<=	1;
		end else if (aci_eirq_wr_set)
		begin
			aci_eirq	<=	1;
		end else if (aci_eirq_rd_clr)
		begin
			aci_eirq	<=	0;
		end
	end

// The read & write must mimic the conditions above for this register bit
// A data error or writing a "1" to EIRQ bit to sets aci_eirq
// Reading the BCR with EIRQ set automatically clears aci_eriq, unless the attempted clear
// occurs coincident with another data error.
	always	@(posedge nios_clk or negedge nios_reset_n)
	begin
		if	(!nios_reset_n)
		begin   
			aci_eirq_wr_set				<=	0;	
			aci_eirq_rd_clr				<=	0;	
		end else begin 
			case	(
						{ (nios_chipselect && nios_write && (nios_address[nah:nal] == bcr_a[nah:nal])),
						  (nios_chipselect && nios_read  && (nios_address[nah:nal] == bcr_a[nah:nal]))}
					)	   
				2'b10:		begin	// Write
								if	(nios_writedata[30])
								begin
									aci_eirq_wr_set		<=	1;	// Allow NIOS to set the error interrupt
									aci_eirq_rd_clr		<=	0;
								end else begin
									aci_eirq_wr_set		<=	0;
									aci_eirq_rd_clr		<=	0;
								end	
							end
				2'b01:		begin	// Read
								aci_eirq_wr_set			<=	0;			
								if	(aci_eirq_sync)	// Meta-stabilized version of aci_eirq
								begin
									aci_eirq_rd_clr		<=	1; // If error interrupt is set, reading EIRQ bit of BCR clears it
								end
							end
				default:	begin
								aci_eirq_wr_set			<=	0;	
								aci_eirq_rd_clr			<=	0;			
							end
			endcase
		end
	end  
                                                                             
 
endmodule       
