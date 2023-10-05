//--------------------------------------------------------------------------//
//                                                                          //
// Title:       synchronizer.v                                               //
// Rev:         Rev 1                                                       //
// Created:     July 18, 2005                                               //
// Author:		David Todd Johnson                                          //
//--------------------------------------------------------------------------//
//                                                                          //
// Description: Synchonizer for Metastability                               //
//
//Copyright © 2005 Altera Corporation. All rights reserved.  Altera products 
//are protected under numerous U.S. and foreign patents, maskwork rights, 
//copyrights and other intellectual property laws.  
//
//This reference design file, and your use thereof, is subject to and governed
//by the terms and conditions of the applicable Altera Reference Design 
//License Agreement.  By using this reference design file, you indicate your
//acceptance of such terms and conditions between you and Altera Corporation.
//In the event that you do not agree with such terms and conditions, you may
//not use the reference design file. Please promptly destroy any copies you 
//have made.
//
//This reference design file being provided on an "as-is" basis and as an 
//accommodation and therefore all warranties, representations or guarantees
//of any kind (whether express, implied or statutory) including, without 
//limitation, warranties of merchantability, non-infringement, or fitness for
//a particular purpose, are specifically disclaimed.  By making this reference
//design file available, Altera expressly does not recommend, suggest or 
//require that this reference design file be used in combination with any 
//other product not provided by Altera


module	synchronizer	(
						reset_n,
						clk,
						data_in,
						data_out
					);
					
	input	reset_n;
	input	clk;
	input	data_in;
	output	data_out;
	
	reg		data_out;
	
	// Scalable synchronizer - depth is the number of flip flops, set >= 2;					
	parameter	depth		=	4;
	parameter	preset_val	=	0;
	
	// Internal data structures:
	reg	[depth-1:0]	sync_reg;
	integer	A; 
	
	always	@(posedge clk or negedge reset_n)
	begin
		if	(!reset_n)
		begin
			for	(A=1; A<=depth-1; A=A+1)
			begin
				sync_reg[A]		<=	preset_val;
			end
			data_out			<=	preset_val;
		end else begin
			sync_reg[0]			<=	data_in;
			for	(A=1; A<=depth-1; A=A+1)
			begin
				sync_reg[A]		<=	sync_reg[A-1];
			end
			data_out			<=	sync_reg[depth-1];
		end
	end    

endmodule
				


