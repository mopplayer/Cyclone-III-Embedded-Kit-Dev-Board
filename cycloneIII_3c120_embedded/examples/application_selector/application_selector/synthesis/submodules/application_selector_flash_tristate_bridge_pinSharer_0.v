// application_selector_flash_tristate_bridge_pinSharer_0.v

// This file was auto-generated from altera_tristate_conduit_pin_sharer_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using SOPC Builder version 11.0 157 at 2011.09.28.10:48:16

`timescale 1 ps / 1 ps
module application_selector_flash_tristate_bridge_pinSharer_0 (
		input  wire        clk_clk,                          //   clk.clk
		input  wire        reset_reset,                      // reset.reset
		output wire        request,                          //   tcm.request
		input  wire        grant,                            //      .grant
		output wire        oe_n_to_the_max2,                 //      .oe_n_to_the_max2_out
		output wire        we_n_to_the_max2,                 //      .we_n_to_the_max2_out
		output wire        cs_n_to_the_max2,                 //      .cs_n_to_the_max2_out
		output wire [25:0] flash_tristate_bridge_address,    //      .flash_tristate_bridge_address_out
		output wire        read_n_to_the_ext_flash,          //      .read_n_to_the_ext_flash_out
		output wire        write_n_to_the_ext_flash,         //      .write_n_to_the_ext_flash_out
		output wire [31:0] flash_tristate_bridge_data,       //      .flash_tristate_bridge_data_out
		input  wire [31:0] flash_tristate_bridge_data_in,    //      .flash_tristate_bridge_data_in
		output wire        flash_tristate_bridge_data_outen, //      .flash_tristate_bridge_data_outen
		output wire        select_n_to_the_ext_flash,        //      .select_n_to_the_ext_flash_out
		input  wire        tcs0_request,                     //  tcs0.request
		output wire        tcs0_grant,                       //      .grant
		input  wire [25:0] tcs0_address_out,                 //      .address_out
		input  wire        tcs0_read_n_out,                  //      .read_n_out
		input  wire        tcs0_write_n_out,                 //      .write_n_out
		input  wire [15:0] tcs0_data_out,                    //      .data_out
		output wire [15:0] tcs0_data_in,                     //      .data_in
		input  wire        tcs0_data_outen,                  //      .data_outen
		input  wire        tcs0_chipselect_n_out,            //      .chipselect_n_out
		input  wire        tcs1_request,                     //  tcs1.request
		output wire        tcs1_grant,                       //      .grant
		input  wire [4:0]  tcs1_address_out,                 //      .address_out
		input  wire        tcs1_read_n_out,                  //      .read_n_out
		input  wire        tcs1_write_n_out,                 //      .write_n_out
		input  wire [31:0] tcs1_data_out,                    //      .data_out
		output wire [31:0] tcs1_data_in,                     //      .data_in
		input  wire        tcs1_data_outen,                  //      .data_outen
		input  wire        tcs1_chipselect_n_out             //      .chipselect_n_out
	);

	wire  [1:0] arbiter_grant_data;        // arbiter:next_grant -> pin_sharer:next_grant
	wire        arbiter_grant_ready;       // pin_sharer:ack -> arbiter:ack
	wire        pin_sharer_tcs1_arb_valid; // pin_sharer:arb_max2_tcm -> arbiter:sink1_valid
	wire        pin_sharer_tcs0_arb_valid; // pin_sharer:arb_ext_flash_tcm -> arbiter:sink0_valid

	application_selector_flash_tristate_bridge_pinSharer_0_pin_sharer pin_sharer (
		.clk                              (clk_clk),                          //      clk.clk
		.reset                            (reset_reset),                      //    reset.reset
		.request                          (request),                          //      tcm.request
		.grant                            (grant),                            //         .grant
		.oe_n_to_the_max2                 (oe_n_to_the_max2),                 //         .oe_n_to_the_max2_out
		.we_n_to_the_max2                 (we_n_to_the_max2),                 //         .we_n_to_the_max2_out
		.cs_n_to_the_max2                 (cs_n_to_the_max2),                 //         .cs_n_to_the_max2_out
		.flash_tristate_bridge_address    (flash_tristate_bridge_address),    //         .flash_tristate_bridge_address_out
		.read_n_to_the_ext_flash          (read_n_to_the_ext_flash),          //         .read_n_to_the_ext_flash_out
		.write_n_to_the_ext_flash         (write_n_to_the_ext_flash),         //         .write_n_to_the_ext_flash_out
		.flash_tristate_bridge_data       (flash_tristate_bridge_data),       //         .flash_tristate_bridge_data_out
		.flash_tristate_bridge_data_in    (flash_tristate_bridge_data_in),    //         .flash_tristate_bridge_data_in
		.flash_tristate_bridge_data_outen (flash_tristate_bridge_data_outen), //         .flash_tristate_bridge_data_outen
		.select_n_to_the_ext_flash        (select_n_to_the_ext_flash),        //         .select_n_to_the_ext_flash_out
		.tcs0_request                     (tcs0_request),                     //     tcs0.request
		.tcs0_grant                       (tcs0_grant),                       //         .grant
		.tcs0_tcm_address_out             (tcs0_address_out),                 //         .address_out
		.tcs0_tcm_read_n_out              (tcs0_read_n_out),                  //         .read_n_out
		.tcs0_tcm_write_n_out             (tcs0_write_n_out),                 //         .write_n_out
		.tcs0_tcm_data_out                (tcs0_data_out),                    //         .data_out
		.tcs0_tcm_data_in                 (tcs0_data_in),                     //         .data_in
		.tcs0_tcm_data_outen              (tcs0_data_outen),                  //         .data_outen
		.tcs0_tcm_chipselect_n_out        (tcs0_chipselect_n_out),            //         .chipselect_n_out
		.tcs1_request                     (tcs1_request),                     //     tcs1.request
		.tcs1_grant                       (tcs1_grant),                       //         .grant
		.tcs1_tcm_address_out             (tcs1_address_out),                 //         .address_out
		.tcs1_tcm_read_n_out              (tcs1_read_n_out),                  //         .read_n_out
		.tcs1_tcm_write_n_out             (tcs1_write_n_out),                 //         .write_n_out
		.tcs1_tcm_data_out                (tcs1_data_out),                    //         .data_out
		.tcs1_tcm_data_in                 (tcs1_data_in),                     //         .data_in
		.tcs1_tcm_data_outen              (tcs1_data_outen),                  //         .data_outen
		.tcs1_tcm_chipselect_n_out        (tcs1_chipselect_n_out),            //         .chipselect_n_out
		.ack                              (arbiter_grant_ready),              //    grant.ready
		.next_grant                       (arbiter_grant_data),               //         .data
		.arb_max2_tcm                     (pin_sharer_tcs1_arb_valid),        // tcs1_arb.valid
		.arb_ext_flash_tcm                (pin_sharer_tcs0_arb_valid)         // tcs0_arb.valid
	);

	application_selector_flash_tristate_bridge_pinSharer_0_arbiter arbiter (
		.clk         (clk_clk),                   //       clk.clk
		.reset       (reset_reset),               // clk_reset.reset
		.ack         (arbiter_grant_ready),       //     grant.ready
		.next_grant  (arbiter_grant_data),        //          .data
		.sink0_valid (pin_sharer_tcs0_arb_valid), //     sink0.valid
		.sink1_valid (pin_sharer_tcs1_arb_valid)  //     sink1.valid
	);

endmodule
