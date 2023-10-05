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

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_latency_counter,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_latency_counter,
                                             cpu_0_instruction_master_read,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 18: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg              cpu_0_jtag_debug_module_arb_share_counter;
  wire             cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 23: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 18: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[23 : 11] , 11'b0} == 24'h1000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | cpu_0_instruction_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[18 : 11] , 11'b0} == 19'h1000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
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

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_heartbeat_0_nios,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios,
                                       cpu_0_data_master_granted_onchip_memory2_0_s1,
                                       cpu_0_data_master_granted_product_info_0_avalon_slave_0,
                                       cpu_0_data_master_granted_sc_inf_0_nios,
                                       cpu_0_data_master_granted_timer_0_s1,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_heartbeat_0_nios,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios,
                                       cpu_0_data_master_qualified_request_onchip_memory2_0_s1,
                                       cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_sc_inf_0_nios,
                                       cpu_0_data_master_qualified_request_timer_0_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_heartbeat_0_nios,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios,
                                       cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
                                       cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_sc_inf_0_nios,
                                       cpu_0_data_master_read_data_valid_timer_0_s1,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_heartbeat_0_nios,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios,
                                       cpu_0_data_master_requests_onchip_memory2_0_s1,
                                       cpu_0_data_master_requests_product_info_0_avalon_slave_0,
                                       cpu_0_data_master_requests_sc_inf_0_nios,
                                       cpu_0_data_master_requests_timer_0_s1,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_heartbeat_0_nios_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_nios_bts_port_ddr2_x40_0_nios_end_xfer,
                                       d1_onchip_memory2_0_s1_end_xfer,
                                       d1_product_info_0_avalon_slave_0_end_xfer,
                                       d1_sc_inf_0_nios_end_xfer,
                                       d1_timer_0_s1_end_xfer,
                                       heartbeat_0_nios_irq_from_sa,
                                       heartbeat_0_nios_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       nios_bts_port_ddr2_x40_0_nios_irq_from_sa,
                                       nios_bts_port_ddr2_x40_0_nios_readdata_from_sa,
                                       nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa,
                                       onchip_memory2_0_s1_readdata_from_sa,
                                       product_info_0_avalon_slave_0_readdata_from_sa,
                                       reset_n,
                                       sc_inf_0_nios_irq_from_sa,
                                       sc_inf_0_nios_readdata_from_sa,
                                       timer_0_s1_irq_from_sa,
                                       timer_0_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_readdatavalid,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 23: 0] cpu_0_data_master_address_to_slave;
  output  [ 31: 0] cpu_0_data_master_irq;
  output           cpu_0_data_master_latency_counter;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_readdatavalid;
  output           cpu_0_data_master_waitrequest;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_heartbeat_0_nios;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios;
  input            cpu_0_data_master_granted_onchip_memory2_0_s1;
  input            cpu_0_data_master_granted_product_info_0_avalon_slave_0;
  input            cpu_0_data_master_granted_sc_inf_0_nios;
  input            cpu_0_data_master_granted_timer_0_s1;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_heartbeat_0_nios;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  input            cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  input            cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_sc_inf_0_nios;
  input            cpu_0_data_master_qualified_request_timer_0_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_heartbeat_0_nios;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  input            cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  input            cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_sc_inf_0_nios;
  input            cpu_0_data_master_read_data_valid_timer_0_s1;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_heartbeat_0_nios;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios;
  input            cpu_0_data_master_requests_onchip_memory2_0_s1;
  input            cpu_0_data_master_requests_product_info_0_avalon_slave_0;
  input            cpu_0_data_master_requests_sc_inf_0_nios;
  input            cpu_0_data_master_requests_timer_0_s1;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_heartbeat_0_nios_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_nios_bts_port_ddr2_x40_0_nios_end_xfer;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input            d1_product_info_0_avalon_slave_0_end_xfer;
  input            d1_sc_inf_0_nios_end_xfer;
  input            d1_timer_0_s1_end_xfer;
  input            heartbeat_0_nios_irq_from_sa;
  input   [ 31: 0] heartbeat_0_nios_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input            nios_bts_port_ddr2_x40_0_nios_irq_from_sa;
  input   [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata_from_sa;
  input            nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input   [ 31: 0] product_info_0_avalon_slave_0_readdata_from_sa;
  input            reset_n;
  input            sc_inf_0_nios_irq_from_sa;
  input   [ 31: 0] sc_inf_0_nios_readdata_from_sa;
  input            timer_0_s1_irq_from_sa;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 23: 0] cpu_0_data_master_address_last_time;
  wire    [ 23: 0] cpu_0_data_master_address_to_slave;
  reg     [  3: 0] cpu_0_data_master_byteenable_last_time;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_is_granted_some_slave;
  reg              cpu_0_data_master_latency_counter;
  reg              cpu_0_data_master_read_but_no_slave_selected;
  reg              cpu_0_data_master_read_last_time;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_run;
  wire             cpu_0_data_master_waitrequest;
  reg              cpu_0_data_master_write_last_time;
  reg     [ 31: 0] cpu_0_data_master_writedata_last_time;
  wire             latency_load_value;
  wire             p1_cpu_0_data_master_latency_counter;
  wire             pre_flush_cpu_0_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_heartbeat_0_nios | ~cpu_0_data_master_requests_heartbeat_0_nios) & (cpu_0_data_master_granted_heartbeat_0_nios | ~cpu_0_data_master_qualified_request_heartbeat_0_nios) & ((~cpu_0_data_master_qualified_request_heartbeat_0_nios | ~cpu_0_data_master_read | (1 & ~d1_heartbeat_0_nios_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_heartbeat_0_nios | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios | ~cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios) & (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios | ~cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios) & ((~cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1;

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | ~cpu_0_data_master_requests_onchip_memory2_0_s1) & (cpu_0_data_master_granted_onchip_memory2_0_s1 | ~cpu_0_data_master_qualified_request_onchip_memory2_0_s1) & ((~cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 | ~cpu_0_data_master_requests_product_info_0_avalon_slave_0) & (cpu_0_data_master_granted_product_info_0_avalon_slave_0 | ~cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0) & ((~cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 | ~cpu_0_data_master_read | (1 & ~d1_product_info_0_avalon_slave_0_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sc_inf_0_nios | ~cpu_0_data_master_requests_sc_inf_0_nios) & (cpu_0_data_master_granted_sc_inf_0_nios | ~cpu_0_data_master_qualified_request_sc_inf_0_nios) & ((~cpu_0_data_master_qualified_request_sc_inf_0_nios | ~cpu_0_data_master_read | (1 & ~d1_sc_inf_0_nios_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sc_inf_0_nios | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_requests_timer_0_s1) & (cpu_0_data_master_granted_timer_0_s1 | ~cpu_0_data_master_qualified_request_timer_0_s1) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_read | (1 & ~d1_timer_0_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = {cpu_0_data_master_address[23],
    1'b0,
    cpu_0_data_master_address[21 : 0]};

  //cpu_0_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_data_master_read_but_no_slave_selected <= cpu_0_data_master_read & cpu_0_data_master_run & ~cpu_0_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_data_master_is_granted_some_slave = cpu_0_data_master_granted_cpu_0_jtag_debug_module |
    cpu_0_data_master_granted_heartbeat_0_nios |
    cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave |
    cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios |
    cpu_0_data_master_granted_onchip_memory2_0_s1 |
    cpu_0_data_master_granted_product_info_0_avalon_slave_0 |
    cpu_0_data_master_granted_sc_inf_0_nios |
    cpu_0_data_master_granted_timer_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_data_master_readdatavalid = cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_data_master_readdatavalid = cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_heartbeat_0_nios |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_sc_inf_0_nios |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_timer_0_s1;

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~(cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_data_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_heartbeat_0_nios & cpu_0_data_master_read)}} | heartbeat_0_nios_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read)}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_read)}} | nios_bts_port_ddr2_x40_0_nios_readdata_from_sa) &
    ({32 {~cpu_0_data_master_read_data_valid_onchip_memory2_0_s1}} | onchip_memory2_0_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 & cpu_0_data_master_read)}} | product_info_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_sc_inf_0_nios & cpu_0_data_master_read)}} | sc_inf_0_nios_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_timer_0_s1 & cpu_0_data_master_read)}} | timer_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_data_master_waitrequest = ~cpu_0_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_latency_counter <= 0;
      else 
        cpu_0_data_master_latency_counter <= p1_cpu_0_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_data_master_latency_counter = ((cpu_0_data_master_run & cpu_0_data_master_read))? latency_load_value :
    (cpu_0_data_master_latency_counter)? cpu_0_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_0_data_master_requests_onchip_memory2_0_s1}} & 1;

  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
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
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    timer_0_s1_irq_from_sa,
    heartbeat_0_nios_irq_from_sa,
    sc_inf_0_nios_irq_from_sa,
    nios_bts_port_ddr2_x40_0_nios_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa};


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_address_last_time <= 0;
      else 
        cpu_0_data_master_address_last_time <= cpu_0_data_master_address;
    end


  //cpu_0/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_data_master_waitrequest & (cpu_0_data_master_read | cpu_0_data_master_write);
    end


  //cpu_0_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_address != cpu_0_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_byteenable_last_time <= 0;
      else 
        cpu_0_data_master_byteenable_last_time <= cpu_0_data_master_byteenable;
    end


  //cpu_0_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_byteenable != cpu_0_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_last_time <= 0;
      else 
        cpu_0_data_master_read_last_time <= cpu_0_data_master_read;
    end


  //cpu_0_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_read != cpu_0_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_write_last_time <= 0;
      else 
        cpu_0_data_master_write_last_time <= cpu_0_data_master_write;
    end


  //cpu_0_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_write != cpu_0_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_writedata_last_time <= 0;
      else 
        cpu_0_data_master_writedata_last_time <= cpu_0_data_master_writedata;
    end


  //cpu_0_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_writedata != cpu_0_data_master_writedata_last_time) & cpu_0_data_master_write)
        begin
          $write("%0d ns: cpu_0_data_master_writedata did not heed wait!!!", $time);
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

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_onchip_memory2_0_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_onchip_memory2_0_s1,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_onchip_memory2_0_s1_end_xfer,
                                              onchip_memory2_0_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_readdatavalid,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 18: 0] cpu_0_instruction_master_address_to_slave;
  output           cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 18: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 18: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 18: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_is_granted_some_slave;
  reg              cpu_0_instruction_master_latency_counter;
  reg              cpu_0_instruction_master_read_but_no_slave_selected;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_0_instruction_master_latency_counter;
  wire             pre_flush_cpu_0_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 | ~cpu_0_instruction_master_requests_onchip_memory2_0_s1) & (cpu_0_instruction_master_granted_onchip_memory2_0_s1 | ~cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1) & ((~cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 | ~(cpu_0_instruction_master_read) | (1 & (cpu_0_instruction_master_read))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[18 : 0];

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_granted_onchip_memory2_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~(cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_instruction_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1}} | onchip_memory2_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_latency_counter <= 0;
      else 
        cpu_0_instruction_master_latency_counter <= p1_cpu_0_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_instruction_master_latency_counter = ((cpu_0_instruction_master_run & cpu_0_instruction_master_read))? latency_load_value :
    (cpu_0_instruction_master_latency_counter)? cpu_0_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_0_instruction_master_requests_onchip_memory2_0_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
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

module heartbeat_0_nios_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_0_data_master_address_to_slave,
                                      cpu_0_data_master_latency_counter,
                                      cpu_0_data_master_read,
                                      cpu_0_data_master_write,
                                      cpu_0_data_master_writedata,
                                      heartbeat_0_nios_irq,
                                      heartbeat_0_nios_readdata,
                                      jtag_avalon_master_0_latency_counter,
                                      jtag_avalon_master_0_master_address_to_slave,
                                      jtag_avalon_master_0_master_read,
                                      jtag_avalon_master_0_master_write,
                                      jtag_avalon_master_0_master_writedata,
                                      reset_n,

                                     // outputs:
                                      cpu_0_data_master_granted_heartbeat_0_nios,
                                      cpu_0_data_master_qualified_request_heartbeat_0_nios,
                                      cpu_0_data_master_read_data_valid_heartbeat_0_nios,
                                      cpu_0_data_master_requests_heartbeat_0_nios,
                                      d1_heartbeat_0_nios_end_xfer,
                                      heartbeat_0_nios_address,
                                      heartbeat_0_nios_chipselect_n,
                                      heartbeat_0_nios_irq_from_sa,
                                      heartbeat_0_nios_read_n,
                                      heartbeat_0_nios_readdata_from_sa,
                                      heartbeat_0_nios_reset_n,
                                      heartbeat_0_nios_write_n,
                                      heartbeat_0_nios_writedata,
                                      jtag_avalon_master_0_granted_heartbeat_0_nios,
                                      jtag_avalon_master_0_qualified_request_heartbeat_0_nios,
                                      jtag_avalon_master_0_read_data_valid_heartbeat_0_nios,
                                      jtag_avalon_master_0_requests_heartbeat_0_nios
                                   )
;

  output           cpu_0_data_master_granted_heartbeat_0_nios;
  output           cpu_0_data_master_qualified_request_heartbeat_0_nios;
  output           cpu_0_data_master_read_data_valid_heartbeat_0_nios;
  output           cpu_0_data_master_requests_heartbeat_0_nios;
  output           d1_heartbeat_0_nios_end_xfer;
  output           heartbeat_0_nios_address;
  output           heartbeat_0_nios_chipselect_n;
  output           heartbeat_0_nios_irq_from_sa;
  output           heartbeat_0_nios_read_n;
  output  [ 31: 0] heartbeat_0_nios_readdata_from_sa;
  output           heartbeat_0_nios_reset_n;
  output           heartbeat_0_nios_write_n;
  output  [ 31: 0] heartbeat_0_nios_writedata;
  output           jtag_avalon_master_0_granted_heartbeat_0_nios;
  output           jtag_avalon_master_0_qualified_request_heartbeat_0_nios;
  output           jtag_avalon_master_0_read_data_valid_heartbeat_0_nios;
  output           jtag_avalon_master_0_requests_heartbeat_0_nios;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            heartbeat_0_nios_irq;
  input   [ 31: 0] heartbeat_0_nios_readdata;
  input            jtag_avalon_master_0_latency_counter;
  input   [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] jtag_avalon_master_0_master_writedata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_heartbeat_0_nios;
  wire             cpu_0_data_master_qualified_request_heartbeat_0_nios;
  wire             cpu_0_data_master_read_data_valid_heartbeat_0_nios;
  wire             cpu_0_data_master_requests_heartbeat_0_nios;
  wire             cpu_0_data_master_saved_grant_heartbeat_0_nios;
  reg              d1_heartbeat_0_nios_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_heartbeat_0_nios;
  wire             heartbeat_0_nios_address;
  wire             heartbeat_0_nios_allgrants;
  wire             heartbeat_0_nios_allow_new_arb_cycle;
  wire             heartbeat_0_nios_any_bursting_master_saved_grant;
  wire             heartbeat_0_nios_any_continuerequest;
  reg     [  1: 0] heartbeat_0_nios_arb_addend;
  wire             heartbeat_0_nios_arb_counter_enable;
  reg              heartbeat_0_nios_arb_share_counter;
  wire             heartbeat_0_nios_arb_share_counter_next_value;
  wire             heartbeat_0_nios_arb_share_set_values;
  wire    [  1: 0] heartbeat_0_nios_arb_winner;
  wire             heartbeat_0_nios_arbitration_holdoff_internal;
  wire             heartbeat_0_nios_beginbursttransfer_internal;
  wire             heartbeat_0_nios_begins_xfer;
  wire             heartbeat_0_nios_chipselect_n;
  wire    [  3: 0] heartbeat_0_nios_chosen_master_double_vector;
  wire    [  1: 0] heartbeat_0_nios_chosen_master_rot_left;
  wire             heartbeat_0_nios_end_xfer;
  wire             heartbeat_0_nios_firsttransfer;
  wire    [  1: 0] heartbeat_0_nios_grant_vector;
  wire             heartbeat_0_nios_in_a_read_cycle;
  wire             heartbeat_0_nios_in_a_write_cycle;
  wire             heartbeat_0_nios_irq_from_sa;
  wire    [  1: 0] heartbeat_0_nios_master_qreq_vector;
  wire             heartbeat_0_nios_non_bursting_master_requests;
  wire             heartbeat_0_nios_read_n;
  wire    [ 31: 0] heartbeat_0_nios_readdata_from_sa;
  reg              heartbeat_0_nios_reg_firsttransfer;
  wire             heartbeat_0_nios_reset_n;
  reg     [  1: 0] heartbeat_0_nios_saved_chosen_master_vector;
  reg              heartbeat_0_nios_slavearbiterlockenable;
  wire             heartbeat_0_nios_slavearbiterlockenable2;
  wire             heartbeat_0_nios_unreg_firsttransfer;
  wire             heartbeat_0_nios_waits_for_read;
  wire             heartbeat_0_nios_waits_for_write;
  wire             heartbeat_0_nios_write_n;
  wire    [ 31: 0] heartbeat_0_nios_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_avalon_master_0_granted_heartbeat_0_nios;
  wire             jtag_avalon_master_0_master_arbiterlock;
  wire             jtag_avalon_master_0_master_arbiterlock2;
  wire             jtag_avalon_master_0_master_continuerequest;
  wire             jtag_avalon_master_0_qualified_request_heartbeat_0_nios;
  wire             jtag_avalon_master_0_read_data_valid_heartbeat_0_nios;
  wire             jtag_avalon_master_0_requests_heartbeat_0_nios;
  wire             jtag_avalon_master_0_saved_grant_heartbeat_0_nios;
  reg              last_cycle_cpu_0_data_master_granted_slave_heartbeat_0_nios;
  reg              last_cycle_jtag_avalon_master_0_master_granted_slave_heartbeat_0_nios;
  wire    [ 23: 0] shifted_address_to_heartbeat_0_nios_from_cpu_0_data_master;
  wire    [ 31: 0] shifted_address_to_heartbeat_0_nios_from_jtag_avalon_master_0_master;
  wire             wait_for_heartbeat_0_nios_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~heartbeat_0_nios_end_xfer;
    end


  assign heartbeat_0_nios_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_heartbeat_0_nios | jtag_avalon_master_0_qualified_request_heartbeat_0_nios));
  //assign heartbeat_0_nios_readdata_from_sa = heartbeat_0_nios_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign heartbeat_0_nios_readdata_from_sa = heartbeat_0_nios_readdata;

  assign cpu_0_data_master_requests_heartbeat_0_nios = ({cpu_0_data_master_address_to_slave[23 : 3] , 3'b0} == 24'h18) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //heartbeat_0_nios_arb_share_counter set values, which is an e_mux
  assign heartbeat_0_nios_arb_share_set_values = 1;

  //heartbeat_0_nios_non_bursting_master_requests mux, which is an e_mux
  assign heartbeat_0_nios_non_bursting_master_requests = cpu_0_data_master_requests_heartbeat_0_nios |
    jtag_avalon_master_0_requests_heartbeat_0_nios |
    cpu_0_data_master_requests_heartbeat_0_nios |
    jtag_avalon_master_0_requests_heartbeat_0_nios;

  //heartbeat_0_nios_any_bursting_master_saved_grant mux, which is an e_mux
  assign heartbeat_0_nios_any_bursting_master_saved_grant = 0;

  //heartbeat_0_nios_arb_share_counter_next_value assignment, which is an e_assign
  assign heartbeat_0_nios_arb_share_counter_next_value = heartbeat_0_nios_firsttransfer ? (heartbeat_0_nios_arb_share_set_values - 1) : |heartbeat_0_nios_arb_share_counter ? (heartbeat_0_nios_arb_share_counter - 1) : 0;

  //heartbeat_0_nios_allgrants all slave grants, which is an e_mux
  assign heartbeat_0_nios_allgrants = (|heartbeat_0_nios_grant_vector) |
    (|heartbeat_0_nios_grant_vector) |
    (|heartbeat_0_nios_grant_vector) |
    (|heartbeat_0_nios_grant_vector);

  //heartbeat_0_nios_end_xfer assignment, which is an e_assign
  assign heartbeat_0_nios_end_xfer = ~(heartbeat_0_nios_waits_for_read | heartbeat_0_nios_waits_for_write);

  //end_xfer_arb_share_counter_term_heartbeat_0_nios arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_heartbeat_0_nios = heartbeat_0_nios_end_xfer & (~heartbeat_0_nios_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //heartbeat_0_nios_arb_share_counter arbitration counter enable, which is an e_assign
  assign heartbeat_0_nios_arb_counter_enable = (end_xfer_arb_share_counter_term_heartbeat_0_nios & heartbeat_0_nios_allgrants) | (end_xfer_arb_share_counter_term_heartbeat_0_nios & ~heartbeat_0_nios_non_bursting_master_requests);

  //heartbeat_0_nios_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          heartbeat_0_nios_arb_share_counter <= 0;
      else if (heartbeat_0_nios_arb_counter_enable)
          heartbeat_0_nios_arb_share_counter <= heartbeat_0_nios_arb_share_counter_next_value;
    end


  //heartbeat_0_nios_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          heartbeat_0_nios_slavearbiterlockenable <= 0;
      else if ((|heartbeat_0_nios_master_qreq_vector & end_xfer_arb_share_counter_term_heartbeat_0_nios) | (end_xfer_arb_share_counter_term_heartbeat_0_nios & ~heartbeat_0_nios_non_bursting_master_requests))
          heartbeat_0_nios_slavearbiterlockenable <= |heartbeat_0_nios_arb_share_counter_next_value;
    end


  //cpu_0/data_master heartbeat_0/nios arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = heartbeat_0_nios_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //heartbeat_0_nios_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign heartbeat_0_nios_slavearbiterlockenable2 = |heartbeat_0_nios_arb_share_counter_next_value;

  //cpu_0/data_master heartbeat_0/nios arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = heartbeat_0_nios_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_avalon_master_0/master heartbeat_0/nios arbiterlock, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock = heartbeat_0_nios_slavearbiterlockenable & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master heartbeat_0/nios arbiterlock2, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock2 = heartbeat_0_nios_slavearbiterlockenable2 & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master granted heartbeat_0/nios last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_jtag_avalon_master_0_master_granted_slave_heartbeat_0_nios <= 0;
      else 
        last_cycle_jtag_avalon_master_0_master_granted_slave_heartbeat_0_nios <= jtag_avalon_master_0_saved_grant_heartbeat_0_nios ? 1 : (heartbeat_0_nios_arbitration_holdoff_internal | ~jtag_avalon_master_0_requests_heartbeat_0_nios) ? 0 : last_cycle_jtag_avalon_master_0_master_granted_slave_heartbeat_0_nios;
    end


  //jtag_avalon_master_0_master_continuerequest continued request, which is an e_mux
  assign jtag_avalon_master_0_master_continuerequest = last_cycle_jtag_avalon_master_0_master_granted_slave_heartbeat_0_nios & jtag_avalon_master_0_requests_heartbeat_0_nios;

  //heartbeat_0_nios_any_continuerequest at least one master continues requesting, which is an e_mux
  assign heartbeat_0_nios_any_continuerequest = jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_heartbeat_0_nios = cpu_0_data_master_requests_heartbeat_0_nios & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | jtag_avalon_master_0_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_heartbeat_0_nios, which is an e_mux
  assign cpu_0_data_master_read_data_valid_heartbeat_0_nios = cpu_0_data_master_granted_heartbeat_0_nios & cpu_0_data_master_read & ~heartbeat_0_nios_waits_for_read;

  //heartbeat_0_nios_writedata mux, which is an e_mux
  assign heartbeat_0_nios_writedata = (cpu_0_data_master_granted_heartbeat_0_nios)? cpu_0_data_master_writedata :
    jtag_avalon_master_0_master_writedata;

  assign jtag_avalon_master_0_requests_heartbeat_0_nios = ({jtag_avalon_master_0_master_address_to_slave[31 : 3] , 3'b0} == 32'h18) & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write);
  //cpu_0/data_master granted heartbeat_0/nios last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_heartbeat_0_nios <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_heartbeat_0_nios <= cpu_0_data_master_saved_grant_heartbeat_0_nios ? 1 : (heartbeat_0_nios_arbitration_holdoff_internal | ~cpu_0_data_master_requests_heartbeat_0_nios) ? 0 : last_cycle_cpu_0_data_master_granted_slave_heartbeat_0_nios;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_heartbeat_0_nios & cpu_0_data_master_requests_heartbeat_0_nios;

  assign jtag_avalon_master_0_qualified_request_heartbeat_0_nios = jtag_avalon_master_0_requests_heartbeat_0_nios & ~((jtag_avalon_master_0_master_read & ((jtag_avalon_master_0_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid jtag_avalon_master_0_read_data_valid_heartbeat_0_nios, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_heartbeat_0_nios = jtag_avalon_master_0_granted_heartbeat_0_nios & jtag_avalon_master_0_master_read & ~heartbeat_0_nios_waits_for_read;

  //allow new arb cycle for heartbeat_0/nios, which is an e_assign
  assign heartbeat_0_nios_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~jtag_avalon_master_0_master_arbiterlock;

  //jtag_avalon_master_0/master assignment into master qualified-requests vector for heartbeat_0/nios, which is an e_assign
  assign heartbeat_0_nios_master_qreq_vector[0] = jtag_avalon_master_0_qualified_request_heartbeat_0_nios;

  //jtag_avalon_master_0/master grant heartbeat_0/nios, which is an e_assign
  assign jtag_avalon_master_0_granted_heartbeat_0_nios = heartbeat_0_nios_grant_vector[0];

  //jtag_avalon_master_0/master saved-grant heartbeat_0/nios, which is an e_assign
  assign jtag_avalon_master_0_saved_grant_heartbeat_0_nios = heartbeat_0_nios_arb_winner[0] && jtag_avalon_master_0_requests_heartbeat_0_nios;

  //cpu_0/data_master assignment into master qualified-requests vector for heartbeat_0/nios, which is an e_assign
  assign heartbeat_0_nios_master_qreq_vector[1] = cpu_0_data_master_qualified_request_heartbeat_0_nios;

  //cpu_0/data_master grant heartbeat_0/nios, which is an e_assign
  assign cpu_0_data_master_granted_heartbeat_0_nios = heartbeat_0_nios_grant_vector[1];

  //cpu_0/data_master saved-grant heartbeat_0/nios, which is an e_assign
  assign cpu_0_data_master_saved_grant_heartbeat_0_nios = heartbeat_0_nios_arb_winner[1] && cpu_0_data_master_requests_heartbeat_0_nios;

  //heartbeat_0/nios chosen-master double-vector, which is an e_assign
  assign heartbeat_0_nios_chosen_master_double_vector = {heartbeat_0_nios_master_qreq_vector, heartbeat_0_nios_master_qreq_vector} & ({~heartbeat_0_nios_master_qreq_vector, ~heartbeat_0_nios_master_qreq_vector} + heartbeat_0_nios_arb_addend);

  //stable onehot encoding of arb winner
  assign heartbeat_0_nios_arb_winner = (heartbeat_0_nios_allow_new_arb_cycle & | heartbeat_0_nios_grant_vector) ? heartbeat_0_nios_grant_vector : heartbeat_0_nios_saved_chosen_master_vector;

  //saved heartbeat_0_nios_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          heartbeat_0_nios_saved_chosen_master_vector <= 0;
      else if (heartbeat_0_nios_allow_new_arb_cycle)
          heartbeat_0_nios_saved_chosen_master_vector <= |heartbeat_0_nios_grant_vector ? heartbeat_0_nios_grant_vector : heartbeat_0_nios_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign heartbeat_0_nios_grant_vector = {(heartbeat_0_nios_chosen_master_double_vector[1] | heartbeat_0_nios_chosen_master_double_vector[3]),
    (heartbeat_0_nios_chosen_master_double_vector[0] | heartbeat_0_nios_chosen_master_double_vector[2])};

  //heartbeat_0/nios chosen master rotated left, which is an e_assign
  assign heartbeat_0_nios_chosen_master_rot_left = (heartbeat_0_nios_arb_winner << 1) ? (heartbeat_0_nios_arb_winner << 1) : 1;

  //heartbeat_0/nios's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          heartbeat_0_nios_arb_addend <= 1;
      else if (|heartbeat_0_nios_grant_vector)
          heartbeat_0_nios_arb_addend <= heartbeat_0_nios_end_xfer? heartbeat_0_nios_chosen_master_rot_left : heartbeat_0_nios_grant_vector;
    end


  //heartbeat_0_nios_reset_n assignment, which is an e_assign
  assign heartbeat_0_nios_reset_n = reset_n;

  assign heartbeat_0_nios_chipselect_n = ~(cpu_0_data_master_granted_heartbeat_0_nios | jtag_avalon_master_0_granted_heartbeat_0_nios);
  //heartbeat_0_nios_firsttransfer first transaction, which is an e_assign
  assign heartbeat_0_nios_firsttransfer = heartbeat_0_nios_begins_xfer ? heartbeat_0_nios_unreg_firsttransfer : heartbeat_0_nios_reg_firsttransfer;

  //heartbeat_0_nios_unreg_firsttransfer first transaction, which is an e_assign
  assign heartbeat_0_nios_unreg_firsttransfer = ~(heartbeat_0_nios_slavearbiterlockenable & heartbeat_0_nios_any_continuerequest);

  //heartbeat_0_nios_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          heartbeat_0_nios_reg_firsttransfer <= 1'b1;
      else if (heartbeat_0_nios_begins_xfer)
          heartbeat_0_nios_reg_firsttransfer <= heartbeat_0_nios_unreg_firsttransfer;
    end


  //heartbeat_0_nios_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign heartbeat_0_nios_beginbursttransfer_internal = heartbeat_0_nios_begins_xfer;

  //heartbeat_0_nios_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign heartbeat_0_nios_arbitration_holdoff_internal = heartbeat_0_nios_begins_xfer & heartbeat_0_nios_firsttransfer;

  //~heartbeat_0_nios_read_n assignment, which is an e_mux
  assign heartbeat_0_nios_read_n = ~((cpu_0_data_master_granted_heartbeat_0_nios & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_heartbeat_0_nios & jtag_avalon_master_0_master_read));

  //~heartbeat_0_nios_write_n assignment, which is an e_mux
  assign heartbeat_0_nios_write_n = ~((cpu_0_data_master_granted_heartbeat_0_nios & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_heartbeat_0_nios & jtag_avalon_master_0_master_write));

  assign shifted_address_to_heartbeat_0_nios_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //heartbeat_0_nios_address mux, which is an e_mux
  assign heartbeat_0_nios_address = (cpu_0_data_master_granted_heartbeat_0_nios)? (shifted_address_to_heartbeat_0_nios_from_cpu_0_data_master >> 2) :
    (shifted_address_to_heartbeat_0_nios_from_jtag_avalon_master_0_master >> 2);

  assign shifted_address_to_heartbeat_0_nios_from_jtag_avalon_master_0_master = jtag_avalon_master_0_master_address_to_slave;
  //d1_heartbeat_0_nios_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_heartbeat_0_nios_end_xfer <= 1;
      else 
        d1_heartbeat_0_nios_end_xfer <= heartbeat_0_nios_end_xfer;
    end


  //heartbeat_0_nios_waits_for_read in a cycle, which is an e_mux
  assign heartbeat_0_nios_waits_for_read = heartbeat_0_nios_in_a_read_cycle & heartbeat_0_nios_begins_xfer;

  //heartbeat_0_nios_in_a_read_cycle assignment, which is an e_assign
  assign heartbeat_0_nios_in_a_read_cycle = (cpu_0_data_master_granted_heartbeat_0_nios & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_heartbeat_0_nios & jtag_avalon_master_0_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = heartbeat_0_nios_in_a_read_cycle;

  //heartbeat_0_nios_waits_for_write in a cycle, which is an e_mux
  assign heartbeat_0_nios_waits_for_write = heartbeat_0_nios_in_a_write_cycle & 0;

  //heartbeat_0_nios_in_a_write_cycle assignment, which is an e_assign
  assign heartbeat_0_nios_in_a_write_cycle = (cpu_0_data_master_granted_heartbeat_0_nios & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_heartbeat_0_nios & jtag_avalon_master_0_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = heartbeat_0_nios_in_a_write_cycle;

  assign wait_for_heartbeat_0_nios_counter = 0;
  //assign heartbeat_0_nios_irq_from_sa = heartbeat_0_nios_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign heartbeat_0_nios_irq_from_sa = heartbeat_0_nios_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //heartbeat_0/nios enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_heartbeat_0_nios + jtag_avalon_master_0_granted_heartbeat_0_nios > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_heartbeat_0_nios + jtag_avalon_master_0_saved_grant_heartbeat_0_nios > 1)
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

module jtag_avalon_master_0_master_arbitrator (
                                                // inputs:
                                                 clk,
                                                 d1_heartbeat_0_nios_end_xfer,
                                                 d1_nios_bts_port_ddr2_x40_0_nios_end_xfer,
                                                 d1_onchip_memory2_0_s1_end_xfer,
                                                 d1_product_info_0_avalon_slave_0_end_xfer,
                                                 d1_sc_inf_0_nios_end_xfer,
                                                 d1_timer_0_s1_end_xfer,
                                                 heartbeat_0_nios_readdata_from_sa,
                                                 jtag_avalon_master_0_granted_heartbeat_0_nios,
                                                 jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios,
                                                 jtag_avalon_master_0_granted_onchip_memory2_0_s1,
                                                 jtag_avalon_master_0_granted_product_info_0_avalon_slave_0,
                                                 jtag_avalon_master_0_granted_sc_inf_0_nios,
                                                 jtag_avalon_master_0_granted_timer_0_s1,
                                                 jtag_avalon_master_0_master_address,
                                                 jtag_avalon_master_0_master_byteenable,
                                                 jtag_avalon_master_0_master_read,
                                                 jtag_avalon_master_0_master_write,
                                                 jtag_avalon_master_0_master_writedata,
                                                 jtag_avalon_master_0_qualified_request_heartbeat_0_nios,
                                                 jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios,
                                                 jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1,
                                                 jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0,
                                                 jtag_avalon_master_0_qualified_request_sc_inf_0_nios,
                                                 jtag_avalon_master_0_qualified_request_timer_0_s1,
                                                 jtag_avalon_master_0_read_data_valid_heartbeat_0_nios,
                                                 jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios,
                                                 jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1,
                                                 jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0,
                                                 jtag_avalon_master_0_read_data_valid_sc_inf_0_nios,
                                                 jtag_avalon_master_0_read_data_valid_timer_0_s1,
                                                 jtag_avalon_master_0_requests_heartbeat_0_nios,
                                                 jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios,
                                                 jtag_avalon_master_0_requests_onchip_memory2_0_s1,
                                                 jtag_avalon_master_0_requests_product_info_0_avalon_slave_0,
                                                 jtag_avalon_master_0_requests_sc_inf_0_nios,
                                                 jtag_avalon_master_0_requests_timer_0_s1,
                                                 nios_bts_port_ddr2_x40_0_nios_readdata_from_sa,
                                                 nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa,
                                                 onchip_memory2_0_s1_readdata_from_sa,
                                                 product_info_0_avalon_slave_0_readdata_from_sa,
                                                 reset_n,
                                                 sc_inf_0_nios_readdata_from_sa,
                                                 timer_0_s1_readdata_from_sa,

                                                // outputs:
                                                 jtag_avalon_master_0_latency_counter,
                                                 jtag_avalon_master_0_master_address_to_slave,
                                                 jtag_avalon_master_0_master_readdata,
                                                 jtag_avalon_master_0_master_readdatavalid,
                                                 jtag_avalon_master_0_master_reset,
                                                 jtag_avalon_master_0_master_waitrequest
                                              )
;

  output           jtag_avalon_master_0_latency_counter;
  output  [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  output  [ 31: 0] jtag_avalon_master_0_master_readdata;
  output           jtag_avalon_master_0_master_readdatavalid;
  output           jtag_avalon_master_0_master_reset;
  output           jtag_avalon_master_0_master_waitrequest;
  input            clk;
  input            d1_heartbeat_0_nios_end_xfer;
  input            d1_nios_bts_port_ddr2_x40_0_nios_end_xfer;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input            d1_product_info_0_avalon_slave_0_end_xfer;
  input            d1_sc_inf_0_nios_end_xfer;
  input            d1_timer_0_s1_end_xfer;
  input   [ 31: 0] heartbeat_0_nios_readdata_from_sa;
  input            jtag_avalon_master_0_granted_heartbeat_0_nios;
  input            jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios;
  input            jtag_avalon_master_0_granted_onchip_memory2_0_s1;
  input            jtag_avalon_master_0_granted_product_info_0_avalon_slave_0;
  input            jtag_avalon_master_0_granted_sc_inf_0_nios;
  input            jtag_avalon_master_0_granted_timer_0_s1;
  input   [ 31: 0] jtag_avalon_master_0_master_address;
  input   [  3: 0] jtag_avalon_master_0_master_byteenable;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] jtag_avalon_master_0_master_writedata;
  input            jtag_avalon_master_0_qualified_request_heartbeat_0_nios;
  input            jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  input            jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1;
  input            jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0;
  input            jtag_avalon_master_0_qualified_request_sc_inf_0_nios;
  input            jtag_avalon_master_0_qualified_request_timer_0_s1;
  input            jtag_avalon_master_0_read_data_valid_heartbeat_0_nios;
  input            jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  input            jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1;
  input            jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0;
  input            jtag_avalon_master_0_read_data_valid_sc_inf_0_nios;
  input            jtag_avalon_master_0_read_data_valid_timer_0_s1;
  input            jtag_avalon_master_0_requests_heartbeat_0_nios;
  input            jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;
  input            jtag_avalon_master_0_requests_onchip_memory2_0_s1;
  input            jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;
  input            jtag_avalon_master_0_requests_sc_inf_0_nios;
  input            jtag_avalon_master_0_requests_timer_0_s1;
  input   [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata_from_sa;
  input            nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input   [ 31: 0] product_info_0_avalon_slave_0_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] sc_inf_0_nios_readdata_from_sa;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg              jtag_avalon_master_0_latency_counter;
  reg     [ 31: 0] jtag_avalon_master_0_master_address_last_time;
  wire    [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  reg     [  3: 0] jtag_avalon_master_0_master_byteenable_last_time;
  wire             jtag_avalon_master_0_master_is_granted_some_slave;
  reg              jtag_avalon_master_0_master_read_but_no_slave_selected;
  reg              jtag_avalon_master_0_master_read_last_time;
  wire    [ 31: 0] jtag_avalon_master_0_master_readdata;
  wire             jtag_avalon_master_0_master_readdatavalid;
  wire             jtag_avalon_master_0_master_reset;
  wire             jtag_avalon_master_0_master_run;
  wire             jtag_avalon_master_0_master_waitrequest;
  reg              jtag_avalon_master_0_master_write_last_time;
  reg     [ 31: 0] jtag_avalon_master_0_master_writedata_last_time;
  wire             latency_load_value;
  wire             p1_jtag_avalon_master_0_latency_counter;
  wire             pre_flush_jtag_avalon_master_0_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (jtag_avalon_master_0_qualified_request_heartbeat_0_nios | ~jtag_avalon_master_0_requests_heartbeat_0_nios) & (jtag_avalon_master_0_granted_heartbeat_0_nios | ~jtag_avalon_master_0_qualified_request_heartbeat_0_nios) & ((~jtag_avalon_master_0_qualified_request_heartbeat_0_nios | ~jtag_avalon_master_0_master_read | (1 & ~d1_heartbeat_0_nios_end_xfer & jtag_avalon_master_0_master_read))) & ((~jtag_avalon_master_0_qualified_request_heartbeat_0_nios | ~jtag_avalon_master_0_master_write | (1 & jtag_avalon_master_0_master_write))) & 1 & (jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios | ~jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios) & (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios | ~jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios) & ((~jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios | ~(jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write) | (1 & ~nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write)))) & ((~jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios | ~(jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write) | (1 & ~nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign jtag_avalon_master_0_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1 | ~jtag_avalon_master_0_requests_onchip_memory2_0_s1) & (jtag_avalon_master_0_granted_onchip_memory2_0_s1 | ~jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1) & ((~jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1 | ~(jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write) | (1 & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write)))) & ((~jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1 | ~(jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write) | (1 & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write)))) & 1 & (jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 | ~jtag_avalon_master_0_requests_product_info_0_avalon_slave_0) & (jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 | ~jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0) & ((~jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 | ~jtag_avalon_master_0_master_read | (1 & ~d1_product_info_0_avalon_slave_0_end_xfer & jtag_avalon_master_0_master_read))) & ((~jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 | ~jtag_avalon_master_0_master_write | (1 & jtag_avalon_master_0_master_write))) & 1 & (jtag_avalon_master_0_qualified_request_sc_inf_0_nios | ~jtag_avalon_master_0_requests_sc_inf_0_nios) & (jtag_avalon_master_0_granted_sc_inf_0_nios | ~jtag_avalon_master_0_qualified_request_sc_inf_0_nios) & ((~jtag_avalon_master_0_qualified_request_sc_inf_0_nios | ~jtag_avalon_master_0_master_read | (1 & ~d1_sc_inf_0_nios_end_xfer & jtag_avalon_master_0_master_read))) & ((~jtag_avalon_master_0_qualified_request_sc_inf_0_nios | ~jtag_avalon_master_0_master_write | (1 & jtag_avalon_master_0_master_write))) & 1 & (jtag_avalon_master_0_qualified_request_timer_0_s1 | ~jtag_avalon_master_0_requests_timer_0_s1) & (jtag_avalon_master_0_granted_timer_0_s1 | ~jtag_avalon_master_0_qualified_request_timer_0_s1) & ((~jtag_avalon_master_0_qualified_request_timer_0_s1 | ~jtag_avalon_master_0_master_read | (1 & ~d1_timer_0_s1_end_xfer & jtag_avalon_master_0_master_read))) & ((~jtag_avalon_master_0_qualified_request_timer_0_s1 | ~jtag_avalon_master_0_master_write | (1 & jtag_avalon_master_0_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign jtag_avalon_master_0_master_address_to_slave = {8'b0,
    jtag_avalon_master_0_master_address[23],
    1'b0,
    jtag_avalon_master_0_master_address[21 : 0]};

  //jtag_avalon_master_0_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_master_read_but_no_slave_selected <= 0;
      else 
        jtag_avalon_master_0_master_read_but_no_slave_selected <= jtag_avalon_master_0_master_read & jtag_avalon_master_0_master_run & ~jtag_avalon_master_0_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign jtag_avalon_master_0_master_is_granted_some_slave = jtag_avalon_master_0_granted_heartbeat_0_nios |
    jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios |
    jtag_avalon_master_0_granted_onchip_memory2_0_s1 |
    jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 |
    jtag_avalon_master_0_granted_sc_inf_0_nios |
    jtag_avalon_master_0_granted_timer_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_jtag_avalon_master_0_master_readdatavalid = jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign jtag_avalon_master_0_master_readdatavalid = jtag_avalon_master_0_master_read_but_no_slave_selected |
    pre_flush_jtag_avalon_master_0_master_readdatavalid |
    jtag_avalon_master_0_read_data_valid_heartbeat_0_nios |
    jtag_avalon_master_0_master_read_but_no_slave_selected |
    pre_flush_jtag_avalon_master_0_master_readdatavalid |
    jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios |
    jtag_avalon_master_0_master_read_but_no_slave_selected |
    pre_flush_jtag_avalon_master_0_master_readdatavalid |
    jtag_avalon_master_0_master_read_but_no_slave_selected |
    pre_flush_jtag_avalon_master_0_master_readdatavalid |
    jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0 |
    jtag_avalon_master_0_master_read_but_no_slave_selected |
    pre_flush_jtag_avalon_master_0_master_readdatavalid |
    jtag_avalon_master_0_read_data_valid_sc_inf_0_nios |
    jtag_avalon_master_0_master_read_but_no_slave_selected |
    pre_flush_jtag_avalon_master_0_master_readdatavalid |
    jtag_avalon_master_0_read_data_valid_timer_0_s1;

  //jtag_avalon_master_0/master readdata mux, which is an e_mux
  assign jtag_avalon_master_0_master_readdata = ({32 {~(jtag_avalon_master_0_qualified_request_heartbeat_0_nios & jtag_avalon_master_0_master_read)}} | heartbeat_0_nios_readdata_from_sa) &
    ({32 {~(jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_master_read)}} | nios_bts_port_ddr2_x40_0_nios_readdata_from_sa) &
    ({32 {~jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1}} | onchip_memory2_0_s1_readdata_from_sa) &
    ({32 {~(jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 & jtag_avalon_master_0_master_read)}} | product_info_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~(jtag_avalon_master_0_qualified_request_sc_inf_0_nios & jtag_avalon_master_0_master_read)}} | sc_inf_0_nios_readdata_from_sa) &
    ({32 {~(jtag_avalon_master_0_qualified_request_timer_0_s1 & jtag_avalon_master_0_master_read)}} | timer_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign jtag_avalon_master_0_master_waitrequest = ~jtag_avalon_master_0_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_latency_counter <= 0;
      else 
        jtag_avalon_master_0_latency_counter <= p1_jtag_avalon_master_0_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_jtag_avalon_master_0_latency_counter = ((jtag_avalon_master_0_master_run & jtag_avalon_master_0_master_read))? latency_load_value :
    (jtag_avalon_master_0_latency_counter)? jtag_avalon_master_0_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {jtag_avalon_master_0_requests_onchip_memory2_0_s1}} & 1;

  //~jtag_avalon_master_0_master_reset assignment, which is an e_assign
  assign jtag_avalon_master_0_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_avalon_master_0_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_master_address_last_time <= 0;
      else 
        jtag_avalon_master_0_master_address_last_time <= jtag_avalon_master_0_master_address;
    end


  //jtag_avalon_master_0/master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= jtag_avalon_master_0_master_waitrequest & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write);
    end


  //jtag_avalon_master_0_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (jtag_avalon_master_0_master_address != jtag_avalon_master_0_master_address_last_time))
        begin
          $write("%0d ns: jtag_avalon_master_0_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //jtag_avalon_master_0_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_master_byteenable_last_time <= 0;
      else 
        jtag_avalon_master_0_master_byteenable_last_time <= jtag_avalon_master_0_master_byteenable;
    end


  //jtag_avalon_master_0_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (jtag_avalon_master_0_master_byteenable != jtag_avalon_master_0_master_byteenable_last_time))
        begin
          $write("%0d ns: jtag_avalon_master_0_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //jtag_avalon_master_0_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_master_read_last_time <= 0;
      else 
        jtag_avalon_master_0_master_read_last_time <= jtag_avalon_master_0_master_read;
    end


  //jtag_avalon_master_0_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (jtag_avalon_master_0_master_read != jtag_avalon_master_0_master_read_last_time))
        begin
          $write("%0d ns: jtag_avalon_master_0_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //jtag_avalon_master_0_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_master_write_last_time <= 0;
      else 
        jtag_avalon_master_0_master_write_last_time <= jtag_avalon_master_0_master_write;
    end


  //jtag_avalon_master_0_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (jtag_avalon_master_0_master_write != jtag_avalon_master_0_master_write_last_time))
        begin
          $write("%0d ns: jtag_avalon_master_0_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //jtag_avalon_master_0_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_master_writedata_last_time <= 0;
      else 
        jtag_avalon_master_0_master_writedata_last_time <= jtag_avalon_master_0_master_writedata;
    end


  //jtag_avalon_master_0_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (jtag_avalon_master_0_master_writedata != jtag_avalon_master_0_master_writedata_last_time) & jtag_avalon_master_0_master_write)
        begin
          $write("%0d ns: jtag_avalon_master_0_master_writedata did not heed wait!!!", $time);
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

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_latency_counter,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 23: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[23 : 3] , 3'b0} == 24'h10) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))));
  //local readdatavalid cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read & ~jtag_uart_0_avalon_jtag_slave_waits_for_read;

  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
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

module nios_bts_port_ddr2_x40_0_nios_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_latency_counter,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_avalon_master_0_latency_counter,
                                                   jtag_avalon_master_0_master_address_to_slave,
                                                   jtag_avalon_master_0_master_read,
                                                   jtag_avalon_master_0_master_write,
                                                   jtag_avalon_master_0_master_writedata,
                                                   nios_bts_port_ddr2_x40_0_nios_irq,
                                                   nios_bts_port_ddr2_x40_0_nios_readdata,
                                                   nios_bts_port_ddr2_x40_0_nios_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios,
                                                   cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios,
                                                   cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios,
                                                   cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios,
                                                   d1_nios_bts_port_ddr2_x40_0_nios_end_xfer,
                                                   jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios,
                                                   jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios,
                                                   jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios,
                                                   jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios,
                                                   nios_bts_port_ddr2_x40_0_nios_address,
                                                   nios_bts_port_ddr2_x40_0_nios_chipselect,
                                                   nios_bts_port_ddr2_x40_0_nios_irq_from_sa,
                                                   nios_bts_port_ddr2_x40_0_nios_read,
                                                   nios_bts_port_ddr2_x40_0_nios_readdata_from_sa,
                                                   nios_bts_port_ddr2_x40_0_nios_reset_n,
                                                   nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa,
                                                   nios_bts_port_ddr2_x40_0_nios_write,
                                                   nios_bts_port_ddr2_x40_0_nios_writedata
                                                )
;

  output           cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios;
  output           cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  output           cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  output           cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios;
  output           d1_nios_bts_port_ddr2_x40_0_nios_end_xfer;
  output           jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios;
  output           jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  output           jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  output           jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;
  output  [ 19: 0] nios_bts_port_ddr2_x40_0_nios_address;
  output           nios_bts_port_ddr2_x40_0_nios_chipselect;
  output           nios_bts_port_ddr2_x40_0_nios_irq_from_sa;
  output           nios_bts_port_ddr2_x40_0_nios_read;
  output  [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata_from_sa;
  output           nios_bts_port_ddr2_x40_0_nios_reset_n;
  output           nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;
  output           nios_bts_port_ddr2_x40_0_nios_write;
  output  [ 31: 0] nios_bts_port_ddr2_x40_0_nios_writedata;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_avalon_master_0_latency_counter;
  input   [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] jtag_avalon_master_0_master_writedata;
  input            nios_bts_port_ddr2_x40_0_nios_irq;
  input   [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata;
  input            nios_bts_port_ddr2_x40_0_nios_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_saved_grant_nios_bts_port_ddr2_x40_0_nios;
  reg              d1_nios_bts_port_ddr2_x40_0_nios_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_master_arbiterlock;
  wire             jtag_avalon_master_0_master_arbiterlock2;
  wire             jtag_avalon_master_0_master_continuerequest;
  wire             jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_saved_grant_nios_bts_port_ddr2_x40_0_nios;
  reg              last_cycle_cpu_0_data_master_granted_slave_nios_bts_port_ddr2_x40_0_nios;
  reg              last_cycle_jtag_avalon_master_0_master_granted_slave_nios_bts_port_ddr2_x40_0_nios;
  wire    [ 19: 0] nios_bts_port_ddr2_x40_0_nios_address;
  wire             nios_bts_port_ddr2_x40_0_nios_allgrants;
  wire             nios_bts_port_ddr2_x40_0_nios_allow_new_arb_cycle;
  wire             nios_bts_port_ddr2_x40_0_nios_any_bursting_master_saved_grant;
  wire             nios_bts_port_ddr2_x40_0_nios_any_continuerequest;
  reg     [  1: 0] nios_bts_port_ddr2_x40_0_nios_arb_addend;
  wire             nios_bts_port_ddr2_x40_0_nios_arb_counter_enable;
  reg              nios_bts_port_ddr2_x40_0_nios_arb_share_counter;
  wire             nios_bts_port_ddr2_x40_0_nios_arb_share_counter_next_value;
  wire             nios_bts_port_ddr2_x40_0_nios_arb_share_set_values;
  wire    [  1: 0] nios_bts_port_ddr2_x40_0_nios_arb_winner;
  wire             nios_bts_port_ddr2_x40_0_nios_arbitration_holdoff_internal;
  wire             nios_bts_port_ddr2_x40_0_nios_beginbursttransfer_internal;
  wire             nios_bts_port_ddr2_x40_0_nios_begins_xfer;
  wire             nios_bts_port_ddr2_x40_0_nios_chipselect;
  wire    [  3: 0] nios_bts_port_ddr2_x40_0_nios_chosen_master_double_vector;
  wire    [  1: 0] nios_bts_port_ddr2_x40_0_nios_chosen_master_rot_left;
  wire             nios_bts_port_ddr2_x40_0_nios_end_xfer;
  wire             nios_bts_port_ddr2_x40_0_nios_firsttransfer;
  wire    [  1: 0] nios_bts_port_ddr2_x40_0_nios_grant_vector;
  wire             nios_bts_port_ddr2_x40_0_nios_in_a_read_cycle;
  wire             nios_bts_port_ddr2_x40_0_nios_in_a_write_cycle;
  wire             nios_bts_port_ddr2_x40_0_nios_irq_from_sa;
  wire    [  1: 0] nios_bts_port_ddr2_x40_0_nios_master_qreq_vector;
  wire             nios_bts_port_ddr2_x40_0_nios_non_bursting_master_requests;
  wire             nios_bts_port_ddr2_x40_0_nios_read;
  wire    [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata_from_sa;
  reg              nios_bts_port_ddr2_x40_0_nios_reg_firsttransfer;
  wire             nios_bts_port_ddr2_x40_0_nios_reset_n;
  reg     [  1: 0] nios_bts_port_ddr2_x40_0_nios_saved_chosen_master_vector;
  reg              nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable;
  wire             nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable2;
  wire             nios_bts_port_ddr2_x40_0_nios_unreg_firsttransfer;
  wire             nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;
  wire             nios_bts_port_ddr2_x40_0_nios_waits_for_read;
  wire             nios_bts_port_ddr2_x40_0_nios_waits_for_write;
  wire             nios_bts_port_ddr2_x40_0_nios_write;
  wire    [ 31: 0] nios_bts_port_ddr2_x40_0_nios_writedata;
  wire    [ 23: 0] shifted_address_to_nios_bts_port_ddr2_x40_0_nios_from_cpu_0_data_master;
  wire    [ 31: 0] shifted_address_to_nios_bts_port_ddr2_x40_0_nios_from_jtag_avalon_master_0_master;
  wire             wait_for_nios_bts_port_ddr2_x40_0_nios_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~nios_bts_port_ddr2_x40_0_nios_end_xfer;
    end


  assign nios_bts_port_ddr2_x40_0_nios_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios | jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios));
  //assign nios_bts_port_ddr2_x40_0_nios_readdata_from_sa = nios_bts_port_ddr2_x40_0_nios_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_readdata_from_sa = nios_bts_port_ddr2_x40_0_nios_readdata;

  assign cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios = ({cpu_0_data_master_address_to_slave[23 : 22] , 22'b0} == 24'h800000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa = nios_bts_port_ddr2_x40_0_nios_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa = nios_bts_port_ddr2_x40_0_nios_waitrequest;

  //nios_bts_port_ddr2_x40_0_nios_arb_share_counter set values, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_arb_share_set_values = 1;

  //nios_bts_port_ddr2_x40_0_nios_non_bursting_master_requests mux, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_non_bursting_master_requests = cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios |
    jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios |
    cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios |
    jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;

  //nios_bts_port_ddr2_x40_0_nios_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_any_bursting_master_saved_grant = 0;

  //nios_bts_port_ddr2_x40_0_nios_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_arb_share_counter_next_value = nios_bts_port_ddr2_x40_0_nios_firsttransfer ? (nios_bts_port_ddr2_x40_0_nios_arb_share_set_values - 1) : |nios_bts_port_ddr2_x40_0_nios_arb_share_counter ? (nios_bts_port_ddr2_x40_0_nios_arb_share_counter - 1) : 0;

  //nios_bts_port_ddr2_x40_0_nios_allgrants all slave grants, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_allgrants = (|nios_bts_port_ddr2_x40_0_nios_grant_vector) |
    (|nios_bts_port_ddr2_x40_0_nios_grant_vector) |
    (|nios_bts_port_ddr2_x40_0_nios_grant_vector) |
    (|nios_bts_port_ddr2_x40_0_nios_grant_vector);

  //nios_bts_port_ddr2_x40_0_nios_end_xfer assignment, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_end_xfer = ~(nios_bts_port_ddr2_x40_0_nios_waits_for_read | nios_bts_port_ddr2_x40_0_nios_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios = nios_bts_port_ddr2_x40_0_nios_end_xfer & (~nios_bts_port_ddr2_x40_0_nios_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_bts_port_ddr2_x40_0_nios_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios & nios_bts_port_ddr2_x40_0_nios_allgrants) | (end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios & ~nios_bts_port_ddr2_x40_0_nios_non_bursting_master_requests);

  //nios_bts_port_ddr2_x40_0_nios_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_bts_port_ddr2_x40_0_nios_arb_share_counter <= 0;
      else if (nios_bts_port_ddr2_x40_0_nios_arb_counter_enable)
          nios_bts_port_ddr2_x40_0_nios_arb_share_counter <= nios_bts_port_ddr2_x40_0_nios_arb_share_counter_next_value;
    end


  //nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable <= 0;
      else if ((|nios_bts_port_ddr2_x40_0_nios_master_qreq_vector & end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios) | (end_xfer_arb_share_counter_term_nios_bts_port_ddr2_x40_0_nios & ~nios_bts_port_ddr2_x40_0_nios_non_bursting_master_requests))
          nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable <= |nios_bts_port_ddr2_x40_0_nios_arb_share_counter_next_value;
    end


  //cpu_0/data_master nios_bts_port_ddr2_x40_0/nios arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable2 = |nios_bts_port_ddr2_x40_0_nios_arb_share_counter_next_value;

  //cpu_0/data_master nios_bts_port_ddr2_x40_0/nios arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_avalon_master_0/master nios_bts_port_ddr2_x40_0/nios arbiterlock, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock = nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master nios_bts_port_ddr2_x40_0/nios arbiterlock2, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock2 = nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable2 & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master granted nios_bts_port_ddr2_x40_0/nios last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_jtag_avalon_master_0_master_granted_slave_nios_bts_port_ddr2_x40_0_nios <= 0;
      else 
        last_cycle_jtag_avalon_master_0_master_granted_slave_nios_bts_port_ddr2_x40_0_nios <= jtag_avalon_master_0_saved_grant_nios_bts_port_ddr2_x40_0_nios ? 1 : (nios_bts_port_ddr2_x40_0_nios_arbitration_holdoff_internal | ~jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios) ? 0 : last_cycle_jtag_avalon_master_0_master_granted_slave_nios_bts_port_ddr2_x40_0_nios;
    end


  //jtag_avalon_master_0_master_continuerequest continued request, which is an e_mux
  assign jtag_avalon_master_0_master_continuerequest = last_cycle_jtag_avalon_master_0_master_granted_slave_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;

  //nios_bts_port_ddr2_x40_0_nios_any_continuerequest at least one master continues requesting, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_any_continuerequest = jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios = cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | jtag_avalon_master_0_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios, which is an e_mux
  assign cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios = cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_read & ~nios_bts_port_ddr2_x40_0_nios_waits_for_read;

  //nios_bts_port_ddr2_x40_0_nios_writedata mux, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_writedata = (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios)? cpu_0_data_master_writedata :
    jtag_avalon_master_0_master_writedata;

  assign jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios = ({jtag_avalon_master_0_master_address_to_slave[31 : 22] , 22'b0} == 32'h800000) & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write);
  //cpu_0/data_master granted nios_bts_port_ddr2_x40_0/nios last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_nios_bts_port_ddr2_x40_0_nios <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_nios_bts_port_ddr2_x40_0_nios <= cpu_0_data_master_saved_grant_nios_bts_port_ddr2_x40_0_nios ? 1 : (nios_bts_port_ddr2_x40_0_nios_arbitration_holdoff_internal | ~cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios) ? 0 : last_cycle_cpu_0_data_master_granted_slave_nios_bts_port_ddr2_x40_0_nios;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios;

  assign jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios = jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios & ~((jtag_avalon_master_0_master_read & ((jtag_avalon_master_0_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios = jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_master_read & ~nios_bts_port_ddr2_x40_0_nios_waits_for_read;

  //allow new arb cycle for nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~jtag_avalon_master_0_master_arbiterlock;

  //jtag_avalon_master_0/master assignment into master qualified-requests vector for nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_master_qreq_vector[0] = jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios;

  //jtag_avalon_master_0/master grant nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios = nios_bts_port_ddr2_x40_0_nios_grant_vector[0];

  //jtag_avalon_master_0/master saved-grant nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign jtag_avalon_master_0_saved_grant_nios_bts_port_ddr2_x40_0_nios = nios_bts_port_ddr2_x40_0_nios_arb_winner[0] && jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;

  //cpu_0/data_master assignment into master qualified-requests vector for nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_master_qreq_vector[1] = cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios;

  //cpu_0/data_master grant nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios = nios_bts_port_ddr2_x40_0_nios_grant_vector[1];

  //cpu_0/data_master saved-grant nios_bts_port_ddr2_x40_0/nios, which is an e_assign
  assign cpu_0_data_master_saved_grant_nios_bts_port_ddr2_x40_0_nios = nios_bts_port_ddr2_x40_0_nios_arb_winner[1] && cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios;

  //nios_bts_port_ddr2_x40_0/nios chosen-master double-vector, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_chosen_master_double_vector = {nios_bts_port_ddr2_x40_0_nios_master_qreq_vector, nios_bts_port_ddr2_x40_0_nios_master_qreq_vector} & ({~nios_bts_port_ddr2_x40_0_nios_master_qreq_vector, ~nios_bts_port_ddr2_x40_0_nios_master_qreq_vector} + nios_bts_port_ddr2_x40_0_nios_arb_addend);

  //stable onehot encoding of arb winner
  assign nios_bts_port_ddr2_x40_0_nios_arb_winner = (nios_bts_port_ddr2_x40_0_nios_allow_new_arb_cycle & | nios_bts_port_ddr2_x40_0_nios_grant_vector) ? nios_bts_port_ddr2_x40_0_nios_grant_vector : nios_bts_port_ddr2_x40_0_nios_saved_chosen_master_vector;

  //saved nios_bts_port_ddr2_x40_0_nios_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_bts_port_ddr2_x40_0_nios_saved_chosen_master_vector <= 0;
      else if (nios_bts_port_ddr2_x40_0_nios_allow_new_arb_cycle)
          nios_bts_port_ddr2_x40_0_nios_saved_chosen_master_vector <= |nios_bts_port_ddr2_x40_0_nios_grant_vector ? nios_bts_port_ddr2_x40_0_nios_grant_vector : nios_bts_port_ddr2_x40_0_nios_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign nios_bts_port_ddr2_x40_0_nios_grant_vector = {(nios_bts_port_ddr2_x40_0_nios_chosen_master_double_vector[1] | nios_bts_port_ddr2_x40_0_nios_chosen_master_double_vector[3]),
    (nios_bts_port_ddr2_x40_0_nios_chosen_master_double_vector[0] | nios_bts_port_ddr2_x40_0_nios_chosen_master_double_vector[2])};

  //nios_bts_port_ddr2_x40_0/nios chosen master rotated left, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_chosen_master_rot_left = (nios_bts_port_ddr2_x40_0_nios_arb_winner << 1) ? (nios_bts_port_ddr2_x40_0_nios_arb_winner << 1) : 1;

  //nios_bts_port_ddr2_x40_0/nios's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_bts_port_ddr2_x40_0_nios_arb_addend <= 1;
      else if (|nios_bts_port_ddr2_x40_0_nios_grant_vector)
          nios_bts_port_ddr2_x40_0_nios_arb_addend <= nios_bts_port_ddr2_x40_0_nios_end_xfer? nios_bts_port_ddr2_x40_0_nios_chosen_master_rot_left : nios_bts_port_ddr2_x40_0_nios_grant_vector;
    end


  //nios_bts_port_ddr2_x40_0_nios_reset_n assignment, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_reset_n = reset_n;

  assign nios_bts_port_ddr2_x40_0_nios_chipselect = cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios | jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios;
  //nios_bts_port_ddr2_x40_0_nios_firsttransfer first transaction, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_firsttransfer = nios_bts_port_ddr2_x40_0_nios_begins_xfer ? nios_bts_port_ddr2_x40_0_nios_unreg_firsttransfer : nios_bts_port_ddr2_x40_0_nios_reg_firsttransfer;

  //nios_bts_port_ddr2_x40_0_nios_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_unreg_firsttransfer = ~(nios_bts_port_ddr2_x40_0_nios_slavearbiterlockenable & nios_bts_port_ddr2_x40_0_nios_any_continuerequest);

  //nios_bts_port_ddr2_x40_0_nios_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_bts_port_ddr2_x40_0_nios_reg_firsttransfer <= 1'b1;
      else if (nios_bts_port_ddr2_x40_0_nios_begins_xfer)
          nios_bts_port_ddr2_x40_0_nios_reg_firsttransfer <= nios_bts_port_ddr2_x40_0_nios_unreg_firsttransfer;
    end


  //nios_bts_port_ddr2_x40_0_nios_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_beginbursttransfer_internal = nios_bts_port_ddr2_x40_0_nios_begins_xfer;

  //nios_bts_port_ddr2_x40_0_nios_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_arbitration_holdoff_internal = nios_bts_port_ddr2_x40_0_nios_begins_xfer & nios_bts_port_ddr2_x40_0_nios_firsttransfer;

  //nios_bts_port_ddr2_x40_0_nios_read assignment, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_read = (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_master_read);

  //nios_bts_port_ddr2_x40_0_nios_write assignment, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_write = (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_master_write);

  assign shifted_address_to_nios_bts_port_ddr2_x40_0_nios_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //nios_bts_port_ddr2_x40_0_nios_address mux, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_address = (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios)? (shifted_address_to_nios_bts_port_ddr2_x40_0_nios_from_cpu_0_data_master >> 2) :
    (shifted_address_to_nios_bts_port_ddr2_x40_0_nios_from_jtag_avalon_master_0_master >> 2);

  assign shifted_address_to_nios_bts_port_ddr2_x40_0_nios_from_jtag_avalon_master_0_master = jtag_avalon_master_0_master_address_to_slave;
  //d1_nios_bts_port_ddr2_x40_0_nios_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_bts_port_ddr2_x40_0_nios_end_xfer <= 1;
      else 
        d1_nios_bts_port_ddr2_x40_0_nios_end_xfer <= nios_bts_port_ddr2_x40_0_nios_end_xfer;
    end


  //nios_bts_port_ddr2_x40_0_nios_waits_for_read in a cycle, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_waits_for_read = nios_bts_port_ddr2_x40_0_nios_in_a_read_cycle & nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;

  //nios_bts_port_ddr2_x40_0_nios_in_a_read_cycle assignment, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_in_a_read_cycle = (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_bts_port_ddr2_x40_0_nios_in_a_read_cycle;

  //nios_bts_port_ddr2_x40_0_nios_waits_for_write in a cycle, which is an e_mux
  assign nios_bts_port_ddr2_x40_0_nios_waits_for_write = nios_bts_port_ddr2_x40_0_nios_in_a_write_cycle & nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;

  //nios_bts_port_ddr2_x40_0_nios_in_a_write_cycle assignment, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_in_a_write_cycle = (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios & jtag_avalon_master_0_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_bts_port_ddr2_x40_0_nios_in_a_write_cycle;

  assign wait_for_nios_bts_port_ddr2_x40_0_nios_counter = 0;
  //assign nios_bts_port_ddr2_x40_0_nios_irq_from_sa = nios_bts_port_ddr2_x40_0_nios_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_bts_port_ddr2_x40_0_nios_irq_from_sa = nios_bts_port_ddr2_x40_0_nios_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_bts_port_ddr2_x40_0/nios enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios + jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_nios_bts_port_ddr2_x40_0_nios + jtag_avalon_master_0_saved_grant_nios_bts_port_ddr2_x40_0_nios > 1)
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

module onchip_memory2_0_s1_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         cpu_0_instruction_master_address_to_slave,
                                         cpu_0_instruction_master_latency_counter,
                                         cpu_0_instruction_master_read,
                                         jtag_avalon_master_0_latency_counter,
                                         jtag_avalon_master_0_master_address_to_slave,
                                         jtag_avalon_master_0_master_byteenable,
                                         jtag_avalon_master_0_master_read,
                                         jtag_avalon_master_0_master_write,
                                         jtag_avalon_master_0_master_writedata,
                                         onchip_memory2_0_s1_readdata,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_onchip_memory2_0_s1,
                                         cpu_0_data_master_qualified_request_onchip_memory2_0_s1,
                                         cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
                                         cpu_0_data_master_requests_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_granted_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_requests_onchip_memory2_0_s1,
                                         d1_onchip_memory2_0_s1_end_xfer,
                                         jtag_avalon_master_0_granted_onchip_memory2_0_s1,
                                         jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1,
                                         jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1,
                                         jtag_avalon_master_0_requests_onchip_memory2_0_s1,
                                         onchip_memory2_0_s1_address,
                                         onchip_memory2_0_s1_byteenable,
                                         onchip_memory2_0_s1_chipselect,
                                         onchip_memory2_0_s1_clken,
                                         onchip_memory2_0_s1_readdata_from_sa,
                                         onchip_memory2_0_s1_reset,
                                         onchip_memory2_0_s1_write,
                                         onchip_memory2_0_s1_writedata
                                      )
;

  output           cpu_0_data_master_granted_onchip_memory2_0_s1;
  output           cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  output           cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  output           cpu_0_data_master_requests_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  output           d1_onchip_memory2_0_s1_end_xfer;
  output           jtag_avalon_master_0_granted_onchip_memory2_0_s1;
  output           jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1;
  output           jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1;
  output           jtag_avalon_master_0_requests_onchip_memory2_0_s1;
  output  [ 15: 0] onchip_memory2_0_s1_address;
  output  [  3: 0] onchip_memory2_0_s1_byteenable;
  output           onchip_memory2_0_s1_chipselect;
  output           onchip_memory2_0_s1_clken;
  output  [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  output           onchip_memory2_0_s1_reset;
  output           onchip_memory2_0_s1_write;
  output  [ 31: 0] onchip_memory2_0_s1_writedata;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 18: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            jtag_avalon_master_0_latency_counter;
  input   [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  input   [  3: 0] jtag_avalon_master_0_master_byteenable;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] jtag_avalon_master_0_master_writedata;
  input   [ 31: 0] onchip_memory2_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  reg              cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             cpu_0_data_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_data_master_saved_grant_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  reg              cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1;
  reg              d1_onchip_memory2_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory2_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_avalon_master_0_granted_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_master_arbiterlock;
  wire             jtag_avalon_master_0_master_arbiterlock2;
  wire             jtag_avalon_master_0_master_continuerequest;
  wire             jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1;
  reg              jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             jtag_avalon_master_0_requests_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_saved_grant_onchip_memory2_0_s1;
  reg              last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1;
  reg              last_cycle_jtag_avalon_master_0_master_granted_slave_onchip_memory2_0_s1;
  wire    [ 15: 0] onchip_memory2_0_s1_address;
  wire             onchip_memory2_0_s1_allgrants;
  wire             onchip_memory2_0_s1_allow_new_arb_cycle;
  wire             onchip_memory2_0_s1_any_bursting_master_saved_grant;
  wire             onchip_memory2_0_s1_any_continuerequest;
  reg     [  2: 0] onchip_memory2_0_s1_arb_addend;
  wire             onchip_memory2_0_s1_arb_counter_enable;
  reg              onchip_memory2_0_s1_arb_share_counter;
  wire             onchip_memory2_0_s1_arb_share_counter_next_value;
  wire             onchip_memory2_0_s1_arb_share_set_values;
  wire    [  2: 0] onchip_memory2_0_s1_arb_winner;
  wire             onchip_memory2_0_s1_arbitration_holdoff_internal;
  wire             onchip_memory2_0_s1_beginbursttransfer_internal;
  wire             onchip_memory2_0_s1_begins_xfer;
  wire    [  3: 0] onchip_memory2_0_s1_byteenable;
  wire             onchip_memory2_0_s1_chipselect;
  wire    [  5: 0] onchip_memory2_0_s1_chosen_master_double_vector;
  wire    [  2: 0] onchip_memory2_0_s1_chosen_master_rot_left;
  wire             onchip_memory2_0_s1_clken;
  wire             onchip_memory2_0_s1_end_xfer;
  wire             onchip_memory2_0_s1_firsttransfer;
  wire    [  2: 0] onchip_memory2_0_s1_grant_vector;
  wire             onchip_memory2_0_s1_in_a_read_cycle;
  wire             onchip_memory2_0_s1_in_a_write_cycle;
  wire    [  2: 0] onchip_memory2_0_s1_master_qreq_vector;
  wire             onchip_memory2_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  reg              onchip_memory2_0_s1_reg_firsttransfer;
  wire             onchip_memory2_0_s1_reset;
  reg     [  2: 0] onchip_memory2_0_s1_saved_chosen_master_vector;
  reg              onchip_memory2_0_s1_slavearbiterlockenable;
  wire             onchip_memory2_0_s1_slavearbiterlockenable2;
  wire             onchip_memory2_0_s1_unreg_firsttransfer;
  wire             onchip_memory2_0_s1_waits_for_read;
  wire             onchip_memory2_0_s1_waits_for_write;
  wire             onchip_memory2_0_s1_write;
  wire    [ 31: 0] onchip_memory2_0_s1_writedata;
  wire             p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             p1_jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire    [ 23: 0] shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master;
  wire    [ 18: 0] shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master;
  wire    [ 31: 0] shifted_address_to_onchip_memory2_0_s1_from_jtag_avalon_master_0_master;
  wire             wait_for_onchip_memory2_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory2_0_s1_end_xfer;
    end


  assign onchip_memory2_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 | jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1));
  //assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata;

  assign cpu_0_data_master_requests_onchip_memory2_0_s1 = ({cpu_0_data_master_address_to_slave[23 : 18] , 18'b0} == 24'h40000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //onchip_memory2_0_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory2_0_s1_arb_share_set_values = 1;

  //onchip_memory2_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory2_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_onchip_memory2_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory2_0_s1 |
    jtag_avalon_master_0_requests_onchip_memory2_0_s1 |
    cpu_0_data_master_requests_onchip_memory2_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory2_0_s1 |
    jtag_avalon_master_0_requests_onchip_memory2_0_s1 |
    cpu_0_data_master_requests_onchip_memory2_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory2_0_s1 |
    jtag_avalon_master_0_requests_onchip_memory2_0_s1;

  //onchip_memory2_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory2_0_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory2_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory2_0_s1_arb_share_counter_next_value = onchip_memory2_0_s1_firsttransfer ? (onchip_memory2_0_s1_arb_share_set_values - 1) : |onchip_memory2_0_s1_arb_share_counter ? (onchip_memory2_0_s1_arb_share_counter - 1) : 0;

  //onchip_memory2_0_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory2_0_s1_allgrants = (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector);

  //onchip_memory2_0_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory2_0_s1_end_xfer = ~(onchip_memory2_0_s1_waits_for_read | onchip_memory2_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory2_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory2_0_s1 = onchip_memory2_0_s1_end_xfer & (~onchip_memory2_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory2_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory2_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & onchip_memory2_0_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & ~onchip_memory2_0_s1_non_bursting_master_requests);

  //onchip_memory2_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_arb_share_counter <= 0;
      else if (onchip_memory2_0_s1_arb_counter_enable)
          onchip_memory2_0_s1_arb_share_counter <= onchip_memory2_0_s1_arb_share_counter_next_value;
    end


  //onchip_memory2_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory2_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory2_0_s1) | (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & ~onchip_memory2_0_s1_non_bursting_master_requests))
          onchip_memory2_0_s1_slavearbiterlockenable <= |onchip_memory2_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //onchip_memory2_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory2_0_s1_slavearbiterlockenable2 = |onchip_memory2_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 <= cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_onchip_memory2_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = (last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 & cpu_0_instruction_master_requests_onchip_memory2_0_s1) |
    (last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 & cpu_0_instruction_master_requests_onchip_memory2_0_s1);

  //onchip_memory2_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory2_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest |
    jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest |
    cpu_0_instruction_master_continuerequest;

  //jtag_avalon_master_0/master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_jtag_avalon_master_0_master_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_jtag_avalon_master_0_master_granted_slave_onchip_memory2_0_s1 <= jtag_avalon_master_0_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~jtag_avalon_master_0_requests_onchip_memory2_0_s1) ? 0 : last_cycle_jtag_avalon_master_0_master_granted_slave_onchip_memory2_0_s1;
    end


  //jtag_avalon_master_0_master_continuerequest continued request, which is an e_mux
  assign jtag_avalon_master_0_master_continuerequest = (last_cycle_jtag_avalon_master_0_master_granted_slave_onchip_memory2_0_s1 & jtag_avalon_master_0_requests_onchip_memory2_0_s1) |
    (last_cycle_jtag_avalon_master_0_master_granted_slave_onchip_memory2_0_s1 & jtag_avalon_master_0_requests_onchip_memory2_0_s1);

  assign cpu_0_data_master_qualified_request_onchip_memory2_0_s1 = cpu_0_data_master_requests_onchip_memory2_0_s1 & ~((cpu_0_data_master_read & ((1 < cpu_0_data_master_latency_counter))) | cpu_0_instruction_master_arbiterlock | jtag_avalon_master_0_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in = cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_read & ~onchip_memory2_0_s1_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register = {cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register, cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 = cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;

  //onchip_memory2_0_s1_writedata mux, which is an e_mux
  assign onchip_memory2_0_s1_writedata = (cpu_0_data_master_granted_onchip_memory2_0_s1)? cpu_0_data_master_writedata :
    jtag_avalon_master_0_master_writedata;

  //mux onchip_memory2_0_s1_clken, which is an e_mux
  assign onchip_memory2_0_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_onchip_memory2_0_s1 = (({cpu_0_instruction_master_address_to_slave[18] , 18'b0} == 19'h40000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 <= cpu_0_data_master_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_onchip_memory2_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = (last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 & cpu_0_data_master_requests_onchip_memory2_0_s1) |
    (last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 & cpu_0_data_master_requests_onchip_memory2_0_s1);

  assign cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 = cpu_0_instruction_master_requests_onchip_memory2_0_s1 & ~((cpu_0_instruction_master_read & ((1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock | jtag_avalon_master_0_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in = cpu_0_instruction_master_granted_onchip_memory2_0_s1 & cpu_0_instruction_master_read & ~onchip_memory2_0_s1_waits_for_read;

  //shift register p1 cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register = {cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register, cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 = cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;

  assign jtag_avalon_master_0_requests_onchip_memory2_0_s1 = ({jtag_avalon_master_0_master_address_to_slave[31 : 18] , 18'b0} == 32'h40000) & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write);
  assign jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1 = jtag_avalon_master_0_requests_onchip_memory2_0_s1 & ~((jtag_avalon_master_0_master_read & ((1 < jtag_avalon_master_0_latency_counter))) | cpu_0_data_master_arbiterlock | cpu_0_instruction_master_arbiterlock);
  //jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register_in = jtag_avalon_master_0_granted_onchip_memory2_0_s1 & jtag_avalon_master_0_master_read & ~onchip_memory2_0_s1_waits_for_read;

  //shift register p1 jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register = {jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register, jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1 = jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1_shift_register;

  //allow new arb cycle for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock & ~jtag_avalon_master_0_master_arbiterlock;

  //jtag_avalon_master_0/master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[0] = jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1;

  //jtag_avalon_master_0/master grant onchip_memory2_0/s1, which is an e_assign
  assign jtag_avalon_master_0_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[0];

  //jtag_avalon_master_0/master saved-grant onchip_memory2_0/s1, which is an e_assign
  assign jtag_avalon_master_0_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[0] && jtag_avalon_master_0_requests_onchip_memory2_0_s1;

  //cpu_0/instruction_master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[1] = cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;

  //cpu_0/instruction_master grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[1];

  //cpu_0/instruction_master saved-grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[1] && cpu_0_instruction_master_requests_onchip_memory2_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[2] = cpu_0_data_master_qualified_request_onchip_memory2_0_s1;

  //cpu_0/data_master grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[2];

  //cpu_0/data_master saved-grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[2] && cpu_0_data_master_requests_onchip_memory2_0_s1;

  //onchip_memory2_0/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory2_0_s1_chosen_master_double_vector = {onchip_memory2_0_s1_master_qreq_vector, onchip_memory2_0_s1_master_qreq_vector} & ({~onchip_memory2_0_s1_master_qreq_vector, ~onchip_memory2_0_s1_master_qreq_vector} + onchip_memory2_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory2_0_s1_arb_winner = (onchip_memory2_0_s1_allow_new_arb_cycle & | onchip_memory2_0_s1_grant_vector) ? onchip_memory2_0_s1_grant_vector : onchip_memory2_0_s1_saved_chosen_master_vector;

  //saved onchip_memory2_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory2_0_s1_allow_new_arb_cycle)
          onchip_memory2_0_s1_saved_chosen_master_vector <= |onchip_memory2_0_s1_grant_vector ? onchip_memory2_0_s1_grant_vector : onchip_memory2_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory2_0_s1_grant_vector = {(onchip_memory2_0_s1_chosen_master_double_vector[2] | onchip_memory2_0_s1_chosen_master_double_vector[5]),
    (onchip_memory2_0_s1_chosen_master_double_vector[1] | onchip_memory2_0_s1_chosen_master_double_vector[4]),
    (onchip_memory2_0_s1_chosen_master_double_vector[0] | onchip_memory2_0_s1_chosen_master_double_vector[3])};

  //onchip_memory2_0/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory2_0_s1_chosen_master_rot_left = (onchip_memory2_0_s1_arb_winner << 1) ? (onchip_memory2_0_s1_arb_winner << 1) : 1;

  //onchip_memory2_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_arb_addend <= 1;
      else if (|onchip_memory2_0_s1_grant_vector)
          onchip_memory2_0_s1_arb_addend <= onchip_memory2_0_s1_end_xfer? onchip_memory2_0_s1_chosen_master_rot_left : onchip_memory2_0_s1_grant_vector;
    end


  //~onchip_memory2_0_s1_reset assignment, which is an e_assign
  assign onchip_memory2_0_s1_reset = ~reset_n;

  assign onchip_memory2_0_s1_chipselect = cpu_0_data_master_granted_onchip_memory2_0_s1 | cpu_0_instruction_master_granted_onchip_memory2_0_s1 | jtag_avalon_master_0_granted_onchip_memory2_0_s1;
  //onchip_memory2_0_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_0_s1_firsttransfer = onchip_memory2_0_s1_begins_xfer ? onchip_memory2_0_s1_unreg_firsttransfer : onchip_memory2_0_s1_reg_firsttransfer;

  //onchip_memory2_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_0_s1_unreg_firsttransfer = ~(onchip_memory2_0_s1_slavearbiterlockenable & onchip_memory2_0_s1_any_continuerequest);

  //onchip_memory2_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory2_0_s1_begins_xfer)
          onchip_memory2_0_s1_reg_firsttransfer <= onchip_memory2_0_s1_unreg_firsttransfer;
    end


  //onchip_memory2_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory2_0_s1_beginbursttransfer_internal = onchip_memory2_0_s1_begins_xfer;

  //onchip_memory2_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory2_0_s1_arbitration_holdoff_internal = onchip_memory2_0_s1_begins_xfer & onchip_memory2_0_s1_firsttransfer;

  //onchip_memory2_0_s1_write assignment, which is an e_mux
  assign onchip_memory2_0_s1_write = (cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_onchip_memory2_0_s1 & jtag_avalon_master_0_master_write);

  assign shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //onchip_memory2_0_s1_address mux, which is an e_mux
  assign onchip_memory2_0_s1_address = (cpu_0_data_master_granted_onchip_memory2_0_s1)? (shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master >> 2) :
    (cpu_0_instruction_master_granted_onchip_memory2_0_s1)? (shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master >> 2) :
    (shifted_address_to_onchip_memory2_0_s1_from_jtag_avalon_master_0_master >> 2);

  assign shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  assign shifted_address_to_onchip_memory2_0_s1_from_jtag_avalon_master_0_master = jtag_avalon_master_0_master_address_to_slave;
  //d1_onchip_memory2_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory2_0_s1_end_xfer <= 1;
      else 
        d1_onchip_memory2_0_s1_end_xfer <= onchip_memory2_0_s1_end_xfer;
    end


  //onchip_memory2_0_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory2_0_s1_waits_for_read = onchip_memory2_0_s1_in_a_read_cycle & 0;

  //onchip_memory2_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory2_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_onchip_memory2_0_s1 & cpu_0_instruction_master_read) | (jtag_avalon_master_0_granted_onchip_memory2_0_s1 & jtag_avalon_master_0_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory2_0_s1_in_a_read_cycle;

  //onchip_memory2_0_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory2_0_s1_waits_for_write = onchip_memory2_0_s1_in_a_write_cycle & 0;

  //onchip_memory2_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory2_0_s1_in_a_write_cycle = (cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_onchip_memory2_0_s1 & jtag_avalon_master_0_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory2_0_s1_in_a_write_cycle;

  assign wait_for_onchip_memory2_0_s1_counter = 0;
  //onchip_memory2_0_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory2_0_s1_byteenable = (cpu_0_data_master_granted_onchip_memory2_0_s1)? cpu_0_data_master_byteenable :
    (jtag_avalon_master_0_granted_onchip_memory2_0_s1)? jtag_avalon_master_0_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory2_0/s1 enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_onchip_memory2_0_s1 + cpu_0_instruction_master_granted_onchip_memory2_0_s1 + jtag_avalon_master_0_granted_onchip_memory2_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_onchip_memory2_0_s1 + cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 + jtag_avalon_master_0_saved_grant_onchip_memory2_0_s1 > 1)
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

module product_info_0_avalon_slave_0_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_latency_counter,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_write,
                                                   jtag_avalon_master_0_latency_counter,
                                                   jtag_avalon_master_0_master_address_to_slave,
                                                   jtag_avalon_master_0_master_read,
                                                   jtag_avalon_master_0_master_write,
                                                   product_info_0_avalon_slave_0_readdata,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_product_info_0_avalon_slave_0,
                                                   cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0,
                                                   cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0,
                                                   cpu_0_data_master_requests_product_info_0_avalon_slave_0,
                                                   d1_product_info_0_avalon_slave_0_end_xfer,
                                                   jtag_avalon_master_0_granted_product_info_0_avalon_slave_0,
                                                   jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0,
                                                   jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0,
                                                   jtag_avalon_master_0_requests_product_info_0_avalon_slave_0,
                                                   product_info_0_avalon_slave_0_address,
                                                   product_info_0_avalon_slave_0_chipselect_n,
                                                   product_info_0_avalon_slave_0_read_n,
                                                   product_info_0_avalon_slave_0_readdata_from_sa,
                                                   product_info_0_avalon_slave_0_reset_n
                                                )
;

  output           cpu_0_data_master_granted_product_info_0_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0;
  output           cpu_0_data_master_requests_product_info_0_avalon_slave_0;
  output           d1_product_info_0_avalon_slave_0_end_xfer;
  output           jtag_avalon_master_0_granted_product_info_0_avalon_slave_0;
  output           jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0;
  output           jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0;
  output           jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;
  output  [  1: 0] product_info_0_avalon_slave_0_address;
  output           product_info_0_avalon_slave_0_chipselect_n;
  output           product_info_0_avalon_slave_0_read_n;
  output  [ 31: 0] product_info_0_avalon_slave_0_readdata_from_sa;
  output           product_info_0_avalon_slave_0_reset_n;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            jtag_avalon_master_0_latency_counter;
  input   [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] product_info_0_avalon_slave_0_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_product_info_0_avalon_slave_0;
  reg              d1_product_info_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_avalon_master_0_granted_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_master_arbiterlock;
  wire             jtag_avalon_master_0_master_arbiterlock2;
  wire             jtag_avalon_master_0_master_continuerequest;
  wire             jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_saved_grant_product_info_0_avalon_slave_0;
  reg              last_cycle_cpu_0_data_master_granted_slave_product_info_0_avalon_slave_0;
  reg              last_cycle_jtag_avalon_master_0_master_granted_slave_product_info_0_avalon_slave_0;
  wire    [  1: 0] product_info_0_avalon_slave_0_address;
  wire             product_info_0_avalon_slave_0_allgrants;
  wire             product_info_0_avalon_slave_0_allow_new_arb_cycle;
  wire             product_info_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             product_info_0_avalon_slave_0_any_continuerequest;
  reg     [  1: 0] product_info_0_avalon_slave_0_arb_addend;
  wire             product_info_0_avalon_slave_0_arb_counter_enable;
  reg              product_info_0_avalon_slave_0_arb_share_counter;
  wire             product_info_0_avalon_slave_0_arb_share_counter_next_value;
  wire             product_info_0_avalon_slave_0_arb_share_set_values;
  wire    [  1: 0] product_info_0_avalon_slave_0_arb_winner;
  wire             product_info_0_avalon_slave_0_arbitration_holdoff_internal;
  wire             product_info_0_avalon_slave_0_beginbursttransfer_internal;
  wire             product_info_0_avalon_slave_0_begins_xfer;
  wire             product_info_0_avalon_slave_0_chipselect_n;
  wire    [  3: 0] product_info_0_avalon_slave_0_chosen_master_double_vector;
  wire    [  1: 0] product_info_0_avalon_slave_0_chosen_master_rot_left;
  wire             product_info_0_avalon_slave_0_end_xfer;
  wire             product_info_0_avalon_slave_0_firsttransfer;
  wire    [  1: 0] product_info_0_avalon_slave_0_grant_vector;
  wire             product_info_0_avalon_slave_0_in_a_read_cycle;
  wire             product_info_0_avalon_slave_0_in_a_write_cycle;
  wire    [  1: 0] product_info_0_avalon_slave_0_master_qreq_vector;
  wire             product_info_0_avalon_slave_0_non_bursting_master_requests;
  wire             product_info_0_avalon_slave_0_read_n;
  wire    [ 31: 0] product_info_0_avalon_slave_0_readdata_from_sa;
  reg              product_info_0_avalon_slave_0_reg_firsttransfer;
  wire             product_info_0_avalon_slave_0_reset_n;
  reg     [  1: 0] product_info_0_avalon_slave_0_saved_chosen_master_vector;
  reg              product_info_0_avalon_slave_0_slavearbiterlockenable;
  wire             product_info_0_avalon_slave_0_slavearbiterlockenable2;
  wire             product_info_0_avalon_slave_0_unreg_firsttransfer;
  wire             product_info_0_avalon_slave_0_waits_for_read;
  wire             product_info_0_avalon_slave_0_waits_for_write;
  wire    [ 23: 0] shifted_address_to_product_info_0_avalon_slave_0_from_cpu_0_data_master;
  wire    [ 31: 0] shifted_address_to_product_info_0_avalon_slave_0_from_jtag_avalon_master_0_master;
  wire             wait_for_product_info_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~product_info_0_avalon_slave_0_end_xfer;
    end


  assign product_info_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 | jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0));
  //assign product_info_0_avalon_slave_0_readdata_from_sa = product_info_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign product_info_0_avalon_slave_0_readdata_from_sa = product_info_0_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_product_info_0_avalon_slave_0 = (({cpu_0_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h0) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //product_info_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign product_info_0_avalon_slave_0_arb_share_set_values = 1;

  //product_info_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign product_info_0_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_product_info_0_avalon_slave_0 |
    jtag_avalon_master_0_requests_product_info_0_avalon_slave_0 |
    cpu_0_data_master_requests_product_info_0_avalon_slave_0 |
    jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;

  //product_info_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign product_info_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //product_info_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign product_info_0_avalon_slave_0_arb_share_counter_next_value = product_info_0_avalon_slave_0_firsttransfer ? (product_info_0_avalon_slave_0_arb_share_set_values - 1) : |product_info_0_avalon_slave_0_arb_share_counter ? (product_info_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //product_info_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign product_info_0_avalon_slave_0_allgrants = (|product_info_0_avalon_slave_0_grant_vector) |
    (|product_info_0_avalon_slave_0_grant_vector) |
    (|product_info_0_avalon_slave_0_grant_vector) |
    (|product_info_0_avalon_slave_0_grant_vector);

  //product_info_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign product_info_0_avalon_slave_0_end_xfer = ~(product_info_0_avalon_slave_0_waits_for_read | product_info_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0 = product_info_0_avalon_slave_0_end_xfer & (~product_info_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //product_info_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign product_info_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0 & product_info_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0 & ~product_info_0_avalon_slave_0_non_bursting_master_requests);

  //product_info_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          product_info_0_avalon_slave_0_arb_share_counter <= 0;
      else if (product_info_0_avalon_slave_0_arb_counter_enable)
          product_info_0_avalon_slave_0_arb_share_counter <= product_info_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //product_info_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          product_info_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|product_info_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_product_info_0_avalon_slave_0 & ~product_info_0_avalon_slave_0_non_bursting_master_requests))
          product_info_0_avalon_slave_0_slavearbiterlockenable <= |product_info_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master product_info_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = product_info_0_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //product_info_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign product_info_0_avalon_slave_0_slavearbiterlockenable2 = |product_info_0_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master product_info_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = product_info_0_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_avalon_master_0/master product_info_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock = product_info_0_avalon_slave_0_slavearbiterlockenable & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master product_info_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock2 = product_info_0_avalon_slave_0_slavearbiterlockenable2 & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master granted product_info_0/avalon_slave_0 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_jtag_avalon_master_0_master_granted_slave_product_info_0_avalon_slave_0 <= 0;
      else 
        last_cycle_jtag_avalon_master_0_master_granted_slave_product_info_0_avalon_slave_0 <= jtag_avalon_master_0_saved_grant_product_info_0_avalon_slave_0 ? 1 : (product_info_0_avalon_slave_0_arbitration_holdoff_internal | ~jtag_avalon_master_0_requests_product_info_0_avalon_slave_0) ? 0 : last_cycle_jtag_avalon_master_0_master_granted_slave_product_info_0_avalon_slave_0;
    end


  //jtag_avalon_master_0_master_continuerequest continued request, which is an e_mux
  assign jtag_avalon_master_0_master_continuerequest = last_cycle_jtag_avalon_master_0_master_granted_slave_product_info_0_avalon_slave_0 & jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;

  //product_info_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_mux
  assign product_info_0_avalon_slave_0_any_continuerequest = jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 = cpu_0_data_master_requests_product_info_0_avalon_slave_0 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | jtag_avalon_master_0_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0, which is an e_mux
  assign cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0 = cpu_0_data_master_granted_product_info_0_avalon_slave_0 & cpu_0_data_master_read & ~product_info_0_avalon_slave_0_waits_for_read;

  assign jtag_avalon_master_0_requests_product_info_0_avalon_slave_0 = (({jtag_avalon_master_0_master_address_to_slave[31 : 4] , 4'b0} == 32'h0) & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write)) & jtag_avalon_master_0_master_read;
  //cpu_0/data_master granted product_info_0/avalon_slave_0 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_product_info_0_avalon_slave_0 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_product_info_0_avalon_slave_0 <= cpu_0_data_master_saved_grant_product_info_0_avalon_slave_0 ? 1 : (product_info_0_avalon_slave_0_arbitration_holdoff_internal | ~cpu_0_data_master_requests_product_info_0_avalon_slave_0) ? 0 : last_cycle_cpu_0_data_master_granted_slave_product_info_0_avalon_slave_0;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_product_info_0_avalon_slave_0 & cpu_0_data_master_requests_product_info_0_avalon_slave_0;

  assign jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 = jtag_avalon_master_0_requests_product_info_0_avalon_slave_0 & ~((jtag_avalon_master_0_master_read & ((jtag_avalon_master_0_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0 = jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 & jtag_avalon_master_0_master_read & ~product_info_0_avalon_slave_0_waits_for_read;

  //allow new arb cycle for product_info_0/avalon_slave_0, which is an e_assign
  assign product_info_0_avalon_slave_0_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~jtag_avalon_master_0_master_arbiterlock;

  //jtag_avalon_master_0/master assignment into master qualified-requests vector for product_info_0/avalon_slave_0, which is an e_assign
  assign product_info_0_avalon_slave_0_master_qreq_vector[0] = jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0;

  //jtag_avalon_master_0/master grant product_info_0/avalon_slave_0, which is an e_assign
  assign jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 = product_info_0_avalon_slave_0_grant_vector[0];

  //jtag_avalon_master_0/master saved-grant product_info_0/avalon_slave_0, which is an e_assign
  assign jtag_avalon_master_0_saved_grant_product_info_0_avalon_slave_0 = product_info_0_avalon_slave_0_arb_winner[0] && jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;

  //cpu_0/data_master assignment into master qualified-requests vector for product_info_0/avalon_slave_0, which is an e_assign
  assign product_info_0_avalon_slave_0_master_qreq_vector[1] = cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0;

  //cpu_0/data_master grant product_info_0/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_granted_product_info_0_avalon_slave_0 = product_info_0_avalon_slave_0_grant_vector[1];

  //cpu_0/data_master saved-grant product_info_0/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_product_info_0_avalon_slave_0 = product_info_0_avalon_slave_0_arb_winner[1] && cpu_0_data_master_requests_product_info_0_avalon_slave_0;

  //product_info_0/avalon_slave_0 chosen-master double-vector, which is an e_assign
  assign product_info_0_avalon_slave_0_chosen_master_double_vector = {product_info_0_avalon_slave_0_master_qreq_vector, product_info_0_avalon_slave_0_master_qreq_vector} & ({~product_info_0_avalon_slave_0_master_qreq_vector, ~product_info_0_avalon_slave_0_master_qreq_vector} + product_info_0_avalon_slave_0_arb_addend);

  //stable onehot encoding of arb winner
  assign product_info_0_avalon_slave_0_arb_winner = (product_info_0_avalon_slave_0_allow_new_arb_cycle & | product_info_0_avalon_slave_0_grant_vector) ? product_info_0_avalon_slave_0_grant_vector : product_info_0_avalon_slave_0_saved_chosen_master_vector;

  //saved product_info_0_avalon_slave_0_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          product_info_0_avalon_slave_0_saved_chosen_master_vector <= 0;
      else if (product_info_0_avalon_slave_0_allow_new_arb_cycle)
          product_info_0_avalon_slave_0_saved_chosen_master_vector <= |product_info_0_avalon_slave_0_grant_vector ? product_info_0_avalon_slave_0_grant_vector : product_info_0_avalon_slave_0_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign product_info_0_avalon_slave_0_grant_vector = {(product_info_0_avalon_slave_0_chosen_master_double_vector[1] | product_info_0_avalon_slave_0_chosen_master_double_vector[3]),
    (product_info_0_avalon_slave_0_chosen_master_double_vector[0] | product_info_0_avalon_slave_0_chosen_master_double_vector[2])};

  //product_info_0/avalon_slave_0 chosen master rotated left, which is an e_assign
  assign product_info_0_avalon_slave_0_chosen_master_rot_left = (product_info_0_avalon_slave_0_arb_winner << 1) ? (product_info_0_avalon_slave_0_arb_winner << 1) : 1;

  //product_info_0/avalon_slave_0's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          product_info_0_avalon_slave_0_arb_addend <= 1;
      else if (|product_info_0_avalon_slave_0_grant_vector)
          product_info_0_avalon_slave_0_arb_addend <= product_info_0_avalon_slave_0_end_xfer? product_info_0_avalon_slave_0_chosen_master_rot_left : product_info_0_avalon_slave_0_grant_vector;
    end


  //product_info_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign product_info_0_avalon_slave_0_reset_n = reset_n;

  assign product_info_0_avalon_slave_0_chipselect_n = ~(cpu_0_data_master_granted_product_info_0_avalon_slave_0 | jtag_avalon_master_0_granted_product_info_0_avalon_slave_0);
  //product_info_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign product_info_0_avalon_slave_0_firsttransfer = product_info_0_avalon_slave_0_begins_xfer ? product_info_0_avalon_slave_0_unreg_firsttransfer : product_info_0_avalon_slave_0_reg_firsttransfer;

  //product_info_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign product_info_0_avalon_slave_0_unreg_firsttransfer = ~(product_info_0_avalon_slave_0_slavearbiterlockenable & product_info_0_avalon_slave_0_any_continuerequest);

  //product_info_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          product_info_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (product_info_0_avalon_slave_0_begins_xfer)
          product_info_0_avalon_slave_0_reg_firsttransfer <= product_info_0_avalon_slave_0_unreg_firsttransfer;
    end


  //product_info_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign product_info_0_avalon_slave_0_beginbursttransfer_internal = product_info_0_avalon_slave_0_begins_xfer;

  //product_info_0_avalon_slave_0_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign product_info_0_avalon_slave_0_arbitration_holdoff_internal = product_info_0_avalon_slave_0_begins_xfer & product_info_0_avalon_slave_0_firsttransfer;

  //~product_info_0_avalon_slave_0_read_n assignment, which is an e_mux
  assign product_info_0_avalon_slave_0_read_n = ~((cpu_0_data_master_granted_product_info_0_avalon_slave_0 & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 & jtag_avalon_master_0_master_read));

  assign shifted_address_to_product_info_0_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //product_info_0_avalon_slave_0_address mux, which is an e_mux
  assign product_info_0_avalon_slave_0_address = (cpu_0_data_master_granted_product_info_0_avalon_slave_0)? (shifted_address_to_product_info_0_avalon_slave_0_from_cpu_0_data_master >> 2) :
    (shifted_address_to_product_info_0_avalon_slave_0_from_jtag_avalon_master_0_master >> 2);

  assign shifted_address_to_product_info_0_avalon_slave_0_from_jtag_avalon_master_0_master = jtag_avalon_master_0_master_address_to_slave;
  //d1_product_info_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_product_info_0_avalon_slave_0_end_xfer <= 1;
      else 
        d1_product_info_0_avalon_slave_0_end_xfer <= product_info_0_avalon_slave_0_end_xfer;
    end


  //product_info_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign product_info_0_avalon_slave_0_waits_for_read = product_info_0_avalon_slave_0_in_a_read_cycle & product_info_0_avalon_slave_0_begins_xfer;

  //product_info_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign product_info_0_avalon_slave_0_in_a_read_cycle = (cpu_0_data_master_granted_product_info_0_avalon_slave_0 & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 & jtag_avalon_master_0_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = product_info_0_avalon_slave_0_in_a_read_cycle;

  //product_info_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign product_info_0_avalon_slave_0_waits_for_write = product_info_0_avalon_slave_0_in_a_write_cycle & 0;

  //product_info_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign product_info_0_avalon_slave_0_in_a_write_cycle = (cpu_0_data_master_granted_product_info_0_avalon_slave_0 & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 & jtag_avalon_master_0_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = product_info_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_product_info_0_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //product_info_0/avalon_slave_0 enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_product_info_0_avalon_slave_0 + jtag_avalon_master_0_granted_product_info_0_avalon_slave_0 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_product_info_0_avalon_slave_0 + jtag_avalon_master_0_saved_grant_product_info_0_avalon_slave_0 > 1)
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

module sc_inf_0_nios_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_latency_counter,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   jtag_avalon_master_0_latency_counter,
                                   jtag_avalon_master_0_master_address_to_slave,
                                   jtag_avalon_master_0_master_read,
                                   jtag_avalon_master_0_master_write,
                                   jtag_avalon_master_0_master_writedata,
                                   reset_n,
                                   sc_inf_0_nios_irq,
                                   sc_inf_0_nios_readdata,

                                  // outputs:
                                   cpu_0_data_master_granted_sc_inf_0_nios,
                                   cpu_0_data_master_qualified_request_sc_inf_0_nios,
                                   cpu_0_data_master_read_data_valid_sc_inf_0_nios,
                                   cpu_0_data_master_requests_sc_inf_0_nios,
                                   d1_sc_inf_0_nios_end_xfer,
                                   jtag_avalon_master_0_granted_sc_inf_0_nios,
                                   jtag_avalon_master_0_qualified_request_sc_inf_0_nios,
                                   jtag_avalon_master_0_read_data_valid_sc_inf_0_nios,
                                   jtag_avalon_master_0_requests_sc_inf_0_nios,
                                   sc_inf_0_nios_address,
                                   sc_inf_0_nios_chipselect_n,
                                   sc_inf_0_nios_irq_from_sa,
                                   sc_inf_0_nios_read_n,
                                   sc_inf_0_nios_readdata_from_sa,
                                   sc_inf_0_nios_reset_n,
                                   sc_inf_0_nios_write_n,
                                   sc_inf_0_nios_writedata
                                )
;

  output           cpu_0_data_master_granted_sc_inf_0_nios;
  output           cpu_0_data_master_qualified_request_sc_inf_0_nios;
  output           cpu_0_data_master_read_data_valid_sc_inf_0_nios;
  output           cpu_0_data_master_requests_sc_inf_0_nios;
  output           d1_sc_inf_0_nios_end_xfer;
  output           jtag_avalon_master_0_granted_sc_inf_0_nios;
  output           jtag_avalon_master_0_qualified_request_sc_inf_0_nios;
  output           jtag_avalon_master_0_read_data_valid_sc_inf_0_nios;
  output           jtag_avalon_master_0_requests_sc_inf_0_nios;
  output  [  7: 0] sc_inf_0_nios_address;
  output           sc_inf_0_nios_chipselect_n;
  output           sc_inf_0_nios_irq_from_sa;
  output           sc_inf_0_nios_read_n;
  output  [ 31: 0] sc_inf_0_nios_readdata_from_sa;
  output           sc_inf_0_nios_reset_n;
  output           sc_inf_0_nios_write_n;
  output  [ 31: 0] sc_inf_0_nios_writedata;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_avalon_master_0_latency_counter;
  input   [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] jtag_avalon_master_0_master_writedata;
  input            reset_n;
  input            sc_inf_0_nios_irq;
  input   [ 31: 0] sc_inf_0_nios_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sc_inf_0_nios;
  wire             cpu_0_data_master_qualified_request_sc_inf_0_nios;
  wire             cpu_0_data_master_read_data_valid_sc_inf_0_nios;
  wire             cpu_0_data_master_requests_sc_inf_0_nios;
  wire             cpu_0_data_master_saved_grant_sc_inf_0_nios;
  reg              d1_reasons_to_wait;
  reg              d1_sc_inf_0_nios_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sc_inf_0_nios;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_avalon_master_0_granted_sc_inf_0_nios;
  wire             jtag_avalon_master_0_master_arbiterlock;
  wire             jtag_avalon_master_0_master_arbiterlock2;
  wire             jtag_avalon_master_0_master_continuerequest;
  wire             jtag_avalon_master_0_qualified_request_sc_inf_0_nios;
  wire             jtag_avalon_master_0_read_data_valid_sc_inf_0_nios;
  wire             jtag_avalon_master_0_requests_sc_inf_0_nios;
  wire             jtag_avalon_master_0_saved_grant_sc_inf_0_nios;
  reg              last_cycle_cpu_0_data_master_granted_slave_sc_inf_0_nios;
  reg              last_cycle_jtag_avalon_master_0_master_granted_slave_sc_inf_0_nios;
  wire    [  7: 0] sc_inf_0_nios_address;
  wire             sc_inf_0_nios_allgrants;
  wire             sc_inf_0_nios_allow_new_arb_cycle;
  wire             sc_inf_0_nios_any_bursting_master_saved_grant;
  wire             sc_inf_0_nios_any_continuerequest;
  reg     [  1: 0] sc_inf_0_nios_arb_addend;
  wire             sc_inf_0_nios_arb_counter_enable;
  reg              sc_inf_0_nios_arb_share_counter;
  wire             sc_inf_0_nios_arb_share_counter_next_value;
  wire             sc_inf_0_nios_arb_share_set_values;
  wire    [  1: 0] sc_inf_0_nios_arb_winner;
  wire             sc_inf_0_nios_arbitration_holdoff_internal;
  wire             sc_inf_0_nios_beginbursttransfer_internal;
  wire             sc_inf_0_nios_begins_xfer;
  wire             sc_inf_0_nios_chipselect_n;
  wire    [  3: 0] sc_inf_0_nios_chosen_master_double_vector;
  wire    [  1: 0] sc_inf_0_nios_chosen_master_rot_left;
  wire             sc_inf_0_nios_end_xfer;
  wire             sc_inf_0_nios_firsttransfer;
  wire    [  1: 0] sc_inf_0_nios_grant_vector;
  wire             sc_inf_0_nios_in_a_read_cycle;
  wire             sc_inf_0_nios_in_a_write_cycle;
  wire             sc_inf_0_nios_irq_from_sa;
  wire    [  1: 0] sc_inf_0_nios_master_qreq_vector;
  wire             sc_inf_0_nios_non_bursting_master_requests;
  wire             sc_inf_0_nios_read_n;
  wire    [ 31: 0] sc_inf_0_nios_readdata_from_sa;
  reg              sc_inf_0_nios_reg_firsttransfer;
  wire             sc_inf_0_nios_reset_n;
  reg     [  1: 0] sc_inf_0_nios_saved_chosen_master_vector;
  reg              sc_inf_0_nios_slavearbiterlockenable;
  wire             sc_inf_0_nios_slavearbiterlockenable2;
  wire             sc_inf_0_nios_unreg_firsttransfer;
  wire             sc_inf_0_nios_waits_for_read;
  wire             sc_inf_0_nios_waits_for_write;
  wire             sc_inf_0_nios_write_n;
  wire    [ 31: 0] sc_inf_0_nios_writedata;
  wire    [ 23: 0] shifted_address_to_sc_inf_0_nios_from_cpu_0_data_master;
  wire    [ 31: 0] shifted_address_to_sc_inf_0_nios_from_jtag_avalon_master_0_master;
  wire             wait_for_sc_inf_0_nios_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sc_inf_0_nios_end_xfer;
    end


  assign sc_inf_0_nios_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sc_inf_0_nios | jtag_avalon_master_0_qualified_request_sc_inf_0_nios));
  //assign sc_inf_0_nios_readdata_from_sa = sc_inf_0_nios_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sc_inf_0_nios_readdata_from_sa = sc_inf_0_nios_readdata;

  assign cpu_0_data_master_requests_sc_inf_0_nios = ({cpu_0_data_master_address_to_slave[23 : 10] , 10'b0} == 24'h400) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //sc_inf_0_nios_arb_share_counter set values, which is an e_mux
  assign sc_inf_0_nios_arb_share_set_values = 1;

  //sc_inf_0_nios_non_bursting_master_requests mux, which is an e_mux
  assign sc_inf_0_nios_non_bursting_master_requests = cpu_0_data_master_requests_sc_inf_0_nios |
    jtag_avalon_master_0_requests_sc_inf_0_nios |
    cpu_0_data_master_requests_sc_inf_0_nios |
    jtag_avalon_master_0_requests_sc_inf_0_nios;

  //sc_inf_0_nios_any_bursting_master_saved_grant mux, which is an e_mux
  assign sc_inf_0_nios_any_bursting_master_saved_grant = 0;

  //sc_inf_0_nios_arb_share_counter_next_value assignment, which is an e_assign
  assign sc_inf_0_nios_arb_share_counter_next_value = sc_inf_0_nios_firsttransfer ? (sc_inf_0_nios_arb_share_set_values - 1) : |sc_inf_0_nios_arb_share_counter ? (sc_inf_0_nios_arb_share_counter - 1) : 0;

  //sc_inf_0_nios_allgrants all slave grants, which is an e_mux
  assign sc_inf_0_nios_allgrants = (|sc_inf_0_nios_grant_vector) |
    (|sc_inf_0_nios_grant_vector) |
    (|sc_inf_0_nios_grant_vector) |
    (|sc_inf_0_nios_grant_vector);

  //sc_inf_0_nios_end_xfer assignment, which is an e_assign
  assign sc_inf_0_nios_end_xfer = ~(sc_inf_0_nios_waits_for_read | sc_inf_0_nios_waits_for_write);

  //end_xfer_arb_share_counter_term_sc_inf_0_nios arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sc_inf_0_nios = sc_inf_0_nios_end_xfer & (~sc_inf_0_nios_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sc_inf_0_nios_arb_share_counter arbitration counter enable, which is an e_assign
  assign sc_inf_0_nios_arb_counter_enable = (end_xfer_arb_share_counter_term_sc_inf_0_nios & sc_inf_0_nios_allgrants) | (end_xfer_arb_share_counter_term_sc_inf_0_nios & ~sc_inf_0_nios_non_bursting_master_requests);

  //sc_inf_0_nios_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sc_inf_0_nios_arb_share_counter <= 0;
      else if (sc_inf_0_nios_arb_counter_enable)
          sc_inf_0_nios_arb_share_counter <= sc_inf_0_nios_arb_share_counter_next_value;
    end


  //sc_inf_0_nios_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sc_inf_0_nios_slavearbiterlockenable <= 0;
      else if ((|sc_inf_0_nios_master_qreq_vector & end_xfer_arb_share_counter_term_sc_inf_0_nios) | (end_xfer_arb_share_counter_term_sc_inf_0_nios & ~sc_inf_0_nios_non_bursting_master_requests))
          sc_inf_0_nios_slavearbiterlockenable <= |sc_inf_0_nios_arb_share_counter_next_value;
    end


  //cpu_0/data_master sc_inf_0/nios arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sc_inf_0_nios_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sc_inf_0_nios_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sc_inf_0_nios_slavearbiterlockenable2 = |sc_inf_0_nios_arb_share_counter_next_value;

  //cpu_0/data_master sc_inf_0/nios arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sc_inf_0_nios_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_avalon_master_0/master sc_inf_0/nios arbiterlock, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock = sc_inf_0_nios_slavearbiterlockenable & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master sc_inf_0/nios arbiterlock2, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock2 = sc_inf_0_nios_slavearbiterlockenable2 & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master granted sc_inf_0/nios last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_jtag_avalon_master_0_master_granted_slave_sc_inf_0_nios <= 0;
      else 
        last_cycle_jtag_avalon_master_0_master_granted_slave_sc_inf_0_nios <= jtag_avalon_master_0_saved_grant_sc_inf_0_nios ? 1 : (sc_inf_0_nios_arbitration_holdoff_internal | ~jtag_avalon_master_0_requests_sc_inf_0_nios) ? 0 : last_cycle_jtag_avalon_master_0_master_granted_slave_sc_inf_0_nios;
    end


  //jtag_avalon_master_0_master_continuerequest continued request, which is an e_mux
  assign jtag_avalon_master_0_master_continuerequest = last_cycle_jtag_avalon_master_0_master_granted_slave_sc_inf_0_nios & jtag_avalon_master_0_requests_sc_inf_0_nios;

  //sc_inf_0_nios_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sc_inf_0_nios_any_continuerequest = jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sc_inf_0_nios = cpu_0_data_master_requests_sc_inf_0_nios & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | jtag_avalon_master_0_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_sc_inf_0_nios, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sc_inf_0_nios = cpu_0_data_master_granted_sc_inf_0_nios & cpu_0_data_master_read & ~sc_inf_0_nios_waits_for_read;

  //sc_inf_0_nios_writedata mux, which is an e_mux
  assign sc_inf_0_nios_writedata = (cpu_0_data_master_granted_sc_inf_0_nios)? cpu_0_data_master_writedata :
    jtag_avalon_master_0_master_writedata;

  assign jtag_avalon_master_0_requests_sc_inf_0_nios = ({jtag_avalon_master_0_master_address_to_slave[31 : 10] , 10'b0} == 32'h400) & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write);
  //cpu_0/data_master granted sc_inf_0/nios last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sc_inf_0_nios <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sc_inf_0_nios <= cpu_0_data_master_saved_grant_sc_inf_0_nios ? 1 : (sc_inf_0_nios_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sc_inf_0_nios) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sc_inf_0_nios;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sc_inf_0_nios & cpu_0_data_master_requests_sc_inf_0_nios;

  assign jtag_avalon_master_0_qualified_request_sc_inf_0_nios = jtag_avalon_master_0_requests_sc_inf_0_nios & ~((jtag_avalon_master_0_master_read & ((jtag_avalon_master_0_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid jtag_avalon_master_0_read_data_valid_sc_inf_0_nios, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_sc_inf_0_nios = jtag_avalon_master_0_granted_sc_inf_0_nios & jtag_avalon_master_0_master_read & ~sc_inf_0_nios_waits_for_read;

  //allow new arb cycle for sc_inf_0/nios, which is an e_assign
  assign sc_inf_0_nios_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~jtag_avalon_master_0_master_arbiterlock;

  //jtag_avalon_master_0/master assignment into master qualified-requests vector for sc_inf_0/nios, which is an e_assign
  assign sc_inf_0_nios_master_qreq_vector[0] = jtag_avalon_master_0_qualified_request_sc_inf_0_nios;

  //jtag_avalon_master_0/master grant sc_inf_0/nios, which is an e_assign
  assign jtag_avalon_master_0_granted_sc_inf_0_nios = sc_inf_0_nios_grant_vector[0];

  //jtag_avalon_master_0/master saved-grant sc_inf_0/nios, which is an e_assign
  assign jtag_avalon_master_0_saved_grant_sc_inf_0_nios = sc_inf_0_nios_arb_winner[0] && jtag_avalon_master_0_requests_sc_inf_0_nios;

  //cpu_0/data_master assignment into master qualified-requests vector for sc_inf_0/nios, which is an e_assign
  assign sc_inf_0_nios_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sc_inf_0_nios;

  //cpu_0/data_master grant sc_inf_0/nios, which is an e_assign
  assign cpu_0_data_master_granted_sc_inf_0_nios = sc_inf_0_nios_grant_vector[1];

  //cpu_0/data_master saved-grant sc_inf_0/nios, which is an e_assign
  assign cpu_0_data_master_saved_grant_sc_inf_0_nios = sc_inf_0_nios_arb_winner[1] && cpu_0_data_master_requests_sc_inf_0_nios;

  //sc_inf_0/nios chosen-master double-vector, which is an e_assign
  assign sc_inf_0_nios_chosen_master_double_vector = {sc_inf_0_nios_master_qreq_vector, sc_inf_0_nios_master_qreq_vector} & ({~sc_inf_0_nios_master_qreq_vector, ~sc_inf_0_nios_master_qreq_vector} + sc_inf_0_nios_arb_addend);

  //stable onehot encoding of arb winner
  assign sc_inf_0_nios_arb_winner = (sc_inf_0_nios_allow_new_arb_cycle & | sc_inf_0_nios_grant_vector) ? sc_inf_0_nios_grant_vector : sc_inf_0_nios_saved_chosen_master_vector;

  //saved sc_inf_0_nios_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sc_inf_0_nios_saved_chosen_master_vector <= 0;
      else if (sc_inf_0_nios_allow_new_arb_cycle)
          sc_inf_0_nios_saved_chosen_master_vector <= |sc_inf_0_nios_grant_vector ? sc_inf_0_nios_grant_vector : sc_inf_0_nios_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sc_inf_0_nios_grant_vector = {(sc_inf_0_nios_chosen_master_double_vector[1] | sc_inf_0_nios_chosen_master_double_vector[3]),
    (sc_inf_0_nios_chosen_master_double_vector[0] | sc_inf_0_nios_chosen_master_double_vector[2])};

  //sc_inf_0/nios chosen master rotated left, which is an e_assign
  assign sc_inf_0_nios_chosen_master_rot_left = (sc_inf_0_nios_arb_winner << 1) ? (sc_inf_0_nios_arb_winner << 1) : 1;

  //sc_inf_0/nios's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sc_inf_0_nios_arb_addend <= 1;
      else if (|sc_inf_0_nios_grant_vector)
          sc_inf_0_nios_arb_addend <= sc_inf_0_nios_end_xfer? sc_inf_0_nios_chosen_master_rot_left : sc_inf_0_nios_grant_vector;
    end


  //sc_inf_0_nios_reset_n assignment, which is an e_assign
  assign sc_inf_0_nios_reset_n = reset_n;

  assign sc_inf_0_nios_chipselect_n = ~(cpu_0_data_master_granted_sc_inf_0_nios | jtag_avalon_master_0_granted_sc_inf_0_nios);
  //sc_inf_0_nios_firsttransfer first transaction, which is an e_assign
  assign sc_inf_0_nios_firsttransfer = sc_inf_0_nios_begins_xfer ? sc_inf_0_nios_unreg_firsttransfer : sc_inf_0_nios_reg_firsttransfer;

  //sc_inf_0_nios_unreg_firsttransfer first transaction, which is an e_assign
  assign sc_inf_0_nios_unreg_firsttransfer = ~(sc_inf_0_nios_slavearbiterlockenable & sc_inf_0_nios_any_continuerequest);

  //sc_inf_0_nios_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sc_inf_0_nios_reg_firsttransfer <= 1'b1;
      else if (sc_inf_0_nios_begins_xfer)
          sc_inf_0_nios_reg_firsttransfer <= sc_inf_0_nios_unreg_firsttransfer;
    end


  //sc_inf_0_nios_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sc_inf_0_nios_beginbursttransfer_internal = sc_inf_0_nios_begins_xfer;

  //sc_inf_0_nios_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sc_inf_0_nios_arbitration_holdoff_internal = sc_inf_0_nios_begins_xfer & sc_inf_0_nios_firsttransfer;

  //~sc_inf_0_nios_read_n assignment, which is an e_mux
  assign sc_inf_0_nios_read_n = ~((cpu_0_data_master_granted_sc_inf_0_nios & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_sc_inf_0_nios & jtag_avalon_master_0_master_read));

  //~sc_inf_0_nios_write_n assignment, which is an e_mux
  assign sc_inf_0_nios_write_n = ~((cpu_0_data_master_granted_sc_inf_0_nios & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_sc_inf_0_nios & jtag_avalon_master_0_master_write));

  assign shifted_address_to_sc_inf_0_nios_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sc_inf_0_nios_address mux, which is an e_mux
  assign sc_inf_0_nios_address = (cpu_0_data_master_granted_sc_inf_0_nios)? (shifted_address_to_sc_inf_0_nios_from_cpu_0_data_master >> 2) :
    (shifted_address_to_sc_inf_0_nios_from_jtag_avalon_master_0_master >> 2);

  assign shifted_address_to_sc_inf_0_nios_from_jtag_avalon_master_0_master = jtag_avalon_master_0_master_address_to_slave;
  //d1_sc_inf_0_nios_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sc_inf_0_nios_end_xfer <= 1;
      else 
        d1_sc_inf_0_nios_end_xfer <= sc_inf_0_nios_end_xfer;
    end


  //sc_inf_0_nios_waits_for_read in a cycle, which is an e_mux
  assign sc_inf_0_nios_waits_for_read = sc_inf_0_nios_in_a_read_cycle & sc_inf_0_nios_begins_xfer;

  //sc_inf_0_nios_in_a_read_cycle assignment, which is an e_assign
  assign sc_inf_0_nios_in_a_read_cycle = (cpu_0_data_master_granted_sc_inf_0_nios & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_sc_inf_0_nios & jtag_avalon_master_0_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sc_inf_0_nios_in_a_read_cycle;

  //sc_inf_0_nios_waits_for_write in a cycle, which is an e_mux
  assign sc_inf_0_nios_waits_for_write = sc_inf_0_nios_in_a_write_cycle & 0;

  //sc_inf_0_nios_in_a_write_cycle assignment, which is an e_assign
  assign sc_inf_0_nios_in_a_write_cycle = (cpu_0_data_master_granted_sc_inf_0_nios & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_sc_inf_0_nios & jtag_avalon_master_0_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sc_inf_0_nios_in_a_write_cycle;

  assign wait_for_sc_inf_0_nios_counter = 0;
  //assign sc_inf_0_nios_irq_from_sa = sc_inf_0_nios_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sc_inf_0_nios_irq_from_sa = sc_inf_0_nios_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sc_inf_0/nios enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_sc_inf_0_nios + jtag_avalon_master_0_granted_sc_inf_0_nios > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sc_inf_0_nios + jtag_avalon_master_0_saved_grant_sc_inf_0_nios > 1)
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

module timer_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_latency_counter,
                                cpu_0_data_master_read,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                jtag_avalon_master_0_latency_counter,
                                jtag_avalon_master_0_master_address_to_slave,
                                jtag_avalon_master_0_master_read,
                                jtag_avalon_master_0_master_write,
                                jtag_avalon_master_0_master_writedata,
                                reset_n,
                                timer_0_s1_irq,
                                timer_0_s1_readdata,

                               // outputs:
                                cpu_0_data_master_granted_timer_0_s1,
                                cpu_0_data_master_qualified_request_timer_0_s1,
                                cpu_0_data_master_read_data_valid_timer_0_s1,
                                cpu_0_data_master_requests_timer_0_s1,
                                d1_timer_0_s1_end_xfer,
                                jtag_avalon_master_0_granted_timer_0_s1,
                                jtag_avalon_master_0_qualified_request_timer_0_s1,
                                jtag_avalon_master_0_read_data_valid_timer_0_s1,
                                jtag_avalon_master_0_requests_timer_0_s1,
                                timer_0_s1_address,
                                timer_0_s1_chipselect,
                                timer_0_s1_irq_from_sa,
                                timer_0_s1_readdata_from_sa,
                                timer_0_s1_reset_n,
                                timer_0_s1_write_n,
                                timer_0_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_timer_0_s1;
  output           cpu_0_data_master_qualified_request_timer_0_s1;
  output           cpu_0_data_master_read_data_valid_timer_0_s1;
  output           cpu_0_data_master_requests_timer_0_s1;
  output           d1_timer_0_s1_end_xfer;
  output           jtag_avalon_master_0_granted_timer_0_s1;
  output           jtag_avalon_master_0_qualified_request_timer_0_s1;
  output           jtag_avalon_master_0_read_data_valid_timer_0_s1;
  output           jtag_avalon_master_0_requests_timer_0_s1;
  output  [  2: 0] timer_0_s1_address;
  output           timer_0_s1_chipselect;
  output           timer_0_s1_irq_from_sa;
  output  [ 15: 0] timer_0_s1_readdata_from_sa;
  output           timer_0_s1_reset_n;
  output           timer_0_s1_write_n;
  output  [ 15: 0] timer_0_s1_writedata;
  input            clk;
  input   [ 23: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_avalon_master_0_latency_counter;
  input   [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  input            jtag_avalon_master_0_master_read;
  input            jtag_avalon_master_0_master_write;
  input   [ 31: 0] jtag_avalon_master_0_master_writedata;
  input            reset_n;
  input            timer_0_s1_irq;
  input   [ 15: 0] timer_0_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_saved_grant_timer_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_avalon_master_0_granted_timer_0_s1;
  wire             jtag_avalon_master_0_master_arbiterlock;
  wire             jtag_avalon_master_0_master_arbiterlock2;
  wire             jtag_avalon_master_0_master_continuerequest;
  wire             jtag_avalon_master_0_qualified_request_timer_0_s1;
  wire             jtag_avalon_master_0_read_data_valid_timer_0_s1;
  wire             jtag_avalon_master_0_requests_timer_0_s1;
  wire             jtag_avalon_master_0_saved_grant_timer_0_s1;
  reg              last_cycle_cpu_0_data_master_granted_slave_timer_0_s1;
  reg              last_cycle_jtag_avalon_master_0_master_granted_slave_timer_0_s1;
  wire    [ 23: 0] shifted_address_to_timer_0_s1_from_cpu_0_data_master;
  wire    [ 31: 0] shifted_address_to_timer_0_s1_from_jtag_avalon_master_0_master;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_allgrants;
  wire             timer_0_s1_allow_new_arb_cycle;
  wire             timer_0_s1_any_bursting_master_saved_grant;
  wire             timer_0_s1_any_continuerequest;
  reg     [  1: 0] timer_0_s1_arb_addend;
  wire             timer_0_s1_arb_counter_enable;
  reg              timer_0_s1_arb_share_counter;
  wire             timer_0_s1_arb_share_counter_next_value;
  wire             timer_0_s1_arb_share_set_values;
  wire    [  1: 0] timer_0_s1_arb_winner;
  wire             timer_0_s1_arbitration_holdoff_internal;
  wire             timer_0_s1_beginbursttransfer_internal;
  wire             timer_0_s1_begins_xfer;
  wire             timer_0_s1_chipselect;
  wire    [  3: 0] timer_0_s1_chosen_master_double_vector;
  wire    [  1: 0] timer_0_s1_chosen_master_rot_left;
  wire             timer_0_s1_end_xfer;
  wire             timer_0_s1_firsttransfer;
  wire    [  1: 0] timer_0_s1_grant_vector;
  wire             timer_0_s1_in_a_read_cycle;
  wire             timer_0_s1_in_a_write_cycle;
  wire             timer_0_s1_irq_from_sa;
  wire    [  1: 0] timer_0_s1_master_qreq_vector;
  wire             timer_0_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  reg              timer_0_s1_reg_firsttransfer;
  wire             timer_0_s1_reset_n;
  reg     [  1: 0] timer_0_s1_saved_chosen_master_vector;
  reg              timer_0_s1_slavearbiterlockenable;
  wire             timer_0_s1_slavearbiterlockenable2;
  wire             timer_0_s1_unreg_firsttransfer;
  wire             timer_0_s1_waits_for_read;
  wire             timer_0_s1_waits_for_write;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire             wait_for_timer_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_0_s1_end_xfer;
    end


  assign timer_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_0_s1 | jtag_avalon_master_0_qualified_request_timer_0_s1));
  //assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata;

  assign cpu_0_data_master_requests_timer_0_s1 = ({cpu_0_data_master_address_to_slave[23 : 5] , 5'b0} == 24'h20) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_0_s1_arb_share_counter set values, which is an e_mux
  assign timer_0_s1_arb_share_set_values = 1;

  //timer_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_0_s1 |
    jtag_avalon_master_0_requests_timer_0_s1 |
    cpu_0_data_master_requests_timer_0_s1 |
    jtag_avalon_master_0_requests_timer_0_s1;

  //timer_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_0_s1_any_bursting_master_saved_grant = 0;

  //timer_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_0_s1_arb_share_counter_next_value = timer_0_s1_firsttransfer ? (timer_0_s1_arb_share_set_values - 1) : |timer_0_s1_arb_share_counter ? (timer_0_s1_arb_share_counter - 1) : 0;

  //timer_0_s1_allgrants all slave grants, which is an e_mux
  assign timer_0_s1_allgrants = (|timer_0_s1_grant_vector) |
    (|timer_0_s1_grant_vector) |
    (|timer_0_s1_grant_vector) |
    (|timer_0_s1_grant_vector);

  //timer_0_s1_end_xfer assignment, which is an e_assign
  assign timer_0_s1_end_xfer = ~(timer_0_s1_waits_for_read | timer_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_0_s1 = timer_0_s1_end_xfer & (~timer_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_0_s1 & timer_0_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests);

  //timer_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_share_counter <= 0;
      else if (timer_0_s1_arb_counter_enable)
          timer_0_s1_arb_share_counter <= timer_0_s1_arb_share_counter_next_value;
    end


  //timer_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_slavearbiterlockenable <= 0;
      else if ((|timer_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_0_s1) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests))
          timer_0_s1_slavearbiterlockenable <= |timer_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_0_s1_slavearbiterlockenable2 = |timer_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_avalon_master_0/master timer_0/s1 arbiterlock, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock = timer_0_s1_slavearbiterlockenable & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master timer_0/s1 arbiterlock2, which is an e_assign
  assign jtag_avalon_master_0_master_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & jtag_avalon_master_0_master_continuerequest;

  //jtag_avalon_master_0/master granted timer_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_jtag_avalon_master_0_master_granted_slave_timer_0_s1 <= 0;
      else 
        last_cycle_jtag_avalon_master_0_master_granted_slave_timer_0_s1 <= jtag_avalon_master_0_saved_grant_timer_0_s1 ? 1 : (timer_0_s1_arbitration_holdoff_internal | ~jtag_avalon_master_0_requests_timer_0_s1) ? 0 : last_cycle_jtag_avalon_master_0_master_granted_slave_timer_0_s1;
    end


  //jtag_avalon_master_0_master_continuerequest continued request, which is an e_mux
  assign jtag_avalon_master_0_master_continuerequest = last_cycle_jtag_avalon_master_0_master_granted_slave_timer_0_s1 & jtag_avalon_master_0_requests_timer_0_s1;

  //timer_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign timer_0_s1_any_continuerequest = jtag_avalon_master_0_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | jtag_avalon_master_0_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_timer_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_timer_0_s1 = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read & ~timer_0_s1_waits_for_read;

  //timer_0_s1_writedata mux, which is an e_mux
  assign timer_0_s1_writedata = (cpu_0_data_master_granted_timer_0_s1)? cpu_0_data_master_writedata :
    jtag_avalon_master_0_master_writedata;

  assign jtag_avalon_master_0_requests_timer_0_s1 = ({jtag_avalon_master_0_master_address_to_slave[31 : 5] , 5'b0} == 32'h20) & (jtag_avalon_master_0_master_read | jtag_avalon_master_0_master_write);
  //cpu_0/data_master granted timer_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_timer_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_timer_0_s1 <= cpu_0_data_master_saved_grant_timer_0_s1 ? 1 : (timer_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_timer_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_timer_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_timer_0_s1 & cpu_0_data_master_requests_timer_0_s1;

  assign jtag_avalon_master_0_qualified_request_timer_0_s1 = jtag_avalon_master_0_requests_timer_0_s1 & ~((jtag_avalon_master_0_master_read & ((jtag_avalon_master_0_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid jtag_avalon_master_0_read_data_valid_timer_0_s1, which is an e_mux
  assign jtag_avalon_master_0_read_data_valid_timer_0_s1 = jtag_avalon_master_0_granted_timer_0_s1 & jtag_avalon_master_0_master_read & ~timer_0_s1_waits_for_read;

  //allow new arb cycle for timer_0/s1, which is an e_assign
  assign timer_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~jtag_avalon_master_0_master_arbiterlock;

  //jtag_avalon_master_0/master assignment into master qualified-requests vector for timer_0/s1, which is an e_assign
  assign timer_0_s1_master_qreq_vector[0] = jtag_avalon_master_0_qualified_request_timer_0_s1;

  //jtag_avalon_master_0/master grant timer_0/s1, which is an e_assign
  assign jtag_avalon_master_0_granted_timer_0_s1 = timer_0_s1_grant_vector[0];

  //jtag_avalon_master_0/master saved-grant timer_0/s1, which is an e_assign
  assign jtag_avalon_master_0_saved_grant_timer_0_s1 = timer_0_s1_arb_winner[0] && jtag_avalon_master_0_requests_timer_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for timer_0/s1, which is an e_assign
  assign timer_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_timer_0_s1;

  //cpu_0/data_master grant timer_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_timer_0_s1 = timer_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant timer_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_0_s1 = timer_0_s1_arb_winner[1] && cpu_0_data_master_requests_timer_0_s1;

  //timer_0/s1 chosen-master double-vector, which is an e_assign
  assign timer_0_s1_chosen_master_double_vector = {timer_0_s1_master_qreq_vector, timer_0_s1_master_qreq_vector} & ({~timer_0_s1_master_qreq_vector, ~timer_0_s1_master_qreq_vector} + timer_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign timer_0_s1_arb_winner = (timer_0_s1_allow_new_arb_cycle & | timer_0_s1_grant_vector) ? timer_0_s1_grant_vector : timer_0_s1_saved_chosen_master_vector;

  //saved timer_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_saved_chosen_master_vector <= 0;
      else if (timer_0_s1_allow_new_arb_cycle)
          timer_0_s1_saved_chosen_master_vector <= |timer_0_s1_grant_vector ? timer_0_s1_grant_vector : timer_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign timer_0_s1_grant_vector = {(timer_0_s1_chosen_master_double_vector[1] | timer_0_s1_chosen_master_double_vector[3]),
    (timer_0_s1_chosen_master_double_vector[0] | timer_0_s1_chosen_master_double_vector[2])};

  //timer_0/s1 chosen master rotated left, which is an e_assign
  assign timer_0_s1_chosen_master_rot_left = (timer_0_s1_arb_winner << 1) ? (timer_0_s1_arb_winner << 1) : 1;

  //timer_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_addend <= 1;
      else if (|timer_0_s1_grant_vector)
          timer_0_s1_arb_addend <= timer_0_s1_end_xfer? timer_0_s1_chosen_master_rot_left : timer_0_s1_grant_vector;
    end


  //timer_0_s1_reset_n assignment, which is an e_assign
  assign timer_0_s1_reset_n = reset_n;

  assign timer_0_s1_chipselect = cpu_0_data_master_granted_timer_0_s1 | jtag_avalon_master_0_granted_timer_0_s1;
  //timer_0_s1_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_firsttransfer = timer_0_s1_begins_xfer ? timer_0_s1_unreg_firsttransfer : timer_0_s1_reg_firsttransfer;

  //timer_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_unreg_firsttransfer = ~(timer_0_s1_slavearbiterlockenable & timer_0_s1_any_continuerequest);

  //timer_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_reg_firsttransfer <= 1'b1;
      else if (timer_0_s1_begins_xfer)
          timer_0_s1_reg_firsttransfer <= timer_0_s1_unreg_firsttransfer;
    end


  //timer_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_0_s1_beginbursttransfer_internal = timer_0_s1_begins_xfer;

  //timer_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign timer_0_s1_arbitration_holdoff_internal = timer_0_s1_begins_xfer & timer_0_s1_firsttransfer;

  //~timer_0_s1_write_n assignment, which is an e_mux
  assign timer_0_s1_write_n = ~((cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_timer_0_s1 & jtag_avalon_master_0_master_write));

  assign shifted_address_to_timer_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_0_s1_address mux, which is an e_mux
  assign timer_0_s1_address = (cpu_0_data_master_granted_timer_0_s1)? (shifted_address_to_timer_0_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_timer_0_s1_from_jtag_avalon_master_0_master >> 2);

  assign shifted_address_to_timer_0_s1_from_jtag_avalon_master_0_master = jtag_avalon_master_0_master_address_to_slave;
  //d1_timer_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_0_s1_end_xfer <= 1;
      else 
        d1_timer_0_s1_end_xfer <= timer_0_s1_end_xfer;
    end


  //timer_0_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_read = timer_0_s1_in_a_read_cycle & timer_0_s1_begins_xfer;

  //timer_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read) | (jtag_avalon_master_0_granted_timer_0_s1 & jtag_avalon_master_0_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_0_s1_in_a_read_cycle;

  //timer_0_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_write = timer_0_s1_in_a_write_cycle & 0;

  //timer_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_write_cycle = (cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write) | (jtag_avalon_master_0_granted_timer_0_s1 & jtag_avalon_master_0_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_0_s1_in_a_write_cycle;

  assign wait_for_timer_0_s1_counter = 0;
  //assign timer_0_s1_irq_from_sa = timer_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_irq_from_sa = timer_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_0/s1 enable non-zero assertions, which is an e_register
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
      if (cpu_0_data_master_granted_timer_0_s1 + jtag_avalon_master_0_granted_timer_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_timer_0_s1 + jtag_avalon_master_0_saved_grant_timer_0_s1 > 1)
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

module nios_bts_reset_clk_0_domain_synch_module (
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

module nios_bts (
                  // 1) global signals:
                   clk_0,
                   reset_n,

                  // the_heartbeat_0
                   led_from_the_heartbeat_0,

                  // the_nios_bts_port_ddr2_x40_0
                   avalon_dip_to_the_nios_bts_port_ddr2_x40_0,
                   avalon_led_from_the_nios_bts_port_ddr2_x40_0,
                   avalon_pb_to_the_nios_bts_port_ddr2_x40_0,
                   create_error_pb_to_the_nios_bts_port_ddr2_x40_0,
                   error_latch_from_the_nios_bts_port_ddr2_x40_0,
                   local_addr_from_the_nios_bts_port_ddr2_x40_0,
                   local_be_from_the_nios_bts_port_ddr2_x40_0,
                   local_burst_begin_from_the_nios_bts_port_ddr2_x40_0,
                   local_clk_to_the_nios_bts_port_ddr2_x40_0,
                   local_init_done_to_the_nios_bts_port_ddr2_x40_0,
                   local_rdata_to_the_nios_bts_port_ddr2_x40_0,
                   local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0,
                   local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0,
                   local_read_req_from_the_nios_bts_port_ddr2_x40_0,
                   local_ready_to_the_nios_bts_port_ddr2_x40_0,
                   local_reset_n_from_the_nios_bts_port_ddr2_x40_0,
                   local_size_from_the_nios_bts_port_ddr2_x40_0,
                   local_wdata_from_the_nios_bts_port_ddr2_x40_0,
                   local_wdata_req_to_the_nios_bts_port_ddr2_x40_0,
                   local_write_req_from_the_nios_bts_port_ddr2_x40_0,
                   pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0,
                   plls_in_locked_to_the_nios_bts_port_ddr2_x40_0,
                   plls_locked_from_the_nios_bts_port_ddr2_x40_0,
                   reset_n_to_the_nios_bts_port_ddr2_x40_0,
                   start_pb_to_the_nios_bts_port_ddr2_x40_0,
                   test_complete_from_the_nios_bts_port_ddr2_x40_0
                )
;

  output  [  7: 0] avalon_led_from_the_nios_bts_port_ddr2_x40_0;
  output           error_latch_from_the_nios_bts_port_ddr2_x40_0;
  output           led_from_the_heartbeat_0;
  output  [ 22: 0] local_addr_from_the_nios_bts_port_ddr2_x40_0;
  output  [ 19: 0] local_be_from_the_nios_bts_port_ddr2_x40_0;
  output           local_burst_begin_from_the_nios_bts_port_ddr2_x40_0;
  output           local_read_req_from_the_nios_bts_port_ddr2_x40_0;
  output           local_reset_n_from_the_nios_bts_port_ddr2_x40_0;
  output           local_size_from_the_nios_bts_port_ddr2_x40_0;
  output  [159: 0] local_wdata_from_the_nios_bts_port_ddr2_x40_0;
  output           local_write_req_from_the_nios_bts_port_ddr2_x40_0;
  output           pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0;
  output           plls_locked_from_the_nios_bts_port_ddr2_x40_0;
  output           test_complete_from_the_nios_bts_port_ddr2_x40_0;
  input   [  7: 0] avalon_dip_to_the_nios_bts_port_ddr2_x40_0;
  input   [  7: 0] avalon_pb_to_the_nios_bts_port_ddr2_x40_0;
  input            clk_0;
  input            create_error_pb_to_the_nios_bts_port_ddr2_x40_0;
  input            local_clk_to_the_nios_bts_port_ddr2_x40_0;
  input            local_init_done_to_the_nios_bts_port_ddr2_x40_0;
  input   [159: 0] local_rdata_to_the_nios_bts_port_ddr2_x40_0;
  input            local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0;
  input            local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0;
  input            local_ready_to_the_nios_bts_port_ddr2_x40_0;
  input            local_wdata_req_to_the_nios_bts_port_ddr2_x40_0;
  input            plls_in_locked_to_the_nios_bts_port_ddr2_x40_0;
  input            reset_n;
  input            reset_n_to_the_nios_bts_port_ddr2_x40_0;
  input            start_pb_to_the_nios_bts_port_ddr2_x40_0;

  wire    [  7: 0] avalon_led_from_the_nios_bts_port_ddr2_x40_0;
  wire             clk_0_reset_n;
  wire    [ 23: 0] cpu_0_data_master_address;
  wire    [ 23: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_heartbeat_0_nios;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_data_master_granted_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_granted_sc_inf_0_nios;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_latency_counter;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_heartbeat_0_nios;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_sc_inf_0_nios;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_heartbeat_0_nios;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  wire             cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_sc_inf_0_nios;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_heartbeat_0_nios;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios;
  wire             cpu_0_data_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_data_master_requests_product_info_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_sc_inf_0_nios;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 18: 0] cpu_0_instruction_master_address;
  wire    [ 18: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_heartbeat_0_nios_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_nios_bts_port_ddr2_x40_0_nios_end_xfer;
  wire             d1_onchip_memory2_0_s1_end_xfer;
  wire             d1_product_info_0_avalon_slave_0_end_xfer;
  wire             d1_sc_inf_0_nios_end_xfer;
  wire             d1_timer_0_s1_end_xfer;
  wire             error_latch_from_the_nios_bts_port_ddr2_x40_0;
  wire             heartbeat_0_nios_address;
  wire             heartbeat_0_nios_chipselect_n;
  wire             heartbeat_0_nios_irq;
  wire             heartbeat_0_nios_irq_from_sa;
  wire             heartbeat_0_nios_read_n;
  wire    [ 31: 0] heartbeat_0_nios_readdata;
  wire    [ 31: 0] heartbeat_0_nios_readdata_from_sa;
  wire             heartbeat_0_nios_reset_n;
  wire             heartbeat_0_nios_write_n;
  wire    [ 31: 0] heartbeat_0_nios_writedata;
  wire             jtag_avalon_master_0_granted_heartbeat_0_nios;
  wire             jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_granted_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_granted_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_granted_sc_inf_0_nios;
  wire             jtag_avalon_master_0_granted_timer_0_s1;
  wire             jtag_avalon_master_0_latency_counter;
  wire    [ 31: 0] jtag_avalon_master_0_master_address;
  wire    [ 31: 0] jtag_avalon_master_0_master_address_to_slave;
  wire    [  3: 0] jtag_avalon_master_0_master_byteenable;
  wire             jtag_avalon_master_0_master_read;
  wire    [ 31: 0] jtag_avalon_master_0_master_readdata;
  wire             jtag_avalon_master_0_master_readdatavalid;
  wire             jtag_avalon_master_0_master_reset;
  wire             jtag_avalon_master_0_master_resetrequest;
  wire             jtag_avalon_master_0_master_waitrequest;
  wire             jtag_avalon_master_0_master_write;
  wire    [ 31: 0] jtag_avalon_master_0_master_writedata;
  wire             jtag_avalon_master_0_qualified_request_heartbeat_0_nios;
  wire             jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_qualified_request_sc_inf_0_nios;
  wire             jtag_avalon_master_0_qualified_request_timer_0_s1;
  wire             jtag_avalon_master_0_read_data_valid_heartbeat_0_nios;
  wire             jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_read_data_valid_sc_inf_0_nios;
  wire             jtag_avalon_master_0_read_data_valid_timer_0_s1;
  wire             jtag_avalon_master_0_requests_heartbeat_0_nios;
  wire             jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios;
  wire             jtag_avalon_master_0_requests_onchip_memory2_0_s1;
  wire             jtag_avalon_master_0_requests_product_info_0_avalon_slave_0;
  wire             jtag_avalon_master_0_requests_sc_inf_0_nios;
  wire             jtag_avalon_master_0_requests_timer_0_s1;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             led_from_the_heartbeat_0;
  wire    [ 22: 0] local_addr_from_the_nios_bts_port_ddr2_x40_0;
  wire    [ 19: 0] local_be_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_burst_begin_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_read_req_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_reset_n_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_size_from_the_nios_bts_port_ddr2_x40_0;
  wire    [159: 0] local_wdata_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_write_req_from_the_nios_bts_port_ddr2_x40_0;
  wire    [ 19: 0] nios_bts_port_ddr2_x40_0_nios_address;
  wire             nios_bts_port_ddr2_x40_0_nios_chipselect;
  wire             nios_bts_port_ddr2_x40_0_nios_irq;
  wire             nios_bts_port_ddr2_x40_0_nios_irq_from_sa;
  wire             nios_bts_port_ddr2_x40_0_nios_read;
  wire    [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata;
  wire    [ 31: 0] nios_bts_port_ddr2_x40_0_nios_readdata_from_sa;
  wire             nios_bts_port_ddr2_x40_0_nios_reset_n;
  wire             nios_bts_port_ddr2_x40_0_nios_waitrequest;
  wire             nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa;
  wire             nios_bts_port_ddr2_x40_0_nios_write;
  wire    [ 31: 0] nios_bts_port_ddr2_x40_0_nios_writedata;
  wire    [ 15: 0] onchip_memory2_0_s1_address;
  wire    [  3: 0] onchip_memory2_0_s1_byteenable;
  wire             onchip_memory2_0_s1_chipselect;
  wire             onchip_memory2_0_s1_clken;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  wire             onchip_memory2_0_s1_reset;
  wire             onchip_memory2_0_s1_write;
  wire    [ 31: 0] onchip_memory2_0_s1_writedata;
  wire             pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0;
  wire             plls_locked_from_the_nios_bts_port_ddr2_x40_0;
  wire    [  1: 0] product_info_0_avalon_slave_0_address;
  wire             product_info_0_avalon_slave_0_chipselect_n;
  wire             product_info_0_avalon_slave_0_read_n;
  wire    [ 31: 0] product_info_0_avalon_slave_0_readdata;
  wire    [ 31: 0] product_info_0_avalon_slave_0_readdata_from_sa;
  wire             product_info_0_avalon_slave_0_reset_n;
  wire             reset_n_sources;
  wire    [  7: 0] sc_inf_0_nios_address;
  wire             sc_inf_0_nios_chipselect_n;
  wire             sc_inf_0_nios_irq;
  wire             sc_inf_0_nios_irq_from_sa;
  wire             sc_inf_0_nios_read_n;
  wire    [ 31: 0] sc_inf_0_nios_readdata;
  wire    [ 31: 0] sc_inf_0_nios_readdata_from_sa;
  wire             sc_inf_0_nios_reset_n;
  wire             sc_inf_0_nios_write_n;
  wire    [ 31: 0] sc_inf_0_nios_writedata;
  wire             test_complete_from_the_nios_bts_port_ddr2_x40_0;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_irq;
  wire             timer_0_s1_irq_from_sa;
  wire    [ 15: 0] timer_0_s1_readdata;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  wire             timer_0_s1_reset_n;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .clk                                                               (clk_0),
      .cpu_0_data_master_address                                         (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                      (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                 (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_heartbeat_0_nios                        (cpu_0_data_master_granted_heartbeat_0_nios),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios           (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_granted_onchip_memory2_0_s1                     (cpu_0_data_master_granted_onchip_memory2_0_s1),
      .cpu_0_data_master_granted_product_info_0_avalon_slave_0           (cpu_0_data_master_granted_product_info_0_avalon_slave_0),
      .cpu_0_data_master_granted_sc_inf_0_nios                           (cpu_0_data_master_granted_sc_inf_0_nios),
      .cpu_0_data_master_granted_timer_0_s1                              (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_irq                                             (cpu_0_data_master_irq),
      .cpu_0_data_master_latency_counter                                 (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module       (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_heartbeat_0_nios              (cpu_0_data_master_qualified_request_heartbeat_0_nios),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios (cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_qualified_request_onchip_memory2_0_s1           (cpu_0_data_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0 (cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0),
      .cpu_0_data_master_qualified_request_sc_inf_0_nios                 (cpu_0_data_master_qualified_request_sc_inf_0_nios),
      .cpu_0_data_master_qualified_request_timer_0_s1                    (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module         (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_heartbeat_0_nios                (cpu_0_data_master_read_data_valid_heartbeat_0_nios),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios   (cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_read_data_valid_onchip_memory2_0_s1             (cpu_0_data_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0   (cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_sc_inf_0_nios                   (cpu_0_data_master_read_data_valid_sc_inf_0_nios),
      .cpu_0_data_master_read_data_valid_timer_0_s1                      (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_readdata                                        (cpu_0_data_master_readdata),
      .cpu_0_data_master_readdatavalid                                   (cpu_0_data_master_readdatavalid),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_heartbeat_0_nios                       (cpu_0_data_master_requests_heartbeat_0_nios),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios          (cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_requests_onchip_memory2_0_s1                    (cpu_0_data_master_requests_onchip_memory2_0_s1),
      .cpu_0_data_master_requests_product_info_0_avalon_slave_0          (cpu_0_data_master_requests_product_info_0_avalon_slave_0),
      .cpu_0_data_master_requests_sc_inf_0_nios                          (cpu_0_data_master_requests_sc_inf_0_nios),
      .cpu_0_data_master_requests_timer_0_s1                             (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                          (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                               (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_heartbeat_0_nios_end_xfer                                      (d1_heartbeat_0_nios_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_nios_bts_port_ddr2_x40_0_nios_end_xfer                         (d1_nios_bts_port_ddr2_x40_0_nios_end_xfer),
      .d1_onchip_memory2_0_s1_end_xfer                                   (d1_onchip_memory2_0_s1_end_xfer),
      .d1_product_info_0_avalon_slave_0_end_xfer                         (d1_product_info_0_avalon_slave_0_end_xfer),
      .d1_sc_inf_0_nios_end_xfer                                         (d1_sc_inf_0_nios_end_xfer),
      .d1_timer_0_s1_end_xfer                                            (d1_timer_0_s1_end_xfer),
      .heartbeat_0_nios_irq_from_sa                                      (heartbeat_0_nios_irq_from_sa),
      .heartbeat_0_nios_readdata_from_sa                                 (heartbeat_0_nios_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_irq_from_sa                         (nios_bts_port_ddr2_x40_0_nios_irq_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_readdata_from_sa                    (nios_bts_port_ddr2_x40_0_nios_readdata_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa                 (nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa),
      .onchip_memory2_0_s1_readdata_from_sa                              (onchip_memory2_0_s1_readdata_from_sa),
      .product_info_0_avalon_slave_0_readdata_from_sa                    (product_info_0_avalon_slave_0_readdata_from_sa),
      .reset_n                                                           (clk_0_reset_n),
      .sc_inf_0_nios_irq_from_sa                                         (sc_inf_0_nios_irq_from_sa),
      .sc_inf_0_nios_readdata_from_sa                                    (sc_inf_0_nios_readdata_from_sa),
      .timer_0_s1_irq_from_sa                                            (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata_from_sa                                       (timer_0_s1_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                (clk_0),
      .cpu_0_instruction_master_address                                   (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_onchip_memory2_0_s1               (cpu_0_instruction_master_granted_onchip_memory2_0_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1     (cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1       (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_instruction_master_readdata                                  (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                             (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_onchip_memory2_0_s1              (cpu_0_instruction_master_requests_onchip_memory2_0_s1),
      .cpu_0_instruction_master_waitrequest                               (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_onchip_memory2_0_s1_end_xfer                                    (d1_onchip_memory2_0_s1_end_xfer),
      .onchip_memory2_0_s1_readdata_from_sa                               (onchip_memory2_0_s1_readdata_from_sa),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_readdatavalid                       (cpu_0_data_master_readdatavalid),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_readdatavalid                       (cpu_0_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  heartbeat_0_nios_arbitrator the_heartbeat_0_nios
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_heartbeat_0_nios              (cpu_0_data_master_granted_heartbeat_0_nios),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_heartbeat_0_nios    (cpu_0_data_master_qualified_request_heartbeat_0_nios),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_heartbeat_0_nios      (cpu_0_data_master_read_data_valid_heartbeat_0_nios),
      .cpu_0_data_master_requests_heartbeat_0_nios             (cpu_0_data_master_requests_heartbeat_0_nios),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                             (cpu_0_data_master_writedata),
      .d1_heartbeat_0_nios_end_xfer                            (d1_heartbeat_0_nios_end_xfer),
      .heartbeat_0_nios_address                                (heartbeat_0_nios_address),
      .heartbeat_0_nios_chipselect_n                           (heartbeat_0_nios_chipselect_n),
      .heartbeat_0_nios_irq                                    (heartbeat_0_nios_irq),
      .heartbeat_0_nios_irq_from_sa                            (heartbeat_0_nios_irq_from_sa),
      .heartbeat_0_nios_read_n                                 (heartbeat_0_nios_read_n),
      .heartbeat_0_nios_readdata                               (heartbeat_0_nios_readdata),
      .heartbeat_0_nios_readdata_from_sa                       (heartbeat_0_nios_readdata_from_sa),
      .heartbeat_0_nios_reset_n                                (heartbeat_0_nios_reset_n),
      .heartbeat_0_nios_write_n                                (heartbeat_0_nios_write_n),
      .heartbeat_0_nios_writedata                              (heartbeat_0_nios_writedata),
      .jtag_avalon_master_0_granted_heartbeat_0_nios           (jtag_avalon_master_0_granted_heartbeat_0_nios),
      .jtag_avalon_master_0_latency_counter                    (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address_to_slave            (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_read                        (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_write                       (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_master_writedata                   (jtag_avalon_master_0_master_writedata),
      .jtag_avalon_master_0_qualified_request_heartbeat_0_nios (jtag_avalon_master_0_qualified_request_heartbeat_0_nios),
      .jtag_avalon_master_0_read_data_valid_heartbeat_0_nios   (jtag_avalon_master_0_read_data_valid_heartbeat_0_nios),
      .jtag_avalon_master_0_requests_heartbeat_0_nios          (jtag_avalon_master_0_requests_heartbeat_0_nios),
      .reset_n                                                 (clk_0_reset_n)
    );

  heartbeat_0 the_heartbeat_0
    (
      .led               (led_from_the_heartbeat_0),
      .nios_address      (heartbeat_0_nios_address),
      .nios_chipselect_n (heartbeat_0_nios_chipselect_n),
      .nios_clk          (clk_0),
      .nios_irq          (heartbeat_0_nios_irq),
      .nios_read_n       (heartbeat_0_nios_read_n),
      .nios_readdata     (heartbeat_0_nios_readdata),
      .nios_reset_n      (heartbeat_0_nios_reset_n),
      .nios_write_n      (heartbeat_0_nios_write_n),
      .nios_writedata    (heartbeat_0_nios_writedata)
    );

  jtag_avalon_master_0_master_arbitrator the_jtag_avalon_master_0_master
    (
      .clk                                                                  (clk_0),
      .d1_heartbeat_0_nios_end_xfer                                         (d1_heartbeat_0_nios_end_xfer),
      .d1_nios_bts_port_ddr2_x40_0_nios_end_xfer                            (d1_nios_bts_port_ddr2_x40_0_nios_end_xfer),
      .d1_onchip_memory2_0_s1_end_xfer                                      (d1_onchip_memory2_0_s1_end_xfer),
      .d1_product_info_0_avalon_slave_0_end_xfer                            (d1_product_info_0_avalon_slave_0_end_xfer),
      .d1_sc_inf_0_nios_end_xfer                                            (d1_sc_inf_0_nios_end_xfer),
      .d1_timer_0_s1_end_xfer                                               (d1_timer_0_s1_end_xfer),
      .heartbeat_0_nios_readdata_from_sa                                    (heartbeat_0_nios_readdata_from_sa),
      .jtag_avalon_master_0_granted_heartbeat_0_nios                        (jtag_avalon_master_0_granted_heartbeat_0_nios),
      .jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios           (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_granted_onchip_memory2_0_s1                     (jtag_avalon_master_0_granted_onchip_memory2_0_s1),
      .jtag_avalon_master_0_granted_product_info_0_avalon_slave_0           (jtag_avalon_master_0_granted_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_granted_sc_inf_0_nios                           (jtag_avalon_master_0_granted_sc_inf_0_nios),
      .jtag_avalon_master_0_granted_timer_0_s1                              (jtag_avalon_master_0_granted_timer_0_s1),
      .jtag_avalon_master_0_latency_counter                                 (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address                                  (jtag_avalon_master_0_master_address),
      .jtag_avalon_master_0_master_address_to_slave                         (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_byteenable                               (jtag_avalon_master_0_master_byteenable),
      .jtag_avalon_master_0_master_read                                     (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_readdata                                 (jtag_avalon_master_0_master_readdata),
      .jtag_avalon_master_0_master_readdatavalid                            (jtag_avalon_master_0_master_readdatavalid),
      .jtag_avalon_master_0_master_reset                                    (jtag_avalon_master_0_master_reset),
      .jtag_avalon_master_0_master_waitrequest                              (jtag_avalon_master_0_master_waitrequest),
      .jtag_avalon_master_0_master_write                                    (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_master_writedata                                (jtag_avalon_master_0_master_writedata),
      .jtag_avalon_master_0_qualified_request_heartbeat_0_nios              (jtag_avalon_master_0_qualified_request_heartbeat_0_nios),
      .jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios (jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1           (jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1),
      .jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 (jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_qualified_request_sc_inf_0_nios                 (jtag_avalon_master_0_qualified_request_sc_inf_0_nios),
      .jtag_avalon_master_0_qualified_request_timer_0_s1                    (jtag_avalon_master_0_qualified_request_timer_0_s1),
      .jtag_avalon_master_0_read_data_valid_heartbeat_0_nios                (jtag_avalon_master_0_read_data_valid_heartbeat_0_nios),
      .jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios   (jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1             (jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1),
      .jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0   (jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_read_data_valid_sc_inf_0_nios                   (jtag_avalon_master_0_read_data_valid_sc_inf_0_nios),
      .jtag_avalon_master_0_read_data_valid_timer_0_s1                      (jtag_avalon_master_0_read_data_valid_timer_0_s1),
      .jtag_avalon_master_0_requests_heartbeat_0_nios                       (jtag_avalon_master_0_requests_heartbeat_0_nios),
      .jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios          (jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_requests_onchip_memory2_0_s1                    (jtag_avalon_master_0_requests_onchip_memory2_0_s1),
      .jtag_avalon_master_0_requests_product_info_0_avalon_slave_0          (jtag_avalon_master_0_requests_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_requests_sc_inf_0_nios                          (jtag_avalon_master_0_requests_sc_inf_0_nios),
      .jtag_avalon_master_0_requests_timer_0_s1                             (jtag_avalon_master_0_requests_timer_0_s1),
      .nios_bts_port_ddr2_x40_0_nios_readdata_from_sa                       (nios_bts_port_ddr2_x40_0_nios_readdata_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa                    (nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa),
      .onchip_memory2_0_s1_readdata_from_sa                                 (onchip_memory2_0_s1_readdata_from_sa),
      .product_info_0_avalon_slave_0_readdata_from_sa                       (product_info_0_avalon_slave_0_readdata_from_sa),
      .reset_n                                                              (clk_0_reset_n),
      .sc_inf_0_nios_readdata_from_sa                                       (sc_inf_0_nios_readdata_from_sa),
      .timer_0_s1_readdata_from_sa                                          (timer_0_s1_readdata_from_sa)
    );

  jtag_avalon_master_0 the_jtag_avalon_master_0
    (
      .clk_clk              (clk_0),
      .clk_reset_reset      (jtag_avalon_master_0_master_reset),
      .master_address       (jtag_avalon_master_0_master_address),
      .master_byteenable    (jtag_avalon_master_0_master_byteenable),
      .master_read          (jtag_avalon_master_0_master_read),
      .master_readdata      (jtag_avalon_master_0_master_readdata),
      .master_readdatavalid (jtag_avalon_master_0_master_readdatavalid),
      .master_reset_reset   (jtag_avalon_master_0_master_resetrequest),
      .master_waitrequest   (jtag_avalon_master_0_master_waitrequest),
      .master_write         (jtag_avalon_master_0_master_write),
      .master_writedata     (jtag_avalon_master_0_master_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clk_0),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_latency_counter                                 (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clk_0_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk_0),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  nios_bts_port_ddr2_x40_0_nios_arbitrator the_nios_bts_port_ddr2_x40_0_nios
    (
      .clk                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios              (cpu_0_data_master_granted_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_latency_counter                                    (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios    (cpu_0_data_master_qualified_request_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_read                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios      (cpu_0_data_master_read_data_valid_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios             (cpu_0_data_master_requests_nios_bts_port_ddr2_x40_0_nios),
      .cpu_0_data_master_write                                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                          (cpu_0_data_master_writedata),
      .d1_nios_bts_port_ddr2_x40_0_nios_end_xfer                            (d1_nios_bts_port_ddr2_x40_0_nios_end_xfer),
      .jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios           (jtag_avalon_master_0_granted_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_latency_counter                                 (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address_to_slave                         (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_read                                     (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_write                                    (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_master_writedata                                (jtag_avalon_master_0_master_writedata),
      .jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios (jtag_avalon_master_0_qualified_request_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios   (jtag_avalon_master_0_read_data_valid_nios_bts_port_ddr2_x40_0_nios),
      .jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios          (jtag_avalon_master_0_requests_nios_bts_port_ddr2_x40_0_nios),
      .nios_bts_port_ddr2_x40_0_nios_address                                (nios_bts_port_ddr2_x40_0_nios_address),
      .nios_bts_port_ddr2_x40_0_nios_chipselect                             (nios_bts_port_ddr2_x40_0_nios_chipselect),
      .nios_bts_port_ddr2_x40_0_nios_irq                                    (nios_bts_port_ddr2_x40_0_nios_irq),
      .nios_bts_port_ddr2_x40_0_nios_irq_from_sa                            (nios_bts_port_ddr2_x40_0_nios_irq_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_read                                   (nios_bts_port_ddr2_x40_0_nios_read),
      .nios_bts_port_ddr2_x40_0_nios_readdata                               (nios_bts_port_ddr2_x40_0_nios_readdata),
      .nios_bts_port_ddr2_x40_0_nios_readdata_from_sa                       (nios_bts_port_ddr2_x40_0_nios_readdata_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_reset_n                                (nios_bts_port_ddr2_x40_0_nios_reset_n),
      .nios_bts_port_ddr2_x40_0_nios_waitrequest                            (nios_bts_port_ddr2_x40_0_nios_waitrequest),
      .nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa                    (nios_bts_port_ddr2_x40_0_nios_waitrequest_from_sa),
      .nios_bts_port_ddr2_x40_0_nios_write                                  (nios_bts_port_ddr2_x40_0_nios_write),
      .nios_bts_port_ddr2_x40_0_nios_writedata                              (nios_bts_port_ddr2_x40_0_nios_writedata),
      .reset_n                                                              (clk_0_reset_n)
    );

  nios_bts_port_ddr2_x40_0 the_nios_bts_port_ddr2_x40_0
    (
      .avalon_dip            (avalon_dip_to_the_nios_bts_port_ddr2_x40_0),
      .avalon_led            (avalon_led_from_the_nios_bts_port_ddr2_x40_0),
      .avalon_pb             (avalon_pb_to_the_nios_bts_port_ddr2_x40_0),
      .create_error_pb       (create_error_pb_to_the_nios_bts_port_ddr2_x40_0),
      .error_irq             (nios_bts_port_ddr2_x40_0_nios_irq),
      .error_latch           (error_latch_from_the_nios_bts_port_ddr2_x40_0),
      .local_addr            (local_addr_from_the_nios_bts_port_ddr2_x40_0),
      .local_be              (local_be_from_the_nios_bts_port_ddr2_x40_0),
      .local_burst_begin     (local_burst_begin_from_the_nios_bts_port_ddr2_x40_0),
      .local_clk             (local_clk_to_the_nios_bts_port_ddr2_x40_0),
      .local_init_done       (local_init_done_to_the_nios_bts_port_ddr2_x40_0),
      .local_rdata           (local_rdata_to_the_nios_bts_port_ddr2_x40_0),
      .local_rdata_valid     (local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0),
      .local_rdvalid_in_n    (local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0),
      .local_read_req        (local_read_req_from_the_nios_bts_port_ddr2_x40_0),
      .local_ready           (local_ready_to_the_nios_bts_port_ddr2_x40_0),
      .local_reset_n         (local_reset_n_from_the_nios_bts_port_ddr2_x40_0),
      .local_size            (local_size_from_the_nios_bts_port_ddr2_x40_0),
      .local_wdata           (local_wdata_from_the_nios_bts_port_ddr2_x40_0),
      .local_wdata_req       (local_wdata_req_to_the_nios_bts_port_ddr2_x40_0),
      .local_write_req       (local_write_req_from_the_nios_bts_port_ddr2_x40_0),
      .nios_address          (nios_bts_port_ddr2_x40_0_nios_address),
      .nios_chipselect       (nios_bts_port_ddr2_x40_0_nios_chipselect),
      .nios_clk              (clk_0),
      .nios_read             (nios_bts_port_ddr2_x40_0_nios_read),
      .nios_readdata         (nios_bts_port_ddr2_x40_0_nios_readdata),
      .nios_reset_n          (nios_bts_port_ddr2_x40_0_nios_reset_n),
      .nios_waitrequest      (nios_bts_port_ddr2_x40_0_nios_waitrequest),
      .nios_write            (nios_bts_port_ddr2_x40_0_nios_write),
      .nios_writedata        (nios_bts_port_ddr2_x40_0_nios_writedata),
      .pattern_sync_acquired (pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0),
      .plls_in_locked        (plls_in_locked_to_the_nios_bts_port_ddr2_x40_0),
      .plls_locked           (plls_locked_from_the_nios_bts_port_ddr2_x40_0),
      .reset_n               (reset_n_to_the_nios_bts_port_ddr2_x40_0),
      .start_pb              (start_pb_to_the_nios_bts_port_ddr2_x40_0),
      .test_complete         (test_complete_from_the_nios_bts_port_ddr2_x40_0)
    );

  onchip_memory2_0_s1_arbitrator the_onchip_memory2_0_s1
    (
      .clk                                                            (clk_0),
      .cpu_0_data_master_address_to_slave                             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                   (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_onchip_memory2_0_s1                  (cpu_0_data_master_granted_onchip_memory2_0_s1),
      .cpu_0_data_master_latency_counter                              (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_onchip_memory2_0_s1        (cpu_0_data_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_data_master_read                                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_onchip_memory2_0_s1          (cpu_0_data_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_data_master_requests_onchip_memory2_0_s1                 (cpu_0_data_master_requests_onchip_memory2_0_s1),
      .cpu_0_data_master_write                                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                    (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                      (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_onchip_memory2_0_s1           (cpu_0_instruction_master_granted_onchip_memory2_0_s1),
      .cpu_0_instruction_master_latency_counter                       (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 (cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_instruction_master_read                                  (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1   (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_instruction_master_requests_onchip_memory2_0_s1          (cpu_0_instruction_master_requests_onchip_memory2_0_s1),
      .d1_onchip_memory2_0_s1_end_xfer                                (d1_onchip_memory2_0_s1_end_xfer),
      .jtag_avalon_master_0_granted_onchip_memory2_0_s1               (jtag_avalon_master_0_granted_onchip_memory2_0_s1),
      .jtag_avalon_master_0_latency_counter                           (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address_to_slave                   (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_byteenable                         (jtag_avalon_master_0_master_byteenable),
      .jtag_avalon_master_0_master_read                               (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_write                              (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_master_writedata                          (jtag_avalon_master_0_master_writedata),
      .jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1     (jtag_avalon_master_0_qualified_request_onchip_memory2_0_s1),
      .jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1       (jtag_avalon_master_0_read_data_valid_onchip_memory2_0_s1),
      .jtag_avalon_master_0_requests_onchip_memory2_0_s1              (jtag_avalon_master_0_requests_onchip_memory2_0_s1),
      .onchip_memory2_0_s1_address                                    (onchip_memory2_0_s1_address),
      .onchip_memory2_0_s1_byteenable                                 (onchip_memory2_0_s1_byteenable),
      .onchip_memory2_0_s1_chipselect                                 (onchip_memory2_0_s1_chipselect),
      .onchip_memory2_0_s1_clken                                      (onchip_memory2_0_s1_clken),
      .onchip_memory2_0_s1_readdata                                   (onchip_memory2_0_s1_readdata),
      .onchip_memory2_0_s1_readdata_from_sa                           (onchip_memory2_0_s1_readdata_from_sa),
      .onchip_memory2_0_s1_reset                                      (onchip_memory2_0_s1_reset),
      .onchip_memory2_0_s1_write                                      (onchip_memory2_0_s1_write),
      .onchip_memory2_0_s1_writedata                                  (onchip_memory2_0_s1_writedata),
      .reset_n                                                        (clk_0_reset_n)
    );

  onchip_memory2_0 the_onchip_memory2_0
    (
      .address    (onchip_memory2_0_s1_address),
      .byteenable (onchip_memory2_0_s1_byteenable),
      .chipselect (onchip_memory2_0_s1_chipselect),
      .clk        (clk_0),
      .clken      (onchip_memory2_0_s1_clken),
      .readdata   (onchip_memory2_0_s1_readdata),
      .reset      (onchip_memory2_0_s1_reset),
      .write      (onchip_memory2_0_s1_write),
      .writedata  (onchip_memory2_0_s1_writedata)
    );

  product_info_0_avalon_slave_0_arbitrator the_product_info_0_avalon_slave_0
    (
      .clk                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_product_info_0_avalon_slave_0              (cpu_0_data_master_granted_product_info_0_avalon_slave_0),
      .cpu_0_data_master_latency_counter                                    (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0    (cpu_0_data_master_qualified_request_product_info_0_avalon_slave_0),
      .cpu_0_data_master_read                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0      (cpu_0_data_master_read_data_valid_product_info_0_avalon_slave_0),
      .cpu_0_data_master_requests_product_info_0_avalon_slave_0             (cpu_0_data_master_requests_product_info_0_avalon_slave_0),
      .cpu_0_data_master_write                                              (cpu_0_data_master_write),
      .d1_product_info_0_avalon_slave_0_end_xfer                            (d1_product_info_0_avalon_slave_0_end_xfer),
      .jtag_avalon_master_0_granted_product_info_0_avalon_slave_0           (jtag_avalon_master_0_granted_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_latency_counter                                 (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address_to_slave                         (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_read                                     (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_write                                    (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0 (jtag_avalon_master_0_qualified_request_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0   (jtag_avalon_master_0_read_data_valid_product_info_0_avalon_slave_0),
      .jtag_avalon_master_0_requests_product_info_0_avalon_slave_0          (jtag_avalon_master_0_requests_product_info_0_avalon_slave_0),
      .product_info_0_avalon_slave_0_address                                (product_info_0_avalon_slave_0_address),
      .product_info_0_avalon_slave_0_chipselect_n                           (product_info_0_avalon_slave_0_chipselect_n),
      .product_info_0_avalon_slave_0_read_n                                 (product_info_0_avalon_slave_0_read_n),
      .product_info_0_avalon_slave_0_readdata                               (product_info_0_avalon_slave_0_readdata),
      .product_info_0_avalon_slave_0_readdata_from_sa                       (product_info_0_avalon_slave_0_readdata_from_sa),
      .product_info_0_avalon_slave_0_reset_n                                (product_info_0_avalon_slave_0_reset_n),
      .reset_n                                                              (clk_0_reset_n)
    );

  product_info_0 the_product_info_0
    (
      .av_address   (product_info_0_avalon_slave_0_address),
      .av_data_read (product_info_0_avalon_slave_0_readdata),
      .chipselect_n (product_info_0_avalon_slave_0_chipselect_n),
      .clk          (clk_0),
      .read_n       (product_info_0_avalon_slave_0_read_n),
      .reset_n      (product_info_0_avalon_slave_0_reset_n)
    );

  sc_inf_0_nios_arbitrator the_sc_inf_0_nios
    (
      .clk                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sc_inf_0_nios              (cpu_0_data_master_granted_sc_inf_0_nios),
      .cpu_0_data_master_latency_counter                    (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sc_inf_0_nios    (cpu_0_data_master_qualified_request_sc_inf_0_nios),
      .cpu_0_data_master_read                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sc_inf_0_nios      (cpu_0_data_master_read_data_valid_sc_inf_0_nios),
      .cpu_0_data_master_requests_sc_inf_0_nios             (cpu_0_data_master_requests_sc_inf_0_nios),
      .cpu_0_data_master_write                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                          (cpu_0_data_master_writedata),
      .d1_sc_inf_0_nios_end_xfer                            (d1_sc_inf_0_nios_end_xfer),
      .jtag_avalon_master_0_granted_sc_inf_0_nios           (jtag_avalon_master_0_granted_sc_inf_0_nios),
      .jtag_avalon_master_0_latency_counter                 (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address_to_slave         (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_read                     (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_write                    (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_master_writedata                (jtag_avalon_master_0_master_writedata),
      .jtag_avalon_master_0_qualified_request_sc_inf_0_nios (jtag_avalon_master_0_qualified_request_sc_inf_0_nios),
      .jtag_avalon_master_0_read_data_valid_sc_inf_0_nios   (jtag_avalon_master_0_read_data_valid_sc_inf_0_nios),
      .jtag_avalon_master_0_requests_sc_inf_0_nios          (jtag_avalon_master_0_requests_sc_inf_0_nios),
      .reset_n                                              (clk_0_reset_n),
      .sc_inf_0_nios_address                                (sc_inf_0_nios_address),
      .sc_inf_0_nios_chipselect_n                           (sc_inf_0_nios_chipselect_n),
      .sc_inf_0_nios_irq                                    (sc_inf_0_nios_irq),
      .sc_inf_0_nios_irq_from_sa                            (sc_inf_0_nios_irq_from_sa),
      .sc_inf_0_nios_read_n                                 (sc_inf_0_nios_read_n),
      .sc_inf_0_nios_readdata                               (sc_inf_0_nios_readdata),
      .sc_inf_0_nios_readdata_from_sa                       (sc_inf_0_nios_readdata_from_sa),
      .sc_inf_0_nios_reset_n                                (sc_inf_0_nios_reset_n),
      .sc_inf_0_nios_write_n                                (sc_inf_0_nios_write_n),
      .sc_inf_0_nios_writedata                              (sc_inf_0_nios_writedata)
    );

  sc_inf_0 the_sc_inf_0
    (
      .nios_address      (sc_inf_0_nios_address),
      .nios_chipselect_n (sc_inf_0_nios_chipselect_n),
      .nios_clk          (clk_0),
      .nios_irq          (sc_inf_0_nios_irq),
      .nios_read_n       (sc_inf_0_nios_read_n),
      .nios_readdata     (sc_inf_0_nios_readdata),
      .nios_reset_n      (sc_inf_0_nios_reset_n),
      .nios_write_n      (sc_inf_0_nios_write_n),
      .nios_writedata    (sc_inf_0_nios_writedata)
    );

  timer_0_s1_arbitrator the_timer_0_s1
    (
      .clk                                               (clk_0),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_0_s1              (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_latency_counter                 (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_timer_0_s1    (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_timer_0_s1      (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_requests_timer_0_s1             (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                       (cpu_0_data_master_writedata),
      .d1_timer_0_s1_end_xfer                            (d1_timer_0_s1_end_xfer),
      .jtag_avalon_master_0_granted_timer_0_s1           (jtag_avalon_master_0_granted_timer_0_s1),
      .jtag_avalon_master_0_latency_counter              (jtag_avalon_master_0_latency_counter),
      .jtag_avalon_master_0_master_address_to_slave      (jtag_avalon_master_0_master_address_to_slave),
      .jtag_avalon_master_0_master_read                  (jtag_avalon_master_0_master_read),
      .jtag_avalon_master_0_master_write                 (jtag_avalon_master_0_master_write),
      .jtag_avalon_master_0_master_writedata             (jtag_avalon_master_0_master_writedata),
      .jtag_avalon_master_0_qualified_request_timer_0_s1 (jtag_avalon_master_0_qualified_request_timer_0_s1),
      .jtag_avalon_master_0_read_data_valid_timer_0_s1   (jtag_avalon_master_0_read_data_valid_timer_0_s1),
      .jtag_avalon_master_0_requests_timer_0_s1          (jtag_avalon_master_0_requests_timer_0_s1),
      .reset_n                                           (clk_0_reset_n),
      .timer_0_s1_address                                (timer_0_s1_address),
      .timer_0_s1_chipselect                             (timer_0_s1_chipselect),
      .timer_0_s1_irq                                    (timer_0_s1_irq),
      .timer_0_s1_irq_from_sa                            (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata                               (timer_0_s1_readdata),
      .timer_0_s1_readdata_from_sa                       (timer_0_s1_readdata_from_sa),
      .timer_0_s1_reset_n                                (timer_0_s1_reset_n),
      .timer_0_s1_write_n                                (timer_0_s1_write_n),
      .timer_0_s1_writedata                              (timer_0_s1_writedata)
    );

  timer_0 the_timer_0
    (
      .address    (timer_0_s1_address),
      .chipselect (timer_0_s1_chipselect),
      .clk        (clk_0),
      .irq        (timer_0_s1_irq),
      .readdata   (timer_0_s1_readdata),
      .reset_n    (timer_0_s1_reset_n),
      .write_n    (timer_0_s1_write_n),
      .writedata  (timer_0_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_bts_reset_clk_0_domain_synch_module nios_bts_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    jtag_avalon_master_0_master_resetrequest |
    jtag_avalon_master_0_master_resetrequest |
    jtag_avalon_master_0_master_resetrequest |
    jtag_avalon_master_0_master_resetrequest |
    jtag_avalon_master_0_master_resetrequest |
    jtag_avalon_master_0_master_resetrequest);


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
// bts_gui_comp/sc_inf.vhd
// sc_inf_0.vhd
// bts_gui_comp/heartbeat.vhd
// heartbeat_0.vhd
// bts_gui_comp/product_info.vhd
// product_info_0.vhd
`include "nios_bts_port_ddr2_x40.v"
`include "nios_bts_port_ddr2_x40_0.v"
`include "timer_0.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "jtag_uart_0.v"
`include "onchip_memory2_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [  7: 0] avalon_dip_to_the_nios_bts_port_ddr2_x40_0;
  wire    [  7: 0] avalon_led_from_the_nios_bts_port_ddr2_x40_0;
  wire    [  7: 0] avalon_pb_to_the_nios_bts_port_ddr2_x40_0;
  wire             clk;
  reg              clk_0;
  wire             create_error_pb_to_the_nios_bts_port_ddr2_x40_0;
  wire             error_latch_from_the_nios_bts_port_ddr2_x40_0;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             led_from_the_heartbeat_0;
  wire    [ 22: 0] local_addr_from_the_nios_bts_port_ddr2_x40_0;
  wire    [ 19: 0] local_be_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_burst_begin_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_clk_to_the_nios_bts_port_ddr2_x40_0;
  wire             local_init_done_to_the_nios_bts_port_ddr2_x40_0;
  wire    [159: 0] local_rdata_to_the_nios_bts_port_ddr2_x40_0;
  wire             local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0;
  wire             local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0;
  wire             local_read_req_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_ready_to_the_nios_bts_port_ddr2_x40_0;
  wire             local_reset_n_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_size_from_the_nios_bts_port_ddr2_x40_0;
  wire    [159: 0] local_wdata_from_the_nios_bts_port_ddr2_x40_0;
  wire             local_wdata_req_to_the_nios_bts_port_ddr2_x40_0;
  wire             local_write_req_from_the_nios_bts_port_ddr2_x40_0;
  wire             pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0;
  wire             plls_in_locked_to_the_nios_bts_port_ddr2_x40_0;
  wire             plls_locked_from_the_nios_bts_port_ddr2_x40_0;
  reg              reset_n;
  wire             reset_n_to_the_nios_bts_port_ddr2_x40_0;
  wire             start_pb_to_the_nios_bts_port_ddr2_x40_0;
  wire             test_complete_from_the_nios_bts_port_ddr2_x40_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_bts DUT
    (
      .avalon_dip_to_the_nios_bts_port_ddr2_x40_0              (avalon_dip_to_the_nios_bts_port_ddr2_x40_0),
      .avalon_led_from_the_nios_bts_port_ddr2_x40_0            (avalon_led_from_the_nios_bts_port_ddr2_x40_0),
      .avalon_pb_to_the_nios_bts_port_ddr2_x40_0               (avalon_pb_to_the_nios_bts_port_ddr2_x40_0),
      .clk_0                                                   (clk_0),
      .create_error_pb_to_the_nios_bts_port_ddr2_x40_0         (create_error_pb_to_the_nios_bts_port_ddr2_x40_0),
      .error_latch_from_the_nios_bts_port_ddr2_x40_0           (error_latch_from_the_nios_bts_port_ddr2_x40_0),
      .led_from_the_heartbeat_0                                (led_from_the_heartbeat_0),
      .local_addr_from_the_nios_bts_port_ddr2_x40_0            (local_addr_from_the_nios_bts_port_ddr2_x40_0),
      .local_be_from_the_nios_bts_port_ddr2_x40_0              (local_be_from_the_nios_bts_port_ddr2_x40_0),
      .local_burst_begin_from_the_nios_bts_port_ddr2_x40_0     (local_burst_begin_from_the_nios_bts_port_ddr2_x40_0),
      .local_clk_to_the_nios_bts_port_ddr2_x40_0               (local_clk_to_the_nios_bts_port_ddr2_x40_0),
      .local_init_done_to_the_nios_bts_port_ddr2_x40_0         (local_init_done_to_the_nios_bts_port_ddr2_x40_0),
      .local_rdata_to_the_nios_bts_port_ddr2_x40_0             (local_rdata_to_the_nios_bts_port_ddr2_x40_0),
      .local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0       (local_rdata_valid_to_the_nios_bts_port_ddr2_x40_0),
      .local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0      (local_rdvalid_in_n_to_the_nios_bts_port_ddr2_x40_0),
      .local_read_req_from_the_nios_bts_port_ddr2_x40_0        (local_read_req_from_the_nios_bts_port_ddr2_x40_0),
      .local_ready_to_the_nios_bts_port_ddr2_x40_0             (local_ready_to_the_nios_bts_port_ddr2_x40_0),
      .local_reset_n_from_the_nios_bts_port_ddr2_x40_0         (local_reset_n_from_the_nios_bts_port_ddr2_x40_0),
      .local_size_from_the_nios_bts_port_ddr2_x40_0            (local_size_from_the_nios_bts_port_ddr2_x40_0),
      .local_wdata_from_the_nios_bts_port_ddr2_x40_0           (local_wdata_from_the_nios_bts_port_ddr2_x40_0),
      .local_wdata_req_to_the_nios_bts_port_ddr2_x40_0         (local_wdata_req_to_the_nios_bts_port_ddr2_x40_0),
      .local_write_req_from_the_nios_bts_port_ddr2_x40_0       (local_write_req_from_the_nios_bts_port_ddr2_x40_0),
      .pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0 (pattern_sync_acquired_from_the_nios_bts_port_ddr2_x40_0),
      .plls_in_locked_to_the_nios_bts_port_ddr2_x40_0          (plls_in_locked_to_the_nios_bts_port_ddr2_x40_0),
      .plls_locked_from_the_nios_bts_port_ddr2_x40_0           (plls_locked_from_the_nios_bts_port_ddr2_x40_0),
      .reset_n                                                 (reset_n),
      .reset_n_to_the_nios_bts_port_ddr2_x40_0                 (reset_n_to_the_nios_bts_port_ddr2_x40_0),
      .start_pb_to_the_nios_bts_port_ddr2_x40_0                (start_pb_to_the_nios_bts_port_ddr2_x40_0),
      .test_complete_from_the_nios_bts_port_ddr2_x40_0         (test_complete_from_the_nios_bts_port_ddr2_x40_0)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on