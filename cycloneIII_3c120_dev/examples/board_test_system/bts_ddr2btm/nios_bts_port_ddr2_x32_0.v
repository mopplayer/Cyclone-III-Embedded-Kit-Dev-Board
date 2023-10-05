// nios_bts_port_ddr2_x32_0.v

// This file was auto-generated as part of a generation operation.
// If you edit it your changes will probably be lost.

`timescale 1 ps / 1 ps
module nios_bts_port_ddr2_x32_0 (
		input  wire         nios_clk,              //       clock_reset.clk
		input  wire         nios_reset_n,          // clock_reset_reset.reset_n
		input  wire         start_pb,              //       conduit_end.export
		input  wire         create_error_pb,       //                  .export
		input  wire         plls_in_locked,        //                  .export
		output wire         plls_locked,           //                  .export
		output wire         pattern_sync_acquired, //                  .export
		output wire         test_complete,         //                  .export
		output wire         error_latch,           //                  .export
		input  wire [7:0]   avalon_pb,             //                  .export
		input  wire [7:0]   avalon_dip,            //                  .export
		output wire [7:0]   avalon_led,            //                  .export
		input  wire         local_clk,             //                  .export
		output wire [22:0]  local_addr,            //                  .export
		output wire [15:0]  local_be,              //                  .export
		input  wire         local_init_done,       //                  .export
		input  wire [127:0] local_rdata,           //                  .export
		input  wire         local_rdata_valid,     //                  .export
		input  wire         local_rdvalid_in_n,    //                  .export
		output wire         local_read_req,        //                  .export
		input  wire         local_ready,           //                  .export
		output wire         local_size,            //                  .export
		output wire         local_burst_begin,     //                  .export
		output wire [127:0] local_wdata,           //                  .export
		input  wire         local_wdata_req,       //                  .export
		output wire         local_write_req,       //                  .export
		output wire         local_reset_n,         //                  .export
		input  wire         reset_n,               //                  .export
		input  wire [19:0]  nios_address,          //              nios.address
		input  wire         nios_chipselect,       //                  .chipselect
		input  wire         nios_read,             //                  .read
		output wire [31:0]  nios_readdata,         //                  .readdata
		input  wire         nios_write,            //                  .write
		input  wire [31:0]  nios_writedata,        //                  .writedata
		output wire         nios_waitrequest,      //                  .waitrequest
		output wire         error_irq              //  interrupt_sender.irq
	);

	nios_bts_port_ddr2_x32 nios_bts_port_ddr2_x32_0 (
		.nios_clk              (nios_clk),              //       clock_reset.clk
		.nios_reset_n          (nios_reset_n),          // clock_reset_reset.reset_n
		.start_pb              (start_pb),              //       conduit_end.export
		.create_error_pb       (create_error_pb),       //                  .export
		.plls_in_locked        (plls_in_locked),        //                  .export
		.plls_locked           (plls_locked),           //                  .export
		.pattern_sync_acquired (pattern_sync_acquired), //                  .export
		.test_complete         (test_complete),         //                  .export
		.error_latch           (error_latch),           //                  .export
		.avalon_pb             (avalon_pb),             //                  .export
		.avalon_dip            (avalon_dip),            //                  .export
		.avalon_led            (avalon_led),            //                  .export
		.local_clk             (local_clk),             //                  .export
		.local_addr            (local_addr),            //                  .export
		.local_be              (local_be),              //                  .export
		.local_init_done       (local_init_done),       //                  .export
		.local_rdata           (local_rdata),           //                  .export
		.local_rdata_valid     (local_rdata_valid),     //                  .export
		.local_rdvalid_in_n    (local_rdvalid_in_n),    //                  .export
		.local_read_req        (local_read_req),        //                  .export
		.local_ready           (local_ready),           //                  .export
		.local_size            (local_size),            //                  .export
		.local_burst_begin     (local_burst_begin),     //                  .export
		.local_wdata           (local_wdata),           //                  .export
		.local_wdata_req       (local_wdata_req),       //                  .export
		.local_write_req       (local_write_req),       //                  .export
		.local_reset_n         (local_reset_n),         //                  .export
		.reset_n               (reset_n),               //                  .export
		.nios_address          (nios_address),          //              nios.address
		.nios_chipselect       (nios_chipselect),       //                  .chipselect
		.nios_read             (nios_read),             //                  .read
		.nios_readdata         (nios_readdata),         //                  .readdata
		.nios_write            (nios_write),            //                  .write
		.nios_writedata        (nios_writedata),        //                  .writedata
		.nios_waitrequest      (nios_waitrequest),      //                  .waitrequest
		.error_irq             (error_irq)              //  interrupt_sender.irq
	);

endmodule
