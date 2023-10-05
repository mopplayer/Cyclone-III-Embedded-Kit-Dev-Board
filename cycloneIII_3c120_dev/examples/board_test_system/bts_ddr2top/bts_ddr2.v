//Legal Notice: (C)2009 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

//--------------------------------------------------------------------------//
// Title:       bts_ddr2.v                                      //
//--------------------------------------------------------------------------//
// Description: Cyclone III 3C120 Host Board Memory Controller       //
//              using NIOS BTS for DDR2-Top-40
//--------------------------------------------------------------------------//
// Revision History:                                                        //
// Rev 1:       First cut.                                                  //
//------ 1 ------- 2 ------- 3 ------- 4 ------- 5 ------- 6 ------- 7 ------7
//------ 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------8
//----------------------------------------------------------------------------

// Comment out for original DDR2 controller
// Comment in for DDR2 NIOS BTS design
`define	sopc_builder_system

/*  Cyclone III FPGA Host Development Kit
		
	Pushbutton, LED, and DIP Switch Descriptions:
		user_led0			PLLs Locked
		user_led1			Test Complete		
		user_led2			Error
		user_led3			Heartbeat
	
*/



// synthesis translate_off
`timescale 1ps / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

// megafunction wizard: %DDR / DDR2 SDRAM High Performance Controller v8.1%
//GENERATION: XML
//Generated by DDR / DDR2 SDRAM High Performance Controller 8.1 [Altera, IP Toolbench v1.3.0 build58]
//IPFS_FILES:
//RELATED_FILES:
//<< MEGAWIZARD PARSE FILE DDR9.0
//.
//<< START MEGAWIZARD INSERT MODULE

module bts_ddr2 (
                              // outputs:
                               ddr2_addr,
                               ddr2_ba,
                               ddr2_cas_n,
                               ddr2_cke,
                               ddr2_clk,
                               ddr2_clk_n,
                               ddr2_cs_n,
                               ddr2_odt,
                               ddr2_ras_n,
                               ddr2_we_n,
                               ddr2_dm,
                               ddr2_dq,
                               ddr2_dqs,							 
                               clkin_125,
							   clkin_50,
                               user_led,                                                                                    
                            )
;
		
  output  [ 12: 0] ddr2_addr;
  output  [  1: 0] ddr2_ba;
  output           ddr2_cas_n;
  output  [  0: 0] ddr2_cke;
  inout   [  1: 0] ddr2_clk;
  inout   [  1: 0] ddr2_clk_n;
  output  [  0: 0] ddr2_cs_n;
  output  [  0: 0] ddr2_odt;
  output           ddr2_ras_n;
  output           ddr2_we_n;
  output  [  4: 0] ddr2_dm;  
  inout   [ 39: 0] ddr2_dq;  
  inout   [  4: 0] ddr2_dqs; 
  input				clkin_125;
  input				clkin_50;
  output [3:0]      user_led;
  
  wire  [3:0]      user_pb;
  wire  [3:0]      user_dipsw; 
  wire         	   cpu_resetn;                              
  wire    [ 12: 0] ddr2_addr;
  wire             mem_aux_full_rate_clk;
  wire             mem_aux_half_rate_clk;
  wire    [  1: 0] ddr2_ba;
  wire             ddr2_cas_n;
  wire    [  0: 0] ddr2_cke;
  wire    [  1: 0] ddr2_clk;
  wire    [  1: 0] ddr2_clk_n;
  wire    [  0: 0] ddr2_cs_n;
  wire    [  4: 0] ddr2_dm;
  wire    [ 39: 0] ddr2_dq;
  wire    [  4: 0] ddr2_dqs; 
  wire    [ 22: 0] mem_local_addr;
  wire    [ 19: 0] mem_local_be;
  wire    [  9: 0] mem_local_col_addr;		
  wire             mem_local_cs_addr;
  wire    [ 159: 0] mem_local_rdata;
  wire             mem_local_rdata_valid;
  wire             mem_local_read_req;
  wire             mem_local_ready;
  wire             mem_local_size;
  wire    [ 159: 0] mem_local_wdata;
  wire    [ 159: 0] mem_local_wdata_0;		
  wire             mem_local_write_req;
  wire    [  0: 0] ddr2_odt;
  wire             ddr2_ras_n;
  wire             ddr2_we_n;
  wire             phy_clk;
  wire             pnf;
  wire    [  7: 0] pnf_per_byte;
  wire             test_complete;
  wire    [  7: 0] test_status;
  wire             reset_phy_clk_n;    
  wire             tie_high;
  wire             tie_low;

  //<< END MEGAWIZARD INSERT MODULE
  
  assign tie_high = 1'b1;
  assign tie_low = 1'b0;
  
  assign user_dipsw [3:0]  = 4'b1111; 		//disable DIPSW function. Its clash with BTS DDR2 Software
  assign user_pb  [3:0] = 4'b1111;			//disable DIPSW function. Its clash with BTS DDR2 Software
  assign cpu_resetn = 1'b1;					//disable DIPSW function. Its clash with BTS DDR2 Software
  
  //<< START MEGAWIZARD INSERT WRAPPER_NAME
  ddr2_top_40 ddr2_top_40_inst
    (
      .aux_full_rate_clk (mem_aux_full_rate_clk),
      .aux_half_rate_clk (mem_aux_half_rate_clk),
      .global_reset_n (ddr2_global_reset_n),
      .local_address (mem_local_addr),
      .local_be (mem_local_be),
      .local_burstbegin (tie_low),
      .local_init_done (),
      .local_rdata (mem_local_rdata),
      .local_rdata_valid (mem_local_rdata_valid),
      .local_read_req (mem_local_read_req),
      .local_ready (mem_local_ready),
      .local_refresh_ack (),
      .local_size (mem_local_size),
      .local_wdata (mem_local_wdata),
      .local_wdata_req (),
      .local_write_req (mem_local_write_req),
      .mem_addr (ddr2_addr),
      .mem_ba (ddr2_ba),
      .mem_cas_n (ddr2_cas_n),
      .mem_cke (ddr2_cke),
      .mem_clk (ddr2_clk),
      .mem_clk_n (ddr2_clk_n),
      .mem_cs_n (ddr2_cs_n),
      .mem_dm (ddr2_dm),
      .mem_dq (ddr2_dq),
      .mem_dqs (ddr2_dqs),
      .mem_odt (ddr2_odt),
      .mem_ras_n (ddr2_ras_n),
      .mem_we_n (ddr2_we_n),
      .phy_clk (phy_clk),			
      .pll_ref_clk (clkin_50),
      .reset_phy_clk_n (reset_phy_clk_n),
      .reset_request_n (),
      .soft_reset_n (ddr2_soft_reset_n)
    );

 
  //<< END MEGAWIZARD INSERT WRAPPER_NAME

  	// BTS Logic
  	wire	  [  7: 0]	ddr2_gpo;
	wire				bts_local_burstbegin; 
	wire				bts_mem_local_wdata_req;

  
	// Metastabilizer for asynchronous reset signal     
	// 1st parameter is the preset value
	// 2nd parameter is the debounce period
	parameter	debounce_prd			=	200000;
	switch_debouncer	#(0,debounce_prd)	switch_debouncer_reset_n
	(
		.reset_n	(1'b1),
		.clk		(!clkin_50),	
		.data_in	(cpu_resetn),		
		.data_out	(reset_n)
	);                                                                                                                                                

 	wire	ddr2_reset_n	=	reset_n && user_dipsw[0];
 
 	assign	start			=	!user_pb[0];	
 	assign	create_error	= 	!user_pb[1];  
 	assign	nios_reset_n	=	user_pb[3];  	 
	assign	nios_clk		=	clkin_50; 
	
	wire	tests_disabled_n	=	
							(	//Force the LED off if no tests are active:	
								ddr2_reset_n 	  								
							);
											
	assign	user_led[0]	=	 (!((ddr2_plls_locked 			|| (!ddr2_reset_n))			)) ;									                                  									                                    				                                 
	assign	user_led[1]	=	(!((ddr2_test_complete			|| (!ddr2_reset_n))			));									
	assign	user_led[2]	=	(!((ddr2_error_latch			&& ddr2_reset_n)					))	;


`ifdef	sopc_builder_system
	assign	ddr2_global_reset_n			= user_pb[2] && ddr2_gpo[0];  
	assign	ddr2_soft_reset_n			= ddr2_gpo[1];  

 //Example instantiation for system 'nios_bts'
  nios_bts nios_bts_inst
    (
	  .avalon_dip_to_the_nios_bts_port_ddr2_x40_0              ({4'b0000,user_dipsw[3:0]}                         ),
      .avalon_led_from_the_nios_bts_port_ddr2_x40_0            (ddr2_gpo                                          ),
      .avalon_pb_to_the_nios_bts_port_ddr2_x40_0               ({4'b0000,user_pb[3:0]}                            ),
      .clk_0                                                   (nios_clk                                          ),
      .create_error_pb_to_the_nios_bts_port_ddr2_x40_0         (create_error                                      ),
      .error_latch_from_the_nios_bts_port_ddr2_x40_0           (ddr2_error_latch                                  ),
      .local_addr_from_the_nios_bts_port_ddr2_x40_0            (mem_local_addr                                    ),
      .local_be_from_the_nios_bts_port_ddr2_x40_0              (mem_local_be                                      ),
      .local_burst_begin_from_the_nios_bts_port_ddr2_x40_0     (                                                  ),
      .local_clk_to_the_nios_bts_port_ddr2_x40_0               (phy_clk                                           ),
      .local_init_done_to_the_nios_bts_port_ddr2_x40_0         (1'b1                                              ),
      .local_rdata_to_the_nios_bts_port_ddr2_x40_0             (mem_local_rdata                                   ),
      .local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0       (mem_local_rdata_valid                             ),
      .local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0      (1'b1                                              ),
      .local_read_req_from_the_nios_bts_port_ddr2_x40_0        (mem_local_read_req                                ),
      .local_ready_to_the_nios_bts_port_ddr2_x40_0             (mem_local_ready                                   ),
      .local_reset_n_from_the_nios_bts_port_ddr2_x40_0         (                                                  ),
      .local_size_from_the_nios_bts_port_ddr2_x40_0            (mem_local_size                                    ),
      .local_wdata_from_the_nios_bts_port_ddr2_x40_0           (mem_local_wdata                                   ),
      .local_wdata_req_to_the_nios_bts_port_ddr2_x40_0         (mem_local_write_req & mem_local_ready          	  ),
      .local_write_req_from_the_nios_bts_port_ddr2_x40_0       (mem_local_write_req                               ),
      .pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0 (ddr2_pattern_sync_acquired                        ),
      .plls_in_locked_to_the_nios_bts_port_ddr2_x40_0          (1'b1                                              ),
      .plls_locked_from_the_nios_bts_port_ddr2_x40_0           (ddr2_plls_locked                                  ),
      .reset_n                                                 (nios_reset_n                                      ),
      .reset_n_to_the_nios_bts_port_ddr2_x40_0                 (reset_n                                           ),
      .start_pb_to_the_nios_bts_port_ddr2_x40_0                (start                                             ),
      .test_complete_from_the_nios_bts_port_ddr2_x40_0         (ddr2_test_complete                                ),
   
      .led_from_the_heartbeat_0            (user_led[3])          
    );
	
	

`else

	assign	ddr2_global_reset_n			= user_pb[2];  
	assign	ddr2_soft_reset_n			= 1'b1;  
 	assign	ddr2_plls_locked			= 1'b1;                                             
	assign	ddr2_pattern_sync_acquired	= 1'b1;
 	assign	ddr2_error_latch			= !pnf;
	
	

  //<< START MEGAWIZARD INSERT CS_ADDR_MAP
  //connect up the column address bits, dropping 2 bits from example driver output because of 4:1 data rate
  assign mem_local_addr[7 : 0] = mem_local_col_addr[9 : 2];

  //<< END MEGAWIZARD INSERT CS_ADDR_MAP

  //<< START MEGAWIZARD INSERT EXAMPLE_DRIVER
  //Self-test, synthesisable code to exercise the DDR SDRAM Controller
  ddr2_top_40_example_driver driver
    (
      .clk (phy_clk),
      .local_bank_addr (mem_local_addr[22 : 21]),
      .local_be (mem_local_be),
      .local_col_addr (mem_local_col_addr),
      .local_cs_addr (mem_local_cs_addr),
      .local_rdata (mem_local_rdata),
      .local_rdata_valid (mem_local_rdata_valid),
      .local_read_req (mem_local_read_req),
      .local_ready (mem_local_ready),
      .local_row_addr (mem_local_addr[20 : 8]),
      .local_size (mem_local_size),
      .local_wdata (mem_local_wdata_0),
      .local_write_req (mem_local_write_req),
      .pnf_per_byte (),
      .pnf_persist (pnf),
      .reset_n (reset_phy_clk_n),
      .test_complete (tst_complete_pulse),
      .test_status ()
    );
     
    assign	mem_local_wdata	=	mem_local_wdata_0 ^ ({64{create_error}});		

  //<< END MEGAWIZARD INSERT EXAMPLE_DRIVER

	// Make test complete persistent
	reg	tst_complete_reg;
	always	@(posedge phy_clk or negedge reset_phy_clk_n)
	begin
		if	(!reset_phy_clk_n)
		begin
			tst_complete_reg		<=	0;
		end else begin
			if (tst_complete_pulse)
			begin
				tst_complete_reg	<=	1;
			end
		end
	end
	assign	ddr2_test_complete	=	tst_complete_reg;
   
   
  //<< END MEGAWIZARD INSERT EXAMPLE_DRIVER
`endif
  //<< START MEGAWIZARD INSERT DLL
  //<< END MEGAWIZARD INSERT DLL
  //<< start europa

endmodule

