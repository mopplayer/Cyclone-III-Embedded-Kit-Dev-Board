//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
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

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_altmemddr_bridge_m1_to_altmemddr_s1_module (
                                                                 // inputs:
                                                                  clear_fifo,
                                                                  clk,
                                                                  data_in,
                                                                  read,
                                                                  reset_n,
                                                                  sync_reset,
                                                                  write,

                                                                 // outputs:
                                                                  data_out,
                                                                  empty,
                                                                  fifo_contains_ones_n,
                                                                  full
                                                               )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altmemddr_s1_arbitrator (
                                 // inputs:
                                  altmemddr_bridge_m1_address_to_slave,
                                  altmemddr_bridge_m1_byteenable,
                                  altmemddr_bridge_m1_latency_counter,
                                  altmemddr_bridge_m1_read,
                                  altmemddr_bridge_m1_write,
                                  altmemddr_bridge_m1_writedata,
                                  altmemddr_s1_readdata,
                                  altmemddr_s1_readdatavalid,
                                  altmemddr_s1_resetrequest_n,
                                  altmemddr_s1_waitrequest_n,
                                  clk,
                                  reset_n,

                                 // outputs:
                                  altmemddr_bridge_m1_granted_altmemddr_s1,
                                  altmemddr_bridge_m1_qualified_request_altmemddr_s1,
                                  altmemddr_bridge_m1_read_data_valid_altmemddr_s1,
                                  altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register,
                                  altmemddr_bridge_m1_requests_altmemddr_s1,
                                  altmemddr_s1_address,
                                  altmemddr_s1_beginbursttransfer,
                                  altmemddr_s1_burstcount,
                                  altmemddr_s1_byteenable,
                                  altmemddr_s1_read,
                                  altmemddr_s1_readdata_from_sa,
                                  altmemddr_s1_resetrequest_n_from_sa,
                                  altmemddr_s1_waitrequest_n_from_sa,
                                  altmemddr_s1_write,
                                  altmemddr_s1_writedata,
                                  d1_altmemddr_s1_end_xfer
                               )
;

  output           altmemddr_bridge_m1_granted_altmemddr_s1;
  output           altmemddr_bridge_m1_qualified_request_altmemddr_s1;
  output           altmemddr_bridge_m1_read_data_valid_altmemddr_s1;
  output           altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register;
  output           altmemddr_bridge_m1_requests_altmemddr_s1;
  output  [ 22: 0] altmemddr_s1_address;
  output           altmemddr_s1_beginbursttransfer;
  output           altmemddr_s1_burstcount;
  output  [  7: 0] altmemddr_s1_byteenable;
  output           altmemddr_s1_read;
  output  [ 63: 0] altmemddr_s1_readdata_from_sa;
  output           altmemddr_s1_resetrequest_n_from_sa;
  output           altmemddr_s1_waitrequest_n_from_sa;
  output           altmemddr_s1_write;
  output  [ 63: 0] altmemddr_s1_writedata;
  output           d1_altmemddr_s1_end_xfer;
  input   [ 25: 0] altmemddr_bridge_m1_address_to_slave;
  input   [  3: 0] altmemddr_bridge_m1_byteenable;
  input            altmemddr_bridge_m1_latency_counter;
  input            altmemddr_bridge_m1_read;
  input            altmemddr_bridge_m1_write;
  input   [ 31: 0] altmemddr_bridge_m1_writedata;
  input   [ 63: 0] altmemddr_s1_readdata;
  input            altmemddr_s1_readdatavalid;
  input            altmemddr_s1_resetrequest_n;
  input            altmemddr_s1_waitrequest_n;
  input            clk;
  input            reset_n;

  wire             altmemddr_bridge_m1_arbiterlock;
  wire             altmemddr_bridge_m1_arbiterlock2;
  wire    [  7: 0] altmemddr_bridge_m1_byteenable_altmemddr_s1;
  wire             altmemddr_bridge_m1_continuerequest;
  wire             altmemddr_bridge_m1_granted_altmemddr_s1;
  wire             altmemddr_bridge_m1_qualified_request_altmemddr_s1;
  wire             altmemddr_bridge_m1_rdv_fifo_empty_altmemddr_s1;
  wire             altmemddr_bridge_m1_rdv_fifo_output_from_altmemddr_s1;
  wire             altmemddr_bridge_m1_read_data_valid_altmemddr_s1;
  wire             altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register;
  wire             altmemddr_bridge_m1_requests_altmemddr_s1;
  wire             altmemddr_bridge_m1_saved_grant_altmemddr_s1;
  wire    [ 63: 0] altmemddr_bridge_m1_writedata_replicated;
  wire    [ 22: 0] altmemddr_s1_address;
  wire             altmemddr_s1_allgrants;
  wire             altmemddr_s1_allow_new_arb_cycle;
  wire             altmemddr_s1_any_bursting_master_saved_grant;
  wire             altmemddr_s1_any_continuerequest;
  wire             altmemddr_s1_arb_counter_enable;
  reg              altmemddr_s1_arb_share_counter;
  wire             altmemddr_s1_arb_share_counter_next_value;
  wire             altmemddr_s1_arb_share_set_values;
  wire             altmemddr_s1_beginbursttransfer;
  wire             altmemddr_s1_beginbursttransfer_internal;
  wire             altmemddr_s1_begins_xfer;
  wire             altmemddr_s1_burstcount;
  wire    [  7: 0] altmemddr_s1_byteenable;
  wire             altmemddr_s1_end_xfer;
  wire             altmemddr_s1_firsttransfer;
  wire             altmemddr_s1_grant_vector;
  wire             altmemddr_s1_in_a_read_cycle;
  wire             altmemddr_s1_in_a_write_cycle;
  wire             altmemddr_s1_master_qreq_vector;
  wire             altmemddr_s1_move_on_to_next_transaction;
  wire             altmemddr_s1_non_bursting_master_requests;
  wire             altmemddr_s1_read;
  wire    [ 63: 0] altmemddr_s1_readdata_from_sa;
  wire             altmemddr_s1_readdatavalid_from_sa;
  reg              altmemddr_s1_reg_firsttransfer;
  wire             altmemddr_s1_resetrequest_n_from_sa;
  reg              altmemddr_s1_slavearbiterlockenable;
  wire             altmemddr_s1_slavearbiterlockenable2;
  wire             altmemddr_s1_unreg_firsttransfer;
  wire             altmemddr_s1_waitrequest_n_from_sa;
  wire             altmemddr_s1_waits_for_read;
  wire             altmemddr_s1_waits_for_write;
  wire             altmemddr_s1_write;
  wire    [ 63: 0] altmemddr_s1_writedata;
  reg              d1_altmemddr_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_altmemddr_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 25: 0] shifted_address_to_altmemddr_s1_from_altmemddr_bridge_m1;
  wire             wait_for_altmemddr_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~altmemddr_s1_end_xfer;
    end


  assign altmemddr_s1_begins_xfer = ~d1_reasons_to_wait & ((altmemddr_bridge_m1_qualified_request_altmemddr_s1));
  //assign altmemddr_s1_readdata_from_sa = altmemddr_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_s1_readdata_from_sa = altmemddr_s1_readdata;

  assign altmemddr_bridge_m1_requests_altmemddr_s1 = (1) & (altmemddr_bridge_m1_read | altmemddr_bridge_m1_write);
  //assign altmemddr_s1_waitrequest_n_from_sa = altmemddr_s1_waitrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_s1_waitrequest_n_from_sa = altmemddr_s1_waitrequest_n;

  //assign altmemddr_s1_readdatavalid_from_sa = altmemddr_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_s1_readdatavalid_from_sa = altmemddr_s1_readdatavalid;

  //altmemddr_s1_arb_share_counter set values, which is an e_mux
  assign altmemddr_s1_arb_share_set_values = 1;

  //altmemddr_s1_non_bursting_master_requests mux, which is an e_mux
  assign altmemddr_s1_non_bursting_master_requests = altmemddr_bridge_m1_requests_altmemddr_s1;

  //altmemddr_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign altmemddr_s1_any_bursting_master_saved_grant = 0;

  //altmemddr_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign altmemddr_s1_arb_share_counter_next_value = altmemddr_s1_firsttransfer ? (altmemddr_s1_arb_share_set_values - 1) : |altmemddr_s1_arb_share_counter ? (altmemddr_s1_arb_share_counter - 1) : 0;

  //altmemddr_s1_allgrants all slave grants, which is an e_mux
  assign altmemddr_s1_allgrants = |altmemddr_s1_grant_vector;

  //altmemddr_s1_end_xfer assignment, which is an e_assign
  assign altmemddr_s1_end_xfer = ~(altmemddr_s1_waits_for_read | altmemddr_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_altmemddr_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_altmemddr_s1 = altmemddr_s1_end_xfer & (~altmemddr_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //altmemddr_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign altmemddr_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_altmemddr_s1 & altmemddr_s1_allgrants) | (end_xfer_arb_share_counter_term_altmemddr_s1 & ~altmemddr_s1_non_bursting_master_requests);

  //altmemddr_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_s1_arb_share_counter <= 0;
      else if (altmemddr_s1_arb_counter_enable)
          altmemddr_s1_arb_share_counter <= altmemddr_s1_arb_share_counter_next_value;
    end


  //altmemddr_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_s1_slavearbiterlockenable <= 0;
      else if ((|altmemddr_s1_master_qreq_vector & end_xfer_arb_share_counter_term_altmemddr_s1) | (end_xfer_arb_share_counter_term_altmemddr_s1 & ~altmemddr_s1_non_bursting_master_requests))
          altmemddr_s1_slavearbiterlockenable <= |altmemddr_s1_arb_share_counter_next_value;
    end


  //altmemddr_bridge/m1 altmemddr/s1 arbiterlock, which is an e_assign
  assign altmemddr_bridge_m1_arbiterlock = altmemddr_s1_slavearbiterlockenable & altmemddr_bridge_m1_continuerequest;

  //altmemddr_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign altmemddr_s1_slavearbiterlockenable2 = |altmemddr_s1_arb_share_counter_next_value;

  //altmemddr_bridge/m1 altmemddr/s1 arbiterlock2, which is an e_assign
  assign altmemddr_bridge_m1_arbiterlock2 = altmemddr_s1_slavearbiterlockenable2 & altmemddr_bridge_m1_continuerequest;

  //altmemddr_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign altmemddr_s1_any_continuerequest = 1;

  //altmemddr_bridge_m1_continuerequest continued request, which is an e_assign
  assign altmemddr_bridge_m1_continuerequest = 1;

  assign altmemddr_bridge_m1_qualified_request_altmemddr_s1 = altmemddr_bridge_m1_requests_altmemddr_s1 & ~((altmemddr_bridge_m1_read & ((altmemddr_bridge_m1_latency_counter != 0) | (1 < altmemddr_bridge_m1_latency_counter))));
  //unique name for altmemddr_s1_move_on_to_next_transaction, which is an e_assign
  assign altmemddr_s1_move_on_to_next_transaction = altmemddr_s1_readdatavalid_from_sa;

  //rdv_fifo_for_altmemddr_bridge_m1_to_altmemddr_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_altmemddr_bridge_m1_to_altmemddr_s1_module rdv_fifo_for_altmemddr_bridge_m1_to_altmemddr_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (altmemddr_bridge_m1_granted_altmemddr_s1),
      .data_out             (altmemddr_bridge_m1_rdv_fifo_output_from_altmemddr_s1),
      .empty                (),
      .fifo_contains_ones_n (altmemddr_bridge_m1_rdv_fifo_empty_altmemddr_s1),
      .full                 (),
      .read                 (altmemddr_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~altmemddr_s1_waits_for_read)
    );

  assign altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register = ~altmemddr_bridge_m1_rdv_fifo_empty_altmemddr_s1;
  //local readdatavalid altmemddr_bridge_m1_read_data_valid_altmemddr_s1, which is an e_mux
  assign altmemddr_bridge_m1_read_data_valid_altmemddr_s1 = altmemddr_s1_readdatavalid_from_sa;

  //replicate narrow data for wide slave
  assign altmemddr_bridge_m1_writedata_replicated = {altmemddr_bridge_m1_writedata,
    altmemddr_bridge_m1_writedata};

  //altmemddr_s1_writedata mux, which is an e_mux
  assign altmemddr_s1_writedata = altmemddr_bridge_m1_writedata_replicated;

  //master is always granted when requested
  assign altmemddr_bridge_m1_granted_altmemddr_s1 = altmemddr_bridge_m1_qualified_request_altmemddr_s1;

  //altmemddr_bridge/m1 saved-grant altmemddr/s1, which is an e_assign
  assign altmemddr_bridge_m1_saved_grant_altmemddr_s1 = altmemddr_bridge_m1_requests_altmemddr_s1;

  //allow new arb cycle for altmemddr/s1, which is an e_assign
  assign altmemddr_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign altmemddr_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign altmemddr_s1_master_qreq_vector = 1;

  //assign altmemddr_s1_resetrequest_n_from_sa = altmemddr_s1_resetrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_s1_resetrequest_n_from_sa = altmemddr_s1_resetrequest_n;

  //altmemddr_s1_firsttransfer first transaction, which is an e_assign
  assign altmemddr_s1_firsttransfer = altmemddr_s1_begins_xfer ? altmemddr_s1_unreg_firsttransfer : altmemddr_s1_reg_firsttransfer;

  //altmemddr_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign altmemddr_s1_unreg_firsttransfer = ~(altmemddr_s1_slavearbiterlockenable & altmemddr_s1_any_continuerequest);

  //altmemddr_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_s1_reg_firsttransfer <= 1'b1;
      else if (altmemddr_s1_begins_xfer)
          altmemddr_s1_reg_firsttransfer <= altmemddr_s1_unreg_firsttransfer;
    end


  //altmemddr_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign altmemddr_s1_beginbursttransfer_internal = altmemddr_s1_begins_xfer;

  //altmemddr/s1 begin burst transfer to slave, which is an e_assign
  assign altmemddr_s1_beginbursttransfer = altmemddr_s1_beginbursttransfer_internal;

  //altmemddr_s1_read assignment, which is an e_mux
  assign altmemddr_s1_read = altmemddr_bridge_m1_granted_altmemddr_s1 & altmemddr_bridge_m1_read;

  //altmemddr_s1_write assignment, which is an e_mux
  assign altmemddr_s1_write = altmemddr_bridge_m1_granted_altmemddr_s1 & altmemddr_bridge_m1_write;

  assign shifted_address_to_altmemddr_s1_from_altmemddr_bridge_m1 = altmemddr_bridge_m1_address_to_slave;
  //altmemddr_s1_address mux, which is an e_mux
  assign altmemddr_s1_address = shifted_address_to_altmemddr_s1_from_altmemddr_bridge_m1 >> 3;

  //d1_altmemddr_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_altmemddr_s1_end_xfer <= 1;
      else 
        d1_altmemddr_s1_end_xfer <= altmemddr_s1_end_xfer;
    end


  //altmemddr_s1_waits_for_read in a cycle, which is an e_mux
  assign altmemddr_s1_waits_for_read = altmemddr_s1_in_a_read_cycle & ~altmemddr_s1_waitrequest_n_from_sa;

  //altmemddr_s1_in_a_read_cycle assignment, which is an e_assign
  assign altmemddr_s1_in_a_read_cycle = altmemddr_bridge_m1_granted_altmemddr_s1 & altmemddr_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = altmemddr_s1_in_a_read_cycle;

  //altmemddr_s1_waits_for_write in a cycle, which is an e_mux
  assign altmemddr_s1_waits_for_write = altmemddr_s1_in_a_write_cycle & ~altmemddr_s1_waitrequest_n_from_sa;

  //altmemddr_s1_in_a_write_cycle assignment, which is an e_assign
  assign altmemddr_s1_in_a_write_cycle = altmemddr_bridge_m1_granted_altmemddr_s1 & altmemddr_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = altmemddr_s1_in_a_write_cycle;

  assign wait_for_altmemddr_s1_counter = 0;
  //altmemddr_s1_byteenable byte enable port mux, which is an e_mux
  assign altmemddr_s1_byteenable = (altmemddr_bridge_m1_granted_altmemddr_s1)? altmemddr_bridge_m1_byteenable_altmemddr_s1 :
    -1;

  //byte_enable_mux for altmemddr_bridge/m1 and altmemddr/s1, which is an e_mux
  assign altmemddr_bridge_m1_byteenable_altmemddr_s1 = (altmemddr_bridge_m1_address_to_slave[2] == 0)? altmemddr_bridge_m1_byteenable :
    {altmemddr_bridge_m1_byteenable, {4'b0}};

  //burstcount mux, which is an e_mux
  assign altmemddr_s1_burstcount = 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altmemddr/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc_reset_osc_clk_1_domain_synch_module (
                                                                                       // inputs:
                                                                                        clk,
                                                                                        data_in,
                                                                                        reset_n,

                                                                                       // outputs:
                                                                                        data_out
                                                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_altmemddr_bridge_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  wire             full_48;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_47;
  assign empty = !full_0;
  assign full_48 = 0;
  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    0;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_altmemddr_bridge_s1_module (
                                                                           // inputs:
                                                                            clear_fifo,
                                                                            clk,
                                                                            data_in,
                                                                            read,
                                                                            reset_n,
                                                                            sync_reset,
                                                                            write,

                                                                           // outputs:
                                                                            data_out,
                                                                            empty,
                                                                            fifo_contains_ones_n,
                                                                            full
                                                                         )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  wire             full_48;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_47;
  assign empty = !full_0;
  assign full_48 = 0;
  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    0;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_sgdma_tx_m_read_to_altmemddr_bridge_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  wire             full_48;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_47;
  assign empty = !full_0;
  assign full_48 = 0;
  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    0;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altmemddr_bridge_s1_arbitrator (
                                        // inputs:
                                         altmemddr_bridge_s1_endofpacket,
                                         altmemddr_bridge_s1_readdata,
                                         altmemddr_bridge_s1_readdatavalid,
                                         altmemddr_bridge_s1_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         cpu_instruction_master_address_to_slave,
                                         cpu_instruction_master_latency_counter,
                                         cpu_instruction_master_read,
                                         reset_n,
                                         sgdma_rx_m_write_address_to_slave,
                                         sgdma_rx_m_write_byteenable,
                                         sgdma_rx_m_write_write,
                                         sgdma_rx_m_write_writedata,
                                         sgdma_tx_m_read_address_to_slave,
                                         sgdma_tx_m_read_latency_counter,
                                         sgdma_tx_m_read_read,

                                        // outputs:
                                         altmemddr_bridge_s1_address,
                                         altmemddr_bridge_s1_byteenable,
                                         altmemddr_bridge_s1_endofpacket_from_sa,
                                         altmemddr_bridge_s1_nativeaddress,
                                         altmemddr_bridge_s1_read,
                                         altmemddr_bridge_s1_readdata_from_sa,
                                         altmemddr_bridge_s1_reset_n,
                                         altmemddr_bridge_s1_waitrequest_from_sa,
                                         altmemddr_bridge_s1_write,
                                         altmemddr_bridge_s1_writedata,
                                         cpu_data_master_granted_altmemddr_bridge_s1,
                                         cpu_data_master_qualified_request_altmemddr_bridge_s1,
                                         cpu_data_master_read_data_valid_altmemddr_bridge_s1,
                                         cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                         cpu_data_master_requests_altmemddr_bridge_s1,
                                         cpu_instruction_master_granted_altmemddr_bridge_s1,
                                         cpu_instruction_master_qualified_request_altmemddr_bridge_s1,
                                         cpu_instruction_master_read_data_valid_altmemddr_bridge_s1,
                                         cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                         cpu_instruction_master_requests_altmemddr_bridge_s1,
                                         d1_altmemddr_bridge_s1_end_xfer,
                                         sgdma_rx_m_write_granted_altmemddr_bridge_s1,
                                         sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1,
                                         sgdma_rx_m_write_requests_altmemddr_bridge_s1,
                                         sgdma_tx_m_read_granted_altmemddr_bridge_s1,
                                         sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1,
                                         sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1,
                                         sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register,
                                         sgdma_tx_m_read_requests_altmemddr_bridge_s1
                                      )
;

  output  [ 23: 0] altmemddr_bridge_s1_address;
  output  [  3: 0] altmemddr_bridge_s1_byteenable;
  output           altmemddr_bridge_s1_endofpacket_from_sa;
  output  [ 23: 0] altmemddr_bridge_s1_nativeaddress;
  output           altmemddr_bridge_s1_read;
  output  [ 31: 0] altmemddr_bridge_s1_readdata_from_sa;
  output           altmemddr_bridge_s1_reset_n;
  output           altmemddr_bridge_s1_waitrequest_from_sa;
  output           altmemddr_bridge_s1_write;
  output  [ 31: 0] altmemddr_bridge_s1_writedata;
  output           cpu_data_master_granted_altmemddr_bridge_s1;
  output           cpu_data_master_qualified_request_altmemddr_bridge_s1;
  output           cpu_data_master_read_data_valid_altmemddr_bridge_s1;
  output           cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  output           cpu_data_master_requests_altmemddr_bridge_s1;
  output           cpu_instruction_master_granted_altmemddr_bridge_s1;
  output           cpu_instruction_master_qualified_request_altmemddr_bridge_s1;
  output           cpu_instruction_master_read_data_valid_altmemddr_bridge_s1;
  output           cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  output           cpu_instruction_master_requests_altmemddr_bridge_s1;
  output           d1_altmemddr_bridge_s1_end_xfer;
  output           sgdma_rx_m_write_granted_altmemddr_bridge_s1;
  output           sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1;
  output           sgdma_rx_m_write_requests_altmemddr_bridge_s1;
  output           sgdma_tx_m_read_granted_altmemddr_bridge_s1;
  output           sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1;
  output           sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1;
  output           sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register;
  output           sgdma_tx_m_read_requests_altmemddr_bridge_s1;
  input            altmemddr_bridge_s1_endofpacket;
  input   [ 31: 0] altmemddr_bridge_s1_readdata;
  input            altmemddr_bridge_s1_readdatavalid;
  input            altmemddr_bridge_s1_waitrequest;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 28: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_m_write_address_to_slave;
  input   [  3: 0] sgdma_rx_m_write_byteenable;
  input            sgdma_rx_m_write_write;
  input   [ 31: 0] sgdma_rx_m_write_writedata;
  input   [ 31: 0] sgdma_tx_m_read_address_to_slave;
  input            sgdma_tx_m_read_latency_counter;
  input            sgdma_tx_m_read_read;

  wire    [ 23: 0] altmemddr_bridge_s1_address;
  wire             altmemddr_bridge_s1_allgrants;
  wire             altmemddr_bridge_s1_allow_new_arb_cycle;
  wire             altmemddr_bridge_s1_any_bursting_master_saved_grant;
  wire             altmemddr_bridge_s1_any_continuerequest;
  reg     [  3: 0] altmemddr_bridge_s1_arb_addend;
  wire             altmemddr_bridge_s1_arb_counter_enable;
  reg     [  1: 0] altmemddr_bridge_s1_arb_share_counter;
  wire    [  1: 0] altmemddr_bridge_s1_arb_share_counter_next_value;
  wire    [  1: 0] altmemddr_bridge_s1_arb_share_set_values;
  wire    [  3: 0] altmemddr_bridge_s1_arb_winner;
  wire             altmemddr_bridge_s1_arbitration_holdoff_internal;
  wire             altmemddr_bridge_s1_beginbursttransfer_internal;
  wire             altmemddr_bridge_s1_begins_xfer;
  wire    [  3: 0] altmemddr_bridge_s1_byteenable;
  wire    [  7: 0] altmemddr_bridge_s1_chosen_master_double_vector;
  wire    [  3: 0] altmemddr_bridge_s1_chosen_master_rot_left;
  wire             altmemddr_bridge_s1_end_xfer;
  wire             altmemddr_bridge_s1_endofpacket_from_sa;
  wire             altmemddr_bridge_s1_firsttransfer;
  wire    [  3: 0] altmemddr_bridge_s1_grant_vector;
  wire             altmemddr_bridge_s1_in_a_read_cycle;
  wire             altmemddr_bridge_s1_in_a_write_cycle;
  wire    [  3: 0] altmemddr_bridge_s1_master_qreq_vector;
  wire             altmemddr_bridge_s1_move_on_to_next_transaction;
  wire    [ 23: 0] altmemddr_bridge_s1_nativeaddress;
  wire             altmemddr_bridge_s1_non_bursting_master_requests;
  wire             altmemddr_bridge_s1_read;
  wire    [ 31: 0] altmemddr_bridge_s1_readdata_from_sa;
  wire             altmemddr_bridge_s1_readdatavalid_from_sa;
  reg              altmemddr_bridge_s1_reg_firsttransfer;
  wire             altmemddr_bridge_s1_reset_n;
  reg     [  3: 0] altmemddr_bridge_s1_saved_chosen_master_vector;
  reg              altmemddr_bridge_s1_slavearbiterlockenable;
  wire             altmemddr_bridge_s1_slavearbiterlockenable2;
  wire             altmemddr_bridge_s1_unreg_firsttransfer;
  wire             altmemddr_bridge_s1_waitrequest_from_sa;
  wire             altmemddr_bridge_s1_waits_for_read;
  wire             altmemddr_bridge_s1_waits_for_write;
  wire             altmemddr_bridge_s1_write;
  wire    [ 31: 0] altmemddr_bridge_s1_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_altmemddr_bridge_s1;
  wire             cpu_data_master_qualified_request_altmemddr_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_altmemddr_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_altmemddr_bridge_s1;
  wire             cpu_data_master_read_data_valid_altmemddr_bridge_s1;
  wire             cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  wire             cpu_data_master_requests_altmemddr_bridge_s1;
  wire             cpu_data_master_saved_grant_altmemddr_bridge_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_altmemddr_bridge_s1;
  wire             cpu_instruction_master_qualified_request_altmemddr_bridge_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_altmemddr_bridge_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_altmemddr_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_altmemddr_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  wire             cpu_instruction_master_requests_altmemddr_bridge_s1;
  wire             cpu_instruction_master_saved_grant_altmemddr_bridge_s1;
  reg              d1_altmemddr_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_altmemddr_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1;
  reg              last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1;
  reg              last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_arbiterlock;
  wire             sgdma_rx_m_write_arbiterlock2;
  wire             sgdma_rx_m_write_continuerequest;
  wire             sgdma_rx_m_write_granted_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_requests_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_saved_grant_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_arbiterlock;
  wire             sgdma_tx_m_read_arbiterlock2;
  wire             sgdma_tx_m_read_continuerequest;
  wire             sgdma_tx_m_read_granted_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_rdv_fifo_empty_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_rdv_fifo_output_from_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register;
  wire             sgdma_tx_m_read_requests_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_saved_grant_altmemddr_bridge_s1;
  wire    [ 28: 0] shifted_address_to_altmemddr_bridge_s1_from_cpu_data_master;
  wire    [ 28: 0] shifted_address_to_altmemddr_bridge_s1_from_cpu_instruction_master;
  wire    [ 31: 0] shifted_address_to_altmemddr_bridge_s1_from_sgdma_rx_m_write;
  wire    [ 31: 0] shifted_address_to_altmemddr_bridge_s1_from_sgdma_tx_m_read;
  wire             wait_for_altmemddr_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~altmemddr_bridge_s1_end_xfer;
    end


  assign altmemddr_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_altmemddr_bridge_s1 | cpu_instruction_master_qualified_request_altmemddr_bridge_s1 | sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1 | sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1));
  //assign altmemddr_bridge_s1_readdata_from_sa = altmemddr_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_bridge_s1_readdata_from_sa = altmemddr_bridge_s1_readdata;

  assign cpu_data_master_requests_altmemddr_bridge_s1 = ({cpu_data_master_address_to_slave[28 : 26] , 26'b0} == 29'hc000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign altmemddr_bridge_s1_waitrequest_from_sa = altmemddr_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_bridge_s1_waitrequest_from_sa = altmemddr_bridge_s1_waitrequest;

  //assign altmemddr_bridge_s1_readdatavalid_from_sa = altmemddr_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_bridge_s1_readdatavalid_from_sa = altmemddr_bridge_s1_readdatavalid;

  //altmemddr_bridge_s1_arb_share_counter set values, which is an e_mux
  assign altmemddr_bridge_s1_arb_share_set_values = 1;

  //altmemddr_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign altmemddr_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_altmemddr_bridge_s1 |
    cpu_instruction_master_requests_altmemddr_bridge_s1 |
    sgdma_rx_m_write_requests_altmemddr_bridge_s1 |
    sgdma_tx_m_read_requests_altmemddr_bridge_s1 |
    cpu_data_master_requests_altmemddr_bridge_s1 |
    cpu_instruction_master_requests_altmemddr_bridge_s1 |
    sgdma_rx_m_write_requests_altmemddr_bridge_s1 |
    sgdma_tx_m_read_requests_altmemddr_bridge_s1 |
    cpu_data_master_requests_altmemddr_bridge_s1 |
    cpu_instruction_master_requests_altmemddr_bridge_s1 |
    sgdma_rx_m_write_requests_altmemddr_bridge_s1 |
    sgdma_tx_m_read_requests_altmemddr_bridge_s1 |
    cpu_data_master_requests_altmemddr_bridge_s1 |
    cpu_instruction_master_requests_altmemddr_bridge_s1 |
    sgdma_rx_m_write_requests_altmemddr_bridge_s1 |
    sgdma_tx_m_read_requests_altmemddr_bridge_s1;

  //altmemddr_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign altmemddr_bridge_s1_any_bursting_master_saved_grant = 0;

  //altmemddr_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign altmemddr_bridge_s1_arb_share_counter_next_value = altmemddr_bridge_s1_firsttransfer ? (altmemddr_bridge_s1_arb_share_set_values - 1) : |altmemddr_bridge_s1_arb_share_counter ? (altmemddr_bridge_s1_arb_share_counter - 1) : 0;

  //altmemddr_bridge_s1_allgrants all slave grants, which is an e_mux
  assign altmemddr_bridge_s1_allgrants = (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector) |
    (|altmemddr_bridge_s1_grant_vector);

  //altmemddr_bridge_s1_end_xfer assignment, which is an e_assign
  assign altmemddr_bridge_s1_end_xfer = ~(altmemddr_bridge_s1_waits_for_read | altmemddr_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_altmemddr_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_altmemddr_bridge_s1 = altmemddr_bridge_s1_end_xfer & (~altmemddr_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //altmemddr_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign altmemddr_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_altmemddr_bridge_s1 & altmemddr_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_altmemddr_bridge_s1 & ~altmemddr_bridge_s1_non_bursting_master_requests);

  //altmemddr_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_s1_arb_share_counter <= 0;
      else if (altmemddr_bridge_s1_arb_counter_enable)
          altmemddr_bridge_s1_arb_share_counter <= altmemddr_bridge_s1_arb_share_counter_next_value;
    end


  //altmemddr_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|altmemddr_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_altmemddr_bridge_s1) | (end_xfer_arb_share_counter_term_altmemddr_bridge_s1 & ~altmemddr_bridge_s1_non_bursting_master_requests))
          altmemddr_bridge_s1_slavearbiterlockenable <= |altmemddr_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master altmemddr_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = altmemddr_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //altmemddr_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign altmemddr_bridge_s1_slavearbiterlockenable2 = |altmemddr_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master altmemddr_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = altmemddr_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master altmemddr_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = altmemddr_bridge_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master altmemddr_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = altmemddr_bridge_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted altmemddr_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1 <= cpu_instruction_master_saved_grant_altmemddr_bridge_s1 ? 1 : (altmemddr_bridge_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_altmemddr_bridge_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1 & cpu_instruction_master_requests_altmemddr_bridge_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1 & cpu_instruction_master_requests_altmemddr_bridge_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_altmemddr_bridge_s1 & cpu_instruction_master_requests_altmemddr_bridge_s1);

  //altmemddr_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign altmemddr_bridge_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    sgdma_rx_m_write_continuerequest |
    sgdma_tx_m_read_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_rx_m_write_continuerequest |
    sgdma_tx_m_read_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    sgdma_tx_m_read_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    sgdma_rx_m_write_continuerequest;

  //sgdma_rx/m_write altmemddr_bridge/s1 arbiterlock, which is an e_assign
  assign sgdma_rx_m_write_arbiterlock = altmemddr_bridge_s1_slavearbiterlockenable & sgdma_rx_m_write_continuerequest;

  //sgdma_rx/m_write altmemddr_bridge/s1 arbiterlock2, which is an e_assign
  assign sgdma_rx_m_write_arbiterlock2 = altmemddr_bridge_s1_slavearbiterlockenable2 & sgdma_rx_m_write_continuerequest;

  //sgdma_rx/m_write granted altmemddr_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1 <= 0;
      else 
        last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1 <= sgdma_rx_m_write_saved_grant_altmemddr_bridge_s1 ? 1 : (altmemddr_bridge_s1_arbitration_holdoff_internal | ~sgdma_rx_m_write_requests_altmemddr_bridge_s1) ? 0 : last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1;
    end


  //sgdma_rx_m_write_continuerequest continued request, which is an e_mux
  assign sgdma_rx_m_write_continuerequest = (last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1 & sgdma_rx_m_write_requests_altmemddr_bridge_s1) |
    (last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1 & sgdma_rx_m_write_requests_altmemddr_bridge_s1) |
    (last_cycle_sgdma_rx_m_write_granted_slave_altmemddr_bridge_s1 & sgdma_rx_m_write_requests_altmemddr_bridge_s1);

  //sgdma_tx/m_read altmemddr_bridge/s1 arbiterlock, which is an e_assign
  assign sgdma_tx_m_read_arbiterlock = altmemddr_bridge_s1_slavearbiterlockenable & sgdma_tx_m_read_continuerequest;

  //sgdma_tx/m_read altmemddr_bridge/s1 arbiterlock2, which is an e_assign
  assign sgdma_tx_m_read_arbiterlock2 = altmemddr_bridge_s1_slavearbiterlockenable2 & sgdma_tx_m_read_continuerequest;

  //sgdma_tx/m_read granted altmemddr_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1 <= 0;
      else 
        last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1 <= sgdma_tx_m_read_saved_grant_altmemddr_bridge_s1 ? 1 : (altmemddr_bridge_s1_arbitration_holdoff_internal | ~sgdma_tx_m_read_requests_altmemddr_bridge_s1) ? 0 : last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1;
    end


  //sgdma_tx_m_read_continuerequest continued request, which is an e_mux
  assign sgdma_tx_m_read_continuerequest = (last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1 & sgdma_tx_m_read_requests_altmemddr_bridge_s1) |
    (last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1 & sgdma_tx_m_read_requests_altmemddr_bridge_s1) |
    (last_cycle_sgdma_tx_m_read_granted_slave_altmemddr_bridge_s1 & sgdma_tx_m_read_requests_altmemddr_bridge_s1);

  assign cpu_data_master_qualified_request_altmemddr_bridge_s1 = cpu_data_master_requests_altmemddr_bridge_s1 & ~((cpu_data_master_read & (~cpu_data_master_waitrequest | (|cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock | sgdma_rx_m_write_arbiterlock | sgdma_tx_m_read_arbiterlock);
  //unique name for altmemddr_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign altmemddr_bridge_s1_move_on_to_next_transaction = altmemddr_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_altmemddr_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_altmemddr_bridge_s1_module rdv_fifo_for_cpu_data_master_to_altmemddr_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_altmemddr_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_altmemddr_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_altmemddr_bridge_s1),
      .full                 (),
      .read                 (altmemddr_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~altmemddr_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_altmemddr_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_altmemddr_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_altmemddr_bridge_s1 = (altmemddr_bridge_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_altmemddr_bridge_s1) & ~ cpu_data_master_rdv_fifo_empty_altmemddr_bridge_s1;

  //altmemddr_bridge_s1_writedata mux, which is an e_mux
  assign altmemddr_bridge_s1_writedata = (cpu_data_master_granted_altmemddr_bridge_s1)? cpu_data_master_writedata :
    sgdma_rx_m_write_writedata;

  //assign altmemddr_bridge_s1_endofpacket_from_sa = altmemddr_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altmemddr_bridge_s1_endofpacket_from_sa = altmemddr_bridge_s1_endofpacket;

  assign cpu_instruction_master_requests_altmemddr_bridge_s1 = (({cpu_instruction_master_address_to_slave[28 : 26] , 26'b0} == 29'hc000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted altmemddr_bridge/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1 <= cpu_data_master_saved_grant_altmemddr_bridge_s1 ? 1 : (altmemddr_bridge_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_altmemddr_bridge_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1 & cpu_data_master_requests_altmemddr_bridge_s1) |
    (last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1 & cpu_data_master_requests_altmemddr_bridge_s1) |
    (last_cycle_cpu_data_master_granted_slave_altmemddr_bridge_s1 & cpu_data_master_requests_altmemddr_bridge_s1);

  assign cpu_instruction_master_qualified_request_altmemddr_bridge_s1 = cpu_instruction_master_requests_altmemddr_bridge_s1 & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock | sgdma_rx_m_write_arbiterlock | sgdma_tx_m_read_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_altmemddr_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_altmemddr_bridge_s1_module rdv_fifo_for_cpu_instruction_master_to_altmemddr_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_altmemddr_bridge_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_altmemddr_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_altmemddr_bridge_s1),
      .full                 (),
      .read                 (altmemddr_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~altmemddr_bridge_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_altmemddr_bridge_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_altmemddr_bridge_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_altmemddr_bridge_s1 = (altmemddr_bridge_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_altmemddr_bridge_s1) & ~ cpu_instruction_master_rdv_fifo_empty_altmemddr_bridge_s1;

  assign sgdma_rx_m_write_requests_altmemddr_bridge_s1 = (({sgdma_rx_m_write_address_to_slave[31 : 26] , 26'b0} == 32'hc000000) & (sgdma_rx_m_write_write)) & sgdma_rx_m_write_write;
  assign sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1 = sgdma_rx_m_write_requests_altmemddr_bridge_s1 & ~(cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | sgdma_tx_m_read_arbiterlock);
  assign sgdma_tx_m_read_requests_altmemddr_bridge_s1 = (({sgdma_tx_m_read_address_to_slave[31 : 26] , 26'b0} == 32'hc000000) & (sgdma_tx_m_read_read)) & sgdma_tx_m_read_read;
  assign sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1 = sgdma_tx_m_read_requests_altmemddr_bridge_s1 & ~((sgdma_tx_m_read_read & ((sgdma_tx_m_read_latency_counter != 0) | (1 < sgdma_tx_m_read_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | sgdma_rx_m_write_arbiterlock);
  //rdv_fifo_for_sgdma_tx_m_read_to_altmemddr_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_sgdma_tx_m_read_to_altmemddr_bridge_s1_module rdv_fifo_for_sgdma_tx_m_read_to_altmemddr_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (sgdma_tx_m_read_granted_altmemddr_bridge_s1),
      .data_out             (sgdma_tx_m_read_rdv_fifo_output_from_altmemddr_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (sgdma_tx_m_read_rdv_fifo_empty_altmemddr_bridge_s1),
      .full                 (),
      .read                 (altmemddr_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~altmemddr_bridge_s1_waits_for_read)
    );

  assign sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register = ~sgdma_tx_m_read_rdv_fifo_empty_altmemddr_bridge_s1;
  //local readdatavalid sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1, which is an e_mux
  assign sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1 = (altmemddr_bridge_s1_readdatavalid_from_sa & sgdma_tx_m_read_rdv_fifo_output_from_altmemddr_bridge_s1) & ~ sgdma_tx_m_read_rdv_fifo_empty_altmemddr_bridge_s1;

  //allow new arb cycle for altmemddr_bridge/s1, which is an e_assign
  assign altmemddr_bridge_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~sgdma_rx_m_write_arbiterlock & ~sgdma_tx_m_read_arbiterlock;

  //sgdma_tx/m_read assignment into master qualified-requests vector for altmemddr_bridge/s1, which is an e_assign
  assign altmemddr_bridge_s1_master_qreq_vector[0] = sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1;

  //sgdma_tx/m_read grant altmemddr_bridge/s1, which is an e_assign
  assign sgdma_tx_m_read_granted_altmemddr_bridge_s1 = altmemddr_bridge_s1_grant_vector[0];

  //sgdma_tx/m_read saved-grant altmemddr_bridge/s1, which is an e_assign
  assign sgdma_tx_m_read_saved_grant_altmemddr_bridge_s1 = altmemddr_bridge_s1_arb_winner[0] && sgdma_tx_m_read_requests_altmemddr_bridge_s1;

  //sgdma_rx/m_write assignment into master qualified-requests vector for altmemddr_bridge/s1, which is an e_assign
  assign altmemddr_bridge_s1_master_qreq_vector[1] = sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1;

  //sgdma_rx/m_write grant altmemddr_bridge/s1, which is an e_assign
  assign sgdma_rx_m_write_granted_altmemddr_bridge_s1 = altmemddr_bridge_s1_grant_vector[1];

  //sgdma_rx/m_write saved-grant altmemddr_bridge/s1, which is an e_assign
  assign sgdma_rx_m_write_saved_grant_altmemddr_bridge_s1 = altmemddr_bridge_s1_arb_winner[1] && sgdma_rx_m_write_requests_altmemddr_bridge_s1;

  //cpu/instruction_master assignment into master qualified-requests vector for altmemddr_bridge/s1, which is an e_assign
  assign altmemddr_bridge_s1_master_qreq_vector[2] = cpu_instruction_master_qualified_request_altmemddr_bridge_s1;

  //cpu/instruction_master grant altmemddr_bridge/s1, which is an e_assign
  assign cpu_instruction_master_granted_altmemddr_bridge_s1 = altmemddr_bridge_s1_grant_vector[2];

  //cpu/instruction_master saved-grant altmemddr_bridge/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_altmemddr_bridge_s1 = altmemddr_bridge_s1_arb_winner[2] && cpu_instruction_master_requests_altmemddr_bridge_s1;

  //cpu/data_master assignment into master qualified-requests vector for altmemddr_bridge/s1, which is an e_assign
  assign altmemddr_bridge_s1_master_qreq_vector[3] = cpu_data_master_qualified_request_altmemddr_bridge_s1;

  //cpu/data_master grant altmemddr_bridge/s1, which is an e_assign
  assign cpu_data_master_granted_altmemddr_bridge_s1 = altmemddr_bridge_s1_grant_vector[3];

  //cpu/data_master saved-grant altmemddr_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_altmemddr_bridge_s1 = altmemddr_bridge_s1_arb_winner[3] && cpu_data_master_requests_altmemddr_bridge_s1;

  //altmemddr_bridge/s1 chosen-master double-vector, which is an e_assign
  assign altmemddr_bridge_s1_chosen_master_double_vector = {altmemddr_bridge_s1_master_qreq_vector, altmemddr_bridge_s1_master_qreq_vector} & ({~altmemddr_bridge_s1_master_qreq_vector, ~altmemddr_bridge_s1_master_qreq_vector} + altmemddr_bridge_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign altmemddr_bridge_s1_arb_winner = (altmemddr_bridge_s1_allow_new_arb_cycle & | altmemddr_bridge_s1_grant_vector) ? altmemddr_bridge_s1_grant_vector : altmemddr_bridge_s1_saved_chosen_master_vector;

  //saved altmemddr_bridge_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_s1_saved_chosen_master_vector <= 0;
      else if (altmemddr_bridge_s1_allow_new_arb_cycle)
          altmemddr_bridge_s1_saved_chosen_master_vector <= |altmemddr_bridge_s1_grant_vector ? altmemddr_bridge_s1_grant_vector : altmemddr_bridge_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign altmemddr_bridge_s1_grant_vector = {(altmemddr_bridge_s1_chosen_master_double_vector[3] | altmemddr_bridge_s1_chosen_master_double_vector[7]),
    (altmemddr_bridge_s1_chosen_master_double_vector[2] | altmemddr_bridge_s1_chosen_master_double_vector[6]),
    (altmemddr_bridge_s1_chosen_master_double_vector[1] | altmemddr_bridge_s1_chosen_master_double_vector[5]),
    (altmemddr_bridge_s1_chosen_master_double_vector[0] | altmemddr_bridge_s1_chosen_master_double_vector[4])};

  //altmemddr_bridge/s1 chosen master rotated left, which is an e_assign
  assign altmemddr_bridge_s1_chosen_master_rot_left = (altmemddr_bridge_s1_arb_winner << 1) ? (altmemddr_bridge_s1_arb_winner << 1) : 1;

  //altmemddr_bridge/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_s1_arb_addend <= 1;
      else if (|altmemddr_bridge_s1_grant_vector)
          altmemddr_bridge_s1_arb_addend <= altmemddr_bridge_s1_end_xfer? altmemddr_bridge_s1_chosen_master_rot_left : altmemddr_bridge_s1_grant_vector;
    end


  //altmemddr_bridge_s1_reset_n assignment, which is an e_assign
  assign altmemddr_bridge_s1_reset_n = reset_n;

  //altmemddr_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign altmemddr_bridge_s1_firsttransfer = altmemddr_bridge_s1_begins_xfer ? altmemddr_bridge_s1_unreg_firsttransfer : altmemddr_bridge_s1_reg_firsttransfer;

  //altmemddr_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign altmemddr_bridge_s1_unreg_firsttransfer = ~(altmemddr_bridge_s1_slavearbiterlockenable & altmemddr_bridge_s1_any_continuerequest);

  //altmemddr_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (altmemddr_bridge_s1_begins_xfer)
          altmemddr_bridge_s1_reg_firsttransfer <= altmemddr_bridge_s1_unreg_firsttransfer;
    end


  //altmemddr_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign altmemddr_bridge_s1_beginbursttransfer_internal = altmemddr_bridge_s1_begins_xfer;

  //altmemddr_bridge_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign altmemddr_bridge_s1_arbitration_holdoff_internal = altmemddr_bridge_s1_begins_xfer & altmemddr_bridge_s1_firsttransfer;

  //altmemddr_bridge_s1_read assignment, which is an e_mux
  assign altmemddr_bridge_s1_read = (cpu_data_master_granted_altmemddr_bridge_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_altmemddr_bridge_s1 & cpu_instruction_master_read) | (sgdma_tx_m_read_granted_altmemddr_bridge_s1 & sgdma_tx_m_read_read);

  //altmemddr_bridge_s1_write assignment, which is an e_mux
  assign altmemddr_bridge_s1_write = (cpu_data_master_granted_altmemddr_bridge_s1 & cpu_data_master_write) | (sgdma_rx_m_write_granted_altmemddr_bridge_s1 & sgdma_rx_m_write_write);

  assign shifted_address_to_altmemddr_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //altmemddr_bridge_s1_address mux, which is an e_mux
  assign altmemddr_bridge_s1_address = (cpu_data_master_granted_altmemddr_bridge_s1)? (shifted_address_to_altmemddr_bridge_s1_from_cpu_data_master >> 2) :
    (cpu_instruction_master_granted_altmemddr_bridge_s1)? (shifted_address_to_altmemddr_bridge_s1_from_cpu_instruction_master >> 2) :
    (sgdma_rx_m_write_granted_altmemddr_bridge_s1)? (shifted_address_to_altmemddr_bridge_s1_from_sgdma_rx_m_write >> 2) :
    (shifted_address_to_altmemddr_bridge_s1_from_sgdma_tx_m_read >> 2);

  assign shifted_address_to_altmemddr_bridge_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  assign shifted_address_to_altmemddr_bridge_s1_from_sgdma_rx_m_write = sgdma_rx_m_write_address_to_slave;
  assign shifted_address_to_altmemddr_bridge_s1_from_sgdma_tx_m_read = sgdma_tx_m_read_address_to_slave;
  //slaveid altmemddr_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign altmemddr_bridge_s1_nativeaddress = (cpu_data_master_granted_altmemddr_bridge_s1)? (cpu_data_master_address_to_slave >> 2) :
    (cpu_instruction_master_granted_altmemddr_bridge_s1)? (cpu_instruction_master_address_to_slave >> 2) :
    (sgdma_rx_m_write_granted_altmemddr_bridge_s1)? (sgdma_rx_m_write_address_to_slave >> 2) :
    (sgdma_tx_m_read_address_to_slave >> 2);

  //d1_altmemddr_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_altmemddr_bridge_s1_end_xfer <= 1;
      else 
        d1_altmemddr_bridge_s1_end_xfer <= altmemddr_bridge_s1_end_xfer;
    end


  //altmemddr_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign altmemddr_bridge_s1_waits_for_read = altmemddr_bridge_s1_in_a_read_cycle & altmemddr_bridge_s1_waitrequest_from_sa;

  //altmemddr_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign altmemddr_bridge_s1_in_a_read_cycle = (cpu_data_master_granted_altmemddr_bridge_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_altmemddr_bridge_s1 & cpu_instruction_master_read) | (sgdma_tx_m_read_granted_altmemddr_bridge_s1 & sgdma_tx_m_read_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = altmemddr_bridge_s1_in_a_read_cycle;

  //altmemddr_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign altmemddr_bridge_s1_waits_for_write = altmemddr_bridge_s1_in_a_write_cycle & altmemddr_bridge_s1_waitrequest_from_sa;

  //altmemddr_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign altmemddr_bridge_s1_in_a_write_cycle = (cpu_data_master_granted_altmemddr_bridge_s1 & cpu_data_master_write) | (sgdma_rx_m_write_granted_altmemddr_bridge_s1 & sgdma_rx_m_write_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = altmemddr_bridge_s1_in_a_write_cycle;

  assign wait_for_altmemddr_bridge_s1_counter = 0;
  //altmemddr_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign altmemddr_bridge_s1_byteenable = (cpu_data_master_granted_altmemddr_bridge_s1)? cpu_data_master_byteenable :
    (sgdma_rx_m_write_granted_altmemddr_bridge_s1)? sgdma_rx_m_write_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altmemddr_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_altmemddr_bridge_s1 + cpu_instruction_master_granted_altmemddr_bridge_s1 + sgdma_rx_m_write_granted_altmemddr_bridge_s1 + sgdma_tx_m_read_granted_altmemddr_bridge_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_altmemddr_bridge_s1 + cpu_instruction_master_saved_grant_altmemddr_bridge_s1 + sgdma_rx_m_write_saved_grant_altmemddr_bridge_s1 + sgdma_tx_m_read_saved_grant_altmemddr_bridge_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_module (
                                                                     // inputs:
                                                                      clear_fifo,
                                                                      clk,
                                                                      data_in,
                                                                      read,
                                                                      reset_n,
                                                                      sync_reset,
                                                                      write,

                                                                     // outputs:
                                                                      data_out,
                                                                      empty,
                                                                      fifo_contains_ones_n,
                                                                      full
                                                                   )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altmemddr_bridge_m1_arbitrator (
                                        // inputs:
                                         altmemddr_bridge_m1_address,
                                         altmemddr_bridge_m1_byteenable,
                                         altmemddr_bridge_m1_granted_altmemddr_s1,
                                         altmemddr_bridge_m1_qualified_request_altmemddr_s1,
                                         altmemddr_bridge_m1_read,
                                         altmemddr_bridge_m1_read_data_valid_altmemddr_s1,
                                         altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register,
                                         altmemddr_bridge_m1_requests_altmemddr_s1,
                                         altmemddr_bridge_m1_write,
                                         altmemddr_bridge_m1_writedata,
                                         altmemddr_s1_readdata_from_sa,
                                         altmemddr_s1_waitrequest_n_from_sa,
                                         clk,
                                         d1_altmemddr_s1_end_xfer,
                                         reset_n,

                                        // outputs:
                                         altmemddr_bridge_m1_address_to_slave,
                                         altmemddr_bridge_m1_latency_counter,
                                         altmemddr_bridge_m1_readdata,
                                         altmemddr_bridge_m1_readdatavalid,
                                         altmemddr_bridge_m1_reset_n,
                                         altmemddr_bridge_m1_waitrequest
                                      )
;

  output  [ 25: 0] altmemddr_bridge_m1_address_to_slave;
  output           altmemddr_bridge_m1_latency_counter;
  output  [ 31: 0] altmemddr_bridge_m1_readdata;
  output           altmemddr_bridge_m1_readdatavalid;
  output           altmemddr_bridge_m1_reset_n;
  output           altmemddr_bridge_m1_waitrequest;
  input   [ 25: 0] altmemddr_bridge_m1_address;
  input   [  3: 0] altmemddr_bridge_m1_byteenable;
  input            altmemddr_bridge_m1_granted_altmemddr_s1;
  input            altmemddr_bridge_m1_qualified_request_altmemddr_s1;
  input            altmemddr_bridge_m1_read;
  input            altmemddr_bridge_m1_read_data_valid_altmemddr_s1;
  input            altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register;
  input            altmemddr_bridge_m1_requests_altmemddr_s1;
  input            altmemddr_bridge_m1_write;
  input   [ 31: 0] altmemddr_bridge_m1_writedata;
  input   [ 63: 0] altmemddr_s1_readdata_from_sa;
  input            altmemddr_s1_waitrequest_n_from_sa;
  input            clk;
  input            d1_altmemddr_s1_end_xfer;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 25: 0] altmemddr_bridge_m1_address_last_time;
  wire    [ 25: 0] altmemddr_bridge_m1_address_to_slave;
  reg     [  3: 0] altmemddr_bridge_m1_byteenable_last_time;
  wire             altmemddr_bridge_m1_latency_counter;
  reg              altmemddr_bridge_m1_read_last_time;
  wire    [ 31: 0] altmemddr_bridge_m1_readdata;
  wire             altmemddr_bridge_m1_readdatavalid;
  wire             altmemddr_bridge_m1_reset_n;
  wire             altmemddr_bridge_m1_run;
  wire             altmemddr_bridge_m1_waitrequest;
  reg              altmemddr_bridge_m1_write_last_time;
  reg     [ 31: 0] altmemddr_bridge_m1_writedata_last_time;
  wire    [ 31: 0] altmemddr_s1_readdata_from_sa_part_selected_by_negative_dbs;
  wire             empty_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo;
  wire             full_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo;
  wire             pre_flush_altmemddr_bridge_m1_readdatavalid;
  wire             r_0;
  wire             read_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo;
  wire             selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_output;
  wire             selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_output_altmemddr_s1;
  wire             write_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (altmemddr_bridge_m1_qualified_request_altmemddr_s1 | ~altmemddr_bridge_m1_requests_altmemddr_s1) & ((~altmemddr_bridge_m1_qualified_request_altmemddr_s1 | ~(altmemddr_bridge_m1_read | altmemddr_bridge_m1_write) | (1 & altmemddr_s1_waitrequest_n_from_sa & (altmemddr_bridge_m1_read | altmemddr_bridge_m1_write)))) & ((~altmemddr_bridge_m1_qualified_request_altmemddr_s1 | ~(altmemddr_bridge_m1_read | altmemddr_bridge_m1_write) | (1 & altmemddr_s1_waitrequest_n_from_sa & (altmemddr_bridge_m1_read | altmemddr_bridge_m1_write))));

  //cascaded wait assignment, which is an e_assign
  assign altmemddr_bridge_m1_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign altmemddr_bridge_m1_address_to_slave = altmemddr_bridge_m1_address[25 : 0];

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_altmemddr_bridge_m1_readdatavalid = altmemddr_bridge_m1_read_data_valid_altmemddr_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign altmemddr_bridge_m1_readdatavalid = 0 |
    pre_flush_altmemddr_bridge_m1_readdatavalid;

  //Negative Dynamic Bus-sizing mux.
  //this mux selects the correct half of the 
  //wide data coming from the slave altmemddr/s1 
  assign altmemddr_s1_readdata_from_sa_part_selected_by_negative_dbs = ((selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_output_altmemddr_s1 == 0))? altmemddr_s1_readdata_from_sa[31 : 0] :
    altmemddr_s1_readdata_from_sa[63 : 32];

  //read_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo fifo read, which is an e_mux
  assign read_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo = altmemddr_bridge_m1_read_data_valid_altmemddr_s1;

  //write_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo fifo write, which is an e_mux
  assign write_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo = altmemddr_bridge_m1_read & altmemddr_bridge_m1_run & altmemddr_bridge_m1_requests_altmemddr_s1;

  assign selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_output_altmemddr_s1 = selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_output;
  //selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo, which is an e_fifo_with_registered_outputs
  selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_module selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (altmemddr_bridge_m1_address_to_slave[2]),
      .data_out             (selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo_output),
      .empty                (empty_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo),
      .fifo_contains_ones_n (),
      .full                 (full_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo),
      .read                 (read_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (write_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo)
    );

  //altmemddr_bridge/m1 readdata mux, which is an e_mux
  assign altmemddr_bridge_m1_readdata = altmemddr_s1_readdata_from_sa_part_selected_by_negative_dbs;

  //actual waitrequest port, which is an e_assign
  assign altmemddr_bridge_m1_waitrequest = ~altmemddr_bridge_m1_run;

  //latent max counter, which is an e_assign
  assign altmemddr_bridge_m1_latency_counter = 0;

  //altmemddr_bridge_m1_reset_n assignment, which is an e_assign
  assign altmemddr_bridge_m1_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altmemddr_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_m1_address_last_time <= 0;
      else 
        altmemddr_bridge_m1_address_last_time <= altmemddr_bridge_m1_address;
    end


  //altmemddr_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= altmemddr_bridge_m1_waitrequest & (altmemddr_bridge_m1_read | altmemddr_bridge_m1_write);
    end


  //altmemddr_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (altmemddr_bridge_m1_address != altmemddr_bridge_m1_address_last_time))
        begin
          $write("%0d ns: altmemddr_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //altmemddr_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_m1_byteenable_last_time <= 0;
      else 
        altmemddr_bridge_m1_byteenable_last_time <= altmemddr_bridge_m1_byteenable;
    end


  //altmemddr_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (altmemddr_bridge_m1_byteenable != altmemddr_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: altmemddr_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //altmemddr_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_m1_read_last_time <= 0;
      else 
        altmemddr_bridge_m1_read_last_time <= altmemddr_bridge_m1_read;
    end


  //altmemddr_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (altmemddr_bridge_m1_read != altmemddr_bridge_m1_read_last_time))
        begin
          $write("%0d ns: altmemddr_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //altmemddr_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_m1_write_last_time <= 0;
      else 
        altmemddr_bridge_m1_write_last_time <= altmemddr_bridge_m1_write;
    end


  //altmemddr_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (altmemddr_bridge_m1_write != altmemddr_bridge_m1_write_last_time))
        begin
          $write("%0d ns: altmemddr_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //altmemddr_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altmemddr_bridge_m1_writedata_last_time <= 0;
      else 
        altmemddr_bridge_m1_writedata_last_time <= altmemddr_bridge_m1_writedata;
    end


  //altmemddr_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (altmemddr_bridge_m1_writedata != altmemddr_bridge_m1_writedata_last_time) & altmemddr_bridge_m1_write)
        begin
          $write("%0d ns: altmemddr_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end


  //selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo read when empty, which is an e_process
  always @(posedge clk)
    begin
      if (empty_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo & read_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo)
        begin
          $write("%0d ns: altmemddr_bridge/m1 negative rdv fifo selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo: read AND empty.\n", $time);
          $stop;
        end
    end


  //selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo write when full, which is an e_process
  always @(posedge clk)
    begin
      if (full_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo & write_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo & ~read_selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo)
        begin
          $write("%0d ns: altmemddr_bridge/m1 negative rdv fifo selecto_nrdv_altmemddr_bridge_m1_1_altmemddr_s1_fifo: write AND full.\n", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altmemddr_bridge_bridge_arbitrator 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module button_pio_s1_arbitrator (
                                  // inputs:
                                   button_pio_s1_irq,
                                   button_pio_s1_readdata,
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   reset_n,

                                  // outputs:
                                   button_pio_s1_address,
                                   button_pio_s1_chipselect,
                                   button_pio_s1_irq_from_sa,
                                   button_pio_s1_readdata_from_sa,
                                   button_pio_s1_reset_n,
                                   button_pio_s1_write_n,
                                   button_pio_s1_writedata,
                                   cpu_data_master_granted_button_pio_s1,
                                   cpu_data_master_qualified_request_button_pio_s1,
                                   cpu_data_master_read_data_valid_button_pio_s1,
                                   cpu_data_master_requests_button_pio_s1,
                                   d1_button_pio_s1_end_xfer
                                )
;

  output  [  1: 0] button_pio_s1_address;
  output           button_pio_s1_chipselect;
  output           button_pio_s1_irq_from_sa;
  output  [ 31: 0] button_pio_s1_readdata_from_sa;
  output           button_pio_s1_reset_n;
  output           button_pio_s1_write_n;
  output  [ 31: 0] button_pio_s1_writedata;
  output           cpu_data_master_granted_button_pio_s1;
  output           cpu_data_master_qualified_request_button_pio_s1;
  output           cpu_data_master_read_data_valid_button_pio_s1;
  output           cpu_data_master_requests_button_pio_s1;
  output           d1_button_pio_s1_end_xfer;
  input            button_pio_s1_irq;
  input   [ 31: 0] button_pio_s1_readdata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] button_pio_s1_address;
  wire             button_pio_s1_allgrants;
  wire             button_pio_s1_allow_new_arb_cycle;
  wire             button_pio_s1_any_bursting_master_saved_grant;
  wire             button_pio_s1_any_continuerequest;
  wire             button_pio_s1_arb_counter_enable;
  reg     [  1: 0] button_pio_s1_arb_share_counter;
  wire    [  1: 0] button_pio_s1_arb_share_counter_next_value;
  wire    [  1: 0] button_pio_s1_arb_share_set_values;
  wire             button_pio_s1_beginbursttransfer_internal;
  wire             button_pio_s1_begins_xfer;
  wire             button_pio_s1_chipselect;
  wire             button_pio_s1_end_xfer;
  wire             button_pio_s1_firsttransfer;
  wire             button_pio_s1_grant_vector;
  wire             button_pio_s1_in_a_read_cycle;
  wire             button_pio_s1_in_a_write_cycle;
  wire             button_pio_s1_irq_from_sa;
  wire             button_pio_s1_master_qreq_vector;
  wire             button_pio_s1_non_bursting_master_requests;
  wire    [ 31: 0] button_pio_s1_readdata_from_sa;
  reg              button_pio_s1_reg_firsttransfer;
  wire             button_pio_s1_reset_n;
  reg              button_pio_s1_slavearbiterlockenable;
  wire             button_pio_s1_slavearbiterlockenable2;
  wire             button_pio_s1_unreg_firsttransfer;
  wire             button_pio_s1_waits_for_read;
  wire             button_pio_s1_waits_for_write;
  wire             button_pio_s1_write_n;
  wire    [ 31: 0] button_pio_s1_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_button_pio_s1;
  wire             cpu_data_master_qualified_request_button_pio_s1;
  wire             cpu_data_master_read_data_valid_button_pio_s1;
  wire             cpu_data_master_requests_button_pio_s1;
  wire             cpu_data_master_saved_grant_button_pio_s1;
  reg              d1_button_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_button_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_button_pio_s1_from_cpu_data_master;
  wire             wait_for_button_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~button_pio_s1_end_xfer;
    end


  assign button_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_button_pio_s1));
  //assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata;

  assign cpu_data_master_requests_button_pio_s1 = ({cpu_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10022c80) & (cpu_data_master_read | cpu_data_master_write);
  //button_pio_s1_arb_share_counter set values, which is an e_mux
  assign button_pio_s1_arb_share_set_values = 1;

  //button_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign button_pio_s1_non_bursting_master_requests = cpu_data_master_requests_button_pio_s1;

  //button_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign button_pio_s1_any_bursting_master_saved_grant = 0;

  //button_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign button_pio_s1_arb_share_counter_next_value = button_pio_s1_firsttransfer ? (button_pio_s1_arb_share_set_values - 1) : |button_pio_s1_arb_share_counter ? (button_pio_s1_arb_share_counter - 1) : 0;

  //button_pio_s1_allgrants all slave grants, which is an e_mux
  assign button_pio_s1_allgrants = |button_pio_s1_grant_vector;

  //button_pio_s1_end_xfer assignment, which is an e_assign
  assign button_pio_s1_end_xfer = ~(button_pio_s1_waits_for_read | button_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_button_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_button_pio_s1 = button_pio_s1_end_xfer & (~button_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //button_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign button_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_button_pio_s1 & button_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_button_pio_s1 & ~button_pio_s1_non_bursting_master_requests);

  //button_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_arb_share_counter <= 0;
      else if (button_pio_s1_arb_counter_enable)
          button_pio_s1_arb_share_counter <= button_pio_s1_arb_share_counter_next_value;
    end


  //button_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_slavearbiterlockenable <= 0;
      else if ((|button_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_button_pio_s1) | (end_xfer_arb_share_counter_term_button_pio_s1 & ~button_pio_s1_non_bursting_master_requests))
          button_pio_s1_slavearbiterlockenable <= |button_pio_s1_arb_share_counter_next_value;
    end


  //cpu/data_master button_pio/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = button_pio_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //button_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign button_pio_s1_slavearbiterlockenable2 = |button_pio_s1_arb_share_counter_next_value;

  //cpu/data_master button_pio/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = button_pio_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //button_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign button_pio_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_button_pio_s1 = cpu_data_master_requests_button_pio_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //button_pio_s1_writedata mux, which is an e_mux
  assign button_pio_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_button_pio_s1 = cpu_data_master_qualified_request_button_pio_s1;

  //cpu/data_master saved-grant button_pio/s1, which is an e_assign
  assign cpu_data_master_saved_grant_button_pio_s1 = cpu_data_master_requests_button_pio_s1;

  //allow new arb cycle for button_pio/s1, which is an e_assign
  assign button_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign button_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign button_pio_s1_master_qreq_vector = 1;

  //button_pio_s1_reset_n assignment, which is an e_assign
  assign button_pio_s1_reset_n = reset_n;

  assign button_pio_s1_chipselect = cpu_data_master_granted_button_pio_s1;
  //button_pio_s1_firsttransfer first transaction, which is an e_assign
  assign button_pio_s1_firsttransfer = button_pio_s1_begins_xfer ? button_pio_s1_unreg_firsttransfer : button_pio_s1_reg_firsttransfer;

  //button_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign button_pio_s1_unreg_firsttransfer = ~(button_pio_s1_slavearbiterlockenable & button_pio_s1_any_continuerequest);

  //button_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_reg_firsttransfer <= 1'b1;
      else if (button_pio_s1_begins_xfer)
          button_pio_s1_reg_firsttransfer <= button_pio_s1_unreg_firsttransfer;
    end


  //button_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign button_pio_s1_beginbursttransfer_internal = button_pio_s1_begins_xfer;

  //~button_pio_s1_write_n assignment, which is an e_mux
  assign button_pio_s1_write_n = ~(cpu_data_master_granted_button_pio_s1 & cpu_data_master_write);

  assign shifted_address_to_button_pio_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //button_pio_s1_address mux, which is an e_mux
  assign button_pio_s1_address = shifted_address_to_button_pio_s1_from_cpu_data_master >> 2;

  //d1_button_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_button_pio_s1_end_xfer <= 1;
      else 
        d1_button_pio_s1_end_xfer <= button_pio_s1_end_xfer;
    end


  //button_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign button_pio_s1_waits_for_read = button_pio_s1_in_a_read_cycle & button_pio_s1_begins_xfer;

  //button_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign button_pio_s1_in_a_read_cycle = cpu_data_master_granted_button_pio_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = button_pio_s1_in_a_read_cycle;

  //button_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign button_pio_s1_waits_for_write = button_pio_s1_in_a_write_cycle & 0;

  //button_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign button_pio_s1_in_a_write_cycle = cpu_data_master_granted_button_pio_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = button_pio_s1_in_a_write_cycle;

  assign wait_for_button_pio_s1_counter = 0;
  //assign button_pio_s1_irq_from_sa = button_pio_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign button_pio_s1_irq_from_sa = button_pio_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //button_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 28: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 28: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 28: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[28 : 11] , 11'b0} == 29'h10021800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[28 : 11] , 11'b0} == 29'h10021800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (|cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     altmemddr_bridge_s1_readdata_from_sa,
                                     altmemddr_bridge_s1_waitrequest_from_sa,
                                     button_pio_s1_irq_from_sa,
                                     button_pio_s1_readdata_from_sa,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable_ext_flash_s1,
                                     cpu_data_master_granted_altmemddr_bridge_s1,
                                     cpu_data_master_granted_button_pio_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                     cpu_data_master_granted_descriptor_memory_s1,
                                     cpu_data_master_granted_ext_flash_s1,
                                     cpu_data_master_granted_high_res_timer_s1,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_lcd_display_control_slave,
                                     cpu_data_master_granted_led_pio_s1,
                                     cpu_data_master_granted_onchip_ram_s1,
                                     cpu_data_master_granted_sgdma_rx_csr,
                                     cpu_data_master_granted_sgdma_tx_csr,
                                     cpu_data_master_granted_sys_clk_timer_s1,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_tse_mac_control_port,
                                     cpu_data_master_qualified_request_altmemddr_bridge_s1,
                                     cpu_data_master_qualified_request_button_pio_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                     cpu_data_master_qualified_request_descriptor_memory_s1,
                                     cpu_data_master_qualified_request_ext_flash_s1,
                                     cpu_data_master_qualified_request_high_res_timer_s1,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_lcd_display_control_slave,
                                     cpu_data_master_qualified_request_led_pio_s1,
                                     cpu_data_master_qualified_request_onchip_ram_s1,
                                     cpu_data_master_qualified_request_sgdma_rx_csr,
                                     cpu_data_master_qualified_request_sgdma_tx_csr,
                                     cpu_data_master_qualified_request_sys_clk_timer_s1,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_tse_mac_control_port,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_altmemddr_bridge_s1,
                                     cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_button_pio_s1,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                     cpu_data_master_read_data_valid_descriptor_memory_s1,
                                     cpu_data_master_read_data_valid_ext_flash_s1,
                                     cpu_data_master_read_data_valid_high_res_timer_s1,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_lcd_display_control_slave,
                                     cpu_data_master_read_data_valid_led_pio_s1,
                                     cpu_data_master_read_data_valid_onchip_ram_s1,
                                     cpu_data_master_read_data_valid_sgdma_rx_csr,
                                     cpu_data_master_read_data_valid_sgdma_tx_csr,
                                     cpu_data_master_read_data_valid_sys_clk_timer_s1,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_tse_mac_control_port,
                                     cpu_data_master_requests_altmemddr_bridge_s1,
                                     cpu_data_master_requests_button_pio_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                     cpu_data_master_requests_descriptor_memory_s1,
                                     cpu_data_master_requests_ext_flash_s1,
                                     cpu_data_master_requests_high_res_timer_s1,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_lcd_display_control_slave,
                                     cpu_data_master_requests_led_pio_s1,
                                     cpu_data_master_requests_onchip_ram_s1,
                                     cpu_data_master_requests_sgdma_rx_csr,
                                     cpu_data_master_requests_sgdma_tx_csr,
                                     cpu_data_master_requests_sys_clk_timer_s1,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_tse_mac_control_port,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa,
                                     cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa,
                                     d1_altmemddr_bridge_s1_end_xfer,
                                     d1_button_pio_s1_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer,
                                     d1_descriptor_memory_s1_end_xfer,
                                     d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                     d1_high_res_timer_s1_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_lcd_display_control_slave_end_xfer,
                                     d1_led_pio_s1_end_xfer,
                                     d1_onchip_ram_s1_end_xfer,
                                     d1_sgdma_rx_csr_end_xfer,
                                     d1_sgdma_tx_csr_end_xfer,
                                     d1_sys_clk_timer_s1_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_tse_mac_control_port_end_xfer,
                                     descriptor_memory_s1_readdata_from_sa,
                                     ext_flash_s1_wait_counter_eq_0,
                                     ext_flash_s1_wait_counter_eq_1,
                                     high_res_timer_s1_irq_from_sa,
                                     high_res_timer_s1_readdata_from_sa,
                                     incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     lcd_display_control_slave_readdata_from_sa,
                                     lcd_display_control_slave_wait_counter_eq_0,
                                     lcd_display_control_slave_wait_counter_eq_1,
                                     led_pio_s1_readdata_from_sa,
                                     onchip_ram_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_descriptor_memory_s1,
                                     registered_cpu_data_master_read_data_valid_ext_flash_s1,
                                     registered_cpu_data_master_read_data_valid_onchip_ram_s1,
                                     reset_n,
                                     sgdma_rx_csr_irq_from_sa,
                                     sgdma_rx_csr_readdata_from_sa,
                                     sgdma_tx_csr_irq_from_sa,
                                     sgdma_tx_csr_readdata_from_sa,
                                     sys_clk_timer_s1_irq_from_sa,
                                     sys_clk_timer_s1_readdata_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     tse_mac_control_port_readdata_from_sa,
                                     tse_mac_control_port_waitrequest_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_irq,
                                     cpu_data_master_no_byte_enables_and_last_term,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 28: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input   [ 31: 0] altmemddr_bridge_s1_readdata_from_sa;
  input            altmemddr_bridge_s1_waitrequest_from_sa;
  input            button_pio_s1_irq_from_sa;
  input   [ 31: 0] button_pio_s1_readdata_from_sa;
  input            clk;
  input   [ 28: 0] cpu_data_master_address;
  input   [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  input            cpu_data_master_granted_altmemddr_bridge_s1;
  input            cpu_data_master_granted_button_pio_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  input            cpu_data_master_granted_descriptor_memory_s1;
  input            cpu_data_master_granted_ext_flash_s1;
  input            cpu_data_master_granted_high_res_timer_s1;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_lcd_display_control_slave;
  input            cpu_data_master_granted_led_pio_s1;
  input            cpu_data_master_granted_onchip_ram_s1;
  input            cpu_data_master_granted_sgdma_rx_csr;
  input            cpu_data_master_granted_sgdma_tx_csr;
  input            cpu_data_master_granted_sys_clk_timer_s1;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_tse_mac_control_port;
  input            cpu_data_master_qualified_request_altmemddr_bridge_s1;
  input            cpu_data_master_qualified_request_button_pio_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  input            cpu_data_master_qualified_request_descriptor_memory_s1;
  input            cpu_data_master_qualified_request_ext_flash_s1;
  input            cpu_data_master_qualified_request_high_res_timer_s1;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_lcd_display_control_slave;
  input            cpu_data_master_qualified_request_led_pio_s1;
  input            cpu_data_master_qualified_request_onchip_ram_s1;
  input            cpu_data_master_qualified_request_sgdma_rx_csr;
  input            cpu_data_master_qualified_request_sgdma_tx_csr;
  input            cpu_data_master_qualified_request_sys_clk_timer_s1;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_tse_mac_control_port;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_altmemddr_bridge_s1;
  input            cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_button_pio_s1;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  input            cpu_data_master_read_data_valid_descriptor_memory_s1;
  input            cpu_data_master_read_data_valid_ext_flash_s1;
  input            cpu_data_master_read_data_valid_high_res_timer_s1;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_lcd_display_control_slave;
  input            cpu_data_master_read_data_valid_led_pio_s1;
  input            cpu_data_master_read_data_valid_onchip_ram_s1;
  input            cpu_data_master_read_data_valid_sgdma_rx_csr;
  input            cpu_data_master_read_data_valid_sgdma_tx_csr;
  input            cpu_data_master_read_data_valid_sys_clk_timer_s1;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_tse_mac_control_port;
  input            cpu_data_master_requests_altmemddr_bridge_s1;
  input            cpu_data_master_requests_button_pio_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  input            cpu_data_master_requests_descriptor_memory_s1;
  input            cpu_data_master_requests_ext_flash_s1;
  input            cpu_data_master_requests_high_res_timer_s1;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_lcd_display_control_slave;
  input            cpu_data_master_requests_led_pio_s1;
  input            cpu_data_master_requests_onchip_ram_s1;
  input            cpu_data_master_requests_sgdma_rx_csr;
  input            cpu_data_master_requests_sgdma_tx_csr;
  input            cpu_data_master_requests_sys_clk_timer_s1;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_tse_mac_control_port;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input   [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  input            d1_altmemddr_bridge_s1_end_xfer;
  input            d1_button_pio_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
  input            d1_descriptor_memory_s1_end_xfer;
  input            d1_flash_tristate_bridge_avalon_slave_end_xfer;
  input            d1_high_res_timer_s1_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_lcd_display_control_slave_end_xfer;
  input            d1_led_pio_s1_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            d1_sgdma_rx_csr_end_xfer;
  input            d1_sgdma_tx_csr_end_xfer;
  input            d1_sys_clk_timer_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_tse_mac_control_port_end_xfer;
  input   [ 31: 0] descriptor_memory_s1_readdata_from_sa;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input            high_res_timer_s1_irq_from_sa;
  input   [ 15: 0] high_res_timer_s1_readdata_from_sa;
  input   [ 15: 0] incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [  7: 0] lcd_display_control_slave_readdata_from_sa;
  input            lcd_display_control_slave_wait_counter_eq_0;
  input            lcd_display_control_slave_wait_counter_eq_1;
  input   [ 31: 0] led_pio_s1_readdata_from_sa;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_descriptor_memory_s1;
  input            registered_cpu_data_master_read_data_valid_ext_flash_s1;
  input            registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  input            reset_n;
  input            sgdma_rx_csr_irq_from_sa;
  input   [ 31: 0] sgdma_rx_csr_readdata_from_sa;
  input            sgdma_tx_csr_irq_from_sa;
  input   [ 31: 0] sgdma_tx_csr_readdata_from_sa;
  input            sys_clk_timer_s1_irq_from_sa;
  input   [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 31: 0] tse_mac_control_port_readdata_from_sa;
  input            tse_mac_control_port_waitrequest_from_sa;

  wire    [ 28: 0] cpu_data_master_address_to_slave;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              cpu_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_altmemddr_bridge_s1 | cpu_data_master_read_data_valid_altmemddr_bridge_s1 | ~cpu_data_master_requests_altmemddr_bridge_s1) & (cpu_data_master_granted_altmemddr_bridge_s1 | ~cpu_data_master_qualified_request_altmemddr_bridge_s1) & ((~cpu_data_master_qualified_request_altmemddr_bridge_s1 | ~cpu_data_master_read | (cpu_data_master_read_data_valid_altmemddr_bridge_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_altmemddr_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~altmemddr_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_button_pio_s1 | ~cpu_data_master_requests_button_pio_s1) & ((~cpu_data_master_qualified_request_button_pio_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_button_pio_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in | ~cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in) & ((~cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_descriptor_memory_s1 | registered_cpu_data_master_read_data_valid_descriptor_memory_s1 | ~cpu_data_master_requests_descriptor_memory_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_data_master_granted_descriptor_memory_s1 | ~cpu_data_master_qualified_request_descriptor_memory_s1) & ((~cpu_data_master_qualified_request_descriptor_memory_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_descriptor_memory_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_descriptor_memory_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_ext_flash_s1 | (registered_cpu_data_master_read_data_valid_ext_flash_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_ext_flash_s1) & (cpu_data_master_granted_ext_flash_s1 | ~cpu_data_master_qualified_request_ext_flash_s1) & ((~cpu_data_master_qualified_request_ext_flash_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_ext_flash_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_ext_flash_s1 | ~cpu_data_master_write | (1 & ext_flash_s1_wait_counter_eq_1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_requests_high_res_timer_s1) & ((~cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & ((~cpu_data_master_qualified_request_lcd_display_control_slave | ~cpu_data_master_read | (1 & lcd_display_control_slave_wait_counter_eq_1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_lcd_display_control_slave | ~cpu_data_master_write | (1 & lcd_display_control_slave_wait_counter_eq_1 & cpu_data_master_write))) & 1;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = (cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_requests_led_pio_s1) & ((~cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_onchip_ram_s1 | registered_cpu_data_master_read_data_valid_onchip_ram_s1 | ~cpu_data_master_requests_onchip_ram_s1) & (cpu_data_master_granted_onchip_ram_s1 | ~cpu_data_master_qualified_request_onchip_ram_s1) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_ram_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sgdma_rx_csr | ~cpu_data_master_requests_sgdma_rx_csr) & ((~cpu_data_master_qualified_request_sgdma_rx_csr | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sgdma_rx_csr | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sgdma_tx_csr | ~cpu_data_master_requests_sgdma_tx_csr) & ((~cpu_data_master_qualified_request_sgdma_tx_csr | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sgdma_tx_csr | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_requests_sys_clk_timer_s1) & ((~cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_tse_mac_control_port | ~cpu_data_master_requests_tse_mac_control_port) & ((~cpu_data_master_qualified_request_tse_mac_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~tse_mac_control_port_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_tse_mac_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~tse_mac_control_port_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[28 : 0];

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_altmemddr_bridge_s1}} | altmemddr_bridge_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in}} | cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_tse_mac_control_port}} | tse_mac_control_port_readdata_from_sa);

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_altmemddr_bridge_s1}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_button_pio_s1}} | button_pio_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_descriptor_memory_s1}} | descriptor_memory_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_ext_flash_s1}} | {incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_high_res_timer_s1}} | high_res_timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_lcd_display_control_slave}} | lcd_display_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_led_pio_s1}} | led_pio_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sgdma_rx_csr}} | sgdma_rx_csr_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sgdma_tx_csr}} | sgdma_tx_csr_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sys_clk_timer_s1}} | sys_clk_timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_tse_mac_control_port}} | registered_cpu_data_master_readdata);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    button_pio_s1_irq_from_sa,
    1'b0,
    1'b0,
    sys_clk_timer_s1_irq_from_sa,
    high_res_timer_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    1'b0,
    sgdma_tx_csr_irq_from_sa,
    sgdma_rx_csr_irq_from_sa};

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1;

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_ext_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1)) |
    cpu_data_master_read_data_valid_ext_flash_s1 |
    ((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_ext_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            altmemddr_bridge_s1_readdata_from_sa,
                                            altmemddr_bridge_s1_waitrequest_from_sa,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_altmemddr_bridge_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_ext_flash_s1,
                                            cpu_instruction_master_granted_onchip_ram_s1,
                                            cpu_instruction_master_qualified_request_altmemddr_bridge_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_ext_flash_s1,
                                            cpu_instruction_master_qualified_request_onchip_ram_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1,
                                            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_ext_flash_s1,
                                            cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                            cpu_instruction_master_requests_altmemddr_bridge_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_ext_flash_s1,
                                            cpu_instruction_master_requests_onchip_ram_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_altmemddr_bridge_s1_end_xfer,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                            d1_onchip_ram_s1_end_xfer,
                                            ext_flash_s1_wait_counter_eq_0,
                                            ext_flash_s1_wait_counter_eq_1,
                                            incoming_data_to_and_from_the_ext_flash,
                                            onchip_ram_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 28: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input   [ 31: 0] altmemddr_bridge_s1_readdata_from_sa;
  input            altmemddr_bridge_s1_waitrequest_from_sa;
  input            clk;
  input   [ 28: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_altmemddr_bridge_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_ext_flash_s1;
  input            cpu_instruction_master_granted_onchip_ram_s1;
  input            cpu_instruction_master_qualified_request_altmemddr_bridge_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_ext_flash_s1;
  input            cpu_instruction_master_qualified_request_onchip_ram_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1;
  input            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_ext_flash_s1;
  input            cpu_instruction_master_read_data_valid_onchip_ram_s1;
  input            cpu_instruction_master_requests_altmemddr_bridge_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_ext_flash_s1;
  input            cpu_instruction_master_requests_onchip_ram_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_altmemddr_bridge_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_flash_tristate_bridge_avalon_slave_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input   [ 15: 0] incoming_data_to_and_from_the_ext_flash;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 28: 0] cpu_instruction_master_address_last_time;
  wire    [ 28: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_altmemddr_bridge_s1 | ~cpu_instruction_master_requests_altmemddr_bridge_s1) & (cpu_instruction_master_granted_altmemddr_bridge_s1 | ~cpu_instruction_master_qualified_request_altmemddr_bridge_s1) & ((~cpu_instruction_master_qualified_request_altmemddr_bridge_s1 | ~cpu_instruction_master_read | (1 & ~altmemddr_bridge_s1_waitrequest_from_sa & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_ext_flash_s1 | ~cpu_instruction_master_requests_ext_flash_s1) & (cpu_instruction_master_granted_ext_flash_s1 | ~cpu_instruction_master_qualified_request_ext_flash_s1) & ((~cpu_instruction_master_qualified_request_ext_flash_s1 | ~cpu_instruction_master_read | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_requests_onchip_ram_s1) & (cpu_instruction_master_granted_onchip_ram_s1 | ~cpu_instruction_master_qualified_request_onchip_ram_s1) & ((~cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_read | (1 & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[28 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_altmemddr_bridge_s1 |
    cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_ext_flash_s1 |
    cpu_instruction_master_granted_onchip_ram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_altmemddr_bridge_s1 |
    (cpu_instruction_master_read_data_valid_ext_flash_s1 & dbs_rdv_counter_overflow) |
    cpu_instruction_master_read_data_valid_onchip_ram_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~cpu_instruction_master_read_data_valid_altmemddr_bridge_s1}} | altmemddr_bridge_s1_readdata_from_sa) &
    ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_ext_flash_s1}} | {incoming_data_to_and_from_the_ext_flash[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({2 {cpu_instruction_master_requests_ext_flash_s1}} & 2) |
    ({2 {cpu_instruction_master_requests_onchip_ram_s1}} & 1);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_data_to_and_from_the_ext_flash;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_ext_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_ext_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer});


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arbitrator (
                                                                         // inputs:
                                                                          clk,
                                                                          cpu_data_master_address_to_slave,
                                                                          cpu_data_master_byteenable,
                                                                          cpu_data_master_read,
                                                                          cpu_data_master_waitrequest,
                                                                          cpu_data_master_write,
                                                                          cpu_data_master_writedata,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest,
                                                                          reset_n,

                                                                         // outputs:
                                                                          cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                                                          cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                                                          cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                                                          cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write,
                                                                          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata,
                                                                          d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer
                                                                       )
;

  output           cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  output           cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  output           cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  output           cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  output  [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address;
  output  [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  output  [  2: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read;
  output  [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write;
  output  [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata;
  output           d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket;
  input   [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_saved_grant_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire    [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_allgrants;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_allow_new_arb_cycle;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_continuerequest;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_counter_enable;
  reg     [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter;
  wire    [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_set_values;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_beginbursttransfer_internal;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_begins_xfer;
  wire    [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_firsttransfer;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_grant_vector;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_read_cycle;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_write_cycle;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_master_qreq_vector;
  wire    [  2: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_non_bursting_master_requests;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  reg              cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reg_firsttransfer;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n;
  reg              cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_unreg_firsttransfer;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_read;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_write;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata;
  reg              d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_from_cpu_data_master;
  wire             wait_for_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
    end


  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in));
  //assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata;

  assign cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in = ({cpu_data_master_address_to_slave[28 : 5] , 5'b0} == 29'h10022c40) & (cpu_data_master_read | cpu_data_master_write);
  //assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter set values, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_set_values = 1;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant = 0;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_firsttransfer ? (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_set_values - 1) : |cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter ? (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter - 1) : 0;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_allgrants all slave grants, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_allgrants = |cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_grant_vector;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer = ~(cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_read | cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer & (~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_non_bursting_master_requests);

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter <= 0;
      else if (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_counter_enable)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in) | (end_xfer_arb_share_counter_term_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_non_bursting_master_requests))
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable <= |cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2 = |cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in = cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata = cpu_data_master_writedata;

  //assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in = cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;

  //cpu/data_master saved-grant cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in = cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;

  //allow new arb cycle for cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/in, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_master_qreq_vector = 1;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n = reset_n;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_firsttransfer = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_begins_xfer ? cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_unreg_firsttransfer : cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reg_firsttransfer;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_unreg_firsttransfer = ~(cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_slavearbiterlockenable & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_any_continuerequest);

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_begins_xfer)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reg_firsttransfer <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_unreg_firsttransfer;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_beginbursttransfer_internal = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_begins_xfer;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read assignment, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read = cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & cpu_data_master_read;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write assignment, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write = cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & cpu_data_master_write;

  assign shifted_address_to_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address = shifted_address_to_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_from_cpu_data_master >> 2;

  //slaveid cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer <= 1;
      else 
        d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_read = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_read_cycle & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_read_cycle = cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_read_cycle;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waits_for_write = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_write_cycle & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_write_cycle = cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_in_a_write_cycle;

  assign wait_for_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_counter = 0;
  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable = (cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_arbitrator (
                                                                          // inputs:
                                                                           clk,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata,
                                                                           d1_sys_pll_s1_end_xfer,
                                                                           reset_n,
                                                                           sys_pll_s1_readdata_from_sa,

                                                                          // outputs:
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n,
                                                                           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest
                                                                        )
;

  output  [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave;
  output  [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest;
  input            clk;
  input   [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address;
  input   [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write;
  input   [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata;
  input            d1_sys_pll_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] sys_pll_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_last_time;
  wire    [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave;
  reg     [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable_last_time;
  reg              cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_last_time;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_run;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest;
  reg              cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write_last_time;
  reg     [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata_last_time;
  wire             r_3;
  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & ((~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1 | ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read | (1 & ~d1_sys_pll_s1_end_xfer & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read))) & ((~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1 | ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write | (1 & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_run = r_3;

  //optimize select-logic by passing only those address bits which matter.
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/out readdata mux, which is an e_mux
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata = sys_pll_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest = ~cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_run;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n assignment, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_last_time <= 0;
      else 
        cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_last_time <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read | cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write);
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address != cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_last_time))
        begin
          $write("%0d ns: cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable_last_time <= 0;
      else 
        cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable_last_time <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable != cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_last_time <= 0;
      else 
        cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_last_time <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read != cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_last_time))
        begin
          $write("%0d ns: cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write_last_time <= 0;
      else 
        cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write_last_time <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write != cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write_last_time))
        begin
          $write("%0d ns: cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata_last_time <= 0;
      else 
        cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata_last_time <= cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata != cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata_last_time) & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write)
        begin
          $write("%0d ns: cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module descriptor_memory_s1_arbitrator (
                                         // inputs:
                                          clk,
                                          cpu_data_master_address_to_slave,
                                          cpu_data_master_byteenable,
                                          cpu_data_master_read,
                                          cpu_data_master_waitrequest,
                                          cpu_data_master_write,
                                          cpu_data_master_writedata,
                                          descriptor_memory_s1_readdata,
                                          reset_n,
                                          sgdma_rx_descriptor_read_address_to_slave,
                                          sgdma_rx_descriptor_read_latency_counter,
                                          sgdma_rx_descriptor_read_read,
                                          sgdma_rx_descriptor_write_address_to_slave,
                                          sgdma_rx_descriptor_write_write,
                                          sgdma_rx_descriptor_write_writedata,
                                          sgdma_tx_descriptor_read_address_to_slave,
                                          sgdma_tx_descriptor_read_latency_counter,
                                          sgdma_tx_descriptor_read_read,
                                          sgdma_tx_descriptor_write_address_to_slave,
                                          sgdma_tx_descriptor_write_write,
                                          sgdma_tx_descriptor_write_writedata,

                                         // outputs:
                                          cpu_data_master_granted_descriptor_memory_s1,
                                          cpu_data_master_qualified_request_descriptor_memory_s1,
                                          cpu_data_master_read_data_valid_descriptor_memory_s1,
                                          cpu_data_master_requests_descriptor_memory_s1,
                                          d1_descriptor_memory_s1_end_xfer,
                                          descriptor_memory_s1_address,
                                          descriptor_memory_s1_byteenable,
                                          descriptor_memory_s1_chipselect,
                                          descriptor_memory_s1_clken,
                                          descriptor_memory_s1_readdata_from_sa,
                                          descriptor_memory_s1_reset,
                                          descriptor_memory_s1_write,
                                          descriptor_memory_s1_writedata,
                                          registered_cpu_data_master_read_data_valid_descriptor_memory_s1,
                                          sgdma_rx_descriptor_read_granted_descriptor_memory_s1,
                                          sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1,
                                          sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1,
                                          sgdma_rx_descriptor_read_requests_descriptor_memory_s1,
                                          sgdma_rx_descriptor_write_granted_descriptor_memory_s1,
                                          sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1,
                                          sgdma_rx_descriptor_write_requests_descriptor_memory_s1,
                                          sgdma_tx_descriptor_read_granted_descriptor_memory_s1,
                                          sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1,
                                          sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1,
                                          sgdma_tx_descriptor_read_requests_descriptor_memory_s1,
                                          sgdma_tx_descriptor_write_granted_descriptor_memory_s1,
                                          sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1,
                                          sgdma_tx_descriptor_write_requests_descriptor_memory_s1
                                       )
;

  output           cpu_data_master_granted_descriptor_memory_s1;
  output           cpu_data_master_qualified_request_descriptor_memory_s1;
  output           cpu_data_master_read_data_valid_descriptor_memory_s1;
  output           cpu_data_master_requests_descriptor_memory_s1;
  output           d1_descriptor_memory_s1_end_xfer;
  output  [  9: 0] descriptor_memory_s1_address;
  output  [  3: 0] descriptor_memory_s1_byteenable;
  output           descriptor_memory_s1_chipselect;
  output           descriptor_memory_s1_clken;
  output  [ 31: 0] descriptor_memory_s1_readdata_from_sa;
  output           descriptor_memory_s1_reset;
  output           descriptor_memory_s1_write;
  output  [ 31: 0] descriptor_memory_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_descriptor_memory_s1;
  output           sgdma_rx_descriptor_read_granted_descriptor_memory_s1;
  output           sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1;
  output           sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1;
  output           sgdma_rx_descriptor_read_requests_descriptor_memory_s1;
  output           sgdma_rx_descriptor_write_granted_descriptor_memory_s1;
  output           sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1;
  output           sgdma_rx_descriptor_write_requests_descriptor_memory_s1;
  output           sgdma_tx_descriptor_read_granted_descriptor_memory_s1;
  output           sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1;
  output           sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1;
  output           sgdma_tx_descriptor_read_requests_descriptor_memory_s1;
  output           sgdma_tx_descriptor_write_granted_descriptor_memory_s1;
  output           sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1;
  output           sgdma_tx_descriptor_write_requests_descriptor_memory_s1;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] descriptor_memory_s1_readdata;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_descriptor_read_address_to_slave;
  input            sgdma_rx_descriptor_read_latency_counter;
  input            sgdma_rx_descriptor_read_read;
  input   [ 31: 0] sgdma_rx_descriptor_write_address_to_slave;
  input            sgdma_rx_descriptor_write_write;
  input   [ 31: 0] sgdma_rx_descriptor_write_writedata;
  input   [ 31: 0] sgdma_tx_descriptor_read_address_to_slave;
  input            sgdma_tx_descriptor_read_latency_counter;
  input            sgdma_tx_descriptor_read_read;
  input   [ 31: 0] sgdma_tx_descriptor_write_address_to_slave;
  input            sgdma_tx_descriptor_write_write;
  input   [ 31: 0] sgdma_tx_descriptor_write_writedata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_descriptor_memory_s1;
  wire             cpu_data_master_qualified_request_descriptor_memory_s1;
  wire             cpu_data_master_read_data_valid_descriptor_memory_s1;
  reg              cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register;
  wire             cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register_in;
  wire             cpu_data_master_requests_descriptor_memory_s1;
  wire             cpu_data_master_saved_grant_descriptor_memory_s1;
  reg              d1_descriptor_memory_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  9: 0] descriptor_memory_s1_address;
  wire             descriptor_memory_s1_allgrants;
  wire             descriptor_memory_s1_allow_new_arb_cycle;
  wire             descriptor_memory_s1_any_bursting_master_saved_grant;
  wire             descriptor_memory_s1_any_continuerequest;
  reg     [  4: 0] descriptor_memory_s1_arb_addend;
  wire             descriptor_memory_s1_arb_counter_enable;
  reg     [  1: 0] descriptor_memory_s1_arb_share_counter;
  wire    [  1: 0] descriptor_memory_s1_arb_share_counter_next_value;
  wire    [  1: 0] descriptor_memory_s1_arb_share_set_values;
  wire    [  4: 0] descriptor_memory_s1_arb_winner;
  wire             descriptor_memory_s1_arbitration_holdoff_internal;
  wire             descriptor_memory_s1_beginbursttransfer_internal;
  wire             descriptor_memory_s1_begins_xfer;
  wire    [  3: 0] descriptor_memory_s1_byteenable;
  wire             descriptor_memory_s1_chipselect;
  wire    [  9: 0] descriptor_memory_s1_chosen_master_double_vector;
  wire    [  4: 0] descriptor_memory_s1_chosen_master_rot_left;
  wire             descriptor_memory_s1_clken;
  wire             descriptor_memory_s1_end_xfer;
  wire             descriptor_memory_s1_firsttransfer;
  wire    [  4: 0] descriptor_memory_s1_grant_vector;
  wire             descriptor_memory_s1_in_a_read_cycle;
  wire             descriptor_memory_s1_in_a_write_cycle;
  wire    [  4: 0] descriptor_memory_s1_master_qreq_vector;
  wire             descriptor_memory_s1_non_bursting_master_requests;
  wire    [ 31: 0] descriptor_memory_s1_readdata_from_sa;
  reg              descriptor_memory_s1_reg_firsttransfer;
  wire             descriptor_memory_s1_reset;
  reg     [  4: 0] descriptor_memory_s1_saved_chosen_master_vector;
  reg              descriptor_memory_s1_slavearbiterlockenable;
  wire             descriptor_memory_s1_slavearbiterlockenable2;
  wire             descriptor_memory_s1_unreg_firsttransfer;
  wire             descriptor_memory_s1_waits_for_read;
  wire             descriptor_memory_s1_waits_for_write;
  wire             descriptor_memory_s1_write;
  wire    [ 31: 0] descriptor_memory_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_descriptor_memory_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1;
  reg              last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1;
  reg              last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1;
  reg              last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1;
  reg              last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1;
  wire             p1_cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register;
  wire             p1_sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;
  wire             p1_sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_arbiterlock;
  wire             sgdma_rx_descriptor_read_arbiterlock2;
  wire             sgdma_rx_descriptor_read_continuerequest;
  wire             sgdma_rx_descriptor_read_granted_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1;
  reg              sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;
  wire             sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in;
  wire             sgdma_rx_descriptor_read_requests_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_saved_grant_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_arbiterlock;
  wire             sgdma_rx_descriptor_write_arbiterlock2;
  wire             sgdma_rx_descriptor_write_continuerequest;
  wire             sgdma_rx_descriptor_write_granted_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_requests_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_saved_grant_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_arbiterlock;
  wire             sgdma_tx_descriptor_read_arbiterlock2;
  wire             sgdma_tx_descriptor_read_continuerequest;
  wire             sgdma_tx_descriptor_read_granted_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1;
  reg              sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;
  wire             sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in;
  wire             sgdma_tx_descriptor_read_requests_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_saved_grant_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_arbiterlock;
  wire             sgdma_tx_descriptor_write_arbiterlock2;
  wire             sgdma_tx_descriptor_write_continuerequest;
  wire             sgdma_tx_descriptor_write_granted_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_requests_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_saved_grant_descriptor_memory_s1;
  wire    [ 28: 0] shifted_address_to_descriptor_memory_s1_from_cpu_data_master;
  wire    [ 31: 0] shifted_address_to_descriptor_memory_s1_from_sgdma_rx_descriptor_read;
  wire    [ 31: 0] shifted_address_to_descriptor_memory_s1_from_sgdma_rx_descriptor_write;
  wire    [ 31: 0] shifted_address_to_descriptor_memory_s1_from_sgdma_tx_descriptor_read;
  wire    [ 31: 0] shifted_address_to_descriptor_memory_s1_from_sgdma_tx_descriptor_write;
  wire             wait_for_descriptor_memory_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~descriptor_memory_s1_end_xfer;
    end


  assign descriptor_memory_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_descriptor_memory_s1 | sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 | sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 | sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 | sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1));
  //assign descriptor_memory_s1_readdata_from_sa = descriptor_memory_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign descriptor_memory_s1_readdata_from_sa = descriptor_memory_s1_readdata;

  assign cpu_data_master_requests_descriptor_memory_s1 = ({cpu_data_master_address_to_slave[28 : 12] , 12'b0} == 29'h10020000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_descriptor_memory_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_descriptor_memory_s1 = cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register_in;

  //descriptor_memory_s1_arb_share_counter set values, which is an e_mux
  assign descriptor_memory_s1_arb_share_set_values = 1;

  //descriptor_memory_s1_non_bursting_master_requests mux, which is an e_mux
  assign descriptor_memory_s1_non_bursting_master_requests = cpu_data_master_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_write_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_write_requests_descriptor_memory_s1 |
    cpu_data_master_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_write_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_write_requests_descriptor_memory_s1 |
    cpu_data_master_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_write_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_write_requests_descriptor_memory_s1 |
    cpu_data_master_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_write_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_write_requests_descriptor_memory_s1 |
    cpu_data_master_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_rx_descriptor_write_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_read_requests_descriptor_memory_s1 |
    sgdma_tx_descriptor_write_requests_descriptor_memory_s1;

  //descriptor_memory_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign descriptor_memory_s1_any_bursting_master_saved_grant = 0;

  //descriptor_memory_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign descriptor_memory_s1_arb_share_counter_next_value = descriptor_memory_s1_firsttransfer ? (descriptor_memory_s1_arb_share_set_values - 1) : |descriptor_memory_s1_arb_share_counter ? (descriptor_memory_s1_arb_share_counter - 1) : 0;

  //descriptor_memory_s1_allgrants all slave grants, which is an e_mux
  assign descriptor_memory_s1_allgrants = (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector) |
    (|descriptor_memory_s1_grant_vector);

  //descriptor_memory_s1_end_xfer assignment, which is an e_assign
  assign descriptor_memory_s1_end_xfer = ~(descriptor_memory_s1_waits_for_read | descriptor_memory_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_descriptor_memory_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_descriptor_memory_s1 = descriptor_memory_s1_end_xfer & (~descriptor_memory_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //descriptor_memory_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign descriptor_memory_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_descriptor_memory_s1 & descriptor_memory_s1_allgrants) | (end_xfer_arb_share_counter_term_descriptor_memory_s1 & ~descriptor_memory_s1_non_bursting_master_requests);

  //descriptor_memory_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_memory_s1_arb_share_counter <= 0;
      else if (descriptor_memory_s1_arb_counter_enable)
          descriptor_memory_s1_arb_share_counter <= descriptor_memory_s1_arb_share_counter_next_value;
    end


  //descriptor_memory_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_memory_s1_slavearbiterlockenable <= 0;
      else if ((|descriptor_memory_s1_master_qreq_vector & end_xfer_arb_share_counter_term_descriptor_memory_s1) | (end_xfer_arb_share_counter_term_descriptor_memory_s1 & ~descriptor_memory_s1_non_bursting_master_requests))
          descriptor_memory_s1_slavearbiterlockenable <= |descriptor_memory_s1_arb_share_counter_next_value;
    end


  //cpu/data_master descriptor_memory/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = descriptor_memory_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //descriptor_memory_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign descriptor_memory_s1_slavearbiterlockenable2 = |descriptor_memory_s1_arb_share_counter_next_value;

  //cpu/data_master descriptor_memory/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = descriptor_memory_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sgdma_rx/descriptor_read descriptor_memory/s1 arbiterlock, which is an e_assign
  assign sgdma_rx_descriptor_read_arbiterlock = descriptor_memory_s1_slavearbiterlockenable & sgdma_rx_descriptor_read_continuerequest;

  //sgdma_rx/descriptor_read descriptor_memory/s1 arbiterlock2, which is an e_assign
  assign sgdma_rx_descriptor_read_arbiterlock2 = descriptor_memory_s1_slavearbiterlockenable2 & sgdma_rx_descriptor_read_continuerequest;

  //sgdma_rx/descriptor_read granted descriptor_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1 <= 0;
      else 
        last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1 <= sgdma_rx_descriptor_read_saved_grant_descriptor_memory_s1 ? 1 : (descriptor_memory_s1_arbitration_holdoff_internal | ~sgdma_rx_descriptor_read_requests_descriptor_memory_s1) ? 0 : last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1;
    end


  //sgdma_rx_descriptor_read_continuerequest continued request, which is an e_mux
  assign sgdma_rx_descriptor_read_continuerequest = (last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_read_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_read_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_read_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_rx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_read_requests_descriptor_memory_s1);

  //descriptor_memory_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign descriptor_memory_s1_any_continuerequest = sgdma_rx_descriptor_read_continuerequest |
    sgdma_rx_descriptor_write_continuerequest |
    sgdma_tx_descriptor_read_continuerequest |
    sgdma_tx_descriptor_write_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_rx_descriptor_write_continuerequest |
    sgdma_tx_descriptor_read_continuerequest |
    sgdma_tx_descriptor_write_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_rx_descriptor_read_continuerequest |
    sgdma_tx_descriptor_read_continuerequest |
    sgdma_tx_descriptor_write_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_rx_descriptor_read_continuerequest |
    sgdma_rx_descriptor_write_continuerequest |
    sgdma_tx_descriptor_write_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_rx_descriptor_read_continuerequest |
    sgdma_rx_descriptor_write_continuerequest |
    sgdma_tx_descriptor_read_continuerequest;

  //sgdma_rx/descriptor_write descriptor_memory/s1 arbiterlock, which is an e_assign
  assign sgdma_rx_descriptor_write_arbiterlock = descriptor_memory_s1_slavearbiterlockenable & sgdma_rx_descriptor_write_continuerequest;

  //sgdma_rx/descriptor_write descriptor_memory/s1 arbiterlock2, which is an e_assign
  assign sgdma_rx_descriptor_write_arbiterlock2 = descriptor_memory_s1_slavearbiterlockenable2 & sgdma_rx_descriptor_write_continuerequest;

  //sgdma_rx/descriptor_write granted descriptor_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1 <= 0;
      else 
        last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1 <= sgdma_rx_descriptor_write_saved_grant_descriptor_memory_s1 ? 1 : (descriptor_memory_s1_arbitration_holdoff_internal | ~sgdma_rx_descriptor_write_requests_descriptor_memory_s1) ? 0 : last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1;
    end


  //sgdma_rx_descriptor_write_continuerequest continued request, which is an e_mux
  assign sgdma_rx_descriptor_write_continuerequest = (last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_write_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_write_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_write_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_rx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_rx_descriptor_write_requests_descriptor_memory_s1);

  //sgdma_tx/descriptor_read descriptor_memory/s1 arbiterlock, which is an e_assign
  assign sgdma_tx_descriptor_read_arbiterlock = descriptor_memory_s1_slavearbiterlockenable & sgdma_tx_descriptor_read_continuerequest;

  //sgdma_tx/descriptor_read descriptor_memory/s1 arbiterlock2, which is an e_assign
  assign sgdma_tx_descriptor_read_arbiterlock2 = descriptor_memory_s1_slavearbiterlockenable2 & sgdma_tx_descriptor_read_continuerequest;

  //sgdma_tx/descriptor_read granted descriptor_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1 <= 0;
      else 
        last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1 <= sgdma_tx_descriptor_read_saved_grant_descriptor_memory_s1 ? 1 : (descriptor_memory_s1_arbitration_holdoff_internal | ~sgdma_tx_descriptor_read_requests_descriptor_memory_s1) ? 0 : last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1;
    end


  //sgdma_tx_descriptor_read_continuerequest continued request, which is an e_mux
  assign sgdma_tx_descriptor_read_continuerequest = (last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_read_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_read_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_read_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_tx_descriptor_read_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_read_requests_descriptor_memory_s1);

  //sgdma_tx/descriptor_write descriptor_memory/s1 arbiterlock, which is an e_assign
  assign sgdma_tx_descriptor_write_arbiterlock = descriptor_memory_s1_slavearbiterlockenable & sgdma_tx_descriptor_write_continuerequest;

  //sgdma_tx/descriptor_write descriptor_memory/s1 arbiterlock2, which is an e_assign
  assign sgdma_tx_descriptor_write_arbiterlock2 = descriptor_memory_s1_slavearbiterlockenable2 & sgdma_tx_descriptor_write_continuerequest;

  //sgdma_tx/descriptor_write granted descriptor_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1 <= 0;
      else 
        last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1 <= sgdma_tx_descriptor_write_saved_grant_descriptor_memory_s1 ? 1 : (descriptor_memory_s1_arbitration_holdoff_internal | ~sgdma_tx_descriptor_write_requests_descriptor_memory_s1) ? 0 : last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1;
    end


  //sgdma_tx_descriptor_write_continuerequest continued request, which is an e_mux
  assign sgdma_tx_descriptor_write_continuerequest = (last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_write_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_write_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_write_requests_descriptor_memory_s1) |
    (last_cycle_sgdma_tx_descriptor_write_granted_slave_descriptor_memory_s1 & sgdma_tx_descriptor_write_requests_descriptor_memory_s1);

  assign cpu_data_master_qualified_request_descriptor_memory_s1 = cpu_data_master_requests_descriptor_memory_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | sgdma_rx_descriptor_read_arbiterlock | sgdma_rx_descriptor_write_arbiterlock | sgdma_tx_descriptor_read_arbiterlock | sgdma_tx_descriptor_write_arbiterlock);
  //cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register_in = cpu_data_master_granted_descriptor_memory_s1 & cpu_data_master_read & ~descriptor_memory_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register = {cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register, cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register_in};

  //cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register <= p1_cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_descriptor_memory_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_descriptor_memory_s1 = cpu_data_master_read_data_valid_descriptor_memory_s1_shift_register;

  //descriptor_memory_s1_writedata mux, which is an e_mux
  assign descriptor_memory_s1_writedata = (cpu_data_master_granted_descriptor_memory_s1)? cpu_data_master_writedata :
    (sgdma_rx_descriptor_write_granted_descriptor_memory_s1)? sgdma_rx_descriptor_write_writedata :
    sgdma_tx_descriptor_write_writedata;

  //mux descriptor_memory_s1_clken, which is an e_mux
  assign descriptor_memory_s1_clken = 1'b1;

  assign sgdma_rx_descriptor_read_requests_descriptor_memory_s1 = (({sgdma_rx_descriptor_read_address_to_slave[31 : 12] , 12'b0} == 32'h10020000) & (sgdma_rx_descriptor_read_read)) & sgdma_rx_descriptor_read_read;
  //cpu/data_master granted descriptor_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1 <= cpu_data_master_saved_grant_descriptor_memory_s1 ? 1 : (descriptor_memory_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_descriptor_memory_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1 & cpu_data_master_requests_descriptor_memory_s1) |
    (last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1 & cpu_data_master_requests_descriptor_memory_s1) |
    (last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1 & cpu_data_master_requests_descriptor_memory_s1) |
    (last_cycle_cpu_data_master_granted_slave_descriptor_memory_s1 & cpu_data_master_requests_descriptor_memory_s1);

  assign sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 = sgdma_rx_descriptor_read_requests_descriptor_memory_s1 & ~(cpu_data_master_arbiterlock | sgdma_rx_descriptor_write_arbiterlock | sgdma_tx_descriptor_read_arbiterlock | sgdma_tx_descriptor_write_arbiterlock);
  //sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in = sgdma_rx_descriptor_read_granted_descriptor_memory_s1 & sgdma_rx_descriptor_read_read & ~descriptor_memory_s1_waits_for_read;

  //shift register p1 sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register = {sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register, sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in};

  //sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register <= 0;
      else 
        sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register <= p1_sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;
    end


  //local readdatavalid sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1, which is an e_mux
  assign sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1 = sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;

  assign sgdma_rx_descriptor_write_requests_descriptor_memory_s1 = (({sgdma_rx_descriptor_write_address_to_slave[31 : 12] , 12'b0} == 32'h10020000) & (sgdma_rx_descriptor_write_write)) & sgdma_rx_descriptor_write_write;
  assign sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 = sgdma_rx_descriptor_write_requests_descriptor_memory_s1 & ~(cpu_data_master_arbiterlock | sgdma_rx_descriptor_read_arbiterlock | sgdma_tx_descriptor_read_arbiterlock | sgdma_tx_descriptor_write_arbiterlock);
  assign sgdma_tx_descriptor_read_requests_descriptor_memory_s1 = (({sgdma_tx_descriptor_read_address_to_slave[31 : 12] , 12'b0} == 32'h10020000) & (sgdma_tx_descriptor_read_read)) & sgdma_tx_descriptor_read_read;
  assign sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 = sgdma_tx_descriptor_read_requests_descriptor_memory_s1 & ~(cpu_data_master_arbiterlock | sgdma_rx_descriptor_read_arbiterlock | sgdma_rx_descriptor_write_arbiterlock | sgdma_tx_descriptor_write_arbiterlock);
  //sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in = sgdma_tx_descriptor_read_granted_descriptor_memory_s1 & sgdma_tx_descriptor_read_read & ~descriptor_memory_s1_waits_for_read;

  //shift register p1 sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register = {sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register, sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register_in};

  //sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register <= 0;
      else 
        sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register <= p1_sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;
    end


  //local readdatavalid sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1, which is an e_mux
  assign sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1 = sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1_shift_register;

  assign sgdma_tx_descriptor_write_requests_descriptor_memory_s1 = (({sgdma_tx_descriptor_write_address_to_slave[31 : 12] , 12'b0} == 32'h10020000) & (sgdma_tx_descriptor_write_write)) & sgdma_tx_descriptor_write_write;
  assign sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 = sgdma_tx_descriptor_write_requests_descriptor_memory_s1 & ~(cpu_data_master_arbiterlock | sgdma_rx_descriptor_read_arbiterlock | sgdma_rx_descriptor_write_arbiterlock | sgdma_tx_descriptor_read_arbiterlock);
  //allow new arb cycle for descriptor_memory/s1, which is an e_assign
  assign descriptor_memory_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~sgdma_rx_descriptor_read_arbiterlock & ~sgdma_rx_descriptor_write_arbiterlock & ~sgdma_tx_descriptor_read_arbiterlock & ~sgdma_tx_descriptor_write_arbiterlock;

  //sgdma_tx/descriptor_write assignment into master qualified-requests vector for descriptor_memory/s1, which is an e_assign
  assign descriptor_memory_s1_master_qreq_vector[0] = sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1;

  //sgdma_tx/descriptor_write grant descriptor_memory/s1, which is an e_assign
  assign sgdma_tx_descriptor_write_granted_descriptor_memory_s1 = descriptor_memory_s1_grant_vector[0];

  //sgdma_tx/descriptor_write saved-grant descriptor_memory/s1, which is an e_assign
  assign sgdma_tx_descriptor_write_saved_grant_descriptor_memory_s1 = descriptor_memory_s1_arb_winner[0] && sgdma_tx_descriptor_write_requests_descriptor_memory_s1;

  //sgdma_tx/descriptor_read assignment into master qualified-requests vector for descriptor_memory/s1, which is an e_assign
  assign descriptor_memory_s1_master_qreq_vector[1] = sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1;

  //sgdma_tx/descriptor_read grant descriptor_memory/s1, which is an e_assign
  assign sgdma_tx_descriptor_read_granted_descriptor_memory_s1 = descriptor_memory_s1_grant_vector[1];

  //sgdma_tx/descriptor_read saved-grant descriptor_memory/s1, which is an e_assign
  assign sgdma_tx_descriptor_read_saved_grant_descriptor_memory_s1 = descriptor_memory_s1_arb_winner[1] && sgdma_tx_descriptor_read_requests_descriptor_memory_s1;

  //sgdma_rx/descriptor_write assignment into master qualified-requests vector for descriptor_memory/s1, which is an e_assign
  assign descriptor_memory_s1_master_qreq_vector[2] = sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1;

  //sgdma_rx/descriptor_write grant descriptor_memory/s1, which is an e_assign
  assign sgdma_rx_descriptor_write_granted_descriptor_memory_s1 = descriptor_memory_s1_grant_vector[2];

  //sgdma_rx/descriptor_write saved-grant descriptor_memory/s1, which is an e_assign
  assign sgdma_rx_descriptor_write_saved_grant_descriptor_memory_s1 = descriptor_memory_s1_arb_winner[2] && sgdma_rx_descriptor_write_requests_descriptor_memory_s1;

  //sgdma_rx/descriptor_read assignment into master qualified-requests vector for descriptor_memory/s1, which is an e_assign
  assign descriptor_memory_s1_master_qreq_vector[3] = sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1;

  //sgdma_rx/descriptor_read grant descriptor_memory/s1, which is an e_assign
  assign sgdma_rx_descriptor_read_granted_descriptor_memory_s1 = descriptor_memory_s1_grant_vector[3];

  //sgdma_rx/descriptor_read saved-grant descriptor_memory/s1, which is an e_assign
  assign sgdma_rx_descriptor_read_saved_grant_descriptor_memory_s1 = descriptor_memory_s1_arb_winner[3] && sgdma_rx_descriptor_read_requests_descriptor_memory_s1;

  //cpu/data_master assignment into master qualified-requests vector for descriptor_memory/s1, which is an e_assign
  assign descriptor_memory_s1_master_qreq_vector[4] = cpu_data_master_qualified_request_descriptor_memory_s1;

  //cpu/data_master grant descriptor_memory/s1, which is an e_assign
  assign cpu_data_master_granted_descriptor_memory_s1 = descriptor_memory_s1_grant_vector[4];

  //cpu/data_master saved-grant descriptor_memory/s1, which is an e_assign
  assign cpu_data_master_saved_grant_descriptor_memory_s1 = descriptor_memory_s1_arb_winner[4] && cpu_data_master_requests_descriptor_memory_s1;

  //descriptor_memory/s1 chosen-master double-vector, which is an e_assign
  assign descriptor_memory_s1_chosen_master_double_vector = {descriptor_memory_s1_master_qreq_vector, descriptor_memory_s1_master_qreq_vector} & ({~descriptor_memory_s1_master_qreq_vector, ~descriptor_memory_s1_master_qreq_vector} + descriptor_memory_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign descriptor_memory_s1_arb_winner = (descriptor_memory_s1_allow_new_arb_cycle & | descriptor_memory_s1_grant_vector) ? descriptor_memory_s1_grant_vector : descriptor_memory_s1_saved_chosen_master_vector;

  //saved descriptor_memory_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_memory_s1_saved_chosen_master_vector <= 0;
      else if (descriptor_memory_s1_allow_new_arb_cycle)
          descriptor_memory_s1_saved_chosen_master_vector <= |descriptor_memory_s1_grant_vector ? descriptor_memory_s1_grant_vector : descriptor_memory_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign descriptor_memory_s1_grant_vector = {(descriptor_memory_s1_chosen_master_double_vector[4] | descriptor_memory_s1_chosen_master_double_vector[9]),
    (descriptor_memory_s1_chosen_master_double_vector[3] | descriptor_memory_s1_chosen_master_double_vector[8]),
    (descriptor_memory_s1_chosen_master_double_vector[2] | descriptor_memory_s1_chosen_master_double_vector[7]),
    (descriptor_memory_s1_chosen_master_double_vector[1] | descriptor_memory_s1_chosen_master_double_vector[6]),
    (descriptor_memory_s1_chosen_master_double_vector[0] | descriptor_memory_s1_chosen_master_double_vector[5])};

  //descriptor_memory/s1 chosen master rotated left, which is an e_assign
  assign descriptor_memory_s1_chosen_master_rot_left = (descriptor_memory_s1_arb_winner << 1) ? (descriptor_memory_s1_arb_winner << 1) : 1;

  //descriptor_memory/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_memory_s1_arb_addend <= 1;
      else if (|descriptor_memory_s1_grant_vector)
          descriptor_memory_s1_arb_addend <= descriptor_memory_s1_end_xfer? descriptor_memory_s1_chosen_master_rot_left : descriptor_memory_s1_grant_vector;
    end


  //~descriptor_memory_s1_reset assignment, which is an e_assign
  assign descriptor_memory_s1_reset = ~reset_n;

  assign descriptor_memory_s1_chipselect = cpu_data_master_granted_descriptor_memory_s1 | sgdma_rx_descriptor_read_granted_descriptor_memory_s1 | sgdma_rx_descriptor_write_granted_descriptor_memory_s1 | sgdma_tx_descriptor_read_granted_descriptor_memory_s1 | sgdma_tx_descriptor_write_granted_descriptor_memory_s1;
  //descriptor_memory_s1_firsttransfer first transaction, which is an e_assign
  assign descriptor_memory_s1_firsttransfer = descriptor_memory_s1_begins_xfer ? descriptor_memory_s1_unreg_firsttransfer : descriptor_memory_s1_reg_firsttransfer;

  //descriptor_memory_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign descriptor_memory_s1_unreg_firsttransfer = ~(descriptor_memory_s1_slavearbiterlockenable & descriptor_memory_s1_any_continuerequest);

  //descriptor_memory_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_memory_s1_reg_firsttransfer <= 1'b1;
      else if (descriptor_memory_s1_begins_xfer)
          descriptor_memory_s1_reg_firsttransfer <= descriptor_memory_s1_unreg_firsttransfer;
    end


  //descriptor_memory_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign descriptor_memory_s1_beginbursttransfer_internal = descriptor_memory_s1_begins_xfer;

  //descriptor_memory_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign descriptor_memory_s1_arbitration_holdoff_internal = descriptor_memory_s1_begins_xfer & descriptor_memory_s1_firsttransfer;

  //descriptor_memory_s1_write assignment, which is an e_mux
  assign descriptor_memory_s1_write = (cpu_data_master_granted_descriptor_memory_s1 & cpu_data_master_write) | (sgdma_rx_descriptor_write_granted_descriptor_memory_s1 & sgdma_rx_descriptor_write_write) | (sgdma_tx_descriptor_write_granted_descriptor_memory_s1 & sgdma_tx_descriptor_write_write);

  assign shifted_address_to_descriptor_memory_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //descriptor_memory_s1_address mux, which is an e_mux
  assign descriptor_memory_s1_address = (cpu_data_master_granted_descriptor_memory_s1)? (shifted_address_to_descriptor_memory_s1_from_cpu_data_master >> 2) :
    (sgdma_rx_descriptor_read_granted_descriptor_memory_s1)? (shifted_address_to_descriptor_memory_s1_from_sgdma_rx_descriptor_read >> 2) :
    (sgdma_rx_descriptor_write_granted_descriptor_memory_s1)? (shifted_address_to_descriptor_memory_s1_from_sgdma_rx_descriptor_write >> 2) :
    (sgdma_tx_descriptor_read_granted_descriptor_memory_s1)? (shifted_address_to_descriptor_memory_s1_from_sgdma_tx_descriptor_read >> 2) :
    (shifted_address_to_descriptor_memory_s1_from_sgdma_tx_descriptor_write >> 2);

  assign shifted_address_to_descriptor_memory_s1_from_sgdma_rx_descriptor_read = sgdma_rx_descriptor_read_address_to_slave;
  assign shifted_address_to_descriptor_memory_s1_from_sgdma_rx_descriptor_write = sgdma_rx_descriptor_write_address_to_slave;
  assign shifted_address_to_descriptor_memory_s1_from_sgdma_tx_descriptor_read = sgdma_tx_descriptor_read_address_to_slave;
  assign shifted_address_to_descriptor_memory_s1_from_sgdma_tx_descriptor_write = sgdma_tx_descriptor_write_address_to_slave;
  //d1_descriptor_memory_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_descriptor_memory_s1_end_xfer <= 1;
      else 
        d1_descriptor_memory_s1_end_xfer <= descriptor_memory_s1_end_xfer;
    end


  //descriptor_memory_s1_waits_for_read in a cycle, which is an e_mux
  assign descriptor_memory_s1_waits_for_read = descriptor_memory_s1_in_a_read_cycle & 0;

  //descriptor_memory_s1_in_a_read_cycle assignment, which is an e_assign
  assign descriptor_memory_s1_in_a_read_cycle = (cpu_data_master_granted_descriptor_memory_s1 & cpu_data_master_read) | (sgdma_rx_descriptor_read_granted_descriptor_memory_s1 & sgdma_rx_descriptor_read_read) | (sgdma_tx_descriptor_read_granted_descriptor_memory_s1 & sgdma_tx_descriptor_read_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = descriptor_memory_s1_in_a_read_cycle;

  //descriptor_memory_s1_waits_for_write in a cycle, which is an e_mux
  assign descriptor_memory_s1_waits_for_write = descriptor_memory_s1_in_a_write_cycle & 0;

  //descriptor_memory_s1_in_a_write_cycle assignment, which is an e_assign
  assign descriptor_memory_s1_in_a_write_cycle = (cpu_data_master_granted_descriptor_memory_s1 & cpu_data_master_write) | (sgdma_rx_descriptor_write_granted_descriptor_memory_s1 & sgdma_rx_descriptor_write_write) | (sgdma_tx_descriptor_write_granted_descriptor_memory_s1 & sgdma_tx_descriptor_write_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = descriptor_memory_s1_in_a_write_cycle;

  assign wait_for_descriptor_memory_s1_counter = 0;
  //descriptor_memory_s1_byteenable byte enable port mux, which is an e_mux
  assign descriptor_memory_s1_byteenable = (cpu_data_master_granted_descriptor_memory_s1)? cpu_data_master_byteenable :
    (sgdma_rx_descriptor_write_granted_descriptor_memory_s1)? {4 {1'b1}} :
    (sgdma_tx_descriptor_write_granted_descriptor_memory_s1)? {4 {1'b1}} :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //descriptor_memory/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_descriptor_memory_s1 + sgdma_rx_descriptor_read_granted_descriptor_memory_s1 + sgdma_rx_descriptor_write_granted_descriptor_memory_s1 + sgdma_tx_descriptor_read_granted_descriptor_memory_s1 + sgdma_tx_descriptor_write_granted_descriptor_memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_descriptor_memory_s1 + sgdma_rx_descriptor_read_saved_grant_descriptor_memory_s1 + sgdma_rx_descriptor_write_saved_grant_descriptor_memory_s1 + sgdma_tx_descriptor_read_saved_grant_descriptor_memory_s1 + sgdma_tx_descriptor_write_saved_grant_descriptor_memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_tristate_bridge_avalon_slave_arbitrator (
                                                       // inputs:
                                                        clk,
                                                        cpu_data_master_address_to_slave,
                                                        cpu_data_master_byteenable,
                                                        cpu_data_master_dbs_address,
                                                        cpu_data_master_dbs_write_16,
                                                        cpu_data_master_no_byte_enables_and_last_term,
                                                        cpu_data_master_read,
                                                        cpu_data_master_write,
                                                        cpu_instruction_master_address_to_slave,
                                                        cpu_instruction_master_dbs_address,
                                                        cpu_instruction_master_latency_counter,
                                                        cpu_instruction_master_read,
                                                        cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                                        reset_n,

                                                       // outputs:
                                                        address_to_the_ext_flash,
                                                        cpu_data_master_byteenable_ext_flash_s1,
                                                        cpu_data_master_granted_ext_flash_s1,
                                                        cpu_data_master_qualified_request_ext_flash_s1,
                                                        cpu_data_master_read_data_valid_ext_flash_s1,
                                                        cpu_data_master_requests_ext_flash_s1,
                                                        cpu_instruction_master_granted_ext_flash_s1,
                                                        cpu_instruction_master_qualified_request_ext_flash_s1,
                                                        cpu_instruction_master_read_data_valid_ext_flash_s1,
                                                        cpu_instruction_master_requests_ext_flash_s1,
                                                        d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                                        data_to_and_from_the_ext_flash,
                                                        ext_flash_s1_wait_counter_eq_0,
                                                        ext_flash_s1_wait_counter_eq_1,
                                                        incoming_data_to_and_from_the_ext_flash,
                                                        incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0,
                                                        read_n_to_the_ext_flash,
                                                        registered_cpu_data_master_read_data_valid_ext_flash_s1,
                                                        select_n_to_the_ext_flash,
                                                        write_n_to_the_ext_flash
                                                     )
;

  output  [ 25: 0] address_to_the_ext_flash;
  output  [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  output           cpu_data_master_granted_ext_flash_s1;
  output           cpu_data_master_qualified_request_ext_flash_s1;
  output           cpu_data_master_read_data_valid_ext_flash_s1;
  output           cpu_data_master_requests_ext_flash_s1;
  output           cpu_instruction_master_granted_ext_flash_s1;
  output           cpu_instruction_master_qualified_request_ext_flash_s1;
  output           cpu_instruction_master_read_data_valid_ext_flash_s1;
  output           cpu_instruction_master_requests_ext_flash_s1;
  output           d1_flash_tristate_bridge_avalon_slave_end_xfer;
  inout   [ 15: 0] data_to_and_from_the_ext_flash;
  output           ext_flash_s1_wait_counter_eq_0;
  output           ext_flash_s1_wait_counter_eq_1;
  output  [ 15: 0] incoming_data_to_and_from_the_ext_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0;
  output           read_n_to_the_ext_flash;
  output           registered_cpu_data_master_read_data_valid_ext_flash_s1;
  output           select_n_to_the_ext_flash;
  output           write_n_to_the_ext_flash;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 28: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  input            reset_n;

  reg     [ 25: 0] address_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ext_flash_s1;
  wire             cpu_data_master_qualified_request_ext_flash_s1;
  wire             cpu_data_master_read_data_valid_ext_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_ext_flash_s1;
  wire             cpu_data_master_saved_grant_ext_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_ext_flash_s1;
  wire             cpu_instruction_master_qualified_request_ext_flash_s1;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_ext_flash_s1;
  wire             cpu_instruction_master_saved_grant_ext_flash_s1;
  reg              d1_flash_tristate_bridge_avalon_slave_end_xfer;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_data_to_and_from_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  wire    [ 15: 0] data_to_and_from_the_ext_flash;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave;
  wire    [  3: 0] ext_flash_s1_counter_load_value;
  wire             ext_flash_s1_in_a_read_cycle;
  wire             ext_flash_s1_in_a_write_cycle;
  reg     [  3: 0] ext_flash_s1_wait_counter;
  wire             ext_flash_s1_wait_counter_eq_0;
  wire             ext_flash_s1_wait_counter_eq_1;
  wire             ext_flash_s1_waits_for_read;
  wire             ext_flash_s1_waits_for_write;
  wire             ext_flash_s1_with_write_latency;
  wire             flash_tristate_bridge_avalon_slave_allgrants;
  wire             flash_tristate_bridge_avalon_slave_allow_new_arb_cycle;
  wire             flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             flash_tristate_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] flash_tristate_bridge_avalon_slave_arb_addend;
  wire             flash_tristate_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] flash_tristate_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_arb_winner;
  wire             flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             flash_tristate_bridge_avalon_slave_beginbursttransfer_internal;
  wire             flash_tristate_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] flash_tristate_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_chosen_master_rot_left;
  wire             flash_tristate_bridge_avalon_slave_end_xfer;
  wire             flash_tristate_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_master_qreq_vector;
  wire             flash_tristate_bridge_avalon_slave_non_bursting_master_requests;
  wire             flash_tristate_bridge_avalon_slave_read_pending;
  reg              flash_tristate_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] flash_tristate_bridge_avalon_slave_saved_chosen_master_vector;
  reg              flash_tristate_bridge_avalon_slave_slavearbiterlockenable;
  wire             flash_tristate_bridge_avalon_slave_slavearbiterlockenable2;
  wire             flash_tristate_bridge_avalon_slave_unreg_firsttransfer;
  wire             flash_tristate_bridge_avalon_slave_write_pending;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_data_to_and_from_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_ext_flash_bit_0_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_10_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_11_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_12_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_13_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_14_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_15_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_1_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_2_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_3_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_4_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_5_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_6_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_7_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_8_is_x;
  wire             incoming_data_to_and_from_the_ext_flash_bit_9_is_x;
  wire    [ 15: 0] incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_ext_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1;
  wire    [ 15: 0] outgoing_data_to_and_from_the_ext_flash;
  wire    [ 25: 0] p1_address_to_the_ext_flash;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
  wire             p1_read_n_to_the_ext_flash;
  wire             p1_select_n_to_the_ext_flash;
  wire             p1_write_n_to_the_ext_flash;
  reg              read_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             registered_cpu_data_master_read_data_valid_ext_flash_s1;
  reg              select_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             wait_for_ext_flash_s1_counter;
  reg              write_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~flash_tristate_bridge_avalon_slave_end_xfer;
    end


  assign flash_tristate_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ext_flash_s1 | cpu_instruction_master_qualified_request_ext_flash_s1));
  assign cpu_data_master_requests_ext_flash_s1 = ({cpu_data_master_address_to_slave[28 : 26] , 26'b0} == 29'h8000000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_ext_flash of type chipselect to ~p1_select_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_ext_flash <= ~0;
      else 
        select_n_to_the_ext_flash <= p1_select_n_to_the_ext_flash;
    end


  assign flash_tristate_bridge_avalon_slave_write_pending = 0;
  //flash_tristate_bridge/avalon_slave read pending calc, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_read_pending = 0;

  //registered rdv signal_name registered_cpu_data_master_read_data_valid_ext_flash_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_ext_flash_s1 = cpu_data_master_read_data_valid_ext_flash_s1_shift_register[0];

  //flash_tristate_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_arb_share_set_values = (cpu_data_master_granted_ext_flash_s1)? 2 :
    (cpu_instruction_master_granted_ext_flash_s1)? 2 :
    (cpu_data_master_granted_ext_flash_s1)? 2 :
    (cpu_instruction_master_granted_ext_flash_s1)? 2 :
    1;

  //flash_tristate_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1 |
    cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1;

  //flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //flash_tristate_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_arb_share_counter_next_value = flash_tristate_bridge_avalon_slave_firsttransfer ? (flash_tristate_bridge_avalon_slave_arb_share_set_values - 1) : |flash_tristate_bridge_avalon_slave_arb_share_counter ? (flash_tristate_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //flash_tristate_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_allgrants = (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector);

  //flash_tristate_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_end_xfer = ~(ext_flash_s1_waits_for_read | ext_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave = flash_tristate_bridge_avalon_slave_end_xfer & (~flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //flash_tristate_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave & flash_tristate_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave & ~flash_tristate_bridge_avalon_slave_non_bursting_master_requests);

  //flash_tristate_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_tristate_bridge_avalon_slave_arb_share_counter <= 0;
      else if (flash_tristate_bridge_avalon_slave_arb_counter_enable)
          flash_tristate_bridge_avalon_slave_arb_share_counter <= flash_tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //flash_tristate_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_tristate_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|flash_tristate_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_flash_tristate_bridge_avalon_slave & ~flash_tristate_bridge_avalon_slave_non_bursting_master_requests))
          flash_tristate_bridge_avalon_slave_slavearbiterlockenable <= |flash_tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master flash_tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = flash_tristate_bridge_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //flash_tristate_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_slavearbiterlockenable2 = |flash_tristate_bridge_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master flash_tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = flash_tristate_bridge_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master flash_tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = flash_tristate_bridge_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master flash_tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = flash_tristate_bridge_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 <= cpu_instruction_master_saved_grant_ext_flash_s1 ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_ext_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 & cpu_instruction_master_requests_ext_flash_s1;

  //flash_tristate_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_ext_flash_s1 = cpu_data_master_requests_ext_flash_s1 & ~((cpu_data_master_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending) | (|cpu_data_master_read_data_valid_ext_flash_s1_shift_register))) | ((flash_tristate_bridge_avalon_slave_read_pending | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_ext_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in = cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read & ~ext_flash_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_ext_flash_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register = {cpu_data_master_read_data_valid_ext_flash_s1_shift_register, cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_ext_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_ext_flash_s1 = cpu_data_master_read_data_valid_ext_flash_s1_shift_register[1];

  //data_to_and_from_the_ext_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_ext_flash <= 0;
      else 
        incoming_data_to_and_from_the_ext_flash <= data_to_and_from_the_ext_flash;
    end


  //ext_flash_s1_with_write_latency assignment, which is an e_assign
  assign ext_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_ext_flash_s1 | cpu_instruction_master_qualified_request_ext_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (ext_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_ext_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_ext_flash <= 0;
      else 
        d1_outgoing_data_to_and_from_the_ext_flash <= outgoing_data_to_and_from_the_ext_flash;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_ext_flash tristate driver, which is an e_assign
  assign data_to_and_from_the_ext_flash = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_ext_flash:{16{1'bz}};

  //outgoing_data_to_and_from_the_ext_flash mux, which is an e_mux
  assign outgoing_data_to_and_from_the_ext_flash = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_ext_flash_s1 = (({cpu_instruction_master_address_to_slave[28 : 26] , 26'b0} == 29'h8000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= cpu_data_master_saved_grant_ext_flash_s1 ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_ext_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_ext_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_ext_flash_s1 & cpu_data_master_requests_ext_flash_s1;

  assign cpu_instruction_master_qualified_request_ext_flash_s1 = cpu_instruction_master_requests_ext_flash_s1 & ~((cpu_instruction_master_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in = cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read & ~ext_flash_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register, cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_ext_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_ext_flash_s1 = cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register[1];

  //allow new arb cycle for flash_tristate_bridge/avalon_slave, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_ext_flash_s1;

  //cpu/instruction_master grant ext_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_ext_flash_s1 = flash_tristate_bridge_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant ext_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_ext_flash_s1 = flash_tristate_bridge_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_ext_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_ext_flash_s1;

  //cpu/data_master grant ext_flash/s1, which is an e_assign
  assign cpu_data_master_granted_ext_flash_s1 = flash_tristate_bridge_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant ext_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_ext_flash_s1 = flash_tristate_bridge_avalon_slave_arb_winner[1] && cpu_data_master_requests_ext_flash_s1;

  //flash_tristate_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_chosen_master_double_vector = {flash_tristate_bridge_avalon_slave_master_qreq_vector, flash_tristate_bridge_avalon_slave_master_qreq_vector} & ({~flash_tristate_bridge_avalon_slave_master_qreq_vector, ~flash_tristate_bridge_avalon_slave_master_qreq_vector} + flash_tristate_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign flash_tristate_bridge_avalon_slave_arb_winner = (flash_tristate_bridge_avalon_slave_allow_new_arb_cycle & | flash_tristate_bridge_avalon_slave_grant_vector) ? flash_tristate_bridge_avalon_slave_grant_vector : flash_tristate_bridge_avalon_slave_saved_chosen_master_vector;

  //saved flash_tristate_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_tristate_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (flash_tristate_bridge_avalon_slave_allow_new_arb_cycle)
          flash_tristate_bridge_avalon_slave_saved_chosen_master_vector <= |flash_tristate_bridge_avalon_slave_grant_vector ? flash_tristate_bridge_avalon_slave_grant_vector : flash_tristate_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign flash_tristate_bridge_avalon_slave_grant_vector = {(flash_tristate_bridge_avalon_slave_chosen_master_double_vector[1] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[3]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[0] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[2])};

  //flash_tristate_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_chosen_master_rot_left = (flash_tristate_bridge_avalon_slave_arb_winner << 1) ? (flash_tristate_bridge_avalon_slave_arb_winner << 1) : 1;

  //flash_tristate_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_tristate_bridge_avalon_slave_arb_addend <= 1;
      else if (|flash_tristate_bridge_avalon_slave_grant_vector)
          flash_tristate_bridge_avalon_slave_arb_addend <= flash_tristate_bridge_avalon_slave_end_xfer? flash_tristate_bridge_avalon_slave_chosen_master_rot_left : flash_tristate_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_ext_flash = ~(cpu_data_master_granted_ext_flash_s1 | cpu_instruction_master_granted_ext_flash_s1);
  //flash_tristate_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_firsttransfer = flash_tristate_bridge_avalon_slave_begins_xfer ? flash_tristate_bridge_avalon_slave_unreg_firsttransfer : flash_tristate_bridge_avalon_slave_reg_firsttransfer;

  //flash_tristate_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_unreg_firsttransfer = ~(flash_tristate_bridge_avalon_slave_slavearbiterlockenable & flash_tristate_bridge_avalon_slave_any_continuerequest);

  //flash_tristate_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_tristate_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (flash_tristate_bridge_avalon_slave_begins_xfer)
          flash_tristate_bridge_avalon_slave_reg_firsttransfer <= flash_tristate_bridge_avalon_slave_unreg_firsttransfer;
    end


  //flash_tristate_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_beginbursttransfer_internal = flash_tristate_bridge_avalon_slave_begins_xfer;

  //flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal = flash_tristate_bridge_avalon_slave_begins_xfer & flash_tristate_bridge_avalon_slave_firsttransfer;

  //~read_n_to_the_ext_flash of type read to ~p1_read_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_ext_flash <= ~0;
      else 
        read_n_to_the_ext_flash <= p1_read_n_to_the_ext_flash;
    end


  //~p1_read_n_to_the_ext_flash assignment, which is an e_mux
  assign p1_read_n_to_the_ext_flash = ~(((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read))& ~flash_tristate_bridge_avalon_slave_begins_xfer & (ext_flash_s1_wait_counter < 4));

  //~write_n_to_the_ext_flash of type write to ~p1_write_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_ext_flash <= ~0;
      else 
        write_n_to_the_ext_flash <= p1_write_n_to_the_ext_flash;
    end


  //~p1_write_n_to_the_ext_flash assignment, which is an e_mux
  assign p1_write_n_to_the_ext_flash = ~(((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write)) & ~flash_tristate_bridge_avalon_slave_begins_xfer & (ext_flash_s1_wait_counter >= 2) & (ext_flash_s1_wait_counter < 6));

  //address_to_the_ext_flash of type address to p1_address_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_ext_flash <= 0;
      else 
        address_to_the_ext_flash <= p1_address_to_the_ext_flash;
    end


  //p1_address_to_the_ext_flash mux, which is an e_mux
  assign p1_address_to_the_ext_flash = (cpu_data_master_granted_ext_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}});

  //d1_flash_tristate_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_flash_tristate_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_flash_tristate_bridge_avalon_slave_end_xfer <= flash_tristate_bridge_avalon_slave_end_xfer;
    end


  //ext_flash_s1_wait_counter_eq_1 assignment, which is an e_assign
  assign ext_flash_s1_wait_counter_eq_1 = ext_flash_s1_wait_counter == 1;

  //ext_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_read = ext_flash_s1_in_a_read_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_read_cycle = (cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ext_flash_s1_in_a_read_cycle;

  //ext_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_write = ext_flash_s1_in_a_write_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_write_cycle = cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ext_flash_s1_in_a_write_cycle;

  assign ext_flash_s1_wait_counter_eq_0 = ext_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ext_flash_s1_wait_counter <= 0;
      else 
        ext_flash_s1_wait_counter <= ext_flash_s1_counter_load_value;
    end


  assign ext_flash_s1_counter_load_value = ((ext_flash_s1_in_a_read_cycle & flash_tristate_bridge_avalon_slave_begins_xfer))? 9 :
    ((ext_flash_s1_in_a_write_cycle & flash_tristate_bridge_avalon_slave_begins_xfer))? 11 :
    (~ext_flash_s1_wait_counter_eq_0)? ext_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_ext_flash_s1_counter = flash_tristate_bridge_avalon_slave_begins_xfer | ~ext_flash_s1_wait_counter_eq_0;
  assign {cpu_data_master_byteenable_ext_flash_s1_segment_1,
cpu_data_master_byteenable_ext_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_ext_flash_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_ext_flash_s1_segment_0 :
    cpu_data_master_byteenable_ext_flash_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_ext_flash_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_0_is_x = ^(incoming_data_to_and_from_the_ext_flash[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_ext_flash_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[0];

  //incoming_data_to_and_from_the_ext_flash_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_1_is_x = ^(incoming_data_to_and_from_the_ext_flash[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_ext_flash_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[1];

  //incoming_data_to_and_from_the_ext_flash_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_2_is_x = ^(incoming_data_to_and_from_the_ext_flash[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_ext_flash_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[2];

  //incoming_data_to_and_from_the_ext_flash_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_3_is_x = ^(incoming_data_to_and_from_the_ext_flash[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_ext_flash_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[3];

  //incoming_data_to_and_from_the_ext_flash_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_4_is_x = ^(incoming_data_to_and_from_the_ext_flash[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_ext_flash_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[4];

  //incoming_data_to_and_from_the_ext_flash_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_5_is_x = ^(incoming_data_to_and_from_the_ext_flash[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_ext_flash_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[5];

  //incoming_data_to_and_from_the_ext_flash_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_6_is_x = ^(incoming_data_to_and_from_the_ext_flash[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_ext_flash_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[6];

  //incoming_data_to_and_from_the_ext_flash_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_7_is_x = ^(incoming_data_to_and_from_the_ext_flash[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_ext_flash_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[7];

  //incoming_data_to_and_from_the_ext_flash_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_8_is_x = ^(incoming_data_to_and_from_the_ext_flash[8]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[8] = incoming_data_to_and_from_the_ext_flash_bit_8_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[8];

  //incoming_data_to_and_from_the_ext_flash_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_9_is_x = ^(incoming_data_to_and_from_the_ext_flash[9]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[9] = incoming_data_to_and_from_the_ext_flash_bit_9_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[9];

  //incoming_data_to_and_from_the_ext_flash_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_10_is_x = ^(incoming_data_to_and_from_the_ext_flash[10]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[10] = incoming_data_to_and_from_the_ext_flash_bit_10_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[10];

  //incoming_data_to_and_from_the_ext_flash_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_11_is_x = ^(incoming_data_to_and_from_the_ext_flash[11]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[11] = incoming_data_to_and_from_the_ext_flash_bit_11_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[11];

  //incoming_data_to_and_from_the_ext_flash_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_12_is_x = ^(incoming_data_to_and_from_the_ext_flash[12]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[12] = incoming_data_to_and_from_the_ext_flash_bit_12_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[12];

  //incoming_data_to_and_from_the_ext_flash_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_13_is_x = ^(incoming_data_to_and_from_the_ext_flash[13]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[13] = incoming_data_to_and_from_the_ext_flash_bit_13_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[13];

  //incoming_data_to_and_from_the_ext_flash_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_14_is_x = ^(incoming_data_to_and_from_the_ext_flash[14]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[14] = incoming_data_to_and_from_the_ext_flash_bit_14_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[14];

  //incoming_data_to_and_from_the_ext_flash_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_ext_flash_bit_15_is_x = ^(incoming_data_to_and_from_the_ext_flash[15]) === 1'bx;

  //Crush incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0[15] = incoming_data_to_and_from_the_ext_flash_bit_15_is_x ? 1'b0 : incoming_data_to_and_from_the_ext_flash[15];

  //ext_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_ext_flash_s1 + cpu_instruction_master_granted_ext_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_ext_flash_s1 + cpu_instruction_master_saved_grant_ext_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0 = incoming_data_to_and_from_the_ext_flash;
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module flash_tristate_bridge_bridge_arbitrator 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module high_res_timer_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_read,
                                       cpu_data_master_waitrequest,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       high_res_timer_s1_irq,
                                       high_res_timer_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_data_master_granted_high_res_timer_s1,
                                       cpu_data_master_qualified_request_high_res_timer_s1,
                                       cpu_data_master_read_data_valid_high_res_timer_s1,
                                       cpu_data_master_requests_high_res_timer_s1,
                                       d1_high_res_timer_s1_end_xfer,
                                       high_res_timer_s1_address,
                                       high_res_timer_s1_chipselect,
                                       high_res_timer_s1_irq_from_sa,
                                       high_res_timer_s1_readdata_from_sa,
                                       high_res_timer_s1_reset_n,
                                       high_res_timer_s1_write_n,
                                       high_res_timer_s1_writedata
                                    )
;

  output           cpu_data_master_granted_high_res_timer_s1;
  output           cpu_data_master_qualified_request_high_res_timer_s1;
  output           cpu_data_master_read_data_valid_high_res_timer_s1;
  output           cpu_data_master_requests_high_res_timer_s1;
  output           d1_high_res_timer_s1_end_xfer;
  output  [  2: 0] high_res_timer_s1_address;
  output           high_res_timer_s1_chipselect;
  output           high_res_timer_s1_irq_from_sa;
  output  [ 15: 0] high_res_timer_s1_readdata_from_sa;
  output           high_res_timer_s1_reset_n;
  output           high_res_timer_s1_write_n;
  output  [ 15: 0] high_res_timer_s1_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            high_res_timer_s1_irq;
  input   [ 15: 0] high_res_timer_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_high_res_timer_s1;
  wire             cpu_data_master_qualified_request_high_res_timer_s1;
  wire             cpu_data_master_read_data_valid_high_res_timer_s1;
  wire             cpu_data_master_requests_high_res_timer_s1;
  wire             cpu_data_master_saved_grant_high_res_timer_s1;
  reg              d1_high_res_timer_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_high_res_timer_s1;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_allgrants;
  wire             high_res_timer_s1_allow_new_arb_cycle;
  wire             high_res_timer_s1_any_bursting_master_saved_grant;
  wire             high_res_timer_s1_any_continuerequest;
  wire             high_res_timer_s1_arb_counter_enable;
  reg     [  1: 0] high_res_timer_s1_arb_share_counter;
  wire    [  1: 0] high_res_timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] high_res_timer_s1_arb_share_set_values;
  wire             high_res_timer_s1_beginbursttransfer_internal;
  wire             high_res_timer_s1_begins_xfer;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_end_xfer;
  wire             high_res_timer_s1_firsttransfer;
  wire             high_res_timer_s1_grant_vector;
  wire             high_res_timer_s1_in_a_read_cycle;
  wire             high_res_timer_s1_in_a_write_cycle;
  wire             high_res_timer_s1_irq_from_sa;
  wire             high_res_timer_s1_master_qreq_vector;
  wire             high_res_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  reg              high_res_timer_s1_reg_firsttransfer;
  wire             high_res_timer_s1_reset_n;
  reg              high_res_timer_s1_slavearbiterlockenable;
  wire             high_res_timer_s1_slavearbiterlockenable2;
  wire             high_res_timer_s1_unreg_firsttransfer;
  wire             high_res_timer_s1_waits_for_read;
  wire             high_res_timer_s1_waits_for_write;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_high_res_timer_s1_from_cpu_data_master;
  wire             wait_for_high_res_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~high_res_timer_s1_end_xfer;
    end


  assign high_res_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_high_res_timer_s1));
  //assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign high_res_timer_s1_readdata_from_sa = high_res_timer_s1_readdata;

  assign cpu_data_master_requests_high_res_timer_s1 = ({cpu_data_master_address_to_slave[28 : 5] , 5'b0} == 29'h10022c20) & (cpu_data_master_read | cpu_data_master_write);
  //high_res_timer_s1_arb_share_counter set values, which is an e_mux
  assign high_res_timer_s1_arb_share_set_values = 1;

  //high_res_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign high_res_timer_s1_non_bursting_master_requests = cpu_data_master_requests_high_res_timer_s1;

  //high_res_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign high_res_timer_s1_any_bursting_master_saved_grant = 0;

  //high_res_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign high_res_timer_s1_arb_share_counter_next_value = high_res_timer_s1_firsttransfer ? (high_res_timer_s1_arb_share_set_values - 1) : |high_res_timer_s1_arb_share_counter ? (high_res_timer_s1_arb_share_counter - 1) : 0;

  //high_res_timer_s1_allgrants all slave grants, which is an e_mux
  assign high_res_timer_s1_allgrants = |high_res_timer_s1_grant_vector;

  //high_res_timer_s1_end_xfer assignment, which is an e_assign
  assign high_res_timer_s1_end_xfer = ~(high_res_timer_s1_waits_for_read | high_res_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_high_res_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_high_res_timer_s1 = high_res_timer_s1_end_xfer & (~high_res_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //high_res_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign high_res_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_high_res_timer_s1 & high_res_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_high_res_timer_s1 & ~high_res_timer_s1_non_bursting_master_requests);

  //high_res_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_arb_share_counter <= 0;
      else if (high_res_timer_s1_arb_counter_enable)
          high_res_timer_s1_arb_share_counter <= high_res_timer_s1_arb_share_counter_next_value;
    end


  //high_res_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_slavearbiterlockenable <= 0;
      else if ((|high_res_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_high_res_timer_s1) | (end_xfer_arb_share_counter_term_high_res_timer_s1 & ~high_res_timer_s1_non_bursting_master_requests))
          high_res_timer_s1_slavearbiterlockenable <= |high_res_timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master high_res_timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = high_res_timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //high_res_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign high_res_timer_s1_slavearbiterlockenable2 = |high_res_timer_s1_arb_share_counter_next_value;

  //cpu/data_master high_res_timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = high_res_timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //high_res_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign high_res_timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_high_res_timer_s1 = cpu_data_master_requests_high_res_timer_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //high_res_timer_s1_writedata mux, which is an e_mux
  assign high_res_timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_high_res_timer_s1 = cpu_data_master_qualified_request_high_res_timer_s1;

  //cpu/data_master saved-grant high_res_timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_high_res_timer_s1 = cpu_data_master_requests_high_res_timer_s1;

  //allow new arb cycle for high_res_timer/s1, which is an e_assign
  assign high_res_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign high_res_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign high_res_timer_s1_master_qreq_vector = 1;

  //high_res_timer_s1_reset_n assignment, which is an e_assign
  assign high_res_timer_s1_reset_n = reset_n;

  assign high_res_timer_s1_chipselect = cpu_data_master_granted_high_res_timer_s1;
  //high_res_timer_s1_firsttransfer first transaction, which is an e_assign
  assign high_res_timer_s1_firsttransfer = high_res_timer_s1_begins_xfer ? high_res_timer_s1_unreg_firsttransfer : high_res_timer_s1_reg_firsttransfer;

  //high_res_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign high_res_timer_s1_unreg_firsttransfer = ~(high_res_timer_s1_slavearbiterlockenable & high_res_timer_s1_any_continuerequest);

  //high_res_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          high_res_timer_s1_reg_firsttransfer <= 1'b1;
      else if (high_res_timer_s1_begins_xfer)
          high_res_timer_s1_reg_firsttransfer <= high_res_timer_s1_unreg_firsttransfer;
    end


  //high_res_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign high_res_timer_s1_beginbursttransfer_internal = high_res_timer_s1_begins_xfer;

  //~high_res_timer_s1_write_n assignment, which is an e_mux
  assign high_res_timer_s1_write_n = ~(cpu_data_master_granted_high_res_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_high_res_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //high_res_timer_s1_address mux, which is an e_mux
  assign high_res_timer_s1_address = shifted_address_to_high_res_timer_s1_from_cpu_data_master >> 2;

  //d1_high_res_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_high_res_timer_s1_end_xfer <= 1;
      else 
        d1_high_res_timer_s1_end_xfer <= high_res_timer_s1_end_xfer;
    end


  //high_res_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign high_res_timer_s1_waits_for_read = high_res_timer_s1_in_a_read_cycle & high_res_timer_s1_begins_xfer;

  //high_res_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign high_res_timer_s1_in_a_read_cycle = cpu_data_master_granted_high_res_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = high_res_timer_s1_in_a_read_cycle;

  //high_res_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign high_res_timer_s1_waits_for_write = high_res_timer_s1_in_a_write_cycle & 0;

  //high_res_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign high_res_timer_s1_in_a_write_cycle = cpu_data_master_granted_high_res_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = high_res_timer_s1_in_a_write_cycle;

  assign wait_for_high_res_timer_s1_counter = 0;
  //assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign high_res_timer_s1_irq_from_sa = high_res_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //high_res_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_read,
                                                 cpu_data_master_waitrequest,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 28: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10022c98) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_display_control_slave_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_data_master_address_to_slave,
                                               cpu_data_master_byteenable,
                                               cpu_data_master_read,
                                               cpu_data_master_write,
                                               cpu_data_master_writedata,
                                               lcd_display_control_slave_readdata,
                                               reset_n,

                                              // outputs:
                                               cpu_data_master_granted_lcd_display_control_slave,
                                               cpu_data_master_qualified_request_lcd_display_control_slave,
                                               cpu_data_master_read_data_valid_lcd_display_control_slave,
                                               cpu_data_master_requests_lcd_display_control_slave,
                                               d1_lcd_display_control_slave_end_xfer,
                                               lcd_display_control_slave_address,
                                               lcd_display_control_slave_begintransfer,
                                               lcd_display_control_slave_read,
                                               lcd_display_control_slave_readdata_from_sa,
                                               lcd_display_control_slave_reset_n,
                                               lcd_display_control_slave_wait_counter_eq_0,
                                               lcd_display_control_slave_wait_counter_eq_1,
                                               lcd_display_control_slave_write,
                                               lcd_display_control_slave_writedata
                                            )
;

  output           cpu_data_master_granted_lcd_display_control_slave;
  output           cpu_data_master_qualified_request_lcd_display_control_slave;
  output           cpu_data_master_read_data_valid_lcd_display_control_slave;
  output           cpu_data_master_requests_lcd_display_control_slave;
  output           d1_lcd_display_control_slave_end_xfer;
  output  [  1: 0] lcd_display_control_slave_address;
  output           lcd_display_control_slave_begintransfer;
  output           lcd_display_control_slave_read;
  output  [  7: 0] lcd_display_control_slave_readdata_from_sa;
  output           lcd_display_control_slave_reset_n;
  output           lcd_display_control_slave_wait_counter_eq_0;
  output           lcd_display_control_slave_wait_counter_eq_1;
  output           lcd_display_control_slave_write;
  output  [  7: 0] lcd_display_control_slave_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  7: 0] lcd_display_control_slave_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_lcd_display_control_slave;
  wire             cpu_data_master_qualified_request_lcd_display_control_slave;
  wire             cpu_data_master_read_data_valid_lcd_display_control_slave;
  wire             cpu_data_master_requests_lcd_display_control_slave;
  wire             cpu_data_master_saved_grant_lcd_display_control_slave;
  reg              d1_lcd_display_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_display_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_display_control_slave_address;
  wire             lcd_display_control_slave_allgrants;
  wire             lcd_display_control_slave_allow_new_arb_cycle;
  wire             lcd_display_control_slave_any_bursting_master_saved_grant;
  wire             lcd_display_control_slave_any_continuerequest;
  wire             lcd_display_control_slave_arb_counter_enable;
  reg     [  1: 0] lcd_display_control_slave_arb_share_counter;
  wire    [  1: 0] lcd_display_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] lcd_display_control_slave_arb_share_set_values;
  wire             lcd_display_control_slave_beginbursttransfer_internal;
  wire             lcd_display_control_slave_begins_xfer;
  wire             lcd_display_control_slave_begintransfer;
  wire    [  6: 0] lcd_display_control_slave_counter_load_value;
  wire             lcd_display_control_slave_end_xfer;
  wire             lcd_display_control_slave_firsttransfer;
  wire             lcd_display_control_slave_grant_vector;
  wire             lcd_display_control_slave_in_a_read_cycle;
  wire             lcd_display_control_slave_in_a_write_cycle;
  wire             lcd_display_control_slave_master_qreq_vector;
  wire             lcd_display_control_slave_non_bursting_master_requests;
  wire             lcd_display_control_slave_pretend_byte_enable;
  wire             lcd_display_control_slave_read;
  wire    [  7: 0] lcd_display_control_slave_readdata_from_sa;
  reg              lcd_display_control_slave_reg_firsttransfer;
  wire             lcd_display_control_slave_reset_n;
  reg              lcd_display_control_slave_slavearbiterlockenable;
  wire             lcd_display_control_slave_slavearbiterlockenable2;
  wire             lcd_display_control_slave_unreg_firsttransfer;
  reg     [  6: 0] lcd_display_control_slave_wait_counter;
  wire             lcd_display_control_slave_wait_counter_eq_0;
  wire             lcd_display_control_slave_wait_counter_eq_1;
  wire             lcd_display_control_slave_waits_for_read;
  wire             lcd_display_control_slave_waits_for_write;
  wire             lcd_display_control_slave_write;
  wire    [  7: 0] lcd_display_control_slave_writedata;
  wire    [ 28: 0] shifted_address_to_lcd_display_control_slave_from_cpu_data_master;
  wire             wait_for_lcd_display_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_display_control_slave_end_xfer;
    end


  assign lcd_display_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_lcd_display_control_slave));
  //assign lcd_display_control_slave_readdata_from_sa = lcd_display_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_display_control_slave_readdata_from_sa = lcd_display_control_slave_readdata;

  assign cpu_data_master_requests_lcd_display_control_slave = ({cpu_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10022c60) & (cpu_data_master_read | cpu_data_master_write);
  //lcd_display_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_display_control_slave_arb_share_set_values = 1;

  //lcd_display_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_display_control_slave_non_bursting_master_requests = cpu_data_master_requests_lcd_display_control_slave;

  //lcd_display_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_display_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_display_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_display_control_slave_arb_share_counter_next_value = lcd_display_control_slave_firsttransfer ? (lcd_display_control_slave_arb_share_set_values - 1) : |lcd_display_control_slave_arb_share_counter ? (lcd_display_control_slave_arb_share_counter - 1) : 0;

  //lcd_display_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_display_control_slave_allgrants = |lcd_display_control_slave_grant_vector;

  //lcd_display_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_display_control_slave_end_xfer = ~(lcd_display_control_slave_waits_for_read | lcd_display_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_display_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_display_control_slave = lcd_display_control_slave_end_xfer & (~lcd_display_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_display_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_display_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_display_control_slave & lcd_display_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_display_control_slave & ~lcd_display_control_slave_non_bursting_master_requests);

  //lcd_display_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_arb_share_counter <= 0;
      else if (lcd_display_control_slave_arb_counter_enable)
          lcd_display_control_slave_arb_share_counter <= lcd_display_control_slave_arb_share_counter_next_value;
    end


  //lcd_display_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_display_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_display_control_slave) | (end_xfer_arb_share_counter_term_lcd_display_control_slave & ~lcd_display_control_slave_non_bursting_master_requests))
          lcd_display_control_slave_slavearbiterlockenable <= |lcd_display_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master lcd_display/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = lcd_display_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //lcd_display_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_display_control_slave_slavearbiterlockenable2 = |lcd_display_control_slave_arb_share_counter_next_value;

  //cpu/data_master lcd_display/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = lcd_display_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //lcd_display_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_display_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_lcd_display_control_slave = cpu_data_master_requests_lcd_display_control_slave;
  //lcd_display_control_slave_writedata mux, which is an e_mux
  assign lcd_display_control_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_lcd_display_control_slave = cpu_data_master_qualified_request_lcd_display_control_slave;

  //cpu/data_master saved-grant lcd_display/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_lcd_display_control_slave = cpu_data_master_requests_lcd_display_control_slave;

  //allow new arb cycle for lcd_display/control_slave, which is an e_assign
  assign lcd_display_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_display_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_display_control_slave_master_qreq_vector = 1;

  assign lcd_display_control_slave_begintransfer = lcd_display_control_slave_begins_xfer;
  //lcd_display_control_slave_reset_n assignment, which is an e_assign
  assign lcd_display_control_slave_reset_n = reset_n;

  //lcd_display_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_display_control_slave_firsttransfer = lcd_display_control_slave_begins_xfer ? lcd_display_control_slave_unreg_firsttransfer : lcd_display_control_slave_reg_firsttransfer;

  //lcd_display_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_display_control_slave_unreg_firsttransfer = ~(lcd_display_control_slave_slavearbiterlockenable & lcd_display_control_slave_any_continuerequest);

  //lcd_display_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_display_control_slave_begins_xfer)
          lcd_display_control_slave_reg_firsttransfer <= lcd_display_control_slave_unreg_firsttransfer;
    end


  //lcd_display_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_display_control_slave_beginbursttransfer_internal = lcd_display_control_slave_begins_xfer;

  //lcd_display_control_slave_read assignment, which is an e_mux
  assign lcd_display_control_slave_read = ((cpu_data_master_granted_lcd_display_control_slave & cpu_data_master_read))& ~lcd_display_control_slave_begins_xfer & (lcd_display_control_slave_wait_counter < 22);

  //lcd_display_control_slave_write assignment, which is an e_mux
  assign lcd_display_control_slave_write = ((cpu_data_master_granted_lcd_display_control_slave & cpu_data_master_write)) & ~lcd_display_control_slave_begins_xfer & (lcd_display_control_slave_wait_counter >= 22) & (lcd_display_control_slave_wait_counter < 44) & lcd_display_control_slave_pretend_byte_enable;

  assign shifted_address_to_lcd_display_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //lcd_display_control_slave_address mux, which is an e_mux
  assign lcd_display_control_slave_address = shifted_address_to_lcd_display_control_slave_from_cpu_data_master >> 2;

  //d1_lcd_display_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_display_control_slave_end_xfer <= 1;
      else 
        d1_lcd_display_control_slave_end_xfer <= lcd_display_control_slave_end_xfer;
    end


  //lcd_display_control_slave_wait_counter_eq_1 assignment, which is an e_assign
  assign lcd_display_control_slave_wait_counter_eq_1 = lcd_display_control_slave_wait_counter == 1;

  //lcd_display_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_display_control_slave_waits_for_read = lcd_display_control_slave_in_a_read_cycle & wait_for_lcd_display_control_slave_counter;

  //lcd_display_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_display_control_slave_in_a_read_cycle = cpu_data_master_granted_lcd_display_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_display_control_slave_in_a_read_cycle;

  //lcd_display_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_display_control_slave_waits_for_write = lcd_display_control_slave_in_a_write_cycle & wait_for_lcd_display_control_slave_counter;

  //lcd_display_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_display_control_slave_in_a_write_cycle = cpu_data_master_granted_lcd_display_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_display_control_slave_in_a_write_cycle;

  assign lcd_display_control_slave_wait_counter_eq_0 = lcd_display_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_wait_counter <= 0;
      else 
        lcd_display_control_slave_wait_counter <= lcd_display_control_slave_counter_load_value;
    end


  assign lcd_display_control_slave_counter_load_value = ((lcd_display_control_slave_in_a_write_cycle & lcd_display_control_slave_begins_xfer))? 64 :
    ((lcd_display_control_slave_in_a_read_cycle & lcd_display_control_slave_begins_xfer))? 42 :
    (~lcd_display_control_slave_wait_counter_eq_0)? lcd_display_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_display_control_slave_counter = lcd_display_control_slave_begins_xfer | ~lcd_display_control_slave_wait_counter_eq_0;
  //lcd_display_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_display_control_slave_pretend_byte_enable = (cpu_data_master_granted_lcd_display_control_slave)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_display/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_pio_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_data_master_address_to_slave,
                                cpu_data_master_read,
                                cpu_data_master_waitrequest,
                                cpu_data_master_write,
                                cpu_data_master_writedata,
                                led_pio_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_data_master_granted_led_pio_s1,
                                cpu_data_master_qualified_request_led_pio_s1,
                                cpu_data_master_read_data_valid_led_pio_s1,
                                cpu_data_master_requests_led_pio_s1,
                                d1_led_pio_s1_end_xfer,
                                led_pio_s1_address,
                                led_pio_s1_chipselect,
                                led_pio_s1_readdata_from_sa,
                                led_pio_s1_reset_n,
                                led_pio_s1_write_n,
                                led_pio_s1_writedata
                             )
;

  output           cpu_data_master_granted_led_pio_s1;
  output           cpu_data_master_qualified_request_led_pio_s1;
  output           cpu_data_master_read_data_valid_led_pio_s1;
  output           cpu_data_master_requests_led_pio_s1;
  output           d1_led_pio_s1_end_xfer;
  output  [  1: 0] led_pio_s1_address;
  output           led_pio_s1_chipselect;
  output  [ 31: 0] led_pio_s1_readdata_from_sa;
  output           led_pio_s1_reset_n;
  output           led_pio_s1_write_n;
  output  [ 31: 0] led_pio_s1_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] led_pio_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_led_pio_s1;
  wire             cpu_data_master_qualified_request_led_pio_s1;
  wire             cpu_data_master_read_data_valid_led_pio_s1;
  wire             cpu_data_master_requests_led_pio_s1;
  wire             cpu_data_master_saved_grant_led_pio_s1;
  reg              d1_led_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_allgrants;
  wire             led_pio_s1_allow_new_arb_cycle;
  wire             led_pio_s1_any_bursting_master_saved_grant;
  wire             led_pio_s1_any_continuerequest;
  wire             led_pio_s1_arb_counter_enable;
  reg     [  1: 0] led_pio_s1_arb_share_counter;
  wire    [  1: 0] led_pio_s1_arb_share_counter_next_value;
  wire    [  1: 0] led_pio_s1_arb_share_set_values;
  wire             led_pio_s1_beginbursttransfer_internal;
  wire             led_pio_s1_begins_xfer;
  wire             led_pio_s1_chipselect;
  wire             led_pio_s1_end_xfer;
  wire             led_pio_s1_firsttransfer;
  wire             led_pio_s1_grant_vector;
  wire             led_pio_s1_in_a_read_cycle;
  wire             led_pio_s1_in_a_write_cycle;
  wire             led_pio_s1_master_qreq_vector;
  wire             led_pio_s1_non_bursting_master_requests;
  wire    [ 31: 0] led_pio_s1_readdata_from_sa;
  reg              led_pio_s1_reg_firsttransfer;
  wire             led_pio_s1_reset_n;
  reg              led_pio_s1_slavearbiterlockenable;
  wire             led_pio_s1_slavearbiterlockenable2;
  wire             led_pio_s1_unreg_firsttransfer;
  wire             led_pio_s1_waits_for_read;
  wire             led_pio_s1_waits_for_write;
  wire             led_pio_s1_write_n;
  wire    [ 31: 0] led_pio_s1_writedata;
  wire    [ 28: 0] shifted_address_to_led_pio_s1_from_cpu_data_master;
  wire             wait_for_led_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~led_pio_s1_end_xfer;
    end


  assign led_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_led_pio_s1));
  //assign led_pio_s1_readdata_from_sa = led_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign led_pio_s1_readdata_from_sa = led_pio_s1_readdata;

  assign cpu_data_master_requests_led_pio_s1 = ({cpu_data_master_address_to_slave[28 : 4] , 4'b0} == 29'h10022c70) & (cpu_data_master_read | cpu_data_master_write);
  //led_pio_s1_arb_share_counter set values, which is an e_mux
  assign led_pio_s1_arb_share_set_values = 1;

  //led_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_pio_s1_non_bursting_master_requests = cpu_data_master_requests_led_pio_s1;

  //led_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_pio_s1_any_bursting_master_saved_grant = 0;

  //led_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_pio_s1_arb_share_counter_next_value = led_pio_s1_firsttransfer ? (led_pio_s1_arb_share_set_values - 1) : |led_pio_s1_arb_share_counter ? (led_pio_s1_arb_share_counter - 1) : 0;

  //led_pio_s1_allgrants all slave grants, which is an e_mux
  assign led_pio_s1_allgrants = |led_pio_s1_grant_vector;

  //led_pio_s1_end_xfer assignment, which is an e_assign
  assign led_pio_s1_end_xfer = ~(led_pio_s1_waits_for_read | led_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_pio_s1 = led_pio_s1_end_xfer & (~led_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_pio_s1 & led_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_led_pio_s1 & ~led_pio_s1_non_bursting_master_requests);

  //led_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_arb_share_counter <= 0;
      else if (led_pio_s1_arb_counter_enable)
          led_pio_s1_arb_share_counter <= led_pio_s1_arb_share_counter_next_value;
    end


  //led_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_slavearbiterlockenable <= 0;
      else if ((|led_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_pio_s1) | (end_xfer_arb_share_counter_term_led_pio_s1 & ~led_pio_s1_non_bursting_master_requests))
          led_pio_s1_slavearbiterlockenable <= |led_pio_s1_arb_share_counter_next_value;
    end


  //cpu/data_master led_pio/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = led_pio_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //led_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_pio_s1_slavearbiterlockenable2 = |led_pio_s1_arb_share_counter_next_value;

  //cpu/data_master led_pio/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = led_pio_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //led_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_pio_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_led_pio_s1 = cpu_data_master_requests_led_pio_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //led_pio_s1_writedata mux, which is an e_mux
  assign led_pio_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_led_pio_s1 = cpu_data_master_qualified_request_led_pio_s1;

  //cpu/data_master saved-grant led_pio/s1, which is an e_assign
  assign cpu_data_master_saved_grant_led_pio_s1 = cpu_data_master_requests_led_pio_s1;

  //allow new arb cycle for led_pio/s1, which is an e_assign
  assign led_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_pio_s1_master_qreq_vector = 1;

  //led_pio_s1_reset_n assignment, which is an e_assign
  assign led_pio_s1_reset_n = reset_n;

  assign led_pio_s1_chipselect = cpu_data_master_granted_led_pio_s1;
  //led_pio_s1_firsttransfer first transaction, which is an e_assign
  assign led_pio_s1_firsttransfer = led_pio_s1_begins_xfer ? led_pio_s1_unreg_firsttransfer : led_pio_s1_reg_firsttransfer;

  //led_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_pio_s1_unreg_firsttransfer = ~(led_pio_s1_slavearbiterlockenable & led_pio_s1_any_continuerequest);

  //led_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_reg_firsttransfer <= 1'b1;
      else if (led_pio_s1_begins_xfer)
          led_pio_s1_reg_firsttransfer <= led_pio_s1_unreg_firsttransfer;
    end


  //led_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_pio_s1_beginbursttransfer_internal = led_pio_s1_begins_xfer;

  //~led_pio_s1_write_n assignment, which is an e_mux
  assign led_pio_s1_write_n = ~(cpu_data_master_granted_led_pio_s1 & cpu_data_master_write);

  assign shifted_address_to_led_pio_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //led_pio_s1_address mux, which is an e_mux
  assign led_pio_s1_address = shifted_address_to_led_pio_s1_from_cpu_data_master >> 2;

  //d1_led_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_pio_s1_end_xfer <= 1;
      else 
        d1_led_pio_s1_end_xfer <= led_pio_s1_end_xfer;
    end


  //led_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign led_pio_s1_waits_for_read = led_pio_s1_in_a_read_cycle & led_pio_s1_begins_xfer;

  //led_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_pio_s1_in_a_read_cycle = cpu_data_master_granted_led_pio_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_pio_s1_in_a_read_cycle;

  //led_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign led_pio_s1_waits_for_write = led_pio_s1_in_a_write_cycle & 0;

  //led_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_pio_s1_in_a_write_cycle = cpu_data_master_granted_led_pio_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_pio_s1_in_a_write_cycle;

  assign wait_for_led_pio_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_ram_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_latency_counter,
                                   cpu_instruction_master_read,
                                   cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register,
                                   onchip_ram_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_ram_s1,
                                   cpu_data_master_qualified_request_onchip_ram_s1,
                                   cpu_data_master_read_data_valid_onchip_ram_s1,
                                   cpu_data_master_requests_onchip_ram_s1,
                                   cpu_instruction_master_granted_onchip_ram_s1,
                                   cpu_instruction_master_qualified_request_onchip_ram_s1,
                                   cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                   cpu_instruction_master_requests_onchip_ram_s1,
                                   d1_onchip_ram_s1_end_xfer,
                                   onchip_ram_s1_address,
                                   onchip_ram_s1_byteenable,
                                   onchip_ram_s1_chipselect,
                                   onchip_ram_s1_clken,
                                   onchip_ram_s1_readdata_from_sa,
                                   onchip_ram_s1_reset,
                                   onchip_ram_s1_write,
                                   onchip_ram_s1_writedata,
                                   registered_cpu_data_master_read_data_valid_onchip_ram_s1
                                )
;

  output           cpu_data_master_granted_onchip_ram_s1;
  output           cpu_data_master_qualified_request_onchip_ram_s1;
  output           cpu_data_master_read_data_valid_onchip_ram_s1;
  output           cpu_data_master_requests_onchip_ram_s1;
  output           cpu_instruction_master_granted_onchip_ram_s1;
  output           cpu_instruction_master_qualified_request_onchip_ram_s1;
  output           cpu_instruction_master_read_data_valid_onchip_ram_s1;
  output           cpu_instruction_master_requests_onchip_ram_s1;
  output           d1_onchip_ram_s1_end_xfer;
  output  [ 13: 0] onchip_ram_s1_address;
  output  [  3: 0] onchip_ram_s1_byteenable;
  output           onchip_ram_s1_chipselect;
  output           onchip_ram_s1_clken;
  output  [ 31: 0] onchip_ram_s1_readdata_from_sa;
  output           onchip_ram_s1_reset;
  output           onchip_ram_s1_write;
  output  [ 31: 0] onchip_ram_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 28: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  input   [ 31: 0] onchip_ram_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  reg              cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_saved_grant_onchip_ram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_saved_grant_onchip_ram_s1;
  reg              d1_onchip_ram_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_ram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
  wire    [ 13: 0] onchip_ram_s1_address;
  wire             onchip_ram_s1_allgrants;
  wire             onchip_ram_s1_allow_new_arb_cycle;
  wire             onchip_ram_s1_any_bursting_master_saved_grant;
  wire             onchip_ram_s1_any_continuerequest;
  reg     [  1: 0] onchip_ram_s1_arb_addend;
  wire             onchip_ram_s1_arb_counter_enable;
  reg     [  1: 0] onchip_ram_s1_arb_share_counter;
  wire    [  1: 0] onchip_ram_s1_arb_share_counter_next_value;
  wire    [  1: 0] onchip_ram_s1_arb_share_set_values;
  wire    [  1: 0] onchip_ram_s1_arb_winner;
  wire             onchip_ram_s1_arbitration_holdoff_internal;
  wire             onchip_ram_s1_beginbursttransfer_internal;
  wire             onchip_ram_s1_begins_xfer;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire    [  3: 0] onchip_ram_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_ram_s1_chosen_master_rot_left;
  wire             onchip_ram_s1_clken;
  wire             onchip_ram_s1_end_xfer;
  wire             onchip_ram_s1_firsttransfer;
  wire    [  1: 0] onchip_ram_s1_grant_vector;
  wire             onchip_ram_s1_in_a_read_cycle;
  wire             onchip_ram_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_ram_s1_master_qreq_vector;
  wire             onchip_ram_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  reg              onchip_ram_s1_reg_firsttransfer;
  wire             onchip_ram_s1_reset;
  reg     [  1: 0] onchip_ram_s1_saved_chosen_master_vector;
  reg              onchip_ram_s1_slavearbiterlockenable;
  wire             onchip_ram_s1_slavearbiterlockenable2;
  wire             onchip_ram_s1_unreg_firsttransfer;
  wire             onchip_ram_s1_waits_for_read;
  wire             onchip_ram_s1_waits_for_write;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  wire    [ 28: 0] shifted_address_to_onchip_ram_s1_from_cpu_data_master;
  wire    [ 28: 0] shifted_address_to_onchip_ram_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_ram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_ram_s1_end_xfer;
    end


  assign onchip_ram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_ram_s1 | cpu_instruction_master_qualified_request_onchip_ram_s1));
  //assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata;

  assign cpu_data_master_requests_onchip_ram_s1 = ({cpu_data_master_address_to_slave[28 : 16] , 16'b0} == 29'h10010000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_ram_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;

  //onchip_ram_s1_arb_share_counter set values, which is an e_mux
  assign onchip_ram_s1_arb_share_set_values = 1;

  //onchip_ram_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_ram_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1 |
    cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_ram_s1_any_bursting_master_saved_grant = 0;

  //onchip_ram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_ram_s1_arb_share_counter_next_value = onchip_ram_s1_firsttransfer ? (onchip_ram_s1_arb_share_set_values - 1) : |onchip_ram_s1_arb_share_counter ? (onchip_ram_s1_arb_share_counter - 1) : 0;

  //onchip_ram_s1_allgrants all slave grants, which is an e_mux
  assign onchip_ram_s1_allgrants = (|onchip_ram_s1_grant_vector) |
    (|onchip_ram_s1_grant_vector) |
    (|onchip_ram_s1_grant_vector) |
    (|onchip_ram_s1_grant_vector);

  //onchip_ram_s1_end_xfer assignment, which is an e_assign
  assign onchip_ram_s1_end_xfer = ~(onchip_ram_s1_waits_for_read | onchip_ram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_ram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_ram_s1 = onchip_ram_s1_end_xfer & (~onchip_ram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_ram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_ram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_ram_s1 & onchip_ram_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests);

  //onchip_ram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_share_counter <= 0;
      else if (onchip_ram_s1_arb_counter_enable)
          onchip_ram_s1_arb_share_counter <= onchip_ram_s1_arb_share_counter_next_value;
    end


  //onchip_ram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_ram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_ram_s1) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests))
          onchip_ram_s1_slavearbiterlockenable <= |onchip_ram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_ram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_ram_s1_slavearbiterlockenable2 = |onchip_ram_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= cpu_instruction_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 & cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_ram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_ram_s1 = cpu_data_master_requests_onchip_ram_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_ram_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read & ~onchip_ram_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_ram_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_data_master_read_data_valid_onchip_ram_s1_shift_register, cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;

  //onchip_ram_s1_writedata mux, which is an e_mux
  assign onchip_ram_s1_writedata = cpu_data_master_writedata;

  //mux onchip_ram_s1_clken, which is an e_mux
  assign onchip_ram_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_ram_s1 = (({cpu_instruction_master_address_to_slave[28 : 16] , 16'b0} == 29'h10010000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= cpu_data_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 & cpu_data_master_requests_onchip_ram_s1;

  assign cpu_instruction_master_qualified_request_onchip_ram_s1 = cpu_instruction_master_requests_onchip_ram_s1 & ~((cpu_instruction_master_read & ((1 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read & ~onchip_ram_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1 = cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;

  //allow new arb cycle for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_ram_s1;

  //cpu/instruction_master grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_ram_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_ram_s1;

  //cpu/data_master grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[1] && cpu_data_master_requests_onchip_ram_s1;

  //onchip_ram/s1 chosen-master double-vector, which is an e_assign
  assign onchip_ram_s1_chosen_master_double_vector = {onchip_ram_s1_master_qreq_vector, onchip_ram_s1_master_qreq_vector} & ({~onchip_ram_s1_master_qreq_vector, ~onchip_ram_s1_master_qreq_vector} + onchip_ram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_ram_s1_arb_winner = (onchip_ram_s1_allow_new_arb_cycle & | onchip_ram_s1_grant_vector) ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;

  //saved onchip_ram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_saved_chosen_master_vector <= 0;
      else if (onchip_ram_s1_allow_new_arb_cycle)
          onchip_ram_s1_saved_chosen_master_vector <= |onchip_ram_s1_grant_vector ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_ram_s1_grant_vector = {(onchip_ram_s1_chosen_master_double_vector[1] | onchip_ram_s1_chosen_master_double_vector[3]),
    (onchip_ram_s1_chosen_master_double_vector[0] | onchip_ram_s1_chosen_master_double_vector[2])};

  //onchip_ram/s1 chosen master rotated left, which is an e_assign
  assign onchip_ram_s1_chosen_master_rot_left = (onchip_ram_s1_arb_winner << 1) ? (onchip_ram_s1_arb_winner << 1) : 1;

  //onchip_ram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_addend <= 1;
      else if (|onchip_ram_s1_grant_vector)
          onchip_ram_s1_arb_addend <= onchip_ram_s1_end_xfer? onchip_ram_s1_chosen_master_rot_left : onchip_ram_s1_grant_vector;
    end


  //~onchip_ram_s1_reset assignment, which is an e_assign
  assign onchip_ram_s1_reset = ~reset_n;

  assign onchip_ram_s1_chipselect = cpu_data_master_granted_onchip_ram_s1 | cpu_instruction_master_granted_onchip_ram_s1;
  //onchip_ram_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_firsttransfer = onchip_ram_s1_begins_xfer ? onchip_ram_s1_unreg_firsttransfer : onchip_ram_s1_reg_firsttransfer;

  //onchip_ram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_unreg_firsttransfer = ~(onchip_ram_s1_slavearbiterlockenable & onchip_ram_s1_any_continuerequest);

  //onchip_ram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_ram_s1_begins_xfer)
          onchip_ram_s1_reg_firsttransfer <= onchip_ram_s1_unreg_firsttransfer;
    end


  //onchip_ram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_ram_s1_beginbursttransfer_internal = onchip_ram_s1_begins_xfer;

  //onchip_ram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_ram_s1_arbitration_holdoff_internal = onchip_ram_s1_begins_xfer & onchip_ram_s1_firsttransfer;

  //onchip_ram_s1_write assignment, which is an e_mux
  assign onchip_ram_s1_write = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_ram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_ram_s1_address mux, which is an e_mux
  assign onchip_ram_s1_address = (cpu_data_master_granted_onchip_ram_s1)? (shifted_address_to_onchip_ram_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_ram_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_ram_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_ram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_ram_s1_end_xfer <= 1;
      else 
        d1_onchip_ram_s1_end_xfer <= onchip_ram_s1_end_xfer;
    end


  //onchip_ram_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_read = onchip_ram_s1_in_a_read_cycle & 0;

  //onchip_ram_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_ram_s1_in_a_read_cycle;

  //onchip_ram_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_write = onchip_ram_s1_in_a_write_cycle & 0;

  //onchip_ram_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_write_cycle = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_ram_s1_in_a_write_cycle;

  assign wait_for_onchip_ram_s1_counter = 0;
  //onchip_ram_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_ram_s1_byteenable = (cpu_data_master_granted_onchip_ram_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_ram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_ram_s1 + cpu_instruction_master_granted_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_ram_s1 + cpu_instruction_master_saved_grant_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_rx_csr_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_data_master_address_to_slave,
                                  cpu_data_master_read,
                                  cpu_data_master_waitrequest,
                                  cpu_data_master_write,
                                  cpu_data_master_writedata,
                                  reset_n,
                                  sgdma_rx_csr_irq,
                                  sgdma_rx_csr_readdata,

                                 // outputs:
                                  cpu_data_master_granted_sgdma_rx_csr,
                                  cpu_data_master_qualified_request_sgdma_rx_csr,
                                  cpu_data_master_read_data_valid_sgdma_rx_csr,
                                  cpu_data_master_requests_sgdma_rx_csr,
                                  d1_sgdma_rx_csr_end_xfer,
                                  sgdma_rx_csr_address,
                                  sgdma_rx_csr_chipselect,
                                  sgdma_rx_csr_irq_from_sa,
                                  sgdma_rx_csr_read,
                                  sgdma_rx_csr_readdata_from_sa,
                                  sgdma_rx_csr_reset_n,
                                  sgdma_rx_csr_write,
                                  sgdma_rx_csr_writedata
                               )
;

  output           cpu_data_master_granted_sgdma_rx_csr;
  output           cpu_data_master_qualified_request_sgdma_rx_csr;
  output           cpu_data_master_read_data_valid_sgdma_rx_csr;
  output           cpu_data_master_requests_sgdma_rx_csr;
  output           d1_sgdma_rx_csr_end_xfer;
  output  [  3: 0] sgdma_rx_csr_address;
  output           sgdma_rx_csr_chipselect;
  output           sgdma_rx_csr_irq_from_sa;
  output           sgdma_rx_csr_read;
  output  [ 31: 0] sgdma_rx_csr_readdata_from_sa;
  output           sgdma_rx_csr_reset_n;
  output           sgdma_rx_csr_write;
  output  [ 31: 0] sgdma_rx_csr_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sgdma_rx_csr_irq;
  input   [ 31: 0] sgdma_rx_csr_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sgdma_rx_csr;
  wire             cpu_data_master_qualified_request_sgdma_rx_csr;
  wire             cpu_data_master_read_data_valid_sgdma_rx_csr;
  wire             cpu_data_master_requests_sgdma_rx_csr;
  wire             cpu_data_master_saved_grant_sgdma_rx_csr;
  reg              d1_reasons_to_wait;
  reg              d1_sgdma_rx_csr_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sgdma_rx_csr;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] sgdma_rx_csr_address;
  wire             sgdma_rx_csr_allgrants;
  wire             sgdma_rx_csr_allow_new_arb_cycle;
  wire             sgdma_rx_csr_any_bursting_master_saved_grant;
  wire             sgdma_rx_csr_any_continuerequest;
  wire             sgdma_rx_csr_arb_counter_enable;
  reg     [  1: 0] sgdma_rx_csr_arb_share_counter;
  wire    [  1: 0] sgdma_rx_csr_arb_share_counter_next_value;
  wire    [  1: 0] sgdma_rx_csr_arb_share_set_values;
  wire             sgdma_rx_csr_beginbursttransfer_internal;
  wire             sgdma_rx_csr_begins_xfer;
  wire             sgdma_rx_csr_chipselect;
  wire             sgdma_rx_csr_end_xfer;
  wire             sgdma_rx_csr_firsttransfer;
  wire             sgdma_rx_csr_grant_vector;
  wire             sgdma_rx_csr_in_a_read_cycle;
  wire             sgdma_rx_csr_in_a_write_cycle;
  wire             sgdma_rx_csr_irq_from_sa;
  wire             sgdma_rx_csr_master_qreq_vector;
  wire             sgdma_rx_csr_non_bursting_master_requests;
  wire             sgdma_rx_csr_read;
  wire    [ 31: 0] sgdma_rx_csr_readdata_from_sa;
  reg              sgdma_rx_csr_reg_firsttransfer;
  wire             sgdma_rx_csr_reset_n;
  reg              sgdma_rx_csr_slavearbiterlockenable;
  wire             sgdma_rx_csr_slavearbiterlockenable2;
  wire             sgdma_rx_csr_unreg_firsttransfer;
  wire             sgdma_rx_csr_waits_for_read;
  wire             sgdma_rx_csr_waits_for_write;
  wire             sgdma_rx_csr_write;
  wire    [ 31: 0] sgdma_rx_csr_writedata;
  wire    [ 28: 0] shifted_address_to_sgdma_rx_csr_from_cpu_data_master;
  wire             wait_for_sgdma_rx_csr_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sgdma_rx_csr_end_xfer;
    end


  assign sgdma_rx_csr_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sgdma_rx_csr));
  //assign sgdma_rx_csr_readdata_from_sa = sgdma_rx_csr_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_rx_csr_readdata_from_sa = sgdma_rx_csr_readdata;

  assign cpu_data_master_requests_sgdma_rx_csr = ({cpu_data_master_address_to_slave[28 : 6] , 6'b0} == 29'h10022400) & (cpu_data_master_read | cpu_data_master_write);
  //sgdma_rx_csr_arb_share_counter set values, which is an e_mux
  assign sgdma_rx_csr_arb_share_set_values = 1;

  //sgdma_rx_csr_non_bursting_master_requests mux, which is an e_mux
  assign sgdma_rx_csr_non_bursting_master_requests = cpu_data_master_requests_sgdma_rx_csr;

  //sgdma_rx_csr_any_bursting_master_saved_grant mux, which is an e_mux
  assign sgdma_rx_csr_any_bursting_master_saved_grant = 0;

  //sgdma_rx_csr_arb_share_counter_next_value assignment, which is an e_assign
  assign sgdma_rx_csr_arb_share_counter_next_value = sgdma_rx_csr_firsttransfer ? (sgdma_rx_csr_arb_share_set_values - 1) : |sgdma_rx_csr_arb_share_counter ? (sgdma_rx_csr_arb_share_counter - 1) : 0;

  //sgdma_rx_csr_allgrants all slave grants, which is an e_mux
  assign sgdma_rx_csr_allgrants = |sgdma_rx_csr_grant_vector;

  //sgdma_rx_csr_end_xfer assignment, which is an e_assign
  assign sgdma_rx_csr_end_xfer = ~(sgdma_rx_csr_waits_for_read | sgdma_rx_csr_waits_for_write);

  //end_xfer_arb_share_counter_term_sgdma_rx_csr arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sgdma_rx_csr = sgdma_rx_csr_end_xfer & (~sgdma_rx_csr_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sgdma_rx_csr_arb_share_counter arbitration counter enable, which is an e_assign
  assign sgdma_rx_csr_arb_counter_enable = (end_xfer_arb_share_counter_term_sgdma_rx_csr & sgdma_rx_csr_allgrants) | (end_xfer_arb_share_counter_term_sgdma_rx_csr & ~sgdma_rx_csr_non_bursting_master_requests);

  //sgdma_rx_csr_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_csr_arb_share_counter <= 0;
      else if (sgdma_rx_csr_arb_counter_enable)
          sgdma_rx_csr_arb_share_counter <= sgdma_rx_csr_arb_share_counter_next_value;
    end


  //sgdma_rx_csr_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_csr_slavearbiterlockenable <= 0;
      else if ((|sgdma_rx_csr_master_qreq_vector & end_xfer_arb_share_counter_term_sgdma_rx_csr) | (end_xfer_arb_share_counter_term_sgdma_rx_csr & ~sgdma_rx_csr_non_bursting_master_requests))
          sgdma_rx_csr_slavearbiterlockenable <= |sgdma_rx_csr_arb_share_counter_next_value;
    end


  //cpu/data_master sgdma_rx/csr arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sgdma_rx_csr_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sgdma_rx_csr_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sgdma_rx_csr_slavearbiterlockenable2 = |sgdma_rx_csr_arb_share_counter_next_value;

  //cpu/data_master sgdma_rx/csr arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sgdma_rx_csr_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sgdma_rx_csr_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sgdma_rx_csr_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sgdma_rx_csr = cpu_data_master_requests_sgdma_rx_csr & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //sgdma_rx_csr_writedata mux, which is an e_mux
  assign sgdma_rx_csr_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sgdma_rx_csr = cpu_data_master_qualified_request_sgdma_rx_csr;

  //cpu/data_master saved-grant sgdma_rx/csr, which is an e_assign
  assign cpu_data_master_saved_grant_sgdma_rx_csr = cpu_data_master_requests_sgdma_rx_csr;

  //allow new arb cycle for sgdma_rx/csr, which is an e_assign
  assign sgdma_rx_csr_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sgdma_rx_csr_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sgdma_rx_csr_master_qreq_vector = 1;

  //sgdma_rx_csr_reset_n assignment, which is an e_assign
  assign sgdma_rx_csr_reset_n = reset_n;

  assign sgdma_rx_csr_chipselect = cpu_data_master_granted_sgdma_rx_csr;
  //sgdma_rx_csr_firsttransfer first transaction, which is an e_assign
  assign sgdma_rx_csr_firsttransfer = sgdma_rx_csr_begins_xfer ? sgdma_rx_csr_unreg_firsttransfer : sgdma_rx_csr_reg_firsttransfer;

  //sgdma_rx_csr_unreg_firsttransfer first transaction, which is an e_assign
  assign sgdma_rx_csr_unreg_firsttransfer = ~(sgdma_rx_csr_slavearbiterlockenable & sgdma_rx_csr_any_continuerequest);

  //sgdma_rx_csr_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_csr_reg_firsttransfer <= 1'b1;
      else if (sgdma_rx_csr_begins_xfer)
          sgdma_rx_csr_reg_firsttransfer <= sgdma_rx_csr_unreg_firsttransfer;
    end


  //sgdma_rx_csr_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sgdma_rx_csr_beginbursttransfer_internal = sgdma_rx_csr_begins_xfer;

  //sgdma_rx_csr_read assignment, which is an e_mux
  assign sgdma_rx_csr_read = cpu_data_master_granted_sgdma_rx_csr & cpu_data_master_read;

  //sgdma_rx_csr_write assignment, which is an e_mux
  assign sgdma_rx_csr_write = cpu_data_master_granted_sgdma_rx_csr & cpu_data_master_write;

  assign shifted_address_to_sgdma_rx_csr_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sgdma_rx_csr_address mux, which is an e_mux
  assign sgdma_rx_csr_address = shifted_address_to_sgdma_rx_csr_from_cpu_data_master >> 2;

  //d1_sgdma_rx_csr_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sgdma_rx_csr_end_xfer <= 1;
      else 
        d1_sgdma_rx_csr_end_xfer <= sgdma_rx_csr_end_xfer;
    end


  //sgdma_rx_csr_waits_for_read in a cycle, which is an e_mux
  assign sgdma_rx_csr_waits_for_read = sgdma_rx_csr_in_a_read_cycle & sgdma_rx_csr_begins_xfer;

  //sgdma_rx_csr_in_a_read_cycle assignment, which is an e_assign
  assign sgdma_rx_csr_in_a_read_cycle = cpu_data_master_granted_sgdma_rx_csr & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sgdma_rx_csr_in_a_read_cycle;

  //sgdma_rx_csr_waits_for_write in a cycle, which is an e_mux
  assign sgdma_rx_csr_waits_for_write = sgdma_rx_csr_in_a_write_cycle & 0;

  //sgdma_rx_csr_in_a_write_cycle assignment, which is an e_assign
  assign sgdma_rx_csr_in_a_write_cycle = cpu_data_master_granted_sgdma_rx_csr & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sgdma_rx_csr_in_a_write_cycle;

  assign wait_for_sgdma_rx_csr_counter = 0;
  //assign sgdma_rx_csr_irq_from_sa = sgdma_rx_csr_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_rx_csr_irq_from_sa = sgdma_rx_csr_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_rx/csr enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_rx_in_arbitrator (
                                // inputs:
                                 clk,
                                 reset_n,
                                 sgdma_rx_in_ready,
                                 tse_mac_receive_data,
                                 tse_mac_receive_empty,
                                 tse_mac_receive_endofpacket,
                                 tse_mac_receive_error,
                                 tse_mac_receive_startofpacket,
                                 tse_mac_receive_valid,

                                // outputs:
                                 sgdma_rx_in_data,
                                 sgdma_rx_in_empty,
                                 sgdma_rx_in_endofpacket,
                                 sgdma_rx_in_error,
                                 sgdma_rx_in_ready_from_sa,
                                 sgdma_rx_in_startofpacket,
                                 sgdma_rx_in_valid
                              )
;

  output  [ 31: 0] sgdma_rx_in_data;
  output  [  1: 0] sgdma_rx_in_empty;
  output           sgdma_rx_in_endofpacket;
  output  [  5: 0] sgdma_rx_in_error;
  output           sgdma_rx_in_ready_from_sa;
  output           sgdma_rx_in_startofpacket;
  output           sgdma_rx_in_valid;
  input            clk;
  input            reset_n;
  input            sgdma_rx_in_ready;
  input   [ 31: 0] tse_mac_receive_data;
  input   [  1: 0] tse_mac_receive_empty;
  input            tse_mac_receive_endofpacket;
  input   [  5: 0] tse_mac_receive_error;
  input            tse_mac_receive_startofpacket;
  input            tse_mac_receive_valid;

  wire    [ 31: 0] sgdma_rx_in_data;
  wire    [  1: 0] sgdma_rx_in_empty;
  wire             sgdma_rx_in_endofpacket;
  wire    [  5: 0] sgdma_rx_in_error;
  wire             sgdma_rx_in_ready_from_sa;
  wire             sgdma_rx_in_startofpacket;
  wire             sgdma_rx_in_valid;
  //mux sgdma_rx_in_data, which is an e_mux
  assign sgdma_rx_in_data = tse_mac_receive_data;

  //mux sgdma_rx_in_empty, which is an e_mux
  assign sgdma_rx_in_empty = tse_mac_receive_empty;

  //mux sgdma_rx_in_endofpacket, which is an e_mux
  assign sgdma_rx_in_endofpacket = tse_mac_receive_endofpacket;

  //mux sgdma_rx_in_error, which is an e_mux
  assign sgdma_rx_in_error = tse_mac_receive_error;

  //assign sgdma_rx_in_ready_from_sa = sgdma_rx_in_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_rx_in_ready_from_sa = sgdma_rx_in_ready;

  //mux sgdma_rx_in_startofpacket, which is an e_mux
  assign sgdma_rx_in_startofpacket = tse_mac_receive_startofpacket;

  //mux sgdma_rx_in_valid, which is an e_mux
  assign sgdma_rx_in_valid = tse_mac_receive_valid;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_rx_descriptor_read_arbitrator (
                                             // inputs:
                                              clk,
                                              d1_descriptor_memory_s1_end_xfer,
                                              descriptor_memory_s1_readdata_from_sa,
                                              reset_n,
                                              sgdma_rx_descriptor_read_address,
                                              sgdma_rx_descriptor_read_granted_descriptor_memory_s1,
                                              sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1,
                                              sgdma_rx_descriptor_read_read,
                                              sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1,
                                              sgdma_rx_descriptor_read_requests_descriptor_memory_s1,

                                             // outputs:
                                              sgdma_rx_descriptor_read_address_to_slave,
                                              sgdma_rx_descriptor_read_latency_counter,
                                              sgdma_rx_descriptor_read_readdata,
                                              sgdma_rx_descriptor_read_readdatavalid,
                                              sgdma_rx_descriptor_read_waitrequest
                                           )
;

  output  [ 31: 0] sgdma_rx_descriptor_read_address_to_slave;
  output           sgdma_rx_descriptor_read_latency_counter;
  output  [ 31: 0] sgdma_rx_descriptor_read_readdata;
  output           sgdma_rx_descriptor_read_readdatavalid;
  output           sgdma_rx_descriptor_read_waitrequest;
  input            clk;
  input            d1_descriptor_memory_s1_end_xfer;
  input   [ 31: 0] descriptor_memory_s1_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_descriptor_read_address;
  input            sgdma_rx_descriptor_read_granted_descriptor_memory_s1;
  input            sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1;
  input            sgdma_rx_descriptor_read_read;
  input            sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1;
  input            sgdma_rx_descriptor_read_requests_descriptor_memory_s1;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_sgdma_rx_descriptor_read_latency_counter;
  wire             pre_flush_sgdma_rx_descriptor_read_readdatavalid;
  wire             r_1;
  reg     [ 31: 0] sgdma_rx_descriptor_read_address_last_time;
  wire    [ 31: 0] sgdma_rx_descriptor_read_address_to_slave;
  wire             sgdma_rx_descriptor_read_is_granted_some_slave;
  reg              sgdma_rx_descriptor_read_latency_counter;
  reg              sgdma_rx_descriptor_read_read_but_no_slave_selected;
  reg              sgdma_rx_descriptor_read_read_last_time;
  wire    [ 31: 0] sgdma_rx_descriptor_read_readdata;
  wire             sgdma_rx_descriptor_read_readdatavalid;
  wire             sgdma_rx_descriptor_read_run;
  wire             sgdma_rx_descriptor_read_waitrequest;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_rx_descriptor_read_requests_descriptor_memory_s1) & (sgdma_rx_descriptor_read_granted_descriptor_memory_s1 | ~sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1) & ((~sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_rx_descriptor_read_read | (1 & sgdma_rx_descriptor_read_read)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_rx_descriptor_read_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_rx_descriptor_read_address_to_slave = {20'b10000000000100000,
    sgdma_rx_descriptor_read_address[11 : 0]};

  //sgdma_rx_descriptor_read_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_read_read_but_no_slave_selected <= 0;
      else 
        sgdma_rx_descriptor_read_read_but_no_slave_selected <= sgdma_rx_descriptor_read_read & sgdma_rx_descriptor_read_run & ~sgdma_rx_descriptor_read_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign sgdma_rx_descriptor_read_is_granted_some_slave = sgdma_rx_descriptor_read_granted_descriptor_memory_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_sgdma_rx_descriptor_read_readdatavalid = sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign sgdma_rx_descriptor_read_readdatavalid = sgdma_rx_descriptor_read_read_but_no_slave_selected |
    pre_flush_sgdma_rx_descriptor_read_readdatavalid;

  //sgdma_rx/descriptor_read readdata mux, which is an e_mux
  assign sgdma_rx_descriptor_read_readdata = descriptor_memory_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign sgdma_rx_descriptor_read_waitrequest = ~sgdma_rx_descriptor_read_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_read_latency_counter <= 0;
      else 
        sgdma_rx_descriptor_read_latency_counter <= p1_sgdma_rx_descriptor_read_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_sgdma_rx_descriptor_read_latency_counter = ((sgdma_rx_descriptor_read_run & sgdma_rx_descriptor_read_read))? latency_load_value :
    (sgdma_rx_descriptor_read_latency_counter)? sgdma_rx_descriptor_read_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {sgdma_rx_descriptor_read_requests_descriptor_memory_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_rx_descriptor_read_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_read_address_last_time <= 0;
      else 
        sgdma_rx_descriptor_read_address_last_time <= sgdma_rx_descriptor_read_address;
    end


  //sgdma_rx/descriptor_read waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_rx_descriptor_read_waitrequest & (sgdma_rx_descriptor_read_read);
    end


  //sgdma_rx_descriptor_read_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_descriptor_read_address != sgdma_rx_descriptor_read_address_last_time))
        begin
          $write("%0d ns: sgdma_rx_descriptor_read_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_rx_descriptor_read_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_read_read_last_time <= 0;
      else 
        sgdma_rx_descriptor_read_read_last_time <= sgdma_rx_descriptor_read_read;
    end


  //sgdma_rx_descriptor_read_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_descriptor_read_read != sgdma_rx_descriptor_read_read_last_time))
        begin
          $write("%0d ns: sgdma_rx_descriptor_read_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_rx_descriptor_write_arbitrator (
                                              // inputs:
                                               clk,
                                               d1_descriptor_memory_s1_end_xfer,
                                               reset_n,
                                               sgdma_rx_descriptor_write_address,
                                               sgdma_rx_descriptor_write_granted_descriptor_memory_s1,
                                               sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1,
                                               sgdma_rx_descriptor_write_requests_descriptor_memory_s1,
                                               sgdma_rx_descriptor_write_write,
                                               sgdma_rx_descriptor_write_writedata,

                                              // outputs:
                                               sgdma_rx_descriptor_write_address_to_slave,
                                               sgdma_rx_descriptor_write_waitrequest
                                            )
;

  output  [ 31: 0] sgdma_rx_descriptor_write_address_to_slave;
  output           sgdma_rx_descriptor_write_waitrequest;
  input            clk;
  input            d1_descriptor_memory_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_descriptor_write_address;
  input            sgdma_rx_descriptor_write_granted_descriptor_memory_s1;
  input            sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1;
  input            sgdma_rx_descriptor_write_requests_descriptor_memory_s1;
  input            sgdma_rx_descriptor_write_write;
  input   [ 31: 0] sgdma_rx_descriptor_write_writedata;

  reg              active_and_waiting_last_time;
  wire             r_1;
  reg     [ 31: 0] sgdma_rx_descriptor_write_address_last_time;
  wire    [ 31: 0] sgdma_rx_descriptor_write_address_to_slave;
  wire             sgdma_rx_descriptor_write_run;
  wire             sgdma_rx_descriptor_write_waitrequest;
  reg              sgdma_rx_descriptor_write_write_last_time;
  reg     [ 31: 0] sgdma_rx_descriptor_write_writedata_last_time;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 | ~sgdma_rx_descriptor_write_requests_descriptor_memory_s1) & (sgdma_rx_descriptor_write_granted_descriptor_memory_s1 | ~sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1) & ((~sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 | ~(sgdma_rx_descriptor_write_write) | (1 & (sgdma_rx_descriptor_write_write))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_rx_descriptor_write_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_rx_descriptor_write_address_to_slave = {20'b10000000000100000,
    sgdma_rx_descriptor_write_address[11 : 0]};

  //actual waitrequest port, which is an e_assign
  assign sgdma_rx_descriptor_write_waitrequest = ~sgdma_rx_descriptor_write_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_rx_descriptor_write_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_write_address_last_time <= 0;
      else 
        sgdma_rx_descriptor_write_address_last_time <= sgdma_rx_descriptor_write_address;
    end


  //sgdma_rx/descriptor_write waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_rx_descriptor_write_waitrequest & (sgdma_rx_descriptor_write_write);
    end


  //sgdma_rx_descriptor_write_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_descriptor_write_address != sgdma_rx_descriptor_write_address_last_time))
        begin
          $write("%0d ns: sgdma_rx_descriptor_write_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_rx_descriptor_write_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_write_write_last_time <= 0;
      else 
        sgdma_rx_descriptor_write_write_last_time <= sgdma_rx_descriptor_write_write;
    end


  //sgdma_rx_descriptor_write_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_descriptor_write_write != sgdma_rx_descriptor_write_write_last_time))
        begin
          $write("%0d ns: sgdma_rx_descriptor_write_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_rx_descriptor_write_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_descriptor_write_writedata_last_time <= 0;
      else 
        sgdma_rx_descriptor_write_writedata_last_time <= sgdma_rx_descriptor_write_writedata;
    end


  //sgdma_rx_descriptor_write_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_descriptor_write_writedata != sgdma_rx_descriptor_write_writedata_last_time) & sgdma_rx_descriptor_write_write)
        begin
          $write("%0d ns: sgdma_rx_descriptor_write_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_rx_m_write_arbitrator (
                                     // inputs:
                                      altmemddr_bridge_s1_waitrequest_from_sa,
                                      clk,
                                      d1_altmemddr_bridge_s1_end_xfer,
                                      reset_n,
                                      sgdma_rx_m_write_address,
                                      sgdma_rx_m_write_byteenable,
                                      sgdma_rx_m_write_granted_altmemddr_bridge_s1,
                                      sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1,
                                      sgdma_rx_m_write_requests_altmemddr_bridge_s1,
                                      sgdma_rx_m_write_write,
                                      sgdma_rx_m_write_writedata,

                                     // outputs:
                                      sgdma_rx_m_write_address_to_slave,
                                      sgdma_rx_m_write_waitrequest
                                   )
;

  output  [ 31: 0] sgdma_rx_m_write_address_to_slave;
  output           sgdma_rx_m_write_waitrequest;
  input            altmemddr_bridge_s1_waitrequest_from_sa;
  input            clk;
  input            d1_altmemddr_bridge_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_m_write_address;
  input   [  3: 0] sgdma_rx_m_write_byteenable;
  input            sgdma_rx_m_write_granted_altmemddr_bridge_s1;
  input            sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1;
  input            sgdma_rx_m_write_requests_altmemddr_bridge_s1;
  input            sgdma_rx_m_write_write;
  input   [ 31: 0] sgdma_rx_m_write_writedata;

  reg              active_and_waiting_last_time;
  wire             r_0;
  reg     [ 31: 0] sgdma_rx_m_write_address_last_time;
  wire    [ 31: 0] sgdma_rx_m_write_address_to_slave;
  reg     [  3: 0] sgdma_rx_m_write_byteenable_last_time;
  wire             sgdma_rx_m_write_run;
  wire             sgdma_rx_m_write_waitrequest;
  reg              sgdma_rx_m_write_write_last_time;
  reg     [ 31: 0] sgdma_rx_m_write_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1 | ~sgdma_rx_m_write_requests_altmemddr_bridge_s1) & (sgdma_rx_m_write_granted_altmemddr_bridge_s1 | ~sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1) & ((~sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1 | ~(sgdma_rx_m_write_write) | (1 & ~altmemddr_bridge_s1_waitrequest_from_sa & (sgdma_rx_m_write_write))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_rx_m_write_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_rx_m_write_address_to_slave = {6'b11,
    sgdma_rx_m_write_address[25 : 0]};

  //actual waitrequest port, which is an e_assign
  assign sgdma_rx_m_write_waitrequest = ~sgdma_rx_m_write_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_rx_m_write_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_m_write_address_last_time <= 0;
      else 
        sgdma_rx_m_write_address_last_time <= sgdma_rx_m_write_address;
    end


  //sgdma_rx/m_write waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_rx_m_write_waitrequest & (sgdma_rx_m_write_write);
    end


  //sgdma_rx_m_write_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_m_write_address != sgdma_rx_m_write_address_last_time))
        begin
          $write("%0d ns: sgdma_rx_m_write_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_rx_m_write_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_m_write_byteenable_last_time <= 0;
      else 
        sgdma_rx_m_write_byteenable_last_time <= sgdma_rx_m_write_byteenable;
    end


  //sgdma_rx_m_write_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_m_write_byteenable != sgdma_rx_m_write_byteenable_last_time))
        begin
          $write("%0d ns: sgdma_rx_m_write_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_rx_m_write_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_m_write_write_last_time <= 0;
      else 
        sgdma_rx_m_write_write_last_time <= sgdma_rx_m_write_write;
    end


  //sgdma_rx_m_write_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_m_write_write != sgdma_rx_m_write_write_last_time))
        begin
          $write("%0d ns: sgdma_rx_m_write_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_rx_m_write_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_m_write_writedata_last_time <= 0;
      else 
        sgdma_rx_m_write_writedata_last_time <= sgdma_rx_m_write_writedata;
    end


  //sgdma_rx_m_write_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_rx_m_write_writedata != sgdma_rx_m_write_writedata_last_time) & sgdma_rx_m_write_write)
        begin
          $write("%0d ns: sgdma_rx_m_write_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_tx_csr_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_data_master_address_to_slave,
                                  cpu_data_master_read,
                                  cpu_data_master_waitrequest,
                                  cpu_data_master_write,
                                  cpu_data_master_writedata,
                                  reset_n,
                                  sgdma_tx_csr_irq,
                                  sgdma_tx_csr_readdata,

                                 // outputs:
                                  cpu_data_master_granted_sgdma_tx_csr,
                                  cpu_data_master_qualified_request_sgdma_tx_csr,
                                  cpu_data_master_read_data_valid_sgdma_tx_csr,
                                  cpu_data_master_requests_sgdma_tx_csr,
                                  d1_sgdma_tx_csr_end_xfer,
                                  sgdma_tx_csr_address,
                                  sgdma_tx_csr_chipselect,
                                  sgdma_tx_csr_irq_from_sa,
                                  sgdma_tx_csr_read,
                                  sgdma_tx_csr_readdata_from_sa,
                                  sgdma_tx_csr_reset_n,
                                  sgdma_tx_csr_write,
                                  sgdma_tx_csr_writedata
                               )
;

  output           cpu_data_master_granted_sgdma_tx_csr;
  output           cpu_data_master_qualified_request_sgdma_tx_csr;
  output           cpu_data_master_read_data_valid_sgdma_tx_csr;
  output           cpu_data_master_requests_sgdma_tx_csr;
  output           d1_sgdma_tx_csr_end_xfer;
  output  [  3: 0] sgdma_tx_csr_address;
  output           sgdma_tx_csr_chipselect;
  output           sgdma_tx_csr_irq_from_sa;
  output           sgdma_tx_csr_read;
  output  [ 31: 0] sgdma_tx_csr_readdata_from_sa;
  output           sgdma_tx_csr_reset_n;
  output           sgdma_tx_csr_write;
  output  [ 31: 0] sgdma_tx_csr_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sgdma_tx_csr_irq;
  input   [ 31: 0] sgdma_tx_csr_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sgdma_tx_csr;
  wire             cpu_data_master_qualified_request_sgdma_tx_csr;
  wire             cpu_data_master_read_data_valid_sgdma_tx_csr;
  wire             cpu_data_master_requests_sgdma_tx_csr;
  wire             cpu_data_master_saved_grant_sgdma_tx_csr;
  reg              d1_reasons_to_wait;
  reg              d1_sgdma_tx_csr_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sgdma_tx_csr;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] sgdma_tx_csr_address;
  wire             sgdma_tx_csr_allgrants;
  wire             sgdma_tx_csr_allow_new_arb_cycle;
  wire             sgdma_tx_csr_any_bursting_master_saved_grant;
  wire             sgdma_tx_csr_any_continuerequest;
  wire             sgdma_tx_csr_arb_counter_enable;
  reg     [  1: 0] sgdma_tx_csr_arb_share_counter;
  wire    [  1: 0] sgdma_tx_csr_arb_share_counter_next_value;
  wire    [  1: 0] sgdma_tx_csr_arb_share_set_values;
  wire             sgdma_tx_csr_beginbursttransfer_internal;
  wire             sgdma_tx_csr_begins_xfer;
  wire             sgdma_tx_csr_chipselect;
  wire             sgdma_tx_csr_end_xfer;
  wire             sgdma_tx_csr_firsttransfer;
  wire             sgdma_tx_csr_grant_vector;
  wire             sgdma_tx_csr_in_a_read_cycle;
  wire             sgdma_tx_csr_in_a_write_cycle;
  wire             sgdma_tx_csr_irq_from_sa;
  wire             sgdma_tx_csr_master_qreq_vector;
  wire             sgdma_tx_csr_non_bursting_master_requests;
  wire             sgdma_tx_csr_read;
  wire    [ 31: 0] sgdma_tx_csr_readdata_from_sa;
  reg              sgdma_tx_csr_reg_firsttransfer;
  wire             sgdma_tx_csr_reset_n;
  reg              sgdma_tx_csr_slavearbiterlockenable;
  wire             sgdma_tx_csr_slavearbiterlockenable2;
  wire             sgdma_tx_csr_unreg_firsttransfer;
  wire             sgdma_tx_csr_waits_for_read;
  wire             sgdma_tx_csr_waits_for_write;
  wire             sgdma_tx_csr_write;
  wire    [ 31: 0] sgdma_tx_csr_writedata;
  wire    [ 28: 0] shifted_address_to_sgdma_tx_csr_from_cpu_data_master;
  wire             wait_for_sgdma_tx_csr_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sgdma_tx_csr_end_xfer;
    end


  assign sgdma_tx_csr_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sgdma_tx_csr));
  //assign sgdma_tx_csr_readdata_from_sa = sgdma_tx_csr_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_tx_csr_readdata_from_sa = sgdma_tx_csr_readdata;

  assign cpu_data_master_requests_sgdma_tx_csr = ({cpu_data_master_address_to_slave[28 : 6] , 6'b0} == 29'h10022000) & (cpu_data_master_read | cpu_data_master_write);
  //sgdma_tx_csr_arb_share_counter set values, which is an e_mux
  assign sgdma_tx_csr_arb_share_set_values = 1;

  //sgdma_tx_csr_non_bursting_master_requests mux, which is an e_mux
  assign sgdma_tx_csr_non_bursting_master_requests = cpu_data_master_requests_sgdma_tx_csr;

  //sgdma_tx_csr_any_bursting_master_saved_grant mux, which is an e_mux
  assign sgdma_tx_csr_any_bursting_master_saved_grant = 0;

  //sgdma_tx_csr_arb_share_counter_next_value assignment, which is an e_assign
  assign sgdma_tx_csr_arb_share_counter_next_value = sgdma_tx_csr_firsttransfer ? (sgdma_tx_csr_arb_share_set_values - 1) : |sgdma_tx_csr_arb_share_counter ? (sgdma_tx_csr_arb_share_counter - 1) : 0;

  //sgdma_tx_csr_allgrants all slave grants, which is an e_mux
  assign sgdma_tx_csr_allgrants = |sgdma_tx_csr_grant_vector;

  //sgdma_tx_csr_end_xfer assignment, which is an e_assign
  assign sgdma_tx_csr_end_xfer = ~(sgdma_tx_csr_waits_for_read | sgdma_tx_csr_waits_for_write);

  //end_xfer_arb_share_counter_term_sgdma_tx_csr arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sgdma_tx_csr = sgdma_tx_csr_end_xfer & (~sgdma_tx_csr_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sgdma_tx_csr_arb_share_counter arbitration counter enable, which is an e_assign
  assign sgdma_tx_csr_arb_counter_enable = (end_xfer_arb_share_counter_term_sgdma_tx_csr & sgdma_tx_csr_allgrants) | (end_xfer_arb_share_counter_term_sgdma_tx_csr & ~sgdma_tx_csr_non_bursting_master_requests);

  //sgdma_tx_csr_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_csr_arb_share_counter <= 0;
      else if (sgdma_tx_csr_arb_counter_enable)
          sgdma_tx_csr_arb_share_counter <= sgdma_tx_csr_arb_share_counter_next_value;
    end


  //sgdma_tx_csr_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_csr_slavearbiterlockenable <= 0;
      else if ((|sgdma_tx_csr_master_qreq_vector & end_xfer_arb_share_counter_term_sgdma_tx_csr) | (end_xfer_arb_share_counter_term_sgdma_tx_csr & ~sgdma_tx_csr_non_bursting_master_requests))
          sgdma_tx_csr_slavearbiterlockenable <= |sgdma_tx_csr_arb_share_counter_next_value;
    end


  //cpu/data_master sgdma_tx/csr arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sgdma_tx_csr_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sgdma_tx_csr_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sgdma_tx_csr_slavearbiterlockenable2 = |sgdma_tx_csr_arb_share_counter_next_value;

  //cpu/data_master sgdma_tx/csr arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sgdma_tx_csr_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sgdma_tx_csr_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sgdma_tx_csr_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sgdma_tx_csr = cpu_data_master_requests_sgdma_tx_csr & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //sgdma_tx_csr_writedata mux, which is an e_mux
  assign sgdma_tx_csr_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sgdma_tx_csr = cpu_data_master_qualified_request_sgdma_tx_csr;

  //cpu/data_master saved-grant sgdma_tx/csr, which is an e_assign
  assign cpu_data_master_saved_grant_sgdma_tx_csr = cpu_data_master_requests_sgdma_tx_csr;

  //allow new arb cycle for sgdma_tx/csr, which is an e_assign
  assign sgdma_tx_csr_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sgdma_tx_csr_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sgdma_tx_csr_master_qreq_vector = 1;

  //sgdma_tx_csr_reset_n assignment, which is an e_assign
  assign sgdma_tx_csr_reset_n = reset_n;

  assign sgdma_tx_csr_chipselect = cpu_data_master_granted_sgdma_tx_csr;
  //sgdma_tx_csr_firsttransfer first transaction, which is an e_assign
  assign sgdma_tx_csr_firsttransfer = sgdma_tx_csr_begins_xfer ? sgdma_tx_csr_unreg_firsttransfer : sgdma_tx_csr_reg_firsttransfer;

  //sgdma_tx_csr_unreg_firsttransfer first transaction, which is an e_assign
  assign sgdma_tx_csr_unreg_firsttransfer = ~(sgdma_tx_csr_slavearbiterlockenable & sgdma_tx_csr_any_continuerequest);

  //sgdma_tx_csr_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_csr_reg_firsttransfer <= 1'b1;
      else if (sgdma_tx_csr_begins_xfer)
          sgdma_tx_csr_reg_firsttransfer <= sgdma_tx_csr_unreg_firsttransfer;
    end


  //sgdma_tx_csr_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sgdma_tx_csr_beginbursttransfer_internal = sgdma_tx_csr_begins_xfer;

  //sgdma_tx_csr_read assignment, which is an e_mux
  assign sgdma_tx_csr_read = cpu_data_master_granted_sgdma_tx_csr & cpu_data_master_read;

  //sgdma_tx_csr_write assignment, which is an e_mux
  assign sgdma_tx_csr_write = cpu_data_master_granted_sgdma_tx_csr & cpu_data_master_write;

  assign shifted_address_to_sgdma_tx_csr_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sgdma_tx_csr_address mux, which is an e_mux
  assign sgdma_tx_csr_address = shifted_address_to_sgdma_tx_csr_from_cpu_data_master >> 2;

  //d1_sgdma_tx_csr_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sgdma_tx_csr_end_xfer <= 1;
      else 
        d1_sgdma_tx_csr_end_xfer <= sgdma_tx_csr_end_xfer;
    end


  //sgdma_tx_csr_waits_for_read in a cycle, which is an e_mux
  assign sgdma_tx_csr_waits_for_read = sgdma_tx_csr_in_a_read_cycle & sgdma_tx_csr_begins_xfer;

  //sgdma_tx_csr_in_a_read_cycle assignment, which is an e_assign
  assign sgdma_tx_csr_in_a_read_cycle = cpu_data_master_granted_sgdma_tx_csr & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sgdma_tx_csr_in_a_read_cycle;

  //sgdma_tx_csr_waits_for_write in a cycle, which is an e_mux
  assign sgdma_tx_csr_waits_for_write = sgdma_tx_csr_in_a_write_cycle & 0;

  //sgdma_tx_csr_in_a_write_cycle assignment, which is an e_assign
  assign sgdma_tx_csr_in_a_write_cycle = cpu_data_master_granted_sgdma_tx_csr & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sgdma_tx_csr_in_a_write_cycle;

  assign wait_for_sgdma_tx_csr_counter = 0;
  //assign sgdma_tx_csr_irq_from_sa = sgdma_tx_csr_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_tx_csr_irq_from_sa = sgdma_tx_csr_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_tx/csr enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_tx_descriptor_read_arbitrator (
                                             // inputs:
                                              clk,
                                              d1_descriptor_memory_s1_end_xfer,
                                              descriptor_memory_s1_readdata_from_sa,
                                              reset_n,
                                              sgdma_tx_descriptor_read_address,
                                              sgdma_tx_descriptor_read_granted_descriptor_memory_s1,
                                              sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1,
                                              sgdma_tx_descriptor_read_read,
                                              sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1,
                                              sgdma_tx_descriptor_read_requests_descriptor_memory_s1,

                                             // outputs:
                                              sgdma_tx_descriptor_read_address_to_slave,
                                              sgdma_tx_descriptor_read_latency_counter,
                                              sgdma_tx_descriptor_read_readdata,
                                              sgdma_tx_descriptor_read_readdatavalid,
                                              sgdma_tx_descriptor_read_waitrequest
                                           )
;

  output  [ 31: 0] sgdma_tx_descriptor_read_address_to_slave;
  output           sgdma_tx_descriptor_read_latency_counter;
  output  [ 31: 0] sgdma_tx_descriptor_read_readdata;
  output           sgdma_tx_descriptor_read_readdatavalid;
  output           sgdma_tx_descriptor_read_waitrequest;
  input            clk;
  input            d1_descriptor_memory_s1_end_xfer;
  input   [ 31: 0] descriptor_memory_s1_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] sgdma_tx_descriptor_read_address;
  input            sgdma_tx_descriptor_read_granted_descriptor_memory_s1;
  input            sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1;
  input            sgdma_tx_descriptor_read_read;
  input            sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1;
  input            sgdma_tx_descriptor_read_requests_descriptor_memory_s1;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_sgdma_tx_descriptor_read_latency_counter;
  wire             pre_flush_sgdma_tx_descriptor_read_readdatavalid;
  wire             r_1;
  reg     [ 31: 0] sgdma_tx_descriptor_read_address_last_time;
  wire    [ 31: 0] sgdma_tx_descriptor_read_address_to_slave;
  wire             sgdma_tx_descriptor_read_is_granted_some_slave;
  reg              sgdma_tx_descriptor_read_latency_counter;
  reg              sgdma_tx_descriptor_read_read_but_no_slave_selected;
  reg              sgdma_tx_descriptor_read_read_last_time;
  wire    [ 31: 0] sgdma_tx_descriptor_read_readdata;
  wire             sgdma_tx_descriptor_read_readdatavalid;
  wire             sgdma_tx_descriptor_read_run;
  wire             sgdma_tx_descriptor_read_waitrequest;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_tx_descriptor_read_requests_descriptor_memory_s1) & (sgdma_tx_descriptor_read_granted_descriptor_memory_s1 | ~sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1) & ((~sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_tx_descriptor_read_read | (1 & sgdma_tx_descriptor_read_read)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_tx_descriptor_read_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_tx_descriptor_read_address_to_slave = {20'b10000000000100000,
    sgdma_tx_descriptor_read_address[11 : 0]};

  //sgdma_tx_descriptor_read_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_read_read_but_no_slave_selected <= 0;
      else 
        sgdma_tx_descriptor_read_read_but_no_slave_selected <= sgdma_tx_descriptor_read_read & sgdma_tx_descriptor_read_run & ~sgdma_tx_descriptor_read_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign sgdma_tx_descriptor_read_is_granted_some_slave = sgdma_tx_descriptor_read_granted_descriptor_memory_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_sgdma_tx_descriptor_read_readdatavalid = sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign sgdma_tx_descriptor_read_readdatavalid = sgdma_tx_descriptor_read_read_but_no_slave_selected |
    pre_flush_sgdma_tx_descriptor_read_readdatavalid;

  //sgdma_tx/descriptor_read readdata mux, which is an e_mux
  assign sgdma_tx_descriptor_read_readdata = descriptor_memory_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign sgdma_tx_descriptor_read_waitrequest = ~sgdma_tx_descriptor_read_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_read_latency_counter <= 0;
      else 
        sgdma_tx_descriptor_read_latency_counter <= p1_sgdma_tx_descriptor_read_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_sgdma_tx_descriptor_read_latency_counter = ((sgdma_tx_descriptor_read_run & sgdma_tx_descriptor_read_read))? latency_load_value :
    (sgdma_tx_descriptor_read_latency_counter)? sgdma_tx_descriptor_read_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {sgdma_tx_descriptor_read_requests_descriptor_memory_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_tx_descriptor_read_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_read_address_last_time <= 0;
      else 
        sgdma_tx_descriptor_read_address_last_time <= sgdma_tx_descriptor_read_address;
    end


  //sgdma_tx/descriptor_read waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_tx_descriptor_read_waitrequest & (sgdma_tx_descriptor_read_read);
    end


  //sgdma_tx_descriptor_read_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_descriptor_read_address != sgdma_tx_descriptor_read_address_last_time))
        begin
          $write("%0d ns: sgdma_tx_descriptor_read_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_tx_descriptor_read_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_read_read_last_time <= 0;
      else 
        sgdma_tx_descriptor_read_read_last_time <= sgdma_tx_descriptor_read_read;
    end


  //sgdma_tx_descriptor_read_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_descriptor_read_read != sgdma_tx_descriptor_read_read_last_time))
        begin
          $write("%0d ns: sgdma_tx_descriptor_read_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_tx_descriptor_write_arbitrator (
                                              // inputs:
                                               clk,
                                               d1_descriptor_memory_s1_end_xfer,
                                               reset_n,
                                               sgdma_tx_descriptor_write_address,
                                               sgdma_tx_descriptor_write_granted_descriptor_memory_s1,
                                               sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1,
                                               sgdma_tx_descriptor_write_requests_descriptor_memory_s1,
                                               sgdma_tx_descriptor_write_write,
                                               sgdma_tx_descriptor_write_writedata,

                                              // outputs:
                                               sgdma_tx_descriptor_write_address_to_slave,
                                               sgdma_tx_descriptor_write_waitrequest
                                            )
;

  output  [ 31: 0] sgdma_tx_descriptor_write_address_to_slave;
  output           sgdma_tx_descriptor_write_waitrequest;
  input            clk;
  input            d1_descriptor_memory_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sgdma_tx_descriptor_write_address;
  input            sgdma_tx_descriptor_write_granted_descriptor_memory_s1;
  input            sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1;
  input            sgdma_tx_descriptor_write_requests_descriptor_memory_s1;
  input            sgdma_tx_descriptor_write_write;
  input   [ 31: 0] sgdma_tx_descriptor_write_writedata;

  reg              active_and_waiting_last_time;
  wire             r_1;
  reg     [ 31: 0] sgdma_tx_descriptor_write_address_last_time;
  wire    [ 31: 0] sgdma_tx_descriptor_write_address_to_slave;
  wire             sgdma_tx_descriptor_write_run;
  wire             sgdma_tx_descriptor_write_waitrequest;
  reg              sgdma_tx_descriptor_write_write_last_time;
  reg     [ 31: 0] sgdma_tx_descriptor_write_writedata_last_time;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 | ~sgdma_tx_descriptor_write_requests_descriptor_memory_s1) & (sgdma_tx_descriptor_write_granted_descriptor_memory_s1 | ~sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1) & ((~sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 | ~(sgdma_tx_descriptor_write_write) | (1 & (sgdma_tx_descriptor_write_write))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_tx_descriptor_write_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_tx_descriptor_write_address_to_slave = {20'b10000000000100000,
    sgdma_tx_descriptor_write_address[11 : 0]};

  //actual waitrequest port, which is an e_assign
  assign sgdma_tx_descriptor_write_waitrequest = ~sgdma_tx_descriptor_write_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_tx_descriptor_write_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_write_address_last_time <= 0;
      else 
        sgdma_tx_descriptor_write_address_last_time <= sgdma_tx_descriptor_write_address;
    end


  //sgdma_tx/descriptor_write waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_tx_descriptor_write_waitrequest & (sgdma_tx_descriptor_write_write);
    end


  //sgdma_tx_descriptor_write_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_descriptor_write_address != sgdma_tx_descriptor_write_address_last_time))
        begin
          $write("%0d ns: sgdma_tx_descriptor_write_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_tx_descriptor_write_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_write_write_last_time <= 0;
      else 
        sgdma_tx_descriptor_write_write_last_time <= sgdma_tx_descriptor_write_write;
    end


  //sgdma_tx_descriptor_write_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_descriptor_write_write != sgdma_tx_descriptor_write_write_last_time))
        begin
          $write("%0d ns: sgdma_tx_descriptor_write_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_tx_descriptor_write_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_descriptor_write_writedata_last_time <= 0;
      else 
        sgdma_tx_descriptor_write_writedata_last_time <= sgdma_tx_descriptor_write_writedata;
    end


  //sgdma_tx_descriptor_write_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_descriptor_write_writedata != sgdma_tx_descriptor_write_writedata_last_time) & sgdma_tx_descriptor_write_write)
        begin
          $write("%0d ns: sgdma_tx_descriptor_write_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_tx_m_read_arbitrator (
                                    // inputs:
                                     altmemddr_bridge_s1_readdata_from_sa,
                                     altmemddr_bridge_s1_waitrequest_from_sa,
                                     clk,
                                     d1_altmemddr_bridge_s1_end_xfer,
                                     reset_n,
                                     sgdma_tx_m_read_address,
                                     sgdma_tx_m_read_granted_altmemddr_bridge_s1,
                                     sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1,
                                     sgdma_tx_m_read_read,
                                     sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1,
                                     sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register,
                                     sgdma_tx_m_read_requests_altmemddr_bridge_s1,

                                    // outputs:
                                     sgdma_tx_m_read_address_to_slave,
                                     sgdma_tx_m_read_latency_counter,
                                     sgdma_tx_m_read_readdata,
                                     sgdma_tx_m_read_readdatavalid,
                                     sgdma_tx_m_read_waitrequest
                                  )
;

  output  [ 31: 0] sgdma_tx_m_read_address_to_slave;
  output           sgdma_tx_m_read_latency_counter;
  output  [ 31: 0] sgdma_tx_m_read_readdata;
  output           sgdma_tx_m_read_readdatavalid;
  output           sgdma_tx_m_read_waitrequest;
  input   [ 31: 0] altmemddr_bridge_s1_readdata_from_sa;
  input            altmemddr_bridge_s1_waitrequest_from_sa;
  input            clk;
  input            d1_altmemddr_bridge_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sgdma_tx_m_read_address;
  input            sgdma_tx_m_read_granted_altmemddr_bridge_s1;
  input            sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1;
  input            sgdma_tx_m_read_read;
  input            sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1;
  input            sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register;
  input            sgdma_tx_m_read_requests_altmemddr_bridge_s1;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_sgdma_tx_m_read_latency_counter;
  wire             pre_flush_sgdma_tx_m_read_readdatavalid;
  wire             r_0;
  reg     [ 31: 0] sgdma_tx_m_read_address_last_time;
  wire    [ 31: 0] sgdma_tx_m_read_address_to_slave;
  wire             sgdma_tx_m_read_is_granted_some_slave;
  reg              sgdma_tx_m_read_latency_counter;
  reg              sgdma_tx_m_read_read_but_no_slave_selected;
  reg              sgdma_tx_m_read_read_last_time;
  wire    [ 31: 0] sgdma_tx_m_read_readdata;
  wire             sgdma_tx_m_read_readdatavalid;
  wire             sgdma_tx_m_read_run;
  wire             sgdma_tx_m_read_waitrequest;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1 | ~sgdma_tx_m_read_requests_altmemddr_bridge_s1) & (sgdma_tx_m_read_granted_altmemddr_bridge_s1 | ~sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1) & ((~sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1 | ~sgdma_tx_m_read_read | (1 & ~altmemddr_bridge_s1_waitrequest_from_sa & sgdma_tx_m_read_read)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_tx_m_read_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_tx_m_read_address_to_slave = {6'b11,
    sgdma_tx_m_read_address[25 : 0]};

  //sgdma_tx_m_read_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_read_but_no_slave_selected <= 0;
      else 
        sgdma_tx_m_read_read_but_no_slave_selected <= sgdma_tx_m_read_read & sgdma_tx_m_read_run & ~sgdma_tx_m_read_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign sgdma_tx_m_read_is_granted_some_slave = sgdma_tx_m_read_granted_altmemddr_bridge_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_sgdma_tx_m_read_readdatavalid = sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign sgdma_tx_m_read_readdatavalid = sgdma_tx_m_read_read_but_no_slave_selected |
    pre_flush_sgdma_tx_m_read_readdatavalid;

  //sgdma_tx/m_read readdata mux, which is an e_mux
  assign sgdma_tx_m_read_readdata = altmemddr_bridge_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign sgdma_tx_m_read_waitrequest = ~sgdma_tx_m_read_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_latency_counter <= 0;
      else 
        sgdma_tx_m_read_latency_counter <= p1_sgdma_tx_m_read_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_sgdma_tx_m_read_latency_counter = ((sgdma_tx_m_read_run & sgdma_tx_m_read_read))? latency_load_value :
    (sgdma_tx_m_read_latency_counter)? sgdma_tx_m_read_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_tx_m_read_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_address_last_time <= 0;
      else 
        sgdma_tx_m_read_address_last_time <= sgdma_tx_m_read_address;
    end


  //sgdma_tx/m_read waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_tx_m_read_waitrequest & (sgdma_tx_m_read_read);
    end


  //sgdma_tx_m_read_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_m_read_address != sgdma_tx_m_read_address_last_time))
        begin
          $write("%0d ns: sgdma_tx_m_read_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_tx_m_read_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_read_last_time <= 0;
      else 
        sgdma_tx_m_read_read_last_time <= sgdma_tx_m_read_read;
    end


  //sgdma_tx_m_read_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_tx_m_read_read != sgdma_tx_m_read_read_last_time))
        begin
          $write("%0d ns: sgdma_tx_m_read_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_tx_out_arbitrator (
                                 // inputs:
                                  clk,
                                  reset_n,
                                  sgdma_tx_out_data,
                                  sgdma_tx_out_empty,
                                  sgdma_tx_out_endofpacket,
                                  sgdma_tx_out_error,
                                  sgdma_tx_out_startofpacket,
                                  sgdma_tx_out_valid,
                                  tse_mac_transmit_ready_from_sa,

                                 // outputs:
                                  sgdma_tx_out_ready
                               )
;

  output           sgdma_tx_out_ready;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sgdma_tx_out_data;
  input   [  1: 0] sgdma_tx_out_empty;
  input            sgdma_tx_out_endofpacket;
  input            sgdma_tx_out_error;
  input            sgdma_tx_out_startofpacket;
  input            sgdma_tx_out_valid;
  input            tse_mac_transmit_ready_from_sa;

  wire             sgdma_tx_out_ready;
  //mux sgdma_tx_out_ready, which is an e_mux
  assign sgdma_tx_out_ready = tse_mac_transmit_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_clk_timer_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_data_master_address_to_slave,
                                      cpu_data_master_read,
                                      cpu_data_master_waitrequest,
                                      cpu_data_master_write,
                                      cpu_data_master_writedata,
                                      reset_n,
                                      sys_clk_timer_s1_irq,
                                      sys_clk_timer_s1_readdata,

                                     // outputs:
                                      cpu_data_master_granted_sys_clk_timer_s1,
                                      cpu_data_master_qualified_request_sys_clk_timer_s1,
                                      cpu_data_master_read_data_valid_sys_clk_timer_s1,
                                      cpu_data_master_requests_sys_clk_timer_s1,
                                      d1_sys_clk_timer_s1_end_xfer,
                                      sys_clk_timer_s1_address,
                                      sys_clk_timer_s1_chipselect,
                                      sys_clk_timer_s1_irq_from_sa,
                                      sys_clk_timer_s1_readdata_from_sa,
                                      sys_clk_timer_s1_reset_n,
                                      sys_clk_timer_s1_write_n,
                                      sys_clk_timer_s1_writedata
                                   )
;

  output           cpu_data_master_granted_sys_clk_timer_s1;
  output           cpu_data_master_qualified_request_sys_clk_timer_s1;
  output           cpu_data_master_read_data_valid_sys_clk_timer_s1;
  output           cpu_data_master_requests_sys_clk_timer_s1;
  output           d1_sys_clk_timer_s1_end_xfer;
  output  [  2: 0] sys_clk_timer_s1_address;
  output           sys_clk_timer_s1_chipselect;
  output           sys_clk_timer_s1_irq_from_sa;
  output  [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  output           sys_clk_timer_s1_reset_n;
  output           sys_clk_timer_s1_write_n;
  output  [ 15: 0] sys_clk_timer_s1_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sys_clk_timer_s1_irq;
  input   [ 15: 0] sys_clk_timer_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sys_clk_timer_s1;
  wire             cpu_data_master_qualified_request_sys_clk_timer_s1;
  wire             cpu_data_master_read_data_valid_sys_clk_timer_s1;
  wire             cpu_data_master_requests_sys_clk_timer_s1;
  wire             cpu_data_master_saved_grant_sys_clk_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sys_clk_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_clk_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_sys_clk_timer_s1_from_cpu_data_master;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_allgrants;
  wire             sys_clk_timer_s1_allow_new_arb_cycle;
  wire             sys_clk_timer_s1_any_bursting_master_saved_grant;
  wire             sys_clk_timer_s1_any_continuerequest;
  wire             sys_clk_timer_s1_arb_counter_enable;
  reg     [  1: 0] sys_clk_timer_s1_arb_share_counter;
  wire    [  1: 0] sys_clk_timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] sys_clk_timer_s1_arb_share_set_values;
  wire             sys_clk_timer_s1_beginbursttransfer_internal;
  wire             sys_clk_timer_s1_begins_xfer;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_end_xfer;
  wire             sys_clk_timer_s1_firsttransfer;
  wire             sys_clk_timer_s1_grant_vector;
  wire             sys_clk_timer_s1_in_a_read_cycle;
  wire             sys_clk_timer_s1_in_a_write_cycle;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire             sys_clk_timer_s1_master_qreq_vector;
  wire             sys_clk_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  reg              sys_clk_timer_s1_reg_firsttransfer;
  wire             sys_clk_timer_s1_reset_n;
  reg              sys_clk_timer_s1_slavearbiterlockenable;
  wire             sys_clk_timer_s1_slavearbiterlockenable2;
  wire             sys_clk_timer_s1_unreg_firsttransfer;
  wire             sys_clk_timer_s1_waits_for_read;
  wire             sys_clk_timer_s1_waits_for_write;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             wait_for_sys_clk_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sys_clk_timer_s1_end_xfer;
    end


  assign sys_clk_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sys_clk_timer_s1));
  //assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata;

  assign cpu_data_master_requests_sys_clk_timer_s1 = ({cpu_data_master_address_to_slave[28 : 5] , 5'b0} == 29'h10022c00) & (cpu_data_master_read | cpu_data_master_write);
  //sys_clk_timer_s1_arb_share_counter set values, which is an e_mux
  assign sys_clk_timer_s1_arb_share_set_values = 1;

  //sys_clk_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_clk_timer_s1_non_bursting_master_requests = cpu_data_master_requests_sys_clk_timer_s1;

  //sys_clk_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_clk_timer_s1_any_bursting_master_saved_grant = 0;

  //sys_clk_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_clk_timer_s1_arb_share_counter_next_value = sys_clk_timer_s1_firsttransfer ? (sys_clk_timer_s1_arb_share_set_values - 1) : |sys_clk_timer_s1_arb_share_counter ? (sys_clk_timer_s1_arb_share_counter - 1) : 0;

  //sys_clk_timer_s1_allgrants all slave grants, which is an e_mux
  assign sys_clk_timer_s1_allgrants = |sys_clk_timer_s1_grant_vector;

  //sys_clk_timer_s1_end_xfer assignment, which is an e_assign
  assign sys_clk_timer_s1_end_xfer = ~(sys_clk_timer_s1_waits_for_read | sys_clk_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_clk_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_clk_timer_s1 = sys_clk_timer_s1_end_xfer & (~sys_clk_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_clk_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_clk_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & sys_clk_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests);

  //sys_clk_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_arb_share_counter <= 0;
      else if (sys_clk_timer_s1_arb_counter_enable)
          sys_clk_timer_s1_arb_share_counter <= sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //sys_clk_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_slavearbiterlockenable <= 0;
      else if ((|sys_clk_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_clk_timer_s1) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests))
          sys_clk_timer_s1_slavearbiterlockenable <= |sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sys_clk_timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sys_clk_timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sys_clk_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_clk_timer_s1_slavearbiterlockenable2 = |sys_clk_timer_s1_arb_share_counter_next_value;

  //cpu/data_master sys_clk_timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sys_clk_timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sys_clk_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_clk_timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sys_clk_timer_s1 = cpu_data_master_requests_sys_clk_timer_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //sys_clk_timer_s1_writedata mux, which is an e_mux
  assign sys_clk_timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sys_clk_timer_s1 = cpu_data_master_qualified_request_sys_clk_timer_s1;

  //cpu/data_master saved-grant sys_clk_timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sys_clk_timer_s1 = cpu_data_master_requests_sys_clk_timer_s1;

  //allow new arb cycle for sys_clk_timer/s1, which is an e_assign
  assign sys_clk_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_clk_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_clk_timer_s1_master_qreq_vector = 1;

  //sys_clk_timer_s1_reset_n assignment, which is an e_assign
  assign sys_clk_timer_s1_reset_n = reset_n;

  assign sys_clk_timer_s1_chipselect = cpu_data_master_granted_sys_clk_timer_s1;
  //sys_clk_timer_s1_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_firsttransfer = sys_clk_timer_s1_begins_xfer ? sys_clk_timer_s1_unreg_firsttransfer : sys_clk_timer_s1_reg_firsttransfer;

  //sys_clk_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_unreg_firsttransfer = ~(sys_clk_timer_s1_slavearbiterlockenable & sys_clk_timer_s1_any_continuerequest);

  //sys_clk_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_reg_firsttransfer <= 1'b1;
      else if (sys_clk_timer_s1_begins_xfer)
          sys_clk_timer_s1_reg_firsttransfer <= sys_clk_timer_s1_unreg_firsttransfer;
    end


  //sys_clk_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_clk_timer_s1_beginbursttransfer_internal = sys_clk_timer_s1_begins_xfer;

  //~sys_clk_timer_s1_write_n assignment, which is an e_mux
  assign sys_clk_timer_s1_write_n = ~(cpu_data_master_granted_sys_clk_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_sys_clk_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sys_clk_timer_s1_address mux, which is an e_mux
  assign sys_clk_timer_s1_address = shifted_address_to_sys_clk_timer_s1_from_cpu_data_master >> 2;

  //d1_sys_clk_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_clk_timer_s1_end_xfer <= 1;
      else 
        d1_sys_clk_timer_s1_end_xfer <= sys_clk_timer_s1_end_xfer;
    end


  //sys_clk_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_read = sys_clk_timer_s1_in_a_read_cycle & sys_clk_timer_s1_begins_xfer;

  //sys_clk_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_read_cycle = cpu_data_master_granted_sys_clk_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_clk_timer_s1_in_a_read_cycle;

  //sys_clk_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_write = sys_clk_timer_s1_in_a_write_cycle & 0;

  //sys_clk_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_write_cycle = cpu_data_master_granted_sys_clk_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_clk_timer_s1_in_a_write_cycle;

  assign wait_for_sys_clk_timer_s1_counter = 0;
  //assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_clk_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_pll_s1_arbitrator (
                               // inputs:
                                clk,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata,
                                reset_n,
                                sys_pll_s1_readdata,
                                sys_pll_s1_resetrequest,

                               // outputs:
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1,
                                cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1,
                                d1_sys_pll_s1_end_xfer,
                                sys_pll_s1_address,
                                sys_pll_s1_chipselect,
                                sys_pll_s1_read,
                                sys_pll_s1_readdata_from_sa,
                                sys_pll_s1_reset_n,
                                sys_pll_s1_resetrequest_from_sa,
                                sys_pll_s1_write,
                                sys_pll_s1_writedata
                             )
;

  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1;
  output           cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;
  output           d1_sys_pll_s1_end_xfer;
  output  [  2: 0] sys_pll_s1_address;
  output           sys_pll_s1_chipselect;
  output           sys_pll_s1_read;
  output  [ 15: 0] sys_pll_s1_readdata_from_sa;
  output           sys_pll_s1_reset_n;
  output           sys_pll_s1_resetrequest_from_sa;
  output           sys_pll_s1_write;
  output  [ 15: 0] sys_pll_s1_writedata;
  input            clk;
  input   [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave;
  input   [  2: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read;
  input            cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write;
  input   [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata;
  input            reset_n;
  input   [ 15: 0] sys_pll_s1_readdata;
  input            sys_pll_s1_resetrequest;

  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_arbiterlock;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_arbiterlock2;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_continuerequest;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_saved_grant_sys_pll_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sys_pll_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_pll_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] sys_pll_s1_address;
  wire             sys_pll_s1_allgrants;
  wire             sys_pll_s1_allow_new_arb_cycle;
  wire             sys_pll_s1_any_bursting_master_saved_grant;
  wire             sys_pll_s1_any_continuerequest;
  wire             sys_pll_s1_arb_counter_enable;
  reg              sys_pll_s1_arb_share_counter;
  wire             sys_pll_s1_arb_share_counter_next_value;
  wire             sys_pll_s1_arb_share_set_values;
  wire             sys_pll_s1_beginbursttransfer_internal;
  wire             sys_pll_s1_begins_xfer;
  wire             sys_pll_s1_chipselect;
  wire             sys_pll_s1_end_xfer;
  wire             sys_pll_s1_firsttransfer;
  wire             sys_pll_s1_grant_vector;
  wire             sys_pll_s1_in_a_read_cycle;
  wire             sys_pll_s1_in_a_write_cycle;
  wire             sys_pll_s1_master_qreq_vector;
  wire             sys_pll_s1_non_bursting_master_requests;
  wire             sys_pll_s1_read;
  wire    [ 15: 0] sys_pll_s1_readdata_from_sa;
  reg              sys_pll_s1_reg_firsttransfer;
  wire             sys_pll_s1_reset_n;
  wire             sys_pll_s1_resetrequest_from_sa;
  reg              sys_pll_s1_slavearbiterlockenable;
  wire             sys_pll_s1_slavearbiterlockenable2;
  wire             sys_pll_s1_unreg_firsttransfer;
  wire             sys_pll_s1_waits_for_read;
  wire             sys_pll_s1_waits_for_write;
  wire             sys_pll_s1_write;
  wire    [ 15: 0] sys_pll_s1_writedata;
  wire             wait_for_sys_pll_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sys_pll_s1_end_xfer;
    end


  assign sys_pll_s1_begins_xfer = ~d1_reasons_to_wait & ((cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1));
  //assign sys_pll_s1_readdata_from_sa = sys_pll_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_pll_s1_readdata_from_sa = sys_pll_s1_readdata;

  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1 = (1) & (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read | cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write);
  //sys_pll_s1_arb_share_counter set values, which is an e_mux
  assign sys_pll_s1_arb_share_set_values = 1;

  //sys_pll_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_pll_s1_non_bursting_master_requests = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;

  //sys_pll_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_pll_s1_any_bursting_master_saved_grant = 0;

  //sys_pll_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_pll_s1_arb_share_counter_next_value = sys_pll_s1_firsttransfer ? (sys_pll_s1_arb_share_set_values - 1) : |sys_pll_s1_arb_share_counter ? (sys_pll_s1_arb_share_counter - 1) : 0;

  //sys_pll_s1_allgrants all slave grants, which is an e_mux
  assign sys_pll_s1_allgrants = |sys_pll_s1_grant_vector;

  //sys_pll_s1_end_xfer assignment, which is an e_assign
  assign sys_pll_s1_end_xfer = ~(sys_pll_s1_waits_for_read | sys_pll_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_pll_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_pll_s1 = sys_pll_s1_end_xfer & (~sys_pll_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_pll_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_pll_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_pll_s1 & sys_pll_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_pll_s1 & ~sys_pll_s1_non_bursting_master_requests);

  //sys_pll_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_pll_s1_arb_share_counter <= 0;
      else if (sys_pll_s1_arb_counter_enable)
          sys_pll_s1_arb_share_counter <= sys_pll_s1_arb_share_counter_next_value;
    end


  //sys_pll_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_pll_s1_slavearbiterlockenable <= 0;
      else if ((|sys_pll_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_pll_s1) | (end_xfer_arb_share_counter_term_sys_pll_s1 & ~sys_pll_s1_non_bursting_master_requests))
          sys_pll_s1_slavearbiterlockenable <= |sys_pll_s1_arb_share_counter_next_value;
    end


  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/out sys_pll/s1 arbiterlock, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_arbiterlock = sys_pll_s1_slavearbiterlockenable & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_continuerequest;

  //sys_pll_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_pll_s1_slavearbiterlockenable2 = |sys_pll_s1_arb_share_counter_next_value;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/out sys_pll/s1 arbiterlock2, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_arbiterlock2 = sys_pll_s1_slavearbiterlockenable2 & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_continuerequest;

  //sys_pll_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_pll_s1_any_continuerequest = 1;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_continuerequest continued request, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_continuerequest = 1;

  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1 = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;
  //sys_pll_s1_writedata mux, which is an e_mux
  assign sys_pll_s1_writedata = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata;

  //master is always granted when requested
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1 = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0/out saved-grant sys_pll/s1, which is an e_assign
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_saved_grant_sys_pll_s1 = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;

  //allow new arb cycle for sys_pll/s1, which is an e_assign
  assign sys_pll_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_pll_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_pll_s1_master_qreq_vector = 1;

  //sys_pll_s1_reset_n assignment, which is an e_assign
  assign sys_pll_s1_reset_n = reset_n;

  //assign sys_pll_s1_resetrequest_from_sa = sys_pll_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_pll_s1_resetrequest_from_sa = sys_pll_s1_resetrequest;

  assign sys_pll_s1_chipselect = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1;
  //sys_pll_s1_firsttransfer first transaction, which is an e_assign
  assign sys_pll_s1_firsttransfer = sys_pll_s1_begins_xfer ? sys_pll_s1_unreg_firsttransfer : sys_pll_s1_reg_firsttransfer;

  //sys_pll_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_pll_s1_unreg_firsttransfer = ~(sys_pll_s1_slavearbiterlockenable & sys_pll_s1_any_continuerequest);

  //sys_pll_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_pll_s1_reg_firsttransfer <= 1'b1;
      else if (sys_pll_s1_begins_xfer)
          sys_pll_s1_reg_firsttransfer <= sys_pll_s1_unreg_firsttransfer;
    end


  //sys_pll_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_pll_s1_beginbursttransfer_internal = sys_pll_s1_begins_xfer;

  //sys_pll_s1_read assignment, which is an e_mux
  assign sys_pll_s1_read = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1 & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read;

  //sys_pll_s1_write assignment, which is an e_mux
  assign sys_pll_s1_write = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1 & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write;

  //sys_pll_s1_address mux, which is an e_mux
  assign sys_pll_s1_address = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress;

  //d1_sys_pll_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_pll_s1_end_xfer <= 1;
      else 
        d1_sys_pll_s1_end_xfer <= sys_pll_s1_end_xfer;
    end


  //sys_pll_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_pll_s1_waits_for_read = sys_pll_s1_in_a_read_cycle & sys_pll_s1_begins_xfer;

  //sys_pll_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_pll_s1_in_a_read_cycle = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1 & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_pll_s1_in_a_read_cycle;

  //sys_pll_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_pll_s1_waits_for_write = sys_pll_s1_in_a_write_cycle & 0;

  //sys_pll_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_pll_s1_in_a_write_cycle = cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1 & cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_pll_s1_in_a_write_cycle;

  assign wait_for_sys_pll_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_pll/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_read,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[28 : 3] , 3'b0} == 29'h10022c90) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tse_mac_control_port_arbitrator (
                                         // inputs:
                                          clk,
                                          cpu_data_master_address_to_slave,
                                          cpu_data_master_read,
                                          cpu_data_master_waitrequest,
                                          cpu_data_master_write,
                                          cpu_data_master_writedata,
                                          reset_n,
                                          tse_mac_control_port_readdata,
                                          tse_mac_control_port_waitrequest,

                                         // outputs:
                                          cpu_data_master_granted_tse_mac_control_port,
                                          cpu_data_master_qualified_request_tse_mac_control_port,
                                          cpu_data_master_read_data_valid_tse_mac_control_port,
                                          cpu_data_master_requests_tse_mac_control_port,
                                          d1_tse_mac_control_port_end_xfer,
                                          tse_mac_control_port_address,
                                          tse_mac_control_port_read,
                                          tse_mac_control_port_readdata_from_sa,
                                          tse_mac_control_port_reset,
                                          tse_mac_control_port_waitrequest_from_sa,
                                          tse_mac_control_port_write,
                                          tse_mac_control_port_writedata
                                       )
;

  output           cpu_data_master_granted_tse_mac_control_port;
  output           cpu_data_master_qualified_request_tse_mac_control_port;
  output           cpu_data_master_read_data_valid_tse_mac_control_port;
  output           cpu_data_master_requests_tse_mac_control_port;
  output           d1_tse_mac_control_port_end_xfer;
  output  [  7: 0] tse_mac_control_port_address;
  output           tse_mac_control_port_read;
  output  [ 31: 0] tse_mac_control_port_readdata_from_sa;
  output           tse_mac_control_port_reset;
  output           tse_mac_control_port_waitrequest_from_sa;
  output           tse_mac_control_port_write;
  output  [ 31: 0] tse_mac_control_port_writedata;
  input            clk;
  input   [ 28: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] tse_mac_control_port_readdata;
  input            tse_mac_control_port_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_tse_mac_control_port;
  wire             cpu_data_master_qualified_request_tse_mac_control_port;
  wire             cpu_data_master_read_data_valid_tse_mac_control_port;
  wire             cpu_data_master_requests_tse_mac_control_port;
  wire             cpu_data_master_saved_grant_tse_mac_control_port;
  reg              d1_reasons_to_wait;
  reg              d1_tse_mac_control_port_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tse_mac_control_port;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 28: 0] shifted_address_to_tse_mac_control_port_from_cpu_data_master;
  wire    [  7: 0] tse_mac_control_port_address;
  wire             tse_mac_control_port_allgrants;
  wire             tse_mac_control_port_allow_new_arb_cycle;
  wire             tse_mac_control_port_any_bursting_master_saved_grant;
  wire             tse_mac_control_port_any_continuerequest;
  wire             tse_mac_control_port_arb_counter_enable;
  reg     [  1: 0] tse_mac_control_port_arb_share_counter;
  wire    [  1: 0] tse_mac_control_port_arb_share_counter_next_value;
  wire    [  1: 0] tse_mac_control_port_arb_share_set_values;
  wire             tse_mac_control_port_beginbursttransfer_internal;
  wire             tse_mac_control_port_begins_xfer;
  wire             tse_mac_control_port_end_xfer;
  wire             tse_mac_control_port_firsttransfer;
  wire             tse_mac_control_port_grant_vector;
  wire             tse_mac_control_port_in_a_read_cycle;
  wire             tse_mac_control_port_in_a_write_cycle;
  wire             tse_mac_control_port_master_qreq_vector;
  wire             tse_mac_control_port_non_bursting_master_requests;
  wire             tse_mac_control_port_read;
  wire    [ 31: 0] tse_mac_control_port_readdata_from_sa;
  reg              tse_mac_control_port_reg_firsttransfer;
  wire             tse_mac_control_port_reset;
  reg              tse_mac_control_port_slavearbiterlockenable;
  wire             tse_mac_control_port_slavearbiterlockenable2;
  wire             tse_mac_control_port_unreg_firsttransfer;
  wire             tse_mac_control_port_waitrequest_from_sa;
  wire             tse_mac_control_port_waits_for_read;
  wire             tse_mac_control_port_waits_for_write;
  wire             tse_mac_control_port_write;
  wire    [ 31: 0] tse_mac_control_port_writedata;
  wire             wait_for_tse_mac_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tse_mac_control_port_end_xfer;
    end


  assign tse_mac_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_tse_mac_control_port));
  //assign tse_mac_control_port_readdata_from_sa = tse_mac_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign tse_mac_control_port_readdata_from_sa = tse_mac_control_port_readdata;

  assign cpu_data_master_requests_tse_mac_control_port = ({cpu_data_master_address_to_slave[28 : 10] , 10'b0} == 29'h10022800) & (cpu_data_master_read | cpu_data_master_write);
  //assign tse_mac_control_port_waitrequest_from_sa = tse_mac_control_port_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign tse_mac_control_port_waitrequest_from_sa = tse_mac_control_port_waitrequest;

  //tse_mac_control_port_arb_share_counter set values, which is an e_mux
  assign tse_mac_control_port_arb_share_set_values = 1;

  //tse_mac_control_port_non_bursting_master_requests mux, which is an e_mux
  assign tse_mac_control_port_non_bursting_master_requests = cpu_data_master_requests_tse_mac_control_port;

  //tse_mac_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign tse_mac_control_port_any_bursting_master_saved_grant = 0;

  //tse_mac_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign tse_mac_control_port_arb_share_counter_next_value = tse_mac_control_port_firsttransfer ? (tse_mac_control_port_arb_share_set_values - 1) : |tse_mac_control_port_arb_share_counter ? (tse_mac_control_port_arb_share_counter - 1) : 0;

  //tse_mac_control_port_allgrants all slave grants, which is an e_mux
  assign tse_mac_control_port_allgrants = |tse_mac_control_port_grant_vector;

  //tse_mac_control_port_end_xfer assignment, which is an e_assign
  assign tse_mac_control_port_end_xfer = ~(tse_mac_control_port_waits_for_read | tse_mac_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_tse_mac_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tse_mac_control_port = tse_mac_control_port_end_xfer & (~tse_mac_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tse_mac_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign tse_mac_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_tse_mac_control_port & tse_mac_control_port_allgrants) | (end_xfer_arb_share_counter_term_tse_mac_control_port & ~tse_mac_control_port_non_bursting_master_requests);

  //tse_mac_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tse_mac_control_port_arb_share_counter <= 0;
      else if (tse_mac_control_port_arb_counter_enable)
          tse_mac_control_port_arb_share_counter <= tse_mac_control_port_arb_share_counter_next_value;
    end


  //tse_mac_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tse_mac_control_port_slavearbiterlockenable <= 0;
      else if ((|tse_mac_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_tse_mac_control_port) | (end_xfer_arb_share_counter_term_tse_mac_control_port & ~tse_mac_control_port_non_bursting_master_requests))
          tse_mac_control_port_slavearbiterlockenable <= |tse_mac_control_port_arb_share_counter_next_value;
    end


  //cpu/data_master tse_mac/control_port arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tse_mac_control_port_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tse_mac_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tse_mac_control_port_slavearbiterlockenable2 = |tse_mac_control_port_arb_share_counter_next_value;

  //cpu/data_master tse_mac/control_port arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tse_mac_control_port_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //tse_mac_control_port_any_continuerequest at least one master continues requesting, which is an e_assign
  assign tse_mac_control_port_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_tse_mac_control_port = cpu_data_master_requests_tse_mac_control_port & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //tse_mac_control_port_writedata mux, which is an e_mux
  assign tse_mac_control_port_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_tse_mac_control_port = cpu_data_master_qualified_request_tse_mac_control_port;

  //cpu/data_master saved-grant tse_mac/control_port, which is an e_assign
  assign cpu_data_master_saved_grant_tse_mac_control_port = cpu_data_master_requests_tse_mac_control_port;

  //allow new arb cycle for tse_mac/control_port, which is an e_assign
  assign tse_mac_control_port_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign tse_mac_control_port_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign tse_mac_control_port_master_qreq_vector = 1;

  //~tse_mac_control_port_reset assignment, which is an e_assign
  assign tse_mac_control_port_reset = ~reset_n;

  //tse_mac_control_port_firsttransfer first transaction, which is an e_assign
  assign tse_mac_control_port_firsttransfer = tse_mac_control_port_begins_xfer ? tse_mac_control_port_unreg_firsttransfer : tse_mac_control_port_reg_firsttransfer;

  //tse_mac_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign tse_mac_control_port_unreg_firsttransfer = ~(tse_mac_control_port_slavearbiterlockenable & tse_mac_control_port_any_continuerequest);

  //tse_mac_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tse_mac_control_port_reg_firsttransfer <= 1'b1;
      else if (tse_mac_control_port_begins_xfer)
          tse_mac_control_port_reg_firsttransfer <= tse_mac_control_port_unreg_firsttransfer;
    end


  //tse_mac_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tse_mac_control_port_beginbursttransfer_internal = tse_mac_control_port_begins_xfer;

  //tse_mac_control_port_read assignment, which is an e_mux
  assign tse_mac_control_port_read = cpu_data_master_granted_tse_mac_control_port & cpu_data_master_read;

  //tse_mac_control_port_write assignment, which is an e_mux
  assign tse_mac_control_port_write = cpu_data_master_granted_tse_mac_control_port & cpu_data_master_write;

  assign shifted_address_to_tse_mac_control_port_from_cpu_data_master = cpu_data_master_address_to_slave;
  //tse_mac_control_port_address mux, which is an e_mux
  assign tse_mac_control_port_address = shifted_address_to_tse_mac_control_port_from_cpu_data_master >> 2;

  //d1_tse_mac_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tse_mac_control_port_end_xfer <= 1;
      else 
        d1_tse_mac_control_port_end_xfer <= tse_mac_control_port_end_xfer;
    end


  //tse_mac_control_port_waits_for_read in a cycle, which is an e_mux
  assign tse_mac_control_port_waits_for_read = tse_mac_control_port_in_a_read_cycle & tse_mac_control_port_waitrequest_from_sa;

  //tse_mac_control_port_in_a_read_cycle assignment, which is an e_assign
  assign tse_mac_control_port_in_a_read_cycle = cpu_data_master_granted_tse_mac_control_port & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = tse_mac_control_port_in_a_read_cycle;

  //tse_mac_control_port_waits_for_write in a cycle, which is an e_mux
  assign tse_mac_control_port_waits_for_write = tse_mac_control_port_in_a_write_cycle & tse_mac_control_port_waitrequest_from_sa;

  //tse_mac_control_port_in_a_write_cycle assignment, which is an e_assign
  assign tse_mac_control_port_in_a_write_cycle = cpu_data_master_granted_tse_mac_control_port & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = tse_mac_control_port_in_a_write_cycle;

  assign wait_for_tse_mac_control_port_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //tse_mac/control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tse_mac_transmit_arbitrator (
                                     // inputs:
                                      clk,
                                      reset_n,
                                      sgdma_tx_out_data,
                                      sgdma_tx_out_empty,
                                      sgdma_tx_out_endofpacket,
                                      sgdma_tx_out_error,
                                      sgdma_tx_out_startofpacket,
                                      sgdma_tx_out_valid,
                                      tse_mac_transmit_ready,

                                     // outputs:
                                      tse_mac_transmit_data,
                                      tse_mac_transmit_empty,
                                      tse_mac_transmit_endofpacket,
                                      tse_mac_transmit_error,
                                      tse_mac_transmit_ready_from_sa,
                                      tse_mac_transmit_startofpacket,
                                      tse_mac_transmit_valid
                                   )
;

  output  [ 31: 0] tse_mac_transmit_data;
  output  [  1: 0] tse_mac_transmit_empty;
  output           tse_mac_transmit_endofpacket;
  output           tse_mac_transmit_error;
  output           tse_mac_transmit_ready_from_sa;
  output           tse_mac_transmit_startofpacket;
  output           tse_mac_transmit_valid;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sgdma_tx_out_data;
  input   [  1: 0] sgdma_tx_out_empty;
  input            sgdma_tx_out_endofpacket;
  input            sgdma_tx_out_error;
  input            sgdma_tx_out_startofpacket;
  input            sgdma_tx_out_valid;
  input            tse_mac_transmit_ready;

  wire    [ 31: 0] tse_mac_transmit_data;
  wire    [  1: 0] tse_mac_transmit_empty;
  wire             tse_mac_transmit_endofpacket;
  wire             tse_mac_transmit_error;
  wire             tse_mac_transmit_ready_from_sa;
  wire             tse_mac_transmit_startofpacket;
  wire             tse_mac_transmit_valid;
  //mux tse_mac_transmit_data, which is an e_mux
  assign tse_mac_transmit_data = sgdma_tx_out_data;

  //mux tse_mac_transmit_endofpacket, which is an e_mux
  assign tse_mac_transmit_endofpacket = sgdma_tx_out_endofpacket;

  //mux tse_mac_transmit_error, which is an e_mux
  assign tse_mac_transmit_error = sgdma_tx_out_error;

  //mux tse_mac_transmit_empty, which is an e_mux
  assign tse_mac_transmit_empty = sgdma_tx_out_empty;

  //assign tse_mac_transmit_ready_from_sa = tse_mac_transmit_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign tse_mac_transmit_ready_from_sa = tse_mac_transmit_ready;

  //mux tse_mac_transmit_startofpacket, which is an e_mux
  assign tse_mac_transmit_startofpacket = sgdma_tx_out_startofpacket;

  //mux tse_mac_transmit_valid, which is an e_mux
  assign tse_mac_transmit_valid = sgdma_tx_out_valid;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tse_mac_receive_arbitrator (
                                    // inputs:
                                     clk,
                                     reset_n,
                                     sgdma_rx_in_ready_from_sa,
                                     tse_mac_receive_data,
                                     tse_mac_receive_empty,
                                     tse_mac_receive_endofpacket,
                                     tse_mac_receive_error,
                                     tse_mac_receive_startofpacket,
                                     tse_mac_receive_valid,

                                    // outputs:
                                     tse_mac_receive_ready
                                  )
;

  output           tse_mac_receive_ready;
  input            clk;
  input            reset_n;
  input            sgdma_rx_in_ready_from_sa;
  input   [ 31: 0] tse_mac_receive_data;
  input   [  1: 0] tse_mac_receive_empty;
  input            tse_mac_receive_endofpacket;
  input   [  5: 0] tse_mac_receive_error;
  input            tse_mac_receive_startofpacket;
  input            tse_mac_receive_valid;

  wire             tse_mac_receive_ready;
  //mux tse_mac_receive_ready, which is an e_mux
  assign tse_mac_receive_ready = sgdma_rx_in_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc_reset_altmemddr_phy_clk_out_domain_synch_module (
                                                                                                   // inputs:
                                                                                                    clk,
                                                                                                    data_in,
                                                                                                    reset_n,

                                                                                                   // outputs:
                                                                                                    data_out
                                                                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc_reset_system_clk_domain_synch_module (
                                                                                        // inputs:
                                                                                         clk,
                                                                                         data_in,
                                                                                         reset_n,

                                                                                        // outputs:
                                                                                         data_out
                                                                                      )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc_reset_osc_clk_domain_synch_module (
                                                                                     // inputs:
                                                                                      clk,
                                                                                      data_in,
                                                                                      reset_n,

                                                                                     // outputs:
                                                                                      data_out
                                                                                   )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cycloneIII_3c120_dev_niosII_standard_sopc (
                                                   // 1) global signals:
                                                    altmemddr_aux_full_rate_clk_out,
                                                    altmemddr_aux_half_rate_clk_out,
                                                    altmemddr_phy_clk_out,
                                                    osc_clk,
                                                    osc_clk_1,
                                                    reset_n,
                                                    system_clk,

                                                   // the_altmemddr
                                                    global_reset_n_to_the_altmemddr,
                                                    local_init_done_from_the_altmemddr,
                                                    local_refresh_ack_from_the_altmemddr,
                                                    local_wdata_req_from_the_altmemddr,
                                                    mem_addr_from_the_altmemddr,
                                                    mem_ba_from_the_altmemddr,
                                                    mem_cas_n_from_the_altmemddr,
                                                    mem_cke_from_the_altmemddr,
                                                    mem_clk_n_to_and_from_the_altmemddr,
                                                    mem_clk_to_and_from_the_altmemddr,
                                                    mem_cs_n_from_the_altmemddr,
                                                    mem_dm_from_the_altmemddr,
                                                    mem_dq_to_and_from_the_altmemddr,
                                                    mem_dqs_to_and_from_the_altmemddr,
                                                    mem_odt_from_the_altmemddr,
                                                    mem_ras_n_from_the_altmemddr,
                                                    mem_we_n_from_the_altmemddr,
                                                    reset_phy_clk_n_from_the_altmemddr,

                                                   // the_button_pio
                                                    in_port_to_the_button_pio,

                                                   // the_flash_tristate_bridge_avalon_slave
                                                    address_to_the_ext_flash,
                                                    data_to_and_from_the_ext_flash,
                                                    read_n_to_the_ext_flash,
                                                    select_n_to_the_ext_flash,
                                                    write_n_to_the_ext_flash,

                                                   // the_lcd_display
                                                    LCD_E_from_the_lcd_display,
                                                    LCD_RS_from_the_lcd_display,
                                                    LCD_RW_from_the_lcd_display,
                                                    LCD_data_to_and_from_the_lcd_display,

                                                   // the_led_pio
                                                    out_port_from_the_led_pio,

                                                   // the_tse_mac
                                                    ena_10_from_the_tse_mac,
                                                    eth_mode_from_the_tse_mac,
                                                    mdc_from_the_tse_mac,
                                                    mdio_in_to_the_tse_mac,
                                                    mdio_oen_from_the_tse_mac,
                                                    mdio_out_from_the_tse_mac,
                                                    rgmii_in_to_the_tse_mac,
                                                    rgmii_out_from_the_tse_mac,
                                                    rx_clk_to_the_tse_mac,
                                                    rx_control_to_the_tse_mac,
                                                    set_1000_to_the_tse_mac,
                                                    set_10_to_the_tse_mac,
                                                    tx_clk_to_the_tse_mac,
                                                    tx_control_from_the_tse_mac
                                                 )
;

  output           LCD_E_from_the_lcd_display;
  output           LCD_RS_from_the_lcd_display;
  output           LCD_RW_from_the_lcd_display;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd_display;
  output  [ 25: 0] address_to_the_ext_flash;
  output           altmemddr_aux_full_rate_clk_out;
  output           altmemddr_aux_half_rate_clk_out;
  output           altmemddr_phy_clk_out;
  inout   [ 15: 0] data_to_and_from_the_ext_flash;
  output           ena_10_from_the_tse_mac;
  output           eth_mode_from_the_tse_mac;
  output           local_init_done_from_the_altmemddr;
  output           local_refresh_ack_from_the_altmemddr;
  output           local_wdata_req_from_the_altmemddr;
  output           mdc_from_the_tse_mac;
  output           mdio_oen_from_the_tse_mac;
  output           mdio_out_from_the_tse_mac;
  output  [ 12: 0] mem_addr_from_the_altmemddr;
  output  [  1: 0] mem_ba_from_the_altmemddr;
  output           mem_cas_n_from_the_altmemddr;
  output           mem_cke_from_the_altmemddr;
  inout            mem_clk_n_to_and_from_the_altmemddr;
  inout            mem_clk_to_and_from_the_altmemddr;
  output           mem_cs_n_from_the_altmemddr;
  output  [  1: 0] mem_dm_from_the_altmemddr;
  inout   [ 15: 0] mem_dq_to_and_from_the_altmemddr;
  inout   [  1: 0] mem_dqs_to_and_from_the_altmemddr;
  output           mem_odt_from_the_altmemddr;
  output           mem_ras_n_from_the_altmemddr;
  output           mem_we_n_from_the_altmemddr;
  output  [  7: 0] out_port_from_the_led_pio;
  output           read_n_to_the_ext_flash;
  output           reset_phy_clk_n_from_the_altmemddr;
  output  [  3: 0] rgmii_out_from_the_tse_mac;
  output           select_n_to_the_ext_flash;
  output           system_clk;
  output           tx_control_from_the_tse_mac;
  output           write_n_to_the_ext_flash;
  input            global_reset_n_to_the_altmemddr;
  input   [  3: 0] in_port_to_the_button_pio;
  input            mdio_in_to_the_tse_mac;
  input            osc_clk;
  input            osc_clk_1;
  input            reset_n;
  input   [  3: 0] rgmii_in_to_the_tse_mac;
  input            rx_clk_to_the_tse_mac;
  input            rx_control_to_the_tse_mac;
  input            set_1000_to_the_tse_mac;
  input            set_10_to_the_tse_mac;
  input            tx_clk_to_the_tse_mac;

  wire             LCD_E_from_the_lcd_display;
  wire             LCD_RS_from_the_lcd_display;
  wire             LCD_RW_from_the_lcd_display;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_display;
  wire    [ 25: 0] address_to_the_ext_flash;
  wire             altmemddr_aux_full_rate_clk_out;
  wire             altmemddr_aux_half_rate_clk_out;
  wire    [ 25: 0] altmemddr_bridge_m1_address;
  wire    [ 25: 0] altmemddr_bridge_m1_address_to_slave;
  wire    [  3: 0] altmemddr_bridge_m1_byteenable;
  wire             altmemddr_bridge_m1_endofpacket;
  wire             altmemddr_bridge_m1_granted_altmemddr_s1;
  wire             altmemddr_bridge_m1_latency_counter;
  wire    [ 23: 0] altmemddr_bridge_m1_nativeaddress;
  wire             altmemddr_bridge_m1_qualified_request_altmemddr_s1;
  wire             altmemddr_bridge_m1_read;
  wire             altmemddr_bridge_m1_read_data_valid_altmemddr_s1;
  wire             altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register;
  wire    [ 31: 0] altmemddr_bridge_m1_readdata;
  wire             altmemddr_bridge_m1_readdatavalid;
  wire             altmemddr_bridge_m1_requests_altmemddr_s1;
  wire             altmemddr_bridge_m1_reset_n;
  wire             altmemddr_bridge_m1_waitrequest;
  wire             altmemddr_bridge_m1_write;
  wire    [ 31: 0] altmemddr_bridge_m1_writedata;
  wire    [ 23: 0] altmemddr_bridge_s1_address;
  wire    [  3: 0] altmemddr_bridge_s1_byteenable;
  wire             altmemddr_bridge_s1_endofpacket;
  wire             altmemddr_bridge_s1_endofpacket_from_sa;
  wire    [ 23: 0] altmemddr_bridge_s1_nativeaddress;
  wire             altmemddr_bridge_s1_read;
  wire    [ 31: 0] altmemddr_bridge_s1_readdata;
  wire    [ 31: 0] altmemddr_bridge_s1_readdata_from_sa;
  wire             altmemddr_bridge_s1_readdatavalid;
  wire             altmemddr_bridge_s1_reset_n;
  wire             altmemddr_bridge_s1_waitrequest;
  wire             altmemddr_bridge_s1_waitrequest_from_sa;
  wire             altmemddr_bridge_s1_write;
  wire    [ 31: 0] altmemddr_bridge_s1_writedata;
  wire             altmemddr_phy_clk_out;
  wire             altmemddr_phy_clk_out_reset_n;
  wire    [ 22: 0] altmemddr_s1_address;
  wire             altmemddr_s1_beginbursttransfer;
  wire             altmemddr_s1_burstcount;
  wire    [  7: 0] altmemddr_s1_byteenable;
  wire             altmemddr_s1_read;
  wire    [ 63: 0] altmemddr_s1_readdata;
  wire    [ 63: 0] altmemddr_s1_readdata_from_sa;
  wire             altmemddr_s1_readdatavalid;
  wire             altmemddr_s1_resetrequest_n;
  wire             altmemddr_s1_resetrequest_n_from_sa;
  wire             altmemddr_s1_waitrequest_n;
  wire             altmemddr_s1_waitrequest_n_from_sa;
  wire             altmemddr_s1_write;
  wire    [ 63: 0] altmemddr_s1_writedata;
  wire    [  1: 0] button_pio_s1_address;
  wire             button_pio_s1_chipselect;
  wire             button_pio_s1_irq;
  wire             button_pio_s1_irq_from_sa;
  wire    [ 31: 0] button_pio_s1_readdata;
  wire    [ 31: 0] button_pio_s1_readdata_from_sa;
  wire             button_pio_s1_reset_n;
  wire             button_pio_s1_write_n;
  wire    [ 31: 0] button_pio_s1_writedata;
  wire    [ 28: 0] cpu_data_master_address;
  wire    [ 28: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_altmemddr_bridge_s1;
  wire             cpu_data_master_granted_button_pio_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_granted_descriptor_memory_s1;
  wire             cpu_data_master_granted_ext_flash_s1;
  wire             cpu_data_master_granted_high_res_timer_s1;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_lcd_display_control_slave;
  wire             cpu_data_master_granted_led_pio_s1;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_granted_sgdma_rx_csr;
  wire             cpu_data_master_granted_sgdma_tx_csr;
  wire             cpu_data_master_granted_sys_clk_timer_s1;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_tse_mac_control_port;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_no_byte_enables_and_last_term;
  wire             cpu_data_master_qualified_request_altmemddr_bridge_s1;
  wire             cpu_data_master_qualified_request_button_pio_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_qualified_request_descriptor_memory_s1;
  wire             cpu_data_master_qualified_request_ext_flash_s1;
  wire             cpu_data_master_qualified_request_high_res_timer_s1;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_lcd_display_control_slave;
  wire             cpu_data_master_qualified_request_led_pio_s1;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_sgdma_rx_csr;
  wire             cpu_data_master_qualified_request_sgdma_tx_csr;
  wire             cpu_data_master_qualified_request_sys_clk_timer_s1;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_tse_mac_control_port;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_altmemddr_bridge_s1;
  wire             cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  wire             cpu_data_master_read_data_valid_button_pio_s1;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_read_data_valid_descriptor_memory_s1;
  wire             cpu_data_master_read_data_valid_ext_flash_s1;
  wire             cpu_data_master_read_data_valid_high_res_timer_s1;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_lcd_display_control_slave;
  wire             cpu_data_master_read_data_valid_led_pio_s1;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_sgdma_rx_csr;
  wire             cpu_data_master_read_data_valid_sgdma_tx_csr;
  wire             cpu_data_master_read_data_valid_sys_clk_timer_s1;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_tse_mac_control_port;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_altmemddr_bridge_s1;
  wire             cpu_data_master_requests_button_pio_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in;
  wire             cpu_data_master_requests_descriptor_memory_s1;
  wire             cpu_data_master_requests_ext_flash_s1;
  wire             cpu_data_master_requests_high_res_timer_s1;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_lcd_display_control_slave;
  wire             cpu_data_master_requests_led_pio_s1;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_requests_sgdma_rx_csr;
  wire             cpu_data_master_requests_sgdma_tx_csr;
  wire             cpu_data_master_requests_sys_clk_timer_s1;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_tse_mac_control_port;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 28: 0] cpu_instruction_master_address;
  wire    [ 28: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_altmemddr_bridge_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_ext_flash_s1;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_altmemddr_bridge_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_ext_flash_s1;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_altmemddr_bridge_s1;
  wire             cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_altmemddr_bridge_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_ext_flash_s1;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire    [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address;
  wire    [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  wire    [  2: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata;
  wire    [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address;
  wire    [  3: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave;
  wire    [  1: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_endofpacket;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1;
  wire    [  2: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write;
  wire    [ 15: 0] cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata;
  wire             d1_altmemddr_bridge_s1_end_xfer;
  wire             d1_altmemddr_s1_end_xfer;
  wire             d1_button_pio_s1_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer;
  wire             d1_descriptor_memory_s1_end_xfer;
  wire             d1_flash_tristate_bridge_avalon_slave_end_xfer;
  wire             d1_high_res_timer_s1_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_display_control_slave_end_xfer;
  wire             d1_led_pio_s1_end_xfer;
  wire             d1_onchip_ram_s1_end_xfer;
  wire             d1_sgdma_rx_csr_end_xfer;
  wire             d1_sgdma_tx_csr_end_xfer;
  wire             d1_sys_clk_timer_s1_end_xfer;
  wire             d1_sys_pll_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_tse_mac_control_port_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_ext_flash;
  wire    [  9: 0] descriptor_memory_s1_address;
  wire    [  3: 0] descriptor_memory_s1_byteenable;
  wire             descriptor_memory_s1_chipselect;
  wire             descriptor_memory_s1_clken;
  wire    [ 31: 0] descriptor_memory_s1_readdata;
  wire    [ 31: 0] descriptor_memory_s1_readdata_from_sa;
  wire             descriptor_memory_s1_reset;
  wire             descriptor_memory_s1_write;
  wire    [ 31: 0] descriptor_memory_s1_writedata;
  wire             ena_10_from_the_tse_mac;
  wire             eth_mode_from_the_tse_mac;
  wire             ext_flash_s1_wait_counter_eq_0;
  wire             ext_flash_s1_wait_counter_eq_1;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_irq;
  wire             high_res_timer_s1_irq_from_sa;
  wire    [ 15: 0] high_res_timer_s1_readdata;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  wire             high_res_timer_s1_reset_n;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire    [ 15: 0] incoming_data_to_and_from_the_ext_flash;
  wire    [ 15: 0] incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_display_control_slave_address;
  wire             lcd_display_control_slave_begintransfer;
  wire             lcd_display_control_slave_read;
  wire    [  7: 0] lcd_display_control_slave_readdata;
  wire    [  7: 0] lcd_display_control_slave_readdata_from_sa;
  wire             lcd_display_control_slave_reset_n;
  wire             lcd_display_control_slave_wait_counter_eq_0;
  wire             lcd_display_control_slave_wait_counter_eq_1;
  wire             lcd_display_control_slave_write;
  wire    [  7: 0] lcd_display_control_slave_writedata;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_chipselect;
  wire    [ 31: 0] led_pio_s1_readdata;
  wire    [ 31: 0] led_pio_s1_readdata_from_sa;
  wire             led_pio_s1_reset_n;
  wire             led_pio_s1_write_n;
  wire    [ 31: 0] led_pio_s1_writedata;
  wire             local_init_done_from_the_altmemddr;
  wire             local_refresh_ack_from_the_altmemddr;
  wire             local_wdata_req_from_the_altmemddr;
  wire             mdc_from_the_tse_mac;
  wire             mdio_oen_from_the_tse_mac;
  wire             mdio_out_from_the_tse_mac;
  wire    [ 12: 0] mem_addr_from_the_altmemddr;
  wire    [  1: 0] mem_ba_from_the_altmemddr;
  wire             mem_cas_n_from_the_altmemddr;
  wire             mem_cke_from_the_altmemddr;
  wire             mem_clk_n_to_and_from_the_altmemddr;
  wire             mem_clk_to_and_from_the_altmemddr;
  wire             mem_cs_n_from_the_altmemddr;
  wire    [  1: 0] mem_dm_from_the_altmemddr;
  wire    [ 15: 0] mem_dq_to_and_from_the_altmemddr;
  wire    [  1: 0] mem_dqs_to_and_from_the_altmemddr;
  wire             mem_odt_from_the_altmemddr;
  wire             mem_ras_n_from_the_altmemddr;
  wire             mem_we_n_from_the_altmemddr;
  wire    [ 13: 0] onchip_ram_s1_address;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire             onchip_ram_s1_clken;
  wire    [ 31: 0] onchip_ram_s1_readdata;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  wire             onchip_ram_s1_reset;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire             osc_clk_1_reset_n;
  wire             osc_clk_reset_n;
  wire             out_clk_altmemddr_aux_full_rate_clk;
  wire             out_clk_altmemddr_aux_half_rate_clk;
  wire             out_clk_altmemddr_phy_clk;
  wire             out_clk_sys_pll_c0;
  wire    [  7: 0] out_port_from_the_led_pio;
  wire             read_n_to_the_ext_flash;
  wire             registered_cpu_data_master_read_data_valid_descriptor_memory_s1;
  wire             registered_cpu_data_master_read_data_valid_ext_flash_s1;
  wire             registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  wire             reset_n_sources;
  wire             reset_phy_clk_n_from_the_altmemddr;
  wire    [  3: 0] rgmii_out_from_the_tse_mac;
  wire             select_n_to_the_ext_flash;
  wire    [  3: 0] sgdma_rx_csr_address;
  wire             sgdma_rx_csr_chipselect;
  wire             sgdma_rx_csr_irq;
  wire             sgdma_rx_csr_irq_from_sa;
  wire             sgdma_rx_csr_read;
  wire    [ 31: 0] sgdma_rx_csr_readdata;
  wire    [ 31: 0] sgdma_rx_csr_readdata_from_sa;
  wire             sgdma_rx_csr_reset_n;
  wire             sgdma_rx_csr_write;
  wire    [ 31: 0] sgdma_rx_csr_writedata;
  wire    [ 31: 0] sgdma_rx_descriptor_read_address;
  wire    [ 31: 0] sgdma_rx_descriptor_read_address_to_slave;
  wire             sgdma_rx_descriptor_read_granted_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_latency_counter;
  wire             sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_read;
  wire             sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1;
  wire    [ 31: 0] sgdma_rx_descriptor_read_readdata;
  wire             sgdma_rx_descriptor_read_readdatavalid;
  wire             sgdma_rx_descriptor_read_requests_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_read_waitrequest;
  wire    [ 31: 0] sgdma_rx_descriptor_write_address;
  wire    [ 31: 0] sgdma_rx_descriptor_write_address_to_slave;
  wire             sgdma_rx_descriptor_write_granted_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_requests_descriptor_memory_s1;
  wire             sgdma_rx_descriptor_write_waitrequest;
  wire             sgdma_rx_descriptor_write_write;
  wire    [ 31: 0] sgdma_rx_descriptor_write_writedata;
  wire    [ 31: 0] sgdma_rx_in_data;
  wire    [  1: 0] sgdma_rx_in_empty;
  wire             sgdma_rx_in_endofpacket;
  wire    [  5: 0] sgdma_rx_in_error;
  wire             sgdma_rx_in_ready;
  wire             sgdma_rx_in_ready_from_sa;
  wire             sgdma_rx_in_startofpacket;
  wire             sgdma_rx_in_valid;
  wire    [ 31: 0] sgdma_rx_m_write_address;
  wire    [ 31: 0] sgdma_rx_m_write_address_to_slave;
  wire    [  3: 0] sgdma_rx_m_write_byteenable;
  wire             sgdma_rx_m_write_granted_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_requests_altmemddr_bridge_s1;
  wire             sgdma_rx_m_write_waitrequest;
  wire             sgdma_rx_m_write_write;
  wire    [ 31: 0] sgdma_rx_m_write_writedata;
  wire    [  3: 0] sgdma_tx_csr_address;
  wire             sgdma_tx_csr_chipselect;
  wire             sgdma_tx_csr_irq;
  wire             sgdma_tx_csr_irq_from_sa;
  wire             sgdma_tx_csr_read;
  wire    [ 31: 0] sgdma_tx_csr_readdata;
  wire    [ 31: 0] sgdma_tx_csr_readdata_from_sa;
  wire             sgdma_tx_csr_reset_n;
  wire             sgdma_tx_csr_write;
  wire    [ 31: 0] sgdma_tx_csr_writedata;
  wire    [ 31: 0] sgdma_tx_descriptor_read_address;
  wire    [ 31: 0] sgdma_tx_descriptor_read_address_to_slave;
  wire             sgdma_tx_descriptor_read_granted_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_latency_counter;
  wire             sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_read;
  wire             sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1;
  wire    [ 31: 0] sgdma_tx_descriptor_read_readdata;
  wire             sgdma_tx_descriptor_read_readdatavalid;
  wire             sgdma_tx_descriptor_read_requests_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_read_waitrequest;
  wire    [ 31: 0] sgdma_tx_descriptor_write_address;
  wire    [ 31: 0] sgdma_tx_descriptor_write_address_to_slave;
  wire             sgdma_tx_descriptor_write_granted_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_requests_descriptor_memory_s1;
  wire             sgdma_tx_descriptor_write_waitrequest;
  wire             sgdma_tx_descriptor_write_write;
  wire    [ 31: 0] sgdma_tx_descriptor_write_writedata;
  wire    [ 31: 0] sgdma_tx_m_read_address;
  wire    [ 31: 0] sgdma_tx_m_read_address_to_slave;
  wire             sgdma_tx_m_read_granted_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_latency_counter;
  wire             sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_read;
  wire             sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register;
  wire    [ 31: 0] sgdma_tx_m_read_readdata;
  wire             sgdma_tx_m_read_readdatavalid;
  wire             sgdma_tx_m_read_requests_altmemddr_bridge_s1;
  wire             sgdma_tx_m_read_waitrequest;
  wire    [ 31: 0] sgdma_tx_out_data;
  wire    [  1: 0] sgdma_tx_out_empty;
  wire             sgdma_tx_out_endofpacket;
  wire             sgdma_tx_out_error;
  wire             sgdma_tx_out_ready;
  wire             sgdma_tx_out_startofpacket;
  wire             sgdma_tx_out_valid;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_irq;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_clk_timer_s1_readdata;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  wire             sys_clk_timer_s1_reset_n;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire    [  2: 0] sys_pll_s1_address;
  wire             sys_pll_s1_chipselect;
  wire             sys_pll_s1_read;
  wire    [ 15: 0] sys_pll_s1_readdata;
  wire    [ 15: 0] sys_pll_s1_readdata_from_sa;
  wire             sys_pll_s1_reset_n;
  wire             sys_pll_s1_resetrequest;
  wire             sys_pll_s1_resetrequest_from_sa;
  wire             sys_pll_s1_write;
  wire    [ 15: 0] sys_pll_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire             system_clk;
  wire             system_clk_reset_n;
  wire    [  7: 0] tse_mac_control_port_address;
  wire             tse_mac_control_port_read;
  wire    [ 31: 0] tse_mac_control_port_readdata;
  wire    [ 31: 0] tse_mac_control_port_readdata_from_sa;
  wire             tse_mac_control_port_reset;
  wire             tse_mac_control_port_waitrequest;
  wire             tse_mac_control_port_waitrequest_from_sa;
  wire             tse_mac_control_port_write;
  wire    [ 31: 0] tse_mac_control_port_writedata;
  wire    [ 31: 0] tse_mac_receive_data;
  wire    [  1: 0] tse_mac_receive_empty;
  wire             tse_mac_receive_endofpacket;
  wire    [  5: 0] tse_mac_receive_error;
  wire             tse_mac_receive_ready;
  wire             tse_mac_receive_startofpacket;
  wire             tse_mac_receive_valid;
  wire    [ 31: 0] tse_mac_transmit_data;
  wire    [  1: 0] tse_mac_transmit_empty;
  wire             tse_mac_transmit_endofpacket;
  wire             tse_mac_transmit_error;
  wire             tse_mac_transmit_ready;
  wire             tse_mac_transmit_ready_from_sa;
  wire             tse_mac_transmit_startofpacket;
  wire             tse_mac_transmit_valid;
  wire             tx_control_from_the_tse_mac;
  wire             write_n_to_the_ext_flash;
  altmemddr_s1_arbitrator the_altmemddr_s1
    (
      .altmemddr_bridge_m1_address_to_slave                            (altmemddr_bridge_m1_address_to_slave),
      .altmemddr_bridge_m1_byteenable                                  (altmemddr_bridge_m1_byteenable),
      .altmemddr_bridge_m1_granted_altmemddr_s1                        (altmemddr_bridge_m1_granted_altmemddr_s1),
      .altmemddr_bridge_m1_latency_counter                             (altmemddr_bridge_m1_latency_counter),
      .altmemddr_bridge_m1_qualified_request_altmemddr_s1              (altmemddr_bridge_m1_qualified_request_altmemddr_s1),
      .altmemddr_bridge_m1_read                                        (altmemddr_bridge_m1_read),
      .altmemddr_bridge_m1_read_data_valid_altmemddr_s1                (altmemddr_bridge_m1_read_data_valid_altmemddr_s1),
      .altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register (altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register),
      .altmemddr_bridge_m1_requests_altmemddr_s1                       (altmemddr_bridge_m1_requests_altmemddr_s1),
      .altmemddr_bridge_m1_write                                       (altmemddr_bridge_m1_write),
      .altmemddr_bridge_m1_writedata                                   (altmemddr_bridge_m1_writedata),
      .altmemddr_s1_address                                            (altmemddr_s1_address),
      .altmemddr_s1_beginbursttransfer                                 (altmemddr_s1_beginbursttransfer),
      .altmemddr_s1_burstcount                                         (altmemddr_s1_burstcount),
      .altmemddr_s1_byteenable                                         (altmemddr_s1_byteenable),
      .altmemddr_s1_read                                               (altmemddr_s1_read),
      .altmemddr_s1_readdata                                           (altmemddr_s1_readdata),
      .altmemddr_s1_readdata_from_sa                                   (altmemddr_s1_readdata_from_sa),
      .altmemddr_s1_readdatavalid                                      (altmemddr_s1_readdatavalid),
      .altmemddr_s1_resetrequest_n                                     (altmemddr_s1_resetrequest_n),
      .altmemddr_s1_resetrequest_n_from_sa                             (altmemddr_s1_resetrequest_n_from_sa),
      .altmemddr_s1_waitrequest_n                                      (altmemddr_s1_waitrequest_n),
      .altmemddr_s1_waitrequest_n_from_sa                              (altmemddr_s1_waitrequest_n_from_sa),
      .altmemddr_s1_write                                              (altmemddr_s1_write),
      .altmemddr_s1_writedata                                          (altmemddr_s1_writedata),
      .clk                                                             (altmemddr_phy_clk_out),
      .d1_altmemddr_s1_end_xfer                                        (d1_altmemddr_s1_end_xfer),
      .reset_n                                                         (altmemddr_phy_clk_out_reset_n)
    );

  //altmemddr_aux_full_rate_clk_out out_clk assignment, which is an e_assign
  assign altmemddr_aux_full_rate_clk_out = out_clk_altmemddr_aux_full_rate_clk;

  //altmemddr_aux_half_rate_clk_out out_clk assignment, which is an e_assign
  assign altmemddr_aux_half_rate_clk_out = out_clk_altmemddr_aux_half_rate_clk;

  //altmemddr_phy_clk_out out_clk assignment, which is an e_assign
  assign altmemddr_phy_clk_out = out_clk_altmemddr_phy_clk;

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c120_dev_niosII_standard_sopc_reset_osc_clk_1_domain_synch_module cycloneIII_3c120_dev_niosII_standard_sopc_reset_osc_clk_1_domain_synch
    (
      .clk      (osc_clk_1),
      .data_in  (1'b1),
      .data_out (osc_clk_1_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    ~altmemddr_s1_resetrequest_n_from_sa |
    ~altmemddr_s1_resetrequest_n_from_sa |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0 |
    sys_pll_s1_resetrequest_from_sa |
    sys_pll_s1_resetrequest_from_sa);

  altmemddr the_altmemddr
    (
      .aux_full_rate_clk (out_clk_altmemddr_aux_full_rate_clk),
      .aux_half_rate_clk (out_clk_altmemddr_aux_half_rate_clk),
      .global_reset_n    (global_reset_n_to_the_altmemddr),
      .local_address     (altmemddr_s1_address),
      .local_be          (altmemddr_s1_byteenable),
      .local_burstbegin  (altmemddr_s1_beginbursttransfer),
      .local_init_done   (local_init_done_from_the_altmemddr),
      .local_rdata       (altmemddr_s1_readdata),
      .local_rdata_valid (altmemddr_s1_readdatavalid),
      .local_read_req    (altmemddr_s1_read),
      .local_ready       (altmemddr_s1_waitrequest_n),
      .local_refresh_ack (local_refresh_ack_from_the_altmemddr),
      .local_size        (altmemddr_s1_burstcount),
      .local_wdata       (altmemddr_s1_writedata),
      .local_wdata_req   (local_wdata_req_from_the_altmemddr),
      .local_write_req   (altmemddr_s1_write),
      .mem_addr          (mem_addr_from_the_altmemddr),
      .mem_ba            (mem_ba_from_the_altmemddr),
      .mem_cas_n         (mem_cas_n_from_the_altmemddr),
      .mem_cke           (mem_cke_from_the_altmemddr),
      .mem_clk           (mem_clk_to_and_from_the_altmemddr),
      .mem_clk_n         (mem_clk_n_to_and_from_the_altmemddr),
      .mem_cs_n          (mem_cs_n_from_the_altmemddr),
      .mem_dm            (mem_dm_from_the_altmemddr),
      .mem_dq            (mem_dq_to_and_from_the_altmemddr),
      .mem_dqs           (mem_dqs_to_and_from_the_altmemddr),
      .mem_odt           (mem_odt_from_the_altmemddr),
      .mem_ras_n         (mem_ras_n_from_the_altmemddr),
      .mem_we_n          (mem_we_n_from_the_altmemddr),
      .phy_clk           (out_clk_altmemddr_phy_clk),
      .pll_ref_clk       (osc_clk_1),
      .reset_phy_clk_n   (reset_phy_clk_n_from_the_altmemddr),
      .reset_request_n   (altmemddr_s1_resetrequest_n),
      .soft_reset_n      (osc_clk_1_reset_n)
    );

  altmemddr_bridge_s1_arbitrator the_altmemddr_bridge_s1
    (
      .altmemddr_bridge_s1_address                                               (altmemddr_bridge_s1_address),
      .altmemddr_bridge_s1_byteenable                                            (altmemddr_bridge_s1_byteenable),
      .altmemddr_bridge_s1_endofpacket                                           (altmemddr_bridge_s1_endofpacket),
      .altmemddr_bridge_s1_endofpacket_from_sa                                   (altmemddr_bridge_s1_endofpacket_from_sa),
      .altmemddr_bridge_s1_nativeaddress                                         (altmemddr_bridge_s1_nativeaddress),
      .altmemddr_bridge_s1_read                                                  (altmemddr_bridge_s1_read),
      .altmemddr_bridge_s1_readdata                                              (altmemddr_bridge_s1_readdata),
      .altmemddr_bridge_s1_readdata_from_sa                                      (altmemddr_bridge_s1_readdata_from_sa),
      .altmemddr_bridge_s1_readdatavalid                                         (altmemddr_bridge_s1_readdatavalid),
      .altmemddr_bridge_s1_reset_n                                               (altmemddr_bridge_s1_reset_n),
      .altmemddr_bridge_s1_waitrequest                                           (altmemddr_bridge_s1_waitrequest),
      .altmemddr_bridge_s1_waitrequest_from_sa                                   (altmemddr_bridge_s1_waitrequest_from_sa),
      .altmemddr_bridge_s1_write                                                 (altmemddr_bridge_s1_write),
      .altmemddr_bridge_s1_writedata                                             (altmemddr_bridge_s1_writedata),
      .clk                                                                       (system_clk),
      .cpu_data_master_address_to_slave                                          (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                (cpu_data_master_byteenable),
      .cpu_data_master_granted_altmemddr_bridge_s1                               (cpu_data_master_granted_altmemddr_bridge_s1),
      .cpu_data_master_qualified_request_altmemddr_bridge_s1                     (cpu_data_master_qualified_request_altmemddr_bridge_s1),
      .cpu_data_master_read                                                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_altmemddr_bridge_s1                       (cpu_data_master_read_data_valid_altmemddr_bridge_s1),
      .cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register        (cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_data_master_requests_altmemddr_bridge_s1                              (cpu_data_master_requests_altmemddr_bridge_s1),
      .cpu_data_master_waitrequest                                               (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                     (cpu_data_master_write),
      .cpu_data_master_writedata                                                 (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                   (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_altmemddr_bridge_s1                        (cpu_instruction_master_granted_altmemddr_bridge_s1),
      .cpu_instruction_master_latency_counter                                    (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_altmemddr_bridge_s1              (cpu_instruction_master_qualified_request_altmemddr_bridge_s1),
      .cpu_instruction_master_read                                               (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1                (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_instruction_master_requests_altmemddr_bridge_s1                       (cpu_instruction_master_requests_altmemddr_bridge_s1),
      .d1_altmemddr_bridge_s1_end_xfer                                           (d1_altmemddr_bridge_s1_end_xfer),
      .reset_n                                                                   (system_clk_reset_n),
      .sgdma_rx_m_write_address_to_slave                                         (sgdma_rx_m_write_address_to_slave),
      .sgdma_rx_m_write_byteenable                                               (sgdma_rx_m_write_byteenable),
      .sgdma_rx_m_write_granted_altmemddr_bridge_s1                              (sgdma_rx_m_write_granted_altmemddr_bridge_s1),
      .sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1                    (sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1),
      .sgdma_rx_m_write_requests_altmemddr_bridge_s1                             (sgdma_rx_m_write_requests_altmemddr_bridge_s1),
      .sgdma_rx_m_write_write                                                    (sgdma_rx_m_write_write),
      .sgdma_rx_m_write_writedata                                                (sgdma_rx_m_write_writedata),
      .sgdma_tx_m_read_address_to_slave                                          (sgdma_tx_m_read_address_to_slave),
      .sgdma_tx_m_read_granted_altmemddr_bridge_s1                               (sgdma_tx_m_read_granted_altmemddr_bridge_s1),
      .sgdma_tx_m_read_latency_counter                                           (sgdma_tx_m_read_latency_counter),
      .sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1                     (sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1),
      .sgdma_tx_m_read_read                                                      (sgdma_tx_m_read_read),
      .sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1                       (sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1),
      .sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register        (sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register),
      .sgdma_tx_m_read_requests_altmemddr_bridge_s1                              (sgdma_tx_m_read_requests_altmemddr_bridge_s1)
    );

  altmemddr_bridge_m1_arbitrator the_altmemddr_bridge_m1
    (
      .altmemddr_bridge_m1_address                                     (altmemddr_bridge_m1_address),
      .altmemddr_bridge_m1_address_to_slave                            (altmemddr_bridge_m1_address_to_slave),
      .altmemddr_bridge_m1_byteenable                                  (altmemddr_bridge_m1_byteenable),
      .altmemddr_bridge_m1_granted_altmemddr_s1                        (altmemddr_bridge_m1_granted_altmemddr_s1),
      .altmemddr_bridge_m1_latency_counter                             (altmemddr_bridge_m1_latency_counter),
      .altmemddr_bridge_m1_qualified_request_altmemddr_s1              (altmemddr_bridge_m1_qualified_request_altmemddr_s1),
      .altmemddr_bridge_m1_read                                        (altmemddr_bridge_m1_read),
      .altmemddr_bridge_m1_read_data_valid_altmemddr_s1                (altmemddr_bridge_m1_read_data_valid_altmemddr_s1),
      .altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register (altmemddr_bridge_m1_read_data_valid_altmemddr_s1_shift_register),
      .altmemddr_bridge_m1_readdata                                    (altmemddr_bridge_m1_readdata),
      .altmemddr_bridge_m1_readdatavalid                               (altmemddr_bridge_m1_readdatavalid),
      .altmemddr_bridge_m1_requests_altmemddr_s1                       (altmemddr_bridge_m1_requests_altmemddr_s1),
      .altmemddr_bridge_m1_reset_n                                     (altmemddr_bridge_m1_reset_n),
      .altmemddr_bridge_m1_waitrequest                                 (altmemddr_bridge_m1_waitrequest),
      .altmemddr_bridge_m1_write                                       (altmemddr_bridge_m1_write),
      .altmemddr_bridge_m1_writedata                                   (altmemddr_bridge_m1_writedata),
      .altmemddr_s1_readdata_from_sa                                   (altmemddr_s1_readdata_from_sa),
      .altmemddr_s1_waitrequest_n_from_sa                              (altmemddr_s1_waitrequest_n_from_sa),
      .clk                                                             (altmemddr_phy_clk_out),
      .d1_altmemddr_s1_end_xfer                                        (d1_altmemddr_s1_end_xfer),
      .reset_n                                                         (altmemddr_phy_clk_out_reset_n)
    );

  altmemddr_bridge the_altmemddr_bridge
    (
      .master_address       (altmemddr_bridge_m1_address),
      .master_byteenable    (altmemddr_bridge_m1_byteenable),
      .master_clk           (altmemddr_phy_clk_out),
      .master_endofpacket   (altmemddr_bridge_m1_endofpacket),
      .master_nativeaddress (altmemddr_bridge_m1_nativeaddress),
      .master_read          (altmemddr_bridge_m1_read),
      .master_readdata      (altmemddr_bridge_m1_readdata),
      .master_readdatavalid (altmemddr_bridge_m1_readdatavalid),
      .master_reset_n       (altmemddr_bridge_m1_reset_n),
      .master_waitrequest   (altmemddr_bridge_m1_waitrequest),
      .master_write         (altmemddr_bridge_m1_write),
      .master_writedata     (altmemddr_bridge_m1_writedata),
      .slave_address        (altmemddr_bridge_s1_address),
      .slave_byteenable     (altmemddr_bridge_s1_byteenable),
      .slave_clk            (system_clk),
      .slave_endofpacket    (altmemddr_bridge_s1_endofpacket),
      .slave_nativeaddress  (altmemddr_bridge_s1_nativeaddress),
      .slave_read           (altmemddr_bridge_s1_read),
      .slave_readdata       (altmemddr_bridge_s1_readdata),
      .slave_readdatavalid  (altmemddr_bridge_s1_readdatavalid),
      .slave_reset_n        (altmemddr_bridge_s1_reset_n),
      .slave_waitrequest    (altmemddr_bridge_s1_waitrequest),
      .slave_write          (altmemddr_bridge_s1_write),
      .slave_writedata      (altmemddr_bridge_s1_writedata)
    );

  button_pio_s1_arbitrator the_button_pio_s1
    (
      .button_pio_s1_address                           (button_pio_s1_address),
      .button_pio_s1_chipselect                        (button_pio_s1_chipselect),
      .button_pio_s1_irq                               (button_pio_s1_irq),
      .button_pio_s1_irq_from_sa                       (button_pio_s1_irq_from_sa),
      .button_pio_s1_readdata                          (button_pio_s1_readdata),
      .button_pio_s1_readdata_from_sa                  (button_pio_s1_readdata_from_sa),
      .button_pio_s1_reset_n                           (button_pio_s1_reset_n),
      .button_pio_s1_write_n                           (button_pio_s1_write_n),
      .button_pio_s1_writedata                         (button_pio_s1_writedata),
      .clk                                             (system_clk),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_button_pio_s1           (cpu_data_master_granted_button_pio_s1),
      .cpu_data_master_qualified_request_button_pio_s1 (cpu_data_master_qualified_request_button_pio_s1),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_button_pio_s1   (cpu_data_master_read_data_valid_button_pio_s1),
      .cpu_data_master_requests_button_pio_s1          (cpu_data_master_requests_button_pio_s1),
      .cpu_data_master_waitrequest                     (cpu_data_master_waitrequest),
      .cpu_data_master_write                           (cpu_data_master_write),
      .cpu_data_master_writedata                       (cpu_data_master_writedata),
      .d1_button_pio_s1_end_xfer                       (d1_button_pio_s1_end_xfer),
      .reset_n                                         (system_clk_reset_n)
    );

  button_pio the_button_pio
    (
      .address    (button_pio_s1_address),
      .chipselect (button_pio_s1_chipselect),
      .clk        (system_clk),
      .in_port    (in_port_to_the_button_pio),
      .irq        (button_pio_s1_irq),
      .readdata   (button_pio_s1_readdata),
      .reset_n    (button_pio_s1_reset_n),
      .write_n    (button_pio_s1_write_n),
      .writedata  (button_pio_s1_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                                       (system_clk),
      .cpu_data_master_address_to_slave                                          (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                               (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                             (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                   (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                     (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                            (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                               (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                     (cpu_data_master_write),
      .cpu_data_master_writedata                                                 (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                   (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                      (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                                    (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module            (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                               (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module              (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                     (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                             (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                                       (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                                          (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                                          (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                                         (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                            (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                                    (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                             (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                                        (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                                (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                               (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                           (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                                         (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                                   (system_clk_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .altmemddr_bridge_s1_readdata_from_sa                                                   (altmemddr_bridge_s1_readdata_from_sa),
      .altmemddr_bridge_s1_waitrequest_from_sa                                                (altmemddr_bridge_s1_waitrequest_from_sa),
      .button_pio_s1_irq_from_sa                                                              (button_pio_s1_irq_from_sa),
      .button_pio_s1_readdata_from_sa                                                         (button_pio_s1_readdata_from_sa),
      .clk                                                                                    (system_clk),
      .cpu_data_master_address                                                                (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                                       (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable_ext_flash_s1                                                (cpu_data_master_byteenable_ext_flash_s1),
      .cpu_data_master_dbs_address                                                            (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                                           (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_altmemddr_bridge_s1                                            (cpu_data_master_granted_altmemddr_bridge_s1),
      .cpu_data_master_granted_button_pio_s1                                                  (cpu_data_master_granted_button_pio_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                                          (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in           (cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_granted_descriptor_memory_s1                                           (cpu_data_master_granted_descriptor_memory_s1),
      .cpu_data_master_granted_ext_flash_s1                                                   (cpu_data_master_granted_ext_flash_s1),
      .cpu_data_master_granted_high_res_timer_s1                                              (cpu_data_master_granted_high_res_timer_s1),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                                    (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_lcd_display_control_slave                                      (cpu_data_master_granted_lcd_display_control_slave),
      .cpu_data_master_granted_led_pio_s1                                                     (cpu_data_master_granted_led_pio_s1),
      .cpu_data_master_granted_onchip_ram_s1                                                  (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_granted_sgdma_rx_csr                                                   (cpu_data_master_granted_sgdma_rx_csr),
      .cpu_data_master_granted_sgdma_tx_csr                                                   (cpu_data_master_granted_sgdma_tx_csr),
      .cpu_data_master_granted_sys_clk_timer_s1                                               (cpu_data_master_granted_sys_clk_timer_s1),
      .cpu_data_master_granted_sysid_control_slave                                            (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_tse_mac_control_port                                           (cpu_data_master_granted_tse_mac_control_port),
      .cpu_data_master_irq                                                                    (cpu_data_master_irq),
      .cpu_data_master_no_byte_enables_and_last_term                                          (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_altmemddr_bridge_s1                                  (cpu_data_master_qualified_request_altmemddr_bridge_s1),
      .cpu_data_master_qualified_request_button_pio_s1                                        (cpu_data_master_qualified_request_button_pio_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                                (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in (cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_qualified_request_descriptor_memory_s1                                 (cpu_data_master_qualified_request_descriptor_memory_s1),
      .cpu_data_master_qualified_request_ext_flash_s1                                         (cpu_data_master_qualified_request_ext_flash_s1),
      .cpu_data_master_qualified_request_high_res_timer_s1                                    (cpu_data_master_qualified_request_high_res_timer_s1),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave                          (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_lcd_display_control_slave                            (cpu_data_master_qualified_request_lcd_display_control_slave),
      .cpu_data_master_qualified_request_led_pio_s1                                           (cpu_data_master_qualified_request_led_pio_s1),
      .cpu_data_master_qualified_request_onchip_ram_s1                                        (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_qualified_request_sgdma_rx_csr                                         (cpu_data_master_qualified_request_sgdma_rx_csr),
      .cpu_data_master_qualified_request_sgdma_tx_csr                                         (cpu_data_master_qualified_request_sgdma_tx_csr),
      .cpu_data_master_qualified_request_sys_clk_timer_s1                                     (cpu_data_master_qualified_request_sys_clk_timer_s1),
      .cpu_data_master_qualified_request_sysid_control_slave                                  (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_tse_mac_control_port                                 (cpu_data_master_qualified_request_tse_mac_control_port),
      .cpu_data_master_read                                                                   (cpu_data_master_read),
      .cpu_data_master_read_data_valid_altmemddr_bridge_s1                                    (cpu_data_master_read_data_valid_altmemddr_bridge_s1),
      .cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register                     (cpu_data_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_button_pio_s1                                          (cpu_data_master_read_data_valid_button_pio_s1),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                                  (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in   (cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_read_data_valid_descriptor_memory_s1                                   (cpu_data_master_read_data_valid_descriptor_memory_s1),
      .cpu_data_master_read_data_valid_ext_flash_s1                                           (cpu_data_master_read_data_valid_ext_flash_s1),
      .cpu_data_master_read_data_valid_high_res_timer_s1                                      (cpu_data_master_read_data_valid_high_res_timer_s1),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave                            (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_lcd_display_control_slave                              (cpu_data_master_read_data_valid_lcd_display_control_slave),
      .cpu_data_master_read_data_valid_led_pio_s1                                             (cpu_data_master_read_data_valid_led_pio_s1),
      .cpu_data_master_read_data_valid_onchip_ram_s1                                          (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_read_data_valid_sgdma_rx_csr                                           (cpu_data_master_read_data_valid_sgdma_rx_csr),
      .cpu_data_master_read_data_valid_sgdma_tx_csr                                           (cpu_data_master_read_data_valid_sgdma_tx_csr),
      .cpu_data_master_read_data_valid_sys_clk_timer_s1                                       (cpu_data_master_read_data_valid_sys_clk_timer_s1),
      .cpu_data_master_read_data_valid_sysid_control_slave                                    (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_tse_mac_control_port                                   (cpu_data_master_read_data_valid_tse_mac_control_port),
      .cpu_data_master_readdata                                                               (cpu_data_master_readdata),
      .cpu_data_master_requests_altmemddr_bridge_s1                                           (cpu_data_master_requests_altmemddr_bridge_s1),
      .cpu_data_master_requests_button_pio_s1                                                 (cpu_data_master_requests_button_pio_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                                         (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in          (cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_requests_descriptor_memory_s1                                          (cpu_data_master_requests_descriptor_memory_s1),
      .cpu_data_master_requests_ext_flash_s1                                                  (cpu_data_master_requests_ext_flash_s1),
      .cpu_data_master_requests_high_res_timer_s1                                             (cpu_data_master_requests_high_res_timer_s1),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                                   (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_lcd_display_control_slave                                     (cpu_data_master_requests_lcd_display_control_slave),
      .cpu_data_master_requests_led_pio_s1                                                    (cpu_data_master_requests_led_pio_s1),
      .cpu_data_master_requests_onchip_ram_s1                                                 (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_requests_sgdma_rx_csr                                                  (cpu_data_master_requests_sgdma_rx_csr),
      .cpu_data_master_requests_sgdma_tx_csr                                                  (cpu_data_master_requests_sgdma_tx_csr),
      .cpu_data_master_requests_sys_clk_timer_s1                                              (cpu_data_master_requests_sys_clk_timer_s1),
      .cpu_data_master_requests_sysid_control_slave                                           (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_tse_mac_control_port                                          (cpu_data_master_requests_tse_mac_control_port),
      .cpu_data_master_waitrequest                                                            (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                                  (cpu_data_master_write),
      .cpu_data_master_writedata                                                              (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                                 (cpu_jtag_debug_module_readdata_from_sa),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa                  (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa               (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa),
      .d1_altmemddr_bridge_s1_end_xfer                                                        (d1_altmemddr_bridge_s1_end_xfer),
      .d1_button_pio_s1_end_xfer                                                              (d1_button_pio_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                                      (d1_cpu_jtag_debug_module_end_xfer),
      .d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer                       (d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer),
      .d1_descriptor_memory_s1_end_xfer                                                       (d1_descriptor_memory_s1_end_xfer),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                                         (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .d1_high_res_timer_s1_end_xfer                                                          (d1_high_res_timer_s1_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                                (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_lcd_display_control_slave_end_xfer                                                  (d1_lcd_display_control_slave_end_xfer),
      .d1_led_pio_s1_end_xfer                                                                 (d1_led_pio_s1_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                                              (d1_onchip_ram_s1_end_xfer),
      .d1_sgdma_rx_csr_end_xfer                                                               (d1_sgdma_rx_csr_end_xfer),
      .d1_sgdma_tx_csr_end_xfer                                                               (d1_sgdma_tx_csr_end_xfer),
      .d1_sys_clk_timer_s1_end_xfer                                                           (d1_sys_clk_timer_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                        (d1_sysid_control_slave_end_xfer),
      .d1_tse_mac_control_port_end_xfer                                                       (d1_tse_mac_control_port_end_xfer),
      .descriptor_memory_s1_readdata_from_sa                                                  (descriptor_memory_s1_readdata_from_sa),
      .ext_flash_s1_wait_counter_eq_0                                                         (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                                         (ext_flash_s1_wait_counter_eq_1),
      .high_res_timer_s1_irq_from_sa                                                          (high_res_timer_s1_irq_from_sa),
      .high_res_timer_s1_readdata_from_sa                                                     (high_res_timer_s1_readdata_from_sa),
      .incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0                         (incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                                (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                                           (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                                        (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .lcd_display_control_slave_readdata_from_sa                                             (lcd_display_control_slave_readdata_from_sa),
      .lcd_display_control_slave_wait_counter_eq_0                                            (lcd_display_control_slave_wait_counter_eq_0),
      .lcd_display_control_slave_wait_counter_eq_1                                            (lcd_display_control_slave_wait_counter_eq_1),
      .led_pio_s1_readdata_from_sa                                                            (led_pio_s1_readdata_from_sa),
      .onchip_ram_s1_readdata_from_sa                                                         (onchip_ram_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_descriptor_memory_s1                        (registered_cpu_data_master_read_data_valid_descriptor_memory_s1),
      .registered_cpu_data_master_read_data_valid_ext_flash_s1                                (registered_cpu_data_master_read_data_valid_ext_flash_s1),
      .registered_cpu_data_master_read_data_valid_onchip_ram_s1                               (registered_cpu_data_master_read_data_valid_onchip_ram_s1),
      .reset_n                                                                                (system_clk_reset_n),
      .sgdma_rx_csr_irq_from_sa                                                               (sgdma_rx_csr_irq_from_sa),
      .sgdma_rx_csr_readdata_from_sa                                                          (sgdma_rx_csr_readdata_from_sa),
      .sgdma_tx_csr_irq_from_sa                                                               (sgdma_tx_csr_irq_from_sa),
      .sgdma_tx_csr_readdata_from_sa                                                          (sgdma_tx_csr_readdata_from_sa),
      .sys_clk_timer_s1_irq_from_sa                                                           (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata_from_sa                                                      (sys_clk_timer_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                                   (sysid_control_slave_readdata_from_sa),
      .tse_mac_control_port_readdata_from_sa                                                  (tse_mac_control_port_readdata_from_sa),
      .tse_mac_control_port_waitrequest_from_sa                                               (tse_mac_control_port_waitrequest_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .altmemddr_bridge_s1_readdata_from_sa                                      (altmemddr_bridge_s1_readdata_from_sa),
      .altmemddr_bridge_s1_waitrequest_from_sa                                   (altmemddr_bridge_s1_waitrequest_from_sa),
      .clk                                                                       (system_clk),
      .cpu_instruction_master_address                                            (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                                   (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                        (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_altmemddr_bridge_s1                        (cpu_instruction_master_granted_altmemddr_bridge_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                      (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_ext_flash_s1                               (cpu_instruction_master_granted_ext_flash_s1),
      .cpu_instruction_master_granted_onchip_ram_s1                              (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_latency_counter                                    (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_altmemddr_bridge_s1              (cpu_instruction_master_qualified_request_altmemddr_bridge_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module            (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_ext_flash_s1                     (cpu_instruction_master_qualified_request_ext_flash_s1),
      .cpu_instruction_master_qualified_request_onchip_ram_s1                    (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_read                                               (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1                (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module              (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_ext_flash_s1                       (cpu_instruction_master_read_data_valid_ext_flash_s1),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1                      (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_readdata                                           (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                                      (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_altmemddr_bridge_s1                       (cpu_instruction_master_requests_altmemddr_bridge_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                     (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_ext_flash_s1                              (cpu_instruction_master_requests_ext_flash_s1),
      .cpu_instruction_master_requests_onchip_ram_s1                             (cpu_instruction_master_requests_onchip_ram_s1),
      .cpu_instruction_master_waitrequest                                        (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                                    (cpu_jtag_debug_module_readdata_from_sa),
      .d1_altmemddr_bridge_s1_end_xfer                                           (d1_altmemddr_bridge_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                         (d1_cpu_jtag_debug_module_end_xfer),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                            (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                                 (d1_onchip_ram_s1_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                            (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                            (ext_flash_s1_wait_counter_eq_1),
      .incoming_data_to_and_from_the_ext_flash                                   (incoming_data_to_and_from_the_ext_flash),
      .onchip_ram_s1_readdata_from_sa                                            (onchip_ram_s1_readdata_from_sa),
      .reset_n                                                                   (system_clk_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (system_clk),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_arbitrator the_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in
    (
      .clk                                                                                    (system_clk),
      .cpu_data_master_address_to_slave                                                       (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                             (cpu_data_master_byteenable),
      .cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in           (cpu_data_master_granted_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in (cpu_data_master_qualified_request_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_read                                                                   (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in   (cpu_data_master_read_data_valid_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in          (cpu_data_master_requests_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in),
      .cpu_data_master_waitrequest                                                            (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                                  (cpu_data_master_write),
      .cpu_data_master_writedata                                                              (cpu_data_master_writedata),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address                           (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable                        (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket                       (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa               (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress                     (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read                              (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata                          (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa                  (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata_from_sa),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n                           (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest                       (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa               (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest_from_sa),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write                             (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata                         (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata),
      .d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer                       (d1_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_end_xfer),
      .reset_n                                                                                (system_clk_reset_n)
    );

  cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_arbitrator the_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out
    (
      .clk                                                                                (osc_clk),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address                      (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave             (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable                   (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1           (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1 (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read                         (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1   (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata                     (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1          (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n                      (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest                  (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write                        (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata                    (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata),
      .d1_sys_pll_s1_end_xfer                                                             (d1_sys_pll_s1_end_xfer),
      .reset_n                                                                            (osc_clk_reset_n),
      .sys_pll_s1_readdata_from_sa                                                        (sys_pll_s1_readdata_from_sa)
    );

  cycloneIII_3c120_dev_niosII_standard_sopc_clock_0 the_cycloneIII_3c120_dev_niosII_standard_sopc_clock_0
    (
      .master_address       (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address),
      .master_byteenable    (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_byteenable),
      .master_clk           (osc_clk),
      .master_endofpacket   (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_endofpacket),
      .master_nativeaddress (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress),
      .master_read          (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read),
      .master_readdata      (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_readdata),
      .master_reset_n       (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_reset_n),
      .master_waitrequest   (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_waitrequest),
      .master_write         (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write),
      .master_writedata     (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata),
      .slave_address        (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_address),
      .slave_byteenable     (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_byteenable),
      .slave_clk            (system_clk),
      .slave_endofpacket    (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket),
      .slave_nativeaddress  (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_nativeaddress),
      .slave_read           (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_read),
      .slave_readdata       (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_readdata),
      .slave_reset_n        (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_reset_n),
      .slave_waitrequest    (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_waitrequest),
      .slave_write          (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_write),
      .slave_writedata      (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_writedata)
    );

  descriptor_memory_s1_arbitrator the_descriptor_memory_s1
    (
      .clk                                                              (system_clk),
      .cpu_data_master_address_to_slave                                 (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                       (cpu_data_master_byteenable),
      .cpu_data_master_granted_descriptor_memory_s1                     (cpu_data_master_granted_descriptor_memory_s1),
      .cpu_data_master_qualified_request_descriptor_memory_s1           (cpu_data_master_qualified_request_descriptor_memory_s1),
      .cpu_data_master_read                                             (cpu_data_master_read),
      .cpu_data_master_read_data_valid_descriptor_memory_s1             (cpu_data_master_read_data_valid_descriptor_memory_s1),
      .cpu_data_master_requests_descriptor_memory_s1                    (cpu_data_master_requests_descriptor_memory_s1),
      .cpu_data_master_waitrequest                                      (cpu_data_master_waitrequest),
      .cpu_data_master_write                                            (cpu_data_master_write),
      .cpu_data_master_writedata                                        (cpu_data_master_writedata),
      .d1_descriptor_memory_s1_end_xfer                                 (d1_descriptor_memory_s1_end_xfer),
      .descriptor_memory_s1_address                                     (descriptor_memory_s1_address),
      .descriptor_memory_s1_byteenable                                  (descriptor_memory_s1_byteenable),
      .descriptor_memory_s1_chipselect                                  (descriptor_memory_s1_chipselect),
      .descriptor_memory_s1_clken                                       (descriptor_memory_s1_clken),
      .descriptor_memory_s1_readdata                                    (descriptor_memory_s1_readdata),
      .descriptor_memory_s1_readdata_from_sa                            (descriptor_memory_s1_readdata_from_sa),
      .descriptor_memory_s1_reset                                       (descriptor_memory_s1_reset),
      .descriptor_memory_s1_write                                       (descriptor_memory_s1_write),
      .descriptor_memory_s1_writedata                                   (descriptor_memory_s1_writedata),
      .registered_cpu_data_master_read_data_valid_descriptor_memory_s1  (registered_cpu_data_master_read_data_valid_descriptor_memory_s1),
      .reset_n                                                          (system_clk_reset_n),
      .sgdma_rx_descriptor_read_address_to_slave                        (sgdma_rx_descriptor_read_address_to_slave),
      .sgdma_rx_descriptor_read_granted_descriptor_memory_s1            (sgdma_rx_descriptor_read_granted_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_latency_counter                         (sgdma_rx_descriptor_read_latency_counter),
      .sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1  (sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_read                                    (sgdma_rx_descriptor_read_read),
      .sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1    (sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_requests_descriptor_memory_s1           (sgdma_rx_descriptor_read_requests_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_address_to_slave                       (sgdma_rx_descriptor_write_address_to_slave),
      .sgdma_rx_descriptor_write_granted_descriptor_memory_s1           (sgdma_rx_descriptor_write_granted_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 (sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_requests_descriptor_memory_s1          (sgdma_rx_descriptor_write_requests_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_write                                  (sgdma_rx_descriptor_write_write),
      .sgdma_rx_descriptor_write_writedata                              (sgdma_rx_descriptor_write_writedata),
      .sgdma_tx_descriptor_read_address_to_slave                        (sgdma_tx_descriptor_read_address_to_slave),
      .sgdma_tx_descriptor_read_granted_descriptor_memory_s1            (sgdma_tx_descriptor_read_granted_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_latency_counter                         (sgdma_tx_descriptor_read_latency_counter),
      .sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1  (sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_read                                    (sgdma_tx_descriptor_read_read),
      .sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1    (sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_requests_descriptor_memory_s1           (sgdma_tx_descriptor_read_requests_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_address_to_slave                       (sgdma_tx_descriptor_write_address_to_slave),
      .sgdma_tx_descriptor_write_granted_descriptor_memory_s1           (sgdma_tx_descriptor_write_granted_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 (sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_requests_descriptor_memory_s1          (sgdma_tx_descriptor_write_requests_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_write                                  (sgdma_tx_descriptor_write_write),
      .sgdma_tx_descriptor_write_writedata                              (sgdma_tx_descriptor_write_writedata)
    );

  descriptor_memory the_descriptor_memory
    (
      .address    (descriptor_memory_s1_address),
      .byteenable (descriptor_memory_s1_byteenable),
      .chipselect (descriptor_memory_s1_chipselect),
      .clk        (system_clk),
      .clken      (descriptor_memory_s1_clken),
      .readdata   (descriptor_memory_s1_readdata),
      .reset      (descriptor_memory_s1_reset),
      .write      (descriptor_memory_s1_write),
      .writedata  (descriptor_memory_s1_writedata)
    );

  flash_tristate_bridge_avalon_slave_arbitrator the_flash_tristate_bridge_avalon_slave
    (
      .address_to_the_ext_flash                                                  (address_to_the_ext_flash),
      .clk                                                                       (system_clk),
      .cpu_data_master_address_to_slave                                          (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_ext_flash_s1                                   (cpu_data_master_byteenable_ext_flash_s1),
      .cpu_data_master_dbs_address                                               (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                              (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_ext_flash_s1                                      (cpu_data_master_granted_ext_flash_s1),
      .cpu_data_master_no_byte_enables_and_last_term                             (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_ext_flash_s1                            (cpu_data_master_qualified_request_ext_flash_s1),
      .cpu_data_master_read                                                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ext_flash_s1                              (cpu_data_master_read_data_valid_ext_flash_s1),
      .cpu_data_master_requests_ext_flash_s1                                     (cpu_data_master_requests_ext_flash_s1),
      .cpu_data_master_write                                                     (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                                   (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                        (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_ext_flash_s1                               (cpu_instruction_master_granted_ext_flash_s1),
      .cpu_instruction_master_latency_counter                                    (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_ext_flash_s1                     (cpu_instruction_master_qualified_request_ext_flash_s1),
      .cpu_instruction_master_read                                               (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_ext_flash_s1                       (cpu_instruction_master_read_data_valid_ext_flash_s1),
      .cpu_instruction_master_requests_ext_flash_s1                              (cpu_instruction_master_requests_ext_flash_s1),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                            (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_ext_flash                                            (data_to_and_from_the_ext_flash),
      .ext_flash_s1_wait_counter_eq_0                                            (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                            (ext_flash_s1_wait_counter_eq_1),
      .incoming_data_to_and_from_the_ext_flash                                   (incoming_data_to_and_from_the_ext_flash),
      .incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0            (incoming_data_to_and_from_the_ext_flash_with_Xs_converted_to_0),
      .read_n_to_the_ext_flash                                                   (read_n_to_the_ext_flash),
      .registered_cpu_data_master_read_data_valid_ext_flash_s1                   (registered_cpu_data_master_read_data_valid_ext_flash_s1),
      .reset_n                                                                   (system_clk_reset_n),
      .select_n_to_the_ext_flash                                                 (select_n_to_the_ext_flash),
      .write_n_to_the_ext_flash                                                  (write_n_to_the_ext_flash)
    );

  high_res_timer_s1_arbitrator the_high_res_timer_s1
    (
      .clk                                                 (system_clk),
      .cpu_data_master_address_to_slave                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_high_res_timer_s1           (cpu_data_master_granted_high_res_timer_s1),
      .cpu_data_master_qualified_request_high_res_timer_s1 (cpu_data_master_qualified_request_high_res_timer_s1),
      .cpu_data_master_read                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_high_res_timer_s1   (cpu_data_master_read_data_valid_high_res_timer_s1),
      .cpu_data_master_requests_high_res_timer_s1          (cpu_data_master_requests_high_res_timer_s1),
      .cpu_data_master_waitrequest                         (cpu_data_master_waitrequest),
      .cpu_data_master_write                               (cpu_data_master_write),
      .cpu_data_master_writedata                           (cpu_data_master_writedata),
      .d1_high_res_timer_s1_end_xfer                       (d1_high_res_timer_s1_end_xfer),
      .high_res_timer_s1_address                           (high_res_timer_s1_address),
      .high_res_timer_s1_chipselect                        (high_res_timer_s1_chipselect),
      .high_res_timer_s1_irq                               (high_res_timer_s1_irq),
      .high_res_timer_s1_irq_from_sa                       (high_res_timer_s1_irq_from_sa),
      .high_res_timer_s1_readdata                          (high_res_timer_s1_readdata),
      .high_res_timer_s1_readdata_from_sa                  (high_res_timer_s1_readdata_from_sa),
      .high_res_timer_s1_reset_n                           (high_res_timer_s1_reset_n),
      .high_res_timer_s1_write_n                           (high_res_timer_s1_write_n),
      .high_res_timer_s1_writedata                         (high_res_timer_s1_writedata),
      .reset_n                                             (system_clk_reset_n)
    );

  high_res_timer the_high_res_timer
    (
      .address    (high_res_timer_s1_address),
      .chipselect (high_res_timer_s1_chipselect),
      .clk        (system_clk),
      .irq        (high_res_timer_s1_irq),
      .readdata   (high_res_timer_s1_readdata),
      .reset_n    (high_res_timer_s1_reset_n),
      .write_n    (high_res_timer_s1_write_n),
      .writedata  (high_res_timer_s1_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (system_clk),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (system_clk_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (system_clk),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  lcd_display_control_slave_arbitrator the_lcd_display_control_slave
    (
      .clk                                                         (system_clk),
      .cpu_data_master_address_to_slave                            (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                  (cpu_data_master_byteenable),
      .cpu_data_master_granted_lcd_display_control_slave           (cpu_data_master_granted_lcd_display_control_slave),
      .cpu_data_master_qualified_request_lcd_display_control_slave (cpu_data_master_qualified_request_lcd_display_control_slave),
      .cpu_data_master_read                                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_lcd_display_control_slave   (cpu_data_master_read_data_valid_lcd_display_control_slave),
      .cpu_data_master_requests_lcd_display_control_slave          (cpu_data_master_requests_lcd_display_control_slave),
      .cpu_data_master_write                                       (cpu_data_master_write),
      .cpu_data_master_writedata                                   (cpu_data_master_writedata),
      .d1_lcd_display_control_slave_end_xfer                       (d1_lcd_display_control_slave_end_xfer),
      .lcd_display_control_slave_address                           (lcd_display_control_slave_address),
      .lcd_display_control_slave_begintransfer                     (lcd_display_control_slave_begintransfer),
      .lcd_display_control_slave_read                              (lcd_display_control_slave_read),
      .lcd_display_control_slave_readdata                          (lcd_display_control_slave_readdata),
      .lcd_display_control_slave_readdata_from_sa                  (lcd_display_control_slave_readdata_from_sa),
      .lcd_display_control_slave_reset_n                           (lcd_display_control_slave_reset_n),
      .lcd_display_control_slave_wait_counter_eq_0                 (lcd_display_control_slave_wait_counter_eq_0),
      .lcd_display_control_slave_wait_counter_eq_1                 (lcd_display_control_slave_wait_counter_eq_1),
      .lcd_display_control_slave_write                             (lcd_display_control_slave_write),
      .lcd_display_control_slave_writedata                         (lcd_display_control_slave_writedata),
      .reset_n                                                     (system_clk_reset_n)
    );

  lcd_display the_lcd_display
    (
      .LCD_E         (LCD_E_from_the_lcd_display),
      .LCD_RS        (LCD_RS_from_the_lcd_display),
      .LCD_RW        (LCD_RW_from_the_lcd_display),
      .LCD_data      (LCD_data_to_and_from_the_lcd_display),
      .address       (lcd_display_control_slave_address),
      .begintransfer (lcd_display_control_slave_begintransfer),
      .clk           (system_clk),
      .read          (lcd_display_control_slave_read),
      .readdata      (lcd_display_control_slave_readdata),
      .reset_n       (lcd_display_control_slave_reset_n),
      .write         (lcd_display_control_slave_write),
      .writedata     (lcd_display_control_slave_writedata)
    );

  led_pio_s1_arbitrator the_led_pio_s1
    (
      .clk                                          (system_clk),
      .cpu_data_master_address_to_slave             (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_led_pio_s1           (cpu_data_master_granted_led_pio_s1),
      .cpu_data_master_qualified_request_led_pio_s1 (cpu_data_master_qualified_request_led_pio_s1),
      .cpu_data_master_read                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_led_pio_s1   (cpu_data_master_read_data_valid_led_pio_s1),
      .cpu_data_master_requests_led_pio_s1          (cpu_data_master_requests_led_pio_s1),
      .cpu_data_master_waitrequest                  (cpu_data_master_waitrequest),
      .cpu_data_master_write                        (cpu_data_master_write),
      .cpu_data_master_writedata                    (cpu_data_master_writedata),
      .d1_led_pio_s1_end_xfer                       (d1_led_pio_s1_end_xfer),
      .led_pio_s1_address                           (led_pio_s1_address),
      .led_pio_s1_chipselect                        (led_pio_s1_chipselect),
      .led_pio_s1_readdata                          (led_pio_s1_readdata),
      .led_pio_s1_readdata_from_sa                  (led_pio_s1_readdata_from_sa),
      .led_pio_s1_reset_n                           (led_pio_s1_reset_n),
      .led_pio_s1_write_n                           (led_pio_s1_write_n),
      .led_pio_s1_writedata                         (led_pio_s1_writedata),
      .reset_n                                      (system_clk_reset_n)
    );

  led_pio the_led_pio
    (
      .address    (led_pio_s1_address),
      .chipselect (led_pio_s1_chipselect),
      .clk        (system_clk),
      .out_port   (out_port_from_the_led_pio),
      .readdata   (led_pio_s1_readdata),
      .reset_n    (led_pio_s1_reset_n),
      .write_n    (led_pio_s1_write_n),
      .writedata  (led_pio_s1_writedata)
    );

  onchip_ram_s1_arbitrator the_onchip_ram_s1
    (
      .clk                                                                       (system_clk),
      .cpu_data_master_address_to_slave                                          (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_ram_s1                                     (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_qualified_request_onchip_ram_s1                           (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_read                                                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_ram_s1                             (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_requests_onchip_ram_s1                                    (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_waitrequest                                               (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                     (cpu_data_master_write),
      .cpu_data_master_writedata                                                 (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                   (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_ram_s1                              (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_latency_counter                                    (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_ram_s1                    (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_read                                               (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register (cpu_instruction_master_read_data_valid_altmemddr_bridge_s1_shift_register),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1                      (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_requests_onchip_ram_s1                             (cpu_instruction_master_requests_onchip_ram_s1),
      .d1_onchip_ram_s1_end_xfer                                                 (d1_onchip_ram_s1_end_xfer),
      .onchip_ram_s1_address                                                     (onchip_ram_s1_address),
      .onchip_ram_s1_byteenable                                                  (onchip_ram_s1_byteenable),
      .onchip_ram_s1_chipselect                                                  (onchip_ram_s1_chipselect),
      .onchip_ram_s1_clken                                                       (onchip_ram_s1_clken),
      .onchip_ram_s1_readdata                                                    (onchip_ram_s1_readdata),
      .onchip_ram_s1_readdata_from_sa                                            (onchip_ram_s1_readdata_from_sa),
      .onchip_ram_s1_reset                                                       (onchip_ram_s1_reset),
      .onchip_ram_s1_write                                                       (onchip_ram_s1_write),
      .onchip_ram_s1_writedata                                                   (onchip_ram_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_ram_s1                  (registered_cpu_data_master_read_data_valid_onchip_ram_s1),
      .reset_n                                                                   (system_clk_reset_n)
    );

  onchip_ram the_onchip_ram
    (
      .address    (onchip_ram_s1_address),
      .byteenable (onchip_ram_s1_byteenable),
      .chipselect (onchip_ram_s1_chipselect),
      .clk        (system_clk),
      .clken      (onchip_ram_s1_clken),
      .readdata   (onchip_ram_s1_readdata),
      .reset      (onchip_ram_s1_reset),
      .write      (onchip_ram_s1_write),
      .writedata  (onchip_ram_s1_writedata)
    );

  sgdma_rx_csr_arbitrator the_sgdma_rx_csr
    (
      .clk                                            (system_clk),
      .cpu_data_master_address_to_slave               (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sgdma_rx_csr           (cpu_data_master_granted_sgdma_rx_csr),
      .cpu_data_master_qualified_request_sgdma_rx_csr (cpu_data_master_qualified_request_sgdma_rx_csr),
      .cpu_data_master_read                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sgdma_rx_csr   (cpu_data_master_read_data_valid_sgdma_rx_csr),
      .cpu_data_master_requests_sgdma_rx_csr          (cpu_data_master_requests_sgdma_rx_csr),
      .cpu_data_master_waitrequest                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                          (cpu_data_master_write),
      .cpu_data_master_writedata                      (cpu_data_master_writedata),
      .d1_sgdma_rx_csr_end_xfer                       (d1_sgdma_rx_csr_end_xfer),
      .reset_n                                        (system_clk_reset_n),
      .sgdma_rx_csr_address                           (sgdma_rx_csr_address),
      .sgdma_rx_csr_chipselect                        (sgdma_rx_csr_chipselect),
      .sgdma_rx_csr_irq                               (sgdma_rx_csr_irq),
      .sgdma_rx_csr_irq_from_sa                       (sgdma_rx_csr_irq_from_sa),
      .sgdma_rx_csr_read                              (sgdma_rx_csr_read),
      .sgdma_rx_csr_readdata                          (sgdma_rx_csr_readdata),
      .sgdma_rx_csr_readdata_from_sa                  (sgdma_rx_csr_readdata_from_sa),
      .sgdma_rx_csr_reset_n                           (sgdma_rx_csr_reset_n),
      .sgdma_rx_csr_write                             (sgdma_rx_csr_write),
      .sgdma_rx_csr_writedata                         (sgdma_rx_csr_writedata)
    );

  sgdma_rx_in_arbitrator the_sgdma_rx_in
    (
      .clk                           (system_clk),
      .reset_n                       (system_clk_reset_n),
      .sgdma_rx_in_data              (sgdma_rx_in_data),
      .sgdma_rx_in_empty             (sgdma_rx_in_empty),
      .sgdma_rx_in_endofpacket       (sgdma_rx_in_endofpacket),
      .sgdma_rx_in_error             (sgdma_rx_in_error),
      .sgdma_rx_in_ready             (sgdma_rx_in_ready),
      .sgdma_rx_in_ready_from_sa     (sgdma_rx_in_ready_from_sa),
      .sgdma_rx_in_startofpacket     (sgdma_rx_in_startofpacket),
      .sgdma_rx_in_valid             (sgdma_rx_in_valid),
      .tse_mac_receive_data          (tse_mac_receive_data),
      .tse_mac_receive_empty         (tse_mac_receive_empty),
      .tse_mac_receive_endofpacket   (tse_mac_receive_endofpacket),
      .tse_mac_receive_error         (tse_mac_receive_error),
      .tse_mac_receive_startofpacket (tse_mac_receive_startofpacket),
      .tse_mac_receive_valid         (tse_mac_receive_valid)
    );

  sgdma_rx_descriptor_read_arbitrator the_sgdma_rx_descriptor_read
    (
      .clk                                                             (system_clk),
      .d1_descriptor_memory_s1_end_xfer                                (d1_descriptor_memory_s1_end_xfer),
      .descriptor_memory_s1_readdata_from_sa                           (descriptor_memory_s1_readdata_from_sa),
      .reset_n                                                         (system_clk_reset_n),
      .sgdma_rx_descriptor_read_address                                (sgdma_rx_descriptor_read_address),
      .sgdma_rx_descriptor_read_address_to_slave                       (sgdma_rx_descriptor_read_address_to_slave),
      .sgdma_rx_descriptor_read_granted_descriptor_memory_s1           (sgdma_rx_descriptor_read_granted_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_latency_counter                        (sgdma_rx_descriptor_read_latency_counter),
      .sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 (sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_read                                   (sgdma_rx_descriptor_read_read),
      .sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1   (sgdma_rx_descriptor_read_read_data_valid_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_readdata                               (sgdma_rx_descriptor_read_readdata),
      .sgdma_rx_descriptor_read_readdatavalid                          (sgdma_rx_descriptor_read_readdatavalid),
      .sgdma_rx_descriptor_read_requests_descriptor_memory_s1          (sgdma_rx_descriptor_read_requests_descriptor_memory_s1),
      .sgdma_rx_descriptor_read_waitrequest                            (sgdma_rx_descriptor_read_waitrequest)
    );

  sgdma_rx_descriptor_write_arbitrator the_sgdma_rx_descriptor_write
    (
      .clk                                                              (system_clk),
      .d1_descriptor_memory_s1_end_xfer                                 (d1_descriptor_memory_s1_end_xfer),
      .reset_n                                                          (system_clk_reset_n),
      .sgdma_rx_descriptor_write_address                                (sgdma_rx_descriptor_write_address),
      .sgdma_rx_descriptor_write_address_to_slave                       (sgdma_rx_descriptor_write_address_to_slave),
      .sgdma_rx_descriptor_write_granted_descriptor_memory_s1           (sgdma_rx_descriptor_write_granted_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 (sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_requests_descriptor_memory_s1          (sgdma_rx_descriptor_write_requests_descriptor_memory_s1),
      .sgdma_rx_descriptor_write_waitrequest                            (sgdma_rx_descriptor_write_waitrequest),
      .sgdma_rx_descriptor_write_write                                  (sgdma_rx_descriptor_write_write),
      .sgdma_rx_descriptor_write_writedata                              (sgdma_rx_descriptor_write_writedata)
    );

  sgdma_rx_m_write_arbitrator the_sgdma_rx_m_write
    (
      .altmemddr_bridge_s1_waitrequest_from_sa                (altmemddr_bridge_s1_waitrequest_from_sa),
      .clk                                                    (system_clk),
      .d1_altmemddr_bridge_s1_end_xfer                        (d1_altmemddr_bridge_s1_end_xfer),
      .reset_n                                                (system_clk_reset_n),
      .sgdma_rx_m_write_address                               (sgdma_rx_m_write_address),
      .sgdma_rx_m_write_address_to_slave                      (sgdma_rx_m_write_address_to_slave),
      .sgdma_rx_m_write_byteenable                            (sgdma_rx_m_write_byteenable),
      .sgdma_rx_m_write_granted_altmemddr_bridge_s1           (sgdma_rx_m_write_granted_altmemddr_bridge_s1),
      .sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1 (sgdma_rx_m_write_qualified_request_altmemddr_bridge_s1),
      .sgdma_rx_m_write_requests_altmemddr_bridge_s1          (sgdma_rx_m_write_requests_altmemddr_bridge_s1),
      .sgdma_rx_m_write_waitrequest                           (sgdma_rx_m_write_waitrequest),
      .sgdma_rx_m_write_write                                 (sgdma_rx_m_write_write),
      .sgdma_rx_m_write_writedata                             (sgdma_rx_m_write_writedata)
    );

  sgdma_rx the_sgdma_rx
    (
      .clk                           (system_clk),
      .csr_address                   (sgdma_rx_csr_address),
      .csr_chipselect                (sgdma_rx_csr_chipselect),
      .csr_irq                       (sgdma_rx_csr_irq),
      .csr_read                      (sgdma_rx_csr_read),
      .csr_readdata                  (sgdma_rx_csr_readdata),
      .csr_write                     (sgdma_rx_csr_write),
      .csr_writedata                 (sgdma_rx_csr_writedata),
      .descriptor_read_address       (sgdma_rx_descriptor_read_address),
      .descriptor_read_read          (sgdma_rx_descriptor_read_read),
      .descriptor_read_readdata      (sgdma_rx_descriptor_read_readdata),
      .descriptor_read_readdatavalid (sgdma_rx_descriptor_read_readdatavalid),
      .descriptor_read_waitrequest   (sgdma_rx_descriptor_read_waitrequest),
      .descriptor_write_address      (sgdma_rx_descriptor_write_address),
      .descriptor_write_waitrequest  (sgdma_rx_descriptor_write_waitrequest),
      .descriptor_write_write        (sgdma_rx_descriptor_write_write),
      .descriptor_write_writedata    (sgdma_rx_descriptor_write_writedata),
      .in_data                       (sgdma_rx_in_data),
      .in_empty                      (sgdma_rx_in_empty),
      .in_endofpacket                (sgdma_rx_in_endofpacket),
      .in_error                      (sgdma_rx_in_error),
      .in_ready                      (sgdma_rx_in_ready),
      .in_startofpacket              (sgdma_rx_in_startofpacket),
      .in_valid                      (sgdma_rx_in_valid),
      .m_write_address               (sgdma_rx_m_write_address),
      .m_write_byteenable            (sgdma_rx_m_write_byteenable),
      .m_write_waitrequest           (sgdma_rx_m_write_waitrequest),
      .m_write_write                 (sgdma_rx_m_write_write),
      .m_write_writedata             (sgdma_rx_m_write_writedata),
      .system_reset_n                (sgdma_rx_csr_reset_n)
    );

  sgdma_tx_csr_arbitrator the_sgdma_tx_csr
    (
      .clk                                            (system_clk),
      .cpu_data_master_address_to_slave               (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sgdma_tx_csr           (cpu_data_master_granted_sgdma_tx_csr),
      .cpu_data_master_qualified_request_sgdma_tx_csr (cpu_data_master_qualified_request_sgdma_tx_csr),
      .cpu_data_master_read                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sgdma_tx_csr   (cpu_data_master_read_data_valid_sgdma_tx_csr),
      .cpu_data_master_requests_sgdma_tx_csr          (cpu_data_master_requests_sgdma_tx_csr),
      .cpu_data_master_waitrequest                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                          (cpu_data_master_write),
      .cpu_data_master_writedata                      (cpu_data_master_writedata),
      .d1_sgdma_tx_csr_end_xfer                       (d1_sgdma_tx_csr_end_xfer),
      .reset_n                                        (system_clk_reset_n),
      .sgdma_tx_csr_address                           (sgdma_tx_csr_address),
      .sgdma_tx_csr_chipselect                        (sgdma_tx_csr_chipselect),
      .sgdma_tx_csr_irq                               (sgdma_tx_csr_irq),
      .sgdma_tx_csr_irq_from_sa                       (sgdma_tx_csr_irq_from_sa),
      .sgdma_tx_csr_read                              (sgdma_tx_csr_read),
      .sgdma_tx_csr_readdata                          (sgdma_tx_csr_readdata),
      .sgdma_tx_csr_readdata_from_sa                  (sgdma_tx_csr_readdata_from_sa),
      .sgdma_tx_csr_reset_n                           (sgdma_tx_csr_reset_n),
      .sgdma_tx_csr_write                             (sgdma_tx_csr_write),
      .sgdma_tx_csr_writedata                         (sgdma_tx_csr_writedata)
    );

  sgdma_tx_descriptor_read_arbitrator the_sgdma_tx_descriptor_read
    (
      .clk                                                             (system_clk),
      .d1_descriptor_memory_s1_end_xfer                                (d1_descriptor_memory_s1_end_xfer),
      .descriptor_memory_s1_readdata_from_sa                           (descriptor_memory_s1_readdata_from_sa),
      .reset_n                                                         (system_clk_reset_n),
      .sgdma_tx_descriptor_read_address                                (sgdma_tx_descriptor_read_address),
      .sgdma_tx_descriptor_read_address_to_slave                       (sgdma_tx_descriptor_read_address_to_slave),
      .sgdma_tx_descriptor_read_granted_descriptor_memory_s1           (sgdma_tx_descriptor_read_granted_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_latency_counter                        (sgdma_tx_descriptor_read_latency_counter),
      .sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 (sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_read                                   (sgdma_tx_descriptor_read_read),
      .sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1   (sgdma_tx_descriptor_read_read_data_valid_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_readdata                               (sgdma_tx_descriptor_read_readdata),
      .sgdma_tx_descriptor_read_readdatavalid                          (sgdma_tx_descriptor_read_readdatavalid),
      .sgdma_tx_descriptor_read_requests_descriptor_memory_s1          (sgdma_tx_descriptor_read_requests_descriptor_memory_s1),
      .sgdma_tx_descriptor_read_waitrequest                            (sgdma_tx_descriptor_read_waitrequest)
    );

  sgdma_tx_descriptor_write_arbitrator the_sgdma_tx_descriptor_write
    (
      .clk                                                              (system_clk),
      .d1_descriptor_memory_s1_end_xfer                                 (d1_descriptor_memory_s1_end_xfer),
      .reset_n                                                          (system_clk_reset_n),
      .sgdma_tx_descriptor_write_address                                (sgdma_tx_descriptor_write_address),
      .sgdma_tx_descriptor_write_address_to_slave                       (sgdma_tx_descriptor_write_address_to_slave),
      .sgdma_tx_descriptor_write_granted_descriptor_memory_s1           (sgdma_tx_descriptor_write_granted_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 (sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_requests_descriptor_memory_s1          (sgdma_tx_descriptor_write_requests_descriptor_memory_s1),
      .sgdma_tx_descriptor_write_waitrequest                            (sgdma_tx_descriptor_write_waitrequest),
      .sgdma_tx_descriptor_write_write                                  (sgdma_tx_descriptor_write_write),
      .sgdma_tx_descriptor_write_writedata                              (sgdma_tx_descriptor_write_writedata)
    );

  sgdma_tx_m_read_arbitrator the_sgdma_tx_m_read
    (
      .altmemddr_bridge_s1_readdata_from_sa                               (altmemddr_bridge_s1_readdata_from_sa),
      .altmemddr_bridge_s1_waitrequest_from_sa                            (altmemddr_bridge_s1_waitrequest_from_sa),
      .clk                                                                (system_clk),
      .d1_altmemddr_bridge_s1_end_xfer                                    (d1_altmemddr_bridge_s1_end_xfer),
      .reset_n                                                            (system_clk_reset_n),
      .sgdma_tx_m_read_address                                            (sgdma_tx_m_read_address),
      .sgdma_tx_m_read_address_to_slave                                   (sgdma_tx_m_read_address_to_slave),
      .sgdma_tx_m_read_granted_altmemddr_bridge_s1                        (sgdma_tx_m_read_granted_altmemddr_bridge_s1),
      .sgdma_tx_m_read_latency_counter                                    (sgdma_tx_m_read_latency_counter),
      .sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1              (sgdma_tx_m_read_qualified_request_altmemddr_bridge_s1),
      .sgdma_tx_m_read_read                                               (sgdma_tx_m_read_read),
      .sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1                (sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1),
      .sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register (sgdma_tx_m_read_read_data_valid_altmemddr_bridge_s1_shift_register),
      .sgdma_tx_m_read_readdata                                           (sgdma_tx_m_read_readdata),
      .sgdma_tx_m_read_readdatavalid                                      (sgdma_tx_m_read_readdatavalid),
      .sgdma_tx_m_read_requests_altmemddr_bridge_s1                       (sgdma_tx_m_read_requests_altmemddr_bridge_s1),
      .sgdma_tx_m_read_waitrequest                                        (sgdma_tx_m_read_waitrequest)
    );

  sgdma_tx_out_arbitrator the_sgdma_tx_out
    (
      .clk                            (system_clk),
      .reset_n                        (system_clk_reset_n),
      .sgdma_tx_out_data              (sgdma_tx_out_data),
      .sgdma_tx_out_empty             (sgdma_tx_out_empty),
      .sgdma_tx_out_endofpacket       (sgdma_tx_out_endofpacket),
      .sgdma_tx_out_error             (sgdma_tx_out_error),
      .sgdma_tx_out_ready             (sgdma_tx_out_ready),
      .sgdma_tx_out_startofpacket     (sgdma_tx_out_startofpacket),
      .sgdma_tx_out_valid             (sgdma_tx_out_valid),
      .tse_mac_transmit_ready_from_sa (tse_mac_transmit_ready_from_sa)
    );

  sgdma_tx the_sgdma_tx
    (
      .clk                           (system_clk),
      .csr_address                   (sgdma_tx_csr_address),
      .csr_chipselect                (sgdma_tx_csr_chipselect),
      .csr_irq                       (sgdma_tx_csr_irq),
      .csr_read                      (sgdma_tx_csr_read),
      .csr_readdata                  (sgdma_tx_csr_readdata),
      .csr_write                     (sgdma_tx_csr_write),
      .csr_writedata                 (sgdma_tx_csr_writedata),
      .descriptor_read_address       (sgdma_tx_descriptor_read_address),
      .descriptor_read_read          (sgdma_tx_descriptor_read_read),
      .descriptor_read_readdata      (sgdma_tx_descriptor_read_readdata),
      .descriptor_read_readdatavalid (sgdma_tx_descriptor_read_readdatavalid),
      .descriptor_read_waitrequest   (sgdma_tx_descriptor_read_waitrequest),
      .descriptor_write_address      (sgdma_tx_descriptor_write_address),
      .descriptor_write_waitrequest  (sgdma_tx_descriptor_write_waitrequest),
      .descriptor_write_write        (sgdma_tx_descriptor_write_write),
      .descriptor_write_writedata    (sgdma_tx_descriptor_write_writedata),
      .m_read_address                (sgdma_tx_m_read_address),
      .m_read_read                   (sgdma_tx_m_read_read),
      .m_read_readdata               (sgdma_tx_m_read_readdata),
      .m_read_readdatavalid          (sgdma_tx_m_read_readdatavalid),
      .m_read_waitrequest            (sgdma_tx_m_read_waitrequest),
      .out_data                      (sgdma_tx_out_data),
      .out_empty                     (sgdma_tx_out_empty),
      .out_endofpacket               (sgdma_tx_out_endofpacket),
      .out_error                     (sgdma_tx_out_error),
      .out_ready                     (sgdma_tx_out_ready),
      .out_startofpacket             (sgdma_tx_out_startofpacket),
      .out_valid                     (sgdma_tx_out_valid),
      .system_reset_n                (sgdma_tx_csr_reset_n)
    );

  sys_clk_timer_s1_arbitrator the_sys_clk_timer_s1
    (
      .clk                                                (system_clk),
      .cpu_data_master_address_to_slave                   (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sys_clk_timer_s1           (cpu_data_master_granted_sys_clk_timer_s1),
      .cpu_data_master_qualified_request_sys_clk_timer_s1 (cpu_data_master_qualified_request_sys_clk_timer_s1),
      .cpu_data_master_read                               (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sys_clk_timer_s1   (cpu_data_master_read_data_valid_sys_clk_timer_s1),
      .cpu_data_master_requests_sys_clk_timer_s1          (cpu_data_master_requests_sys_clk_timer_s1),
      .cpu_data_master_waitrequest                        (cpu_data_master_waitrequest),
      .cpu_data_master_write                              (cpu_data_master_write),
      .cpu_data_master_writedata                          (cpu_data_master_writedata),
      .d1_sys_clk_timer_s1_end_xfer                       (d1_sys_clk_timer_s1_end_xfer),
      .reset_n                                            (system_clk_reset_n),
      .sys_clk_timer_s1_address                           (sys_clk_timer_s1_address),
      .sys_clk_timer_s1_chipselect                        (sys_clk_timer_s1_chipselect),
      .sys_clk_timer_s1_irq                               (sys_clk_timer_s1_irq),
      .sys_clk_timer_s1_irq_from_sa                       (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata                          (sys_clk_timer_s1_readdata),
      .sys_clk_timer_s1_readdata_from_sa                  (sys_clk_timer_s1_readdata_from_sa),
      .sys_clk_timer_s1_reset_n                           (sys_clk_timer_s1_reset_n),
      .sys_clk_timer_s1_write_n                           (sys_clk_timer_s1_write_n),
      .sys_clk_timer_s1_writedata                         (sys_clk_timer_s1_writedata)
    );

  sys_clk_timer the_sys_clk_timer
    (
      .address    (sys_clk_timer_s1_address),
      .chipselect (sys_clk_timer_s1_chipselect),
      .clk        (system_clk),
      .irq        (sys_clk_timer_s1_irq),
      .readdata   (sys_clk_timer_s1_readdata),
      .reset_n    (sys_clk_timer_s1_reset_n),
      .write_n    (sys_clk_timer_s1_write_n),
      .writedata  (sys_clk_timer_s1_writedata)
    );

  sys_pll_s1_arbitrator the_sys_pll_s1
    (
      .clk                                                                                (osc_clk),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave             (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_address_to_slave),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1           (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_granted_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress                (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_nativeaddress),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1 (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_qualified_request_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read                         (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1   (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_read_data_valid_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1          (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_requests_sys_pll_s1),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write                        (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_write),
      .cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata                    (cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_writedata),
      .d1_sys_pll_s1_end_xfer                                                             (d1_sys_pll_s1_end_xfer),
      .reset_n                                                                            (osc_clk_reset_n),
      .sys_pll_s1_address                                                                 (sys_pll_s1_address),
      .sys_pll_s1_chipselect                                                              (sys_pll_s1_chipselect),
      .sys_pll_s1_read                                                                    (sys_pll_s1_read),
      .sys_pll_s1_readdata                                                                (sys_pll_s1_readdata),
      .sys_pll_s1_readdata_from_sa                                                        (sys_pll_s1_readdata_from_sa),
      .sys_pll_s1_reset_n                                                                 (sys_pll_s1_reset_n),
      .sys_pll_s1_resetrequest                                                            (sys_pll_s1_resetrequest),
      .sys_pll_s1_resetrequest_from_sa                                                    (sys_pll_s1_resetrequest_from_sa),
      .sys_pll_s1_write                                                                   (sys_pll_s1_write),
      .sys_pll_s1_writedata                                                               (sys_pll_s1_writedata)
    );

  //system_clk out_clk assignment, which is an e_assign
  assign system_clk = out_clk_sys_pll_c0;

  sys_pll the_sys_pll
    (
      .address      (sys_pll_s1_address),
      .c0           (out_clk_sys_pll_c0),
      .chipselect   (sys_pll_s1_chipselect),
      .clk          (osc_clk),
      .read         (sys_pll_s1_read),
      .readdata     (sys_pll_s1_readdata),
      .reset_n      (sys_pll_s1_reset_n),
      .resetrequest (sys_pll_s1_resetrequest),
      .write        (sys_pll_s1_write),
      .writedata    (sys_pll_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (system_clk),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (system_clk_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  tse_mac_control_port_arbitrator the_tse_mac_control_port
    (
      .clk                                                    (system_clk),
      .cpu_data_master_address_to_slave                       (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_tse_mac_control_port           (cpu_data_master_granted_tse_mac_control_port),
      .cpu_data_master_qualified_request_tse_mac_control_port (cpu_data_master_qualified_request_tse_mac_control_port),
      .cpu_data_master_read                                   (cpu_data_master_read),
      .cpu_data_master_read_data_valid_tse_mac_control_port   (cpu_data_master_read_data_valid_tse_mac_control_port),
      .cpu_data_master_requests_tse_mac_control_port          (cpu_data_master_requests_tse_mac_control_port),
      .cpu_data_master_waitrequest                            (cpu_data_master_waitrequest),
      .cpu_data_master_write                                  (cpu_data_master_write),
      .cpu_data_master_writedata                              (cpu_data_master_writedata),
      .d1_tse_mac_control_port_end_xfer                       (d1_tse_mac_control_port_end_xfer),
      .reset_n                                                (system_clk_reset_n),
      .tse_mac_control_port_address                           (tse_mac_control_port_address),
      .tse_mac_control_port_read                              (tse_mac_control_port_read),
      .tse_mac_control_port_readdata                          (tse_mac_control_port_readdata),
      .tse_mac_control_port_readdata_from_sa                  (tse_mac_control_port_readdata_from_sa),
      .tse_mac_control_port_reset                             (tse_mac_control_port_reset),
      .tse_mac_control_port_waitrequest                       (tse_mac_control_port_waitrequest),
      .tse_mac_control_port_waitrequest_from_sa               (tse_mac_control_port_waitrequest_from_sa),
      .tse_mac_control_port_write                             (tse_mac_control_port_write),
      .tse_mac_control_port_writedata                         (tse_mac_control_port_writedata)
    );

  tse_mac_transmit_arbitrator the_tse_mac_transmit
    (
      .clk                            (system_clk),
      .reset_n                        (system_clk_reset_n),
      .sgdma_tx_out_data              (sgdma_tx_out_data),
      .sgdma_tx_out_empty             (sgdma_tx_out_empty),
      .sgdma_tx_out_endofpacket       (sgdma_tx_out_endofpacket),
      .sgdma_tx_out_error             (sgdma_tx_out_error),
      .sgdma_tx_out_startofpacket     (sgdma_tx_out_startofpacket),
      .sgdma_tx_out_valid             (sgdma_tx_out_valid),
      .tse_mac_transmit_data          (tse_mac_transmit_data),
      .tse_mac_transmit_empty         (tse_mac_transmit_empty),
      .tse_mac_transmit_endofpacket   (tse_mac_transmit_endofpacket),
      .tse_mac_transmit_error         (tse_mac_transmit_error),
      .tse_mac_transmit_ready         (tse_mac_transmit_ready),
      .tse_mac_transmit_ready_from_sa (tse_mac_transmit_ready_from_sa),
      .tse_mac_transmit_startofpacket (tse_mac_transmit_startofpacket),
      .tse_mac_transmit_valid         (tse_mac_transmit_valid)
    );

  tse_mac_receive_arbitrator the_tse_mac_receive
    (
      .clk                           (system_clk),
      .reset_n                       (system_clk_reset_n),
      .sgdma_rx_in_ready_from_sa     (sgdma_rx_in_ready_from_sa),
      .tse_mac_receive_data          (tse_mac_receive_data),
      .tse_mac_receive_empty         (tse_mac_receive_empty),
      .tse_mac_receive_endofpacket   (tse_mac_receive_endofpacket),
      .tse_mac_receive_error         (tse_mac_receive_error),
      .tse_mac_receive_ready         (tse_mac_receive_ready),
      .tse_mac_receive_startofpacket (tse_mac_receive_startofpacket),
      .tse_mac_receive_valid         (tse_mac_receive_valid)
    );

  tse_mac the_tse_mac
    (
      .address     (tse_mac_control_port_address),
      .clk         (system_clk),
      .ena_10      (ena_10_from_the_tse_mac),
      .eth_mode    (eth_mode_from_the_tse_mac),
      .ff_rx_clk   (system_clk),
      .ff_rx_data  (tse_mac_receive_data),
      .ff_rx_dval  (tse_mac_receive_valid),
      .ff_rx_eop   (tse_mac_receive_endofpacket),
      .ff_rx_mod   (tse_mac_receive_empty),
      .ff_rx_rdy   (tse_mac_receive_ready),
      .ff_rx_sop   (tse_mac_receive_startofpacket),
      .ff_tx_clk   (system_clk),
      .ff_tx_data  (tse_mac_transmit_data),
      .ff_tx_eop   (tse_mac_transmit_endofpacket),
      .ff_tx_err   (tse_mac_transmit_error),
      .ff_tx_mod   (tse_mac_transmit_empty),
      .ff_tx_rdy   (tse_mac_transmit_ready),
      .ff_tx_sop   (tse_mac_transmit_startofpacket),
      .ff_tx_wren  (tse_mac_transmit_valid),
      .mdc         (mdc_from_the_tse_mac),
      .mdio_in     (mdio_in_to_the_tse_mac),
      .mdio_oen    (mdio_oen_from_the_tse_mac),
      .mdio_out    (mdio_out_from_the_tse_mac),
      .read        (tse_mac_control_port_read),
      .readdata    (tse_mac_control_port_readdata),
      .reset       (tse_mac_control_port_reset),
      .rgmii_in    (rgmii_in_to_the_tse_mac),
      .rgmii_out   (rgmii_out_from_the_tse_mac),
      .rx_clk      (rx_clk_to_the_tse_mac),
      .rx_control  (rx_control_to_the_tse_mac),
      .rx_err      (tse_mac_receive_error),
      .set_10      (set_10_to_the_tse_mac),
      .set_1000    (set_1000_to_the_tse_mac),
      .tx_clk      (tx_clk_to_the_tse_mac),
      .tx_control  (tx_control_from_the_tse_mac),
      .waitrequest (tse_mac_control_port_waitrequest),
      .write       (tse_mac_control_port_write),
      .writedata   (tse_mac_control_port_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c120_dev_niosII_standard_sopc_reset_altmemddr_phy_clk_out_domain_synch_module cycloneIII_3c120_dev_niosII_standard_sopc_reset_altmemddr_phy_clk_out_domain_synch
    (
      .clk      (altmemddr_phy_clk_out),
      .data_in  (1'b1),
      .data_out (altmemddr_phy_clk_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c120_dev_niosII_standard_sopc_reset_system_clk_domain_synch_module cycloneIII_3c120_dev_niosII_standard_sopc_reset_system_clk_domain_synch
    (
      .clk      (system_clk),
      .data_in  (1'b1),
      .data_out (system_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  cycloneIII_3c120_dev_niosII_standard_sopc_reset_osc_clk_domain_synch_module cycloneIII_3c120_dev_niosII_standard_sopc_reset_osc_clk_domain_synch
    (
      .clk      (osc_clk),
      .data_in  (1'b1),
      .data_out (osc_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //altmemddr_bridge_m1_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign altmemddr_bridge_m1_endofpacket = 0;

  //cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 24: 0] rdaddress;
  input            rdclken;
  input   [ 24: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [33554431: 0];
  wire    [  7: 0] q;
  reg     [ 24: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("ext_flash_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ext_flash_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 25,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash_lane1_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 24: 0] rdaddress;
  input            rdclken;
  input   [ 24: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [33554431: 0];
  wire    [  7: 0] q;
  reg     [ 24: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("ext_flash_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ext_flash_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 25,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [ 15: 0] data;
  input   [ 24: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //ext_flash_lane0, which is an e_ram
  ext_flash_lane0_module ext_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //ext_flash_lane1, which is an e_ram
  ext_flash_lane1_module ext_flash_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/11.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/11.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/11.1/quartus/eda/sim_lib/sgate.v"
`include "C:/altera/11.1/quartus/eda/sim_lib/stratixiigx_hssi_atoms.v"
`include "C:/altera/11.1/quartus/eda/sim_lib/stratixiv_hssi_atoms.v"
`include "tse_mac.vo"
`include "tse_mac_loopback.v"
`include "descriptor_memory.v"
`include "cycloneIII_3c120_dev_niosII_standard_sopc_clock_0.v"
`include "lcd_display.v"
`include "sysid.v"
`include "sys_pll.v"
`include "altpllsys_pll.v"
`include "button_pio.v"
`include "high_res_timer.v"
`include "onchip_ram.v"
`include "altmemddr_bridge.v"
`include "jtag_uart.v"
`include "led_pio.v"
`include "sys_clk_timer.v"
`include "sgdma_rx.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sgdma_tx.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             LCD_E_from_the_lcd_display;
  wire             LCD_RS_from_the_lcd_display;
  wire             LCD_RW_from_the_lcd_display;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_display;
  wire    [ 25: 0] address_to_the_ext_flash;
  wire             altmemddr_aux_full_rate_clk_out;
  wire             altmemddr_aux_half_rate_clk_out;
  wire             altmemddr_bridge_m1_endofpacket;
  wire    [ 23: 0] altmemddr_bridge_m1_nativeaddress;
  wire             altmemddr_bridge_s1_endofpacket_from_sa;
  wire             altmemddr_phy_clk_out;
  wire             clk;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_in_endofpacket_from_sa;
  wire             cycloneIII_3c120_dev_niosII_standard_sopc_clock_0_out_endofpacket;
  wire    [ 15: 0] data_to_and_from_the_ext_flash;
  wire             ena_10_from_the_tse_mac;
  wire             eth_mode_from_the_tse_mac;
  wire             global_reset_n_to_the_altmemddr;
  wire    [  3: 0] in_port_to_the_button_pio;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             local_init_done_from_the_altmemddr;
  wire             local_refresh_ack_from_the_altmemddr;
  wire             local_wdata_req_from_the_altmemddr;
  wire             mdc_from_the_tse_mac;
  wire             mdio_in_to_the_tse_mac;
  wire             mdio_oen_from_the_tse_mac;
  wire             mdio_out_from_the_tse_mac;
  wire    [ 12: 0] mem_addr_from_the_altmemddr;
  wire    [  1: 0] mem_ba_from_the_altmemddr;
  wire             mem_cas_n_from_the_altmemddr;
  wire             mem_cke_from_the_altmemddr;
  wire             mem_clk_n_to_and_from_the_altmemddr;
  wire             mem_clk_to_and_from_the_altmemddr;
  wire             mem_cs_n_from_the_altmemddr;
  wire    [  1: 0] mem_dm_from_the_altmemddr;
  wire    [ 15: 0] mem_dq_to_and_from_the_altmemddr;
  wire    [  1: 0] mem_dqs_to_and_from_the_altmemddr;
  wire             mem_odt_from_the_altmemddr;
  wire             mem_ras_n_from_the_altmemddr;
  wire             mem_we_n_from_the_altmemddr;
  reg              osc_clk;
  reg              osc_clk_1;
  wire    [  7: 0] out_port_from_the_led_pio;
  wire             read_n_to_the_ext_flash;
  reg              reset_n;
  wire             reset_phy_clk_n_from_the_altmemddr;
  wire    [  3: 0] rgmii_in_to_the_tse_mac;
  wire    [  3: 0] rgmii_out_from_the_tse_mac;
  wire             rx_clk_to_the_tse_mac;
  wire             rx_control_to_the_tse_mac;
  wire             select_n_to_the_ext_flash;
  wire             set_1000_to_the_tse_mac;
  wire             set_10_to_the_tse_mac;
  wire             sysid_control_slave_clock;
  wire             system_clk;
  wire             tx_clk_to_the_tse_mac;
  wire             tx_control_from_the_tse_mac;
  wire             write_n_to_the_ext_flash;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  cycloneIII_3c120_dev_niosII_standard_sopc DUT
    (
      .LCD_E_from_the_lcd_display           (LCD_E_from_the_lcd_display),
      .LCD_RS_from_the_lcd_display          (LCD_RS_from_the_lcd_display),
      .LCD_RW_from_the_lcd_display          (LCD_RW_from_the_lcd_display),
      .LCD_data_to_and_from_the_lcd_display (LCD_data_to_and_from_the_lcd_display),
      .address_to_the_ext_flash             (address_to_the_ext_flash),
      .altmemddr_aux_full_rate_clk_out      (altmemddr_aux_full_rate_clk_out),
      .altmemddr_aux_half_rate_clk_out      (altmemddr_aux_half_rate_clk_out),
      .altmemddr_phy_clk_out                (altmemddr_phy_clk_out),
      .data_to_and_from_the_ext_flash       (data_to_and_from_the_ext_flash),
      .ena_10_from_the_tse_mac              (ena_10_from_the_tse_mac),
      .eth_mode_from_the_tse_mac            (eth_mode_from_the_tse_mac),
      .global_reset_n_to_the_altmemddr      (global_reset_n_to_the_altmemddr),
      .in_port_to_the_button_pio            (in_port_to_the_button_pio),
      .local_init_done_from_the_altmemddr   (local_init_done_from_the_altmemddr),
      .local_refresh_ack_from_the_altmemddr (local_refresh_ack_from_the_altmemddr),
      .local_wdata_req_from_the_altmemddr   (local_wdata_req_from_the_altmemddr),
      .mdc_from_the_tse_mac                 (mdc_from_the_tse_mac),
      .mdio_in_to_the_tse_mac               (mdio_in_to_the_tse_mac),
      .mdio_oen_from_the_tse_mac            (mdio_oen_from_the_tse_mac),
      .mdio_out_from_the_tse_mac            (mdio_out_from_the_tse_mac),
      .mem_addr_from_the_altmemddr          (mem_addr_from_the_altmemddr),
      .mem_ba_from_the_altmemddr            (mem_ba_from_the_altmemddr),
      .mem_cas_n_from_the_altmemddr         (mem_cas_n_from_the_altmemddr),
      .mem_cke_from_the_altmemddr           (mem_cke_from_the_altmemddr),
      .mem_clk_n_to_and_from_the_altmemddr  (mem_clk_n_to_and_from_the_altmemddr),
      .mem_clk_to_and_from_the_altmemddr    (mem_clk_to_and_from_the_altmemddr),
      .mem_cs_n_from_the_altmemddr          (mem_cs_n_from_the_altmemddr),
      .mem_dm_from_the_altmemddr            (mem_dm_from_the_altmemddr),
      .mem_dq_to_and_from_the_altmemddr     (mem_dq_to_and_from_the_altmemddr),
      .mem_dqs_to_and_from_the_altmemddr    (mem_dqs_to_and_from_the_altmemddr),
      .mem_odt_from_the_altmemddr           (mem_odt_from_the_altmemddr),
      .mem_ras_n_from_the_altmemddr         (mem_ras_n_from_the_altmemddr),
      .mem_we_n_from_the_altmemddr          (mem_we_n_from_the_altmemddr),
      .osc_clk                              (osc_clk),
      .osc_clk_1                            (osc_clk_1),
      .out_port_from_the_led_pio            (out_port_from_the_led_pio),
      .read_n_to_the_ext_flash              (read_n_to_the_ext_flash),
      .reset_n                              (reset_n),
      .reset_phy_clk_n_from_the_altmemddr   (reset_phy_clk_n_from_the_altmemddr),
      .rgmii_in_to_the_tse_mac              (rgmii_in_to_the_tse_mac),
      .rgmii_out_from_the_tse_mac           (rgmii_out_from_the_tse_mac),
      .rx_clk_to_the_tse_mac                (rx_clk_to_the_tse_mac),
      .rx_control_to_the_tse_mac            (rx_control_to_the_tse_mac),
      .select_n_to_the_ext_flash            (select_n_to_the_ext_flash),
      .set_1000_to_the_tse_mac              (set_1000_to_the_tse_mac),
      .set_10_to_the_tse_mac                (set_10_to_the_tse_mac),
      .system_clk                           (system_clk),
      .tx_clk_to_the_tse_mac                (tx_clk_to_the_tse_mac),
      .tx_control_from_the_tse_mac          (tx_control_from_the_tse_mac),
      .write_n_to_the_ext_flash             (write_n_to_the_ext_flash)
    );

  //default value specified in MODULE button_pio ptf port section
  assign in_port_to_the_button_pio = 15;

  ext_flash the_ext_flash
    (
      .address  (address_to_the_ext_flash[25 : 1]),
      .data     (data_to_and_from_the_ext_flash),
      .read_n   (read_n_to_the_ext_flash),
      .select_n (select_n_to_the_ext_flash),
      .write_n  (write_n_to_the_ext_flash)
    );

  tse_mac_loopback the_tse_mac_loopback
    (
      .rgmii_in   (rgmii_in_to_the_tse_mac),
      .rgmii_out  (rgmii_out_from_the_tse_mac),
      .rx_clk     (rx_clk_to_the_tse_mac),
      .rx_control (rx_control_to_the_tse_mac),
      .set_10     (set_10_to_the_tse_mac),
      .set_1000   (set_1000_to_the_tse_mac),
      .tx_clk     (tx_clk_to_the_tse_mac),
      .tx_control (tx_control_from_the_tse_mac)
    );

  initial
    osc_clk = 1'b0;
  always
    #10 osc_clk <= ~osc_clk;
  
  initial
    osc_clk_1 = 1'b0;
  always
    #4 osc_clk_1 <= ~osc_clk_1;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on