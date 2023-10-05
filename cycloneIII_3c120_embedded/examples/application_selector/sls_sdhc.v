// sls_sdhc.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module sls_sdhc (
		input  wire        clk,                  //            clock.clk
		input  wire        reset_n,              //      clock_reset.reset_n
		input  wire [4:0]  AvS_address,          //          control.address
		input  wire        AvS_chipselect,       //                 .chipselect
		input  wire        AvS_write_n,          //                 .write_n
		input  wire        AvS_read_n,           //                 .read_n
		input  wire [31:0] AvS_writedata,        //                 .writedata
		output wire [31:0] AvS_readdata,         //                 .readdata
		output wire        AvS_waitrequest,      //                 .waitrequest
		output wire [31:0] AvM_wr_address,       //     write_master.address
		output wire [31:0] AvM_wr_writedata,     //                 .writedata
		output wire        AvM_wr_write_n,       //                 .write_n
		output wire        AvM_wr_chipselect,    //                 .chipselect
		input  wire        AvM_wr_waitrequest,   //                 .waitrequest
		output wire [3:0]  AvM_wr_byteenable,    //                 .byteenable
		input  wire [31:0] AvM_rd_readdata,      //      read_master.readdata
		output wire        AvM_rd_read_n,        //                 .read_n
		output wire [31:0] AvM_rd_address,       //                 .address
		input  wire        AvM_rd_waitrequest,   //                 .waitrequest
		input  wire        AvM_rd_readdatavalid, //                 .readdatavalid
		output wire [3:0]  AvM_rd_byteenable,    //                 .byteenable
		output wire        AvS_irq,              // interrupt_sender.irq
		output wire        SD_CLK,               //      conduit_end.export
		inout  wire        SD_CMD,               //                 .export
		inout  wire        SD_DAT0,              //                 .export
		inout  wire        SD_DAT1,              //                 .export
		inout  wire        SD_DAT2,              //                 .export
		inout  wire        SD_DAT3,              //                 .export
		input  wire        SD_In,                //                 .export
		input  wire        SD_Wp,                //                 .export
		output wire        SD_Busy               //                 .export
	);

	sls_sdhc_top #(
		.tx_buffer_depth (2048),
		.tx_buffer_add   (11),
		.rx_buffer_depth (2048),
		.rx_buffer_add   (11)
	) sls_sdhc (
		.clk                  (clk),                  //            clock.clk
		.reset_n              (reset_n),              //      clock_reset.reset_n
		.AvS_address          (AvS_address),          //          control.address
		.AvS_chipselect       (AvS_chipselect),       //                 .chipselect
		.AvS_write_n          (AvS_write_n),          //                 .write_n
		.AvS_read_n           (AvS_read_n),           //                 .read_n
		.AvS_writedata        (AvS_writedata),        //                 .writedata
		.AvS_readdata         (AvS_readdata),         //                 .readdata
		.AvS_waitrequest      (AvS_waitrequest),      //                 .waitrequest
		.AvM_wr_address       (AvM_wr_address),       //     write_master.address
		.AvM_wr_writedata     (AvM_wr_writedata),     //                 .writedata
		.AvM_wr_write_n       (AvM_wr_write_n),       //                 .write_n
		.AvM_wr_chipselect    (AvM_wr_chipselect),    //                 .chipselect
		.AvM_wr_waitrequest   (AvM_wr_waitrequest),   //                 .waitrequest
		.AvM_wr_byteenable    (AvM_wr_byteenable),    //                 .byteenable
		.AvM_rd_readdata      (AvM_rd_readdata),      //      read_master.readdata
		.AvM_rd_read_n        (AvM_rd_read_n),        //                 .read_n
		.AvM_rd_address       (AvM_rd_address),       //                 .address
		.AvM_rd_waitrequest   (AvM_rd_waitrequest),   //                 .waitrequest
		.AvM_rd_readdatavalid (AvM_rd_readdatavalid), //                 .readdatavalid
		.AvM_rd_byteenable    (AvM_rd_byteenable),    //                 .byteenable
		.AvS_irq              (AvS_irq),              // interrupt_sender.irq
		.SD_CLK               (SD_CLK),               //      conduit_end.export
		.SD_CMD               (SD_CMD),               //                 .export
		.SD_DAT0              (SD_DAT0),              //                 .export
		.SD_DAT1              (SD_DAT1),              //                 .export
		.SD_DAT2              (SD_DAT2),              //                 .export
		.SD_DAT3              (SD_DAT3),              //                 .export
		.SD_In                (SD_In),                //                 .export
		.SD_Wp                (SD_Wp),                //                 .export
		.SD_Busy              (SD_Busy)               //                 .export
	);

endmodule
