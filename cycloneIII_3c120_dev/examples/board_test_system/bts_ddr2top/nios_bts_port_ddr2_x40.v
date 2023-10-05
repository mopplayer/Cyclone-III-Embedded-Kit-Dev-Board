
//--------------------------------------------------------------------------//
// Title:       nios_bts_port_ddr2_x40.v                                    //
// Rev:         Rev 1                                                       //
// Author		Altera                                                      //
//--------------------------------------------------------------------------//
// Description: NIOS BTS Port For DDR2 Memory                               //
//----------------------------------------------------------------------------
//Copyright © 2009 Altera Corporation. All rights reserved.  Altera products
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
                                                               
module nios_bts_port_ddr2_x40 (
    input          								reset_n,
	input										start_pb,
	input										create_error_pb,           				
	input										plls_in_locked,				
	output		    							plls_locked, 
	output										pattern_sync_acquired,
	output										test_complete,
	output										error_latch,
	output										error_irq,
	input										nios_clk,
	input	[19:0]								nios_address,
  	input	      								nios_chipselect,
  	input	      								nios_read,
  	output	[31:0]								nios_readdata,
  	input	      								nios_reset_n,
  	input	      	    		    			nios_write,
 	input	[31:0]								nios_writedata,
	output										nios_waitrequest,
	input	[7:0]								avalon_pb,
	input	[7:0]								avalon_dip,
	output	[7:0]								avalon_led,  
	input										local_clk,
	output	[22	: 0] 							local_addr,
	output	[19	: 0]							local_be,			
	input										local_init_done,
	input	[159: 0]							local_rdata,		
	input										local_rdata_valid,	
	input										local_rdvalid_in_n,	
	output										local_read_req,		
	input										local_ready,		
	output										local_size,	
	output										local_burst_begin,			
	output	[159: 0]							local_wdata,		
	input										local_wdata_req,	
	output										local_write_req,
	output										local_reset_n	
);                          	
 
 
nios_bts_port_ddr2_x40_top	nios_bts_port_ddr2_x40_top_i
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