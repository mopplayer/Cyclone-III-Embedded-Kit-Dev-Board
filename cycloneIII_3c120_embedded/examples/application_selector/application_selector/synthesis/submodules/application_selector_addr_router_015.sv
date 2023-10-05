// (C) 2001-2011 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/11.0/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#2 $
// $Revision: #2 $
// $Date: 2011/03/23 $
// $Author: aferrucc $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module application_selector_addr_router_015_default_decode
  #(
     parameter DEFAULT_CHANNEL = 1,
               DEFAULT_DESTID = 2 
   )
  (output [67 - 63 : 0] default_destid,
   output [16-1 : 0] default_src_channel
  );

  assign default_destid = DEFAULT_DESTID;
  generate begin : default_decode
    if (DEFAULT_CHANNEL == -1)
      assign default_src_channel = 0;
    else
      assign default_src_channel = 1 << DEFAULT_CHANNEL;
  end endgenerate

endmodule


module application_selector_addr_router_015
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [69-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [69-1    : 0] src_data,
    output reg [16-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 45;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 67;
    localparam PKT_DEST_ID_L = 63;
    localparam ST_DATA_W = 69;
    localparam ST_CHANNEL_W = 16;
    localparam DECODER_TYPE = 0;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;

    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(32'h190 - 32'h180);
    localparam PAD1 = log2ceil(32'h20 - 32'h0);
    localparam PAD2 = log2ceil(32'h288 - 32'h280);
    localparam PAD3 = log2ceil(32'h60 - 32'h40);
    localparam PAD4 = log2ceil(32'h1b0 - 32'h1a0);
    localparam PAD5 = log2ceil(32'ha0 - 32'h80);
    localparam PAD6 = log2ceil(32'he0 - 32'hc0);
    localparam PAD7 = log2ceil(32'h120 - 32'h100);
    localparam PAD8 = log2ceil(32'h298 - 32'h290);
    localparam PAD9 = log2ceil(32'h1d0 - 32'h1c0);
    localparam PAD10 = log2ceil(32'h1f0 - 32'h1e0);
    localparam PAD11 = log2ceil(32'h210 - 32'h200);
    localparam PAD12 = log2ceil(32'h230 - 32'h220);
    localparam PAD13 = log2ceil(32'h250 - 32'h240);
    localparam PAD14 = log2ceil(32'h270 - 32'h260);
    localparam PAD15 = log2ceil(32'h160 - 32'h140);

    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 32'h298;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;
    localparam RG = RANGE_ADDR_WIDTH-1;

    reg [PKT_ADDR_W-1 : 0] address;

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;

    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [16-1 : 0] default_src_channel;

    application_selector_addr_router_015_default_decode the_default_decode(
      .default_destid (default_destid),
      .default_src_channel (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;
        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------
        address     = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];

        // ( 0x180 .. 0x190 )
        if ( {address[RG:PAD0],{PAD0{1'b0}}} == 'h180 ) begin
            src_channel = 'b0000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // ( 0x0 .. 0x20 )
        if ( {address[RG:PAD1],{PAD1{1'b0}}} == 'h0 ) begin
            src_channel = 'b0000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // ( 0x280 .. 0x288 )
        if ( {address[RG:PAD2],{PAD2{1'b0}}} == 'h280 ) begin
            src_channel = 'b0000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // ( 0x40 .. 0x60 )
        if ( {address[RG:PAD3],{PAD3{1'b0}}} == 'h40 ) begin
            src_channel = 'b0000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // ( 0x1a0 .. 0x1b0 )
        if ( {address[RG:PAD4],{PAD4{1'b0}}} == 'h1a0 ) begin
            src_channel = 'b0000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // ( 0x80 .. 0xa0 )
        if ( {address[RG:PAD5],{PAD5{1'b0}}} == 'h80 ) begin
            src_channel = 'b0000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // ( 0xc0 .. 0xe0 )
        if ( {address[RG:PAD6],{PAD6{1'b0}}} == 'hc0 ) begin
            src_channel = 'b0000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // ( 0x100 .. 0x120 )
        if ( {address[RG:PAD7],{PAD7{1'b0}}} == 'h100 ) begin
            src_channel = 'b0000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // ( 0x290 .. 0x298 )
        if ( {address[RG:PAD8],{PAD8{1'b0}}} == 'h290 ) begin
            src_channel = 'b0000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // ( 0x1c0 .. 0x1d0 )
        if ( {address[RG:PAD9],{PAD9{1'b0}}} == 'h1c0 ) begin
            src_channel = 'b0000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // ( 0x1e0 .. 0x1f0 )
        if ( {address[RG:PAD10],{PAD10{1'b0}}} == 'h1e0 ) begin
            src_channel = 'b0000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // ( 0x200 .. 0x210 )
        if ( {address[RG:PAD11],{PAD11{1'b0}}} == 'h200 ) begin
            src_channel = 'b0000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // ( 0x220 .. 0x230 )
        if ( {address[RG:PAD12],{PAD12{1'b0}}} == 'h220 ) begin
            src_channel = 'b0001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
        end

        // ( 0x240 .. 0x250 )
        if ( {address[RG:PAD13],{PAD13{1'b0}}} == 'h240 ) begin
            src_channel = 'b0010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
        end

        // ( 0x260 .. 0x270 )
        if ( {address[RG:PAD14],{PAD14{1'b0}}} == 'h260 ) begin
            src_channel = 'b0100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
        end

        // ( 0x140 .. 0x160 )
        if ( {address[RG:PAD15],{PAD15{1'b0}}} == 'h140 ) begin
            src_channel = 'b1000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
        end

    end

    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[63:0] val;
        reg [63:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


