//--------------------------------------------------------------------------//
//                                                                          //
// Title:       pipeline_delay.v     	        		                	//
// Rev:         Rev 1                                                       //
// Created:     May 31, 2006		                                       	//
// Author:		David Johnson												//
//                                                                          //
//--------------------------------------------------------------------------//
//                                                                          //
// Description: 	Adds "delay" clocks of pipeline delay 					//
//																			//                                                                          //
//--------------------------------------------------------------------------//
//                                                                          //
// Revision History:                                                        //
//                                                                          //
// Rev 1:       First cut													//
//              					                        				//
//                                                                          //
//----------------------------------------------------------------------------
//------ 1 ------- 2 ------- 3 ------- 4 ------- 5 ------- 6 ------- 7 ------7
//------ 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------8
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
//with any other product not provided by Altera.
//                                                                            

// Will add up num_barrels * channel_width bits of skew delay at tx parallel input to the transceiver.
// Resolution is to 1 serial bit period for non 8B/10B data.
// If sending control characters and data (8B/10B), pcs expects aligned data, 
// therefore only provide skew numbers which are multiples of channel width.
// This module is connected little endian for compatibility with the Altera Transceiver PCS circuitry
// Send multiple parallel data channels concatenated on "datain".
// Send multiple delay skew values concatenated on "skew".
// Multiple data channels are output on "dataout", for direct connection to the tx_datain on the alt2gxb XCVRs


module	pipeline_delay	(
							reset_n,
							clk,
							datain,
							dataout  
						); 
						
parameter	data_width		=	1;
parameter	delay			=	pipeline_depth-1;
parameter	reset_value		=	1'b0;					
parameter	pipeline_depth	=	2; // >=2

input									reset_n;
input									clk;
input	[data_width-1:0]				datain;
output	[data_width-1:0]				dataout;

wire									reset_n;
wire									clk;
wire	[data_width-1:0]				datain;
reg		[data_width-1:0]				dataout;
	
// Internal data structures:
reg		[data_width-1:0]				pipeline	[0:delay-1]	;
integer									A;   

	always	@(posedge clk or negedge reset_n)
	begin
		if	(!reset_n)     
		begin
			for	(A=0; A<delay; A=A+1)
			begin
				pipeline[A]	<=	reset_value;
				dataout		<=	reset_value;
			end
		end else begin
			pipeline[0]	<= datain;
			for (A=1; A<delay; A=A+1)
			begin
				pipeline[A]	<=	pipeline[A-1];
			end
			dataout	<=	pipeline[delay-1];
		end                                                      
	end	        
	
                                                              
endmodule
