/********************************************************************
* Module:    edge_detector
* Author:    David T. Johnson
* Function:  Detects + and/or - edge, and generates pulse for single event
* Revision:  1.0  July 21, 2005
********************************************************************/

//Copyright © 2008 Altera Corporation. All rights reserved.  Altera products 
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


module edge_detector	(
								clk,
								reset_n,
								data_in,
								data_out			
						);
							
	parameter	enable_positive_edge 	= 1;	// Generates pulse on positive edge
	parameter 	enable_negative_edge	= 0;	// Generates pulse on negative edge
	parameter	pulse_polarity			= 1;	// Pulse polarity							

	input		clk;
	input		reset_n;
	input		data_in;
	output	reg	data_out;
																		
// Internal data structures:
	reg			data_in_prev;	// 4 deep metastabilier	
	reg			edge_detected;

	always	@(posedge clk or negedge reset_n)
	begin
		if	(!reset_n)
		begin
			data_out		<=	!pulse_polarity;
			data_in_prev	<=	!pulse_polarity;
		end else begin
			if
			(
					((!data_in_prev) && data_in && enable_positive_edge)	||
					(data_in_prev && (!data_in) && enable_negative_edge)
			)
			begin
				data_out	<=	pulse_polarity;
			end else begin
				data_out	<=	!pulse_polarity;
			end
			data_in_prev	<=	data_in;			
		end
	end
					

endmodule
