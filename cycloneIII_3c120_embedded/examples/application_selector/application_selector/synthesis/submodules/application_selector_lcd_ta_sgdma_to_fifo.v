// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
module application_selector_lcd_ta_sgdma_to_fifo (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [63: 0] in_data,
      input              in_startofpacket,
      input              in_endofpacket,
      input      [ 2: 0] in_empty,
      // Interface: out
      input              out_ready,
      output reg         out_valid,
      output reg [63: 0] out_data,
      output reg         out_startofpacket,
      output reg         out_endofpacket,
      output reg [ 2: 0] out_empty
);




   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------

   reg  [68: 0] in_payload;
   reg  [68: 0] out_payload;
   reg  [ 1: 0] ready;


   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data,in_startofpacket,in_endofpacket,in_empty};
     {out_data,out_startofpacket,out_endofpacket,out_empty} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
     ready[1] = out_ready;
     out_valid = in_valid && ready[0];
     out_payload = in_payload;
     in_ready = ready[0];
   end


   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
        ready[1-1:0] <= 0;
      end else begin
        ready[1-1:0] <= ready[1:1];
      end 
   end


endmodule

