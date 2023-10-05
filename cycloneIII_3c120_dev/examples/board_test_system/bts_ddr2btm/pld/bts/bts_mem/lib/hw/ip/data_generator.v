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
-- Title:       data_generator.v                                            --
-- Rev:         Rev 1                                                       --
-- Modified:    April 3, 2007                                               --
-- Author:      David Johnson                                               --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Description: Altera Board Test System II Data Generator                  --
------------------------------------------------------------------------------
--                                                                          --
-- Revision History:                                                        --
-- Rev 1 - Original code                                                    --
------------------------------------------------------------------------------
*/  
module	data_generator	(
							// NIOS Control Interface
							input										nios_clk,
							input	[nios_mem_addr_width-1:0]			nios_address,    		// For multiple interfaces, add bits for address decoder to select the avalon slave
  							input	      								nios_chipselect,
  							input	      								nios_read,
  							output	[nios_width-1:0]					nios_readdata,
  							input	      								nios_reset_n,
  							input	      	    		    			nios_write,
 							input	[nios_width-1:0]					nios_writedata,
							// Full Speed Data Generator Interface
							input										dgen_reset_n,  
							input										dgen_clk,
							input										prbs_chipselect,
							input										mem_chipselect,
							input	[waveform_select_width-1:0]			waveform_select,
							input										reset_ptr,
							input	[waveform_ptr_width-1:0]			waveform_ptr,
							input										math_chipselect,
							input										dgen_read,                                                                                                                                                        
							input										dgen_address,     // Needed to look like an Avalon bus        
							output	reg	[data_width-1:0]				dgen_readdata, 
							output	reg	[aci_tectr_width-1:0]			dgen_transaction_ctr,
							input	[data_width-1:0]					prbs_coeff,
							input	[data_width-1:0]					prbs_seed,
							input										create_error,
							input	[data_width-1:0]					aci_cem,
							output										dgen_data_req							
						);
   
						
/*
// Some LFSR Polynomial Coefficients   
parameter	prbs_coeff2		=	2'b11;
parameter	prbs_coeff3		=	3'b011;
parameter	prbs_coeff4		=	4'b0011;
parameter	prbs_coeff5		=	5'b00101;
parameter	prbs_coeff6		=	6'b000011;
parameter	prbs_coeff7		=	7'b0000011;
parameter	prbs_coeff8		=	8'h1d;
parameter	prbs_coeff16	=	16'h100b;
parameter	prbs_coeff32	=	32'hc000_0401;
parameter	prbs_coeff128	=	128'h0000_0000_0000_0000_0000_0000_2800_0005;
*/						

// Will create data_width/prbs_depth prbs generators
parameter	data_width					=	144;
parameter	data_width_log2				=	8;	// ceil(log2(data_width+1)) (+1 for auto concatenate function)
parameter	nios_width					=	32;	// Nios data width
parameter	nios_width_log2				=	5; 
parameter	prbs_depth					=	32;		// Use parameter to														// fix prbs structure      
parameter	tec_words					=	2;      // # of NIO Words for tranaction and error counters
parameter	mem_widthad_a 				= 	9;		// Depth of the dualport ram
parameter	waveform_select_width		=	3;		// 
parameter	lane_width					=	8;		// Use for math function
// Fixed or calculated:
parameter	math_lanes					=	data_width / math_width;
parameter	math_width					=	lane_width; // For QDRII, this could be 9 (byte + parity bit)
parameter	byte_width					=	8;
parameter	byte_width_log2				=	3;
parameter	nios_bytes					=	nios_width / byte_width;
parameter	nios_bytes_log2				=	nios_width_log2 - byte_width_log2;
parameter	byte_lanes					=	data_width / byte_width;
parameter	nios_mem_addr_width			=	mem_widthad_a + data_width_log2 - nios_width_log2 + 2; // eg 9 bits to access 512 deep memory, 3 bits to access 144 bit data bus = 12 then +2 for word access 			                                  
parameter	aci_tectr_width				=	tec_words * nios_width;	// Transaction and Error counter width 
parameter	waveform_ptr_width			=	mem_widthad_a - waveform_select_width; // Pointer for selected waveform   
parameter	reset_recovery_ctr_width	=	6;		// Surpress filling FIFO until after reset asserts
parameter	reset_recovery_ctr_max		=	{reset_recovery_ctr_width{1'b1}};
parameter	dgen_read_pulse_width		=	2;	// Pulse Width (Compensates for pipeline depth)
parameter	dgen_read_pulse_on			=	reset_recovery_ctr_max - dgen_read_pulse_width - 1;
parameter	dgen_read_pulse_off			=	reset_recovery_ctr_max - 1;
	
		
wire	[data_width-1:0]			mem_readdata;					
// Internal data structures: 
reg		[data_width-1:0]			prbs_sr; 
reg		[math_width-1:0]			math_ctr;                                
reg		[data_width-1:0]			create_error_bits;  
reg									prbs_chipselect1;
reg									mem_chipselect1;
reg									math_chipselect1;
reg	[reset_recovery_ctr_width-1:0]	reset_recovery_ctr;
reg									dgen_read_pulse;

assign	dgen_data_req	= dgen_read || dgen_read_pulse;

assign	nios_readdata		=	0;

	always	@(posedge dgen_clk or negedge dgen_reset_n)
	begin
		if	(!dgen_reset_n)
		begin
			dgen_init;
			create_error_bits	<=	0;
		end else begin 
			if	(create_error)
			begin
				create_error_bits	<=	aci_cem;
			end else if (dgen_data_req)
			begin
				create_error_bits	<=	0;
			end
			if	(dgen_data_req)
			begin
				case	({prbs_chipselect,math_chipselect})
					2'b10:		begin	
									if	(reset_ptr)
									begin
										prbs_sr					<=	prbs_seed;	// Control PRBS Period 
									end else begin // Update (datawidth / prbs_depth) lfsr's
										build_prbs(prbs_coeff);
									end
								end			
					2'b01:		begin
									if	(reset_ptr)
									begin
										math_ctr				<=	0;
									end else begin
										math_ctr				<=	math_ctr + 1;
									end
								end	
					default:	;		
				endcase
				case	({prbs_chipselect1,mem_chipselect1,math_chipselect1})
					3'b100:		dgen_readdata	<=	prbs_sr ^ create_error_bits;			
					3'b010:		dgen_readdata	<=	mem_readdata ^ create_error_bits;
					3'b001:		dgen_readdata	<=	({math_lanes{(math_ctr ^ waveform_select)}}) ^ create_error_bits;							
					default:	;
				endcase
				prbs_chipselect1	<=	prbs_chipselect;
				mem_chipselect1		<=	mem_chipselect;			
				math_chipselect1	<=	math_chipselect;
				//if	((dgen_transaction_ctr != {aci_tectr_width{1'b1}}) && dgen_read) // Don't rollover + don't increment during dgen_read_pulse (init queue up)
				if	(dgen_read)
				begin 
					dgen_transaction_ctr 		<=	dgen_transaction_ctr + 1;
				end					
			end	 
			if	(reset_recovery_ctr != reset_recovery_ctr_max)
			begin
				case	(reset_recovery_ctr)
					dgen_read_pulse_on:		dgen_read_pulse	<=	1;
					dgen_read_pulse_off:	dgen_read_pulse	<=	0;
					default:	;
				endcase
				reset_recovery_ctr	<=	reset_recovery_ctr + 1;				
			end	
		end
	end
	
	// Initialization:
	task	dgen_init;
		begin
			prbs_sr							<=	prbs_seed;	// PRBS Init
			dgen_transaction_ctr			<=	0; 										
			math_ctr						<=	0;
			prbs_chipselect1				<=	0;
			mem_chipselect1					<=	0;			
			math_chipselect1				<=	0;	
			reset_recovery_ctr				<=	0;	
			dgen_readdata					<=	0;	// Can initialize memory during reset
			dgen_read_pulse					<=	0;	// if address sequencer is running
		end
	endtask

	// PRBS Genenerators (Concatenated)
	integer		A;	// structure to build concatenated PRBS generators
	integer		B;
	task	build_prbs;
	input	[data_width-1:0]			prbs_coeff;
	
		begin
			prbs_sr[0]	<=	0	^	(prbs_sr[prbs_depth-1] & prbs_coeff[0]); // coeff[0] must be 1
			B	=	prbs_depth;
			for	(A=1; A<=data_width-1; A=A+1)
			begin
				if	(A % prbs_depth == 0)
				//if	(prbs_fb_mask[A] == 1)
				begin
					prbs_sr[A]	<=	0	^	(prbs_sr[A+prbs_depth-1] & prbs_coeff[A]); // coeff[0] must be 1
					B			=	B	+	prbs_depth;
				end else begin
					prbs_sr[A]	<=	prbs_sr[A-1] ^ (prbs_sr[B-1] & prbs_coeff[A]);
				end
			end
		end        
	endtask 


		// Can update waveform memory at the full bandwidth on the write side.  Currently
		// for NIOS writes, the follwoing replicates data on the NIOS data bus
		// and assert the respective 4 "we" signals.
		
	generate
		genvar	Z;
		for	(Z=0; Z<byte_lanes; Z=Z+1)
		begin	:	dualport_ram
			defparam	dualport_ram_scalable_i.data_width		=	8;
			defparam	dualport_ram_scalable_i.addr_width		=	mem_widthad_a;	
			dualport_ram_scalable	dualport_ram_scalable_i
			(
				.q			(mem_readdata[((Z+1)*8)-1:(Z*8)]),
				.addr_in	(nios_address[mem_widthad_a-1+nios_bytes_log2:nios_bytes_log2]),
				.addr_out	({waveform_select,waveform_ptr}),
				.d			(nios_writedata[(((Z+1)*8)-1) % nios_width:(Z*8) % nios_width]),
				.we			(nios_chipselect && nios_write && (nios_address[nios_mem_addr_width-1:mem_widthad_a+nios_bytes_log2] == (Z>>nios_bytes_log2))),			
				.clk1		(nios_clk),
				.clk2		(dgen_clk),
				.re			(dgen_data_req)
			);
		end
	endgenerate




endmodule       

