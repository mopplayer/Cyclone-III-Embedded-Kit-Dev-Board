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
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  2: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
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
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
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

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h801800) & (cpu_data_master_read | cpu_data_master_write);
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

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[27 : 11] , 11'b0} == 28'h801800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
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

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
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
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable_ext_flash_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_descriptor_memory_s1,
                                     cpu_data_master_granted_ext_flash_s1,
                                     cpu_data_master_granted_high_res_timer_s1,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_lcd_control_slave,
                                     cpu_data_master_granted_led_pio_s1,
                                     cpu_data_master_granted_sgdma_rx_csr,
                                     cpu_data_master_granted_sgdma_tx_csr,
                                     cpu_data_master_granted_ssram_avalon_tristate_slave,
                                     cpu_data_master_granted_sys_clk_timer_s1,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_tse_mac_control_port,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_descriptor_memory_s1,
                                     cpu_data_master_qualified_request_ext_flash_s1,
                                     cpu_data_master_qualified_request_high_res_timer_s1,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_lcd_control_slave,
                                     cpu_data_master_qualified_request_led_pio_s1,
                                     cpu_data_master_qualified_request_sgdma_rx_csr,
                                     cpu_data_master_qualified_request_sgdma_tx_csr,
                                     cpu_data_master_qualified_request_ssram_avalon_tristate_slave,
                                     cpu_data_master_qualified_request_sys_clk_timer_s1,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_tse_mac_control_port,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_descriptor_memory_s1,
                                     cpu_data_master_read_data_valid_ext_flash_s1,
                                     cpu_data_master_read_data_valid_high_res_timer_s1,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_lcd_control_slave,
                                     cpu_data_master_read_data_valid_led_pio_s1,
                                     cpu_data_master_read_data_valid_sgdma_rx_csr,
                                     cpu_data_master_read_data_valid_sgdma_tx_csr,
                                     cpu_data_master_read_data_valid_ssram_avalon_tristate_slave,
                                     cpu_data_master_read_data_valid_sys_clk_timer_s1,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_tse_mac_control_port,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_descriptor_memory_s1,
                                     cpu_data_master_requests_ext_flash_s1,
                                     cpu_data_master_requests_high_res_timer_s1,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_lcd_control_slave,
                                     cpu_data_master_requests_led_pio_s1,
                                     cpu_data_master_requests_sgdma_rx_csr,
                                     cpu_data_master_requests_sgdma_tx_csr,
                                     cpu_data_master_requests_ssram_avalon_tristate_slave,
                                     cpu_data_master_requests_sys_clk_timer_s1,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_tse_mac_control_port,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_descriptor_memory_s1_end_xfer,
                                     d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                     d1_high_res_timer_s1_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_lcd_control_slave_end_xfer,
                                     d1_led_pio_s1_end_xfer,
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
                                     incoming_flash_tristate_bridge_data,
                                     incoming_flash_tristate_bridge_data_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     lcd_control_slave_readdata_from_sa,
                                     lcd_control_slave_wait_counter_eq_0,
                                     lcd_control_slave_wait_counter_eq_1,
                                     led_pio_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_descriptor_memory_s1,
                                     registered_cpu_data_master_read_data_valid_ext_flash_s1,
                                     registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave,
                                     reset_n,
                                     sgdma_rx_csr_irq_from_sa,
                                     sgdma_rx_csr_readdata_from_sa,
                                     sgdma_tx_csr_irq_from_sa,
                                     sgdma_tx_csr_readdata_from_sa,
                                     ssram_avalon_tristate_slave_wait_counter_eq_0,
                                     ssram_avalon_tristate_slave_wait_counter_eq_1,
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

  output  [ 27: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input            clk;
  input   [ 27: 0] cpu_data_master_address;
  input   [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_descriptor_memory_s1;
  input            cpu_data_master_granted_ext_flash_s1;
  input            cpu_data_master_granted_high_res_timer_s1;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_lcd_control_slave;
  input            cpu_data_master_granted_led_pio_s1;
  input            cpu_data_master_granted_sgdma_rx_csr;
  input            cpu_data_master_granted_sgdma_tx_csr;
  input            cpu_data_master_granted_ssram_avalon_tristate_slave;
  input            cpu_data_master_granted_sys_clk_timer_s1;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_tse_mac_control_port;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_descriptor_memory_s1;
  input            cpu_data_master_qualified_request_ext_flash_s1;
  input            cpu_data_master_qualified_request_high_res_timer_s1;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_lcd_control_slave;
  input            cpu_data_master_qualified_request_led_pio_s1;
  input            cpu_data_master_qualified_request_sgdma_rx_csr;
  input            cpu_data_master_qualified_request_sgdma_tx_csr;
  input            cpu_data_master_qualified_request_ssram_avalon_tristate_slave;
  input            cpu_data_master_qualified_request_sys_clk_timer_s1;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_tse_mac_control_port;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_descriptor_memory_s1;
  input            cpu_data_master_read_data_valid_ext_flash_s1;
  input            cpu_data_master_read_data_valid_high_res_timer_s1;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_lcd_control_slave;
  input            cpu_data_master_read_data_valid_led_pio_s1;
  input            cpu_data_master_read_data_valid_sgdma_rx_csr;
  input            cpu_data_master_read_data_valid_sgdma_tx_csr;
  input            cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  input            cpu_data_master_read_data_valid_sys_clk_timer_s1;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_tse_mac_control_port;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_descriptor_memory_s1;
  input            cpu_data_master_requests_ext_flash_s1;
  input            cpu_data_master_requests_high_res_timer_s1;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_lcd_control_slave;
  input            cpu_data_master_requests_led_pio_s1;
  input            cpu_data_master_requests_sgdma_rx_csr;
  input            cpu_data_master_requests_sgdma_tx_csr;
  input            cpu_data_master_requests_ssram_avalon_tristate_slave;
  input            cpu_data_master_requests_sys_clk_timer_s1;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_tse_mac_control_port;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_descriptor_memory_s1_end_xfer;
  input            d1_flash_tristate_bridge_avalon_slave_end_xfer;
  input            d1_high_res_timer_s1_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_lcd_control_slave_end_xfer;
  input            d1_led_pio_s1_end_xfer;
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
  input   [ 31: 0] incoming_flash_tristate_bridge_data;
  input   [ 15: 0] incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [  7: 0] lcd_control_slave_readdata_from_sa;
  input            lcd_control_slave_wait_counter_eq_0;
  input            lcd_control_slave_wait_counter_eq_1;
  input   [ 31: 0] led_pio_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_descriptor_memory_s1;
  input            registered_cpu_data_master_read_data_valid_ext_flash_s1;
  input            registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  input            reset_n;
  input            sgdma_rx_csr_irq_from_sa;
  input   [ 31: 0] sgdma_rx_csr_readdata_from_sa;
  input            sgdma_tx_csr_irq_from_sa;
  input   [ 31: 0] sgdma_tx_csr_readdata_from_sa;
  input            ssram_avalon_tristate_slave_wait_counter_eq_0;
  input            ssram_avalon_tristate_slave_wait_counter_eq_1;
  input            sys_clk_timer_s1_irq_from_sa;
  input   [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 31: 0] tse_mac_control_port_readdata_from_sa;
  input            tse_mac_control_port_waitrequest_from_sa;

  wire    [ 27: 0] cpu_data_master_address_to_slave;
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
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_descriptor_memory_s1 | registered_cpu_data_master_read_data_valid_descriptor_memory_s1 | ~cpu_data_master_requests_descriptor_memory_s1) & (cpu_data_master_granted_descriptor_memory_s1 | ~cpu_data_master_qualified_request_descriptor_memory_s1) & ((~cpu_data_master_qualified_request_descriptor_memory_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_descriptor_memory_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_descriptor_memory_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_ext_flash_s1 | (registered_cpu_data_master_read_data_valid_ext_flash_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_ext_flash_s1) & (cpu_data_master_qualified_request_ssram_avalon_tristate_slave | registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave | ~cpu_data_master_requests_ssram_avalon_tristate_slave) & (cpu_data_master_granted_ext_flash_s1 | ~cpu_data_master_qualified_request_ext_flash_s1) & (cpu_data_master_granted_ssram_avalon_tristate_slave | ~cpu_data_master_qualified_request_ssram_avalon_tristate_slave) & ((~cpu_data_master_qualified_request_ext_flash_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_ext_flash_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_ext_flash_s1 | ~cpu_data_master_write | (1 & ext_flash_s1_wait_counter_eq_1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & ((~cpu_data_master_qualified_request_ssram_avalon_tristate_slave | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_ssram_avalon_tristate_slave | ~cpu_data_master_write | (1 & ssram_avalon_tristate_slave_wait_counter_eq_1 & cpu_data_master_write))) & 1;

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_requests_high_res_timer_s1) & ((~cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_high_res_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & ((~cpu_data_master_qualified_request_lcd_control_slave | ~cpu_data_master_read | (1 & lcd_control_slave_wait_counter_eq_1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_lcd_control_slave | ~cpu_data_master_write | (1 & lcd_control_slave_wait_counter_eq_1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_requests_led_pio_s1) & ((~cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sgdma_rx_csr | ~cpu_data_master_requests_sgdma_rx_csr) & ((~cpu_data_master_qualified_request_sgdma_rx_csr | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sgdma_rx_csr | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sgdma_tx_csr | ~cpu_data_master_requests_sgdma_tx_csr);

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_data_master_qualified_request_sgdma_tx_csr | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sgdma_tx_csr | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_requests_sys_clk_timer_s1) & ((~cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_tse_mac_control_port | ~cpu_data_master_requests_tse_mac_control_port) & ((~cpu_data_master_qualified_request_tse_mac_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~tse_mac_control_port_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_tse_mac_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~tse_mac_control_port_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = {cpu_data_master_address[27],
    1'b0,
    cpu_data_master_address[25 : 0]};

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_descriptor_memory_s1}} | descriptor_memory_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_ext_flash_s1}} | {incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_ssram_avalon_tristate_slave}} | incoming_flash_tristate_bridge_data) &
    ({32 {~cpu_data_master_requests_high_res_timer_s1}} | high_res_timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_lcd_control_slave}} | lcd_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_led_pio_s1}} | led_pio_s1_readdata_from_sa) &
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
  assign p1_dbs_16_reg_segment_0 = incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;

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
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    high_res_timer_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    sys_clk_timer_s1_irq_from_sa,
    sgdma_tx_csr_irq_from_sa,
    sgdma_rx_csr_irq_from_sa};

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_tse_mac_control_port}} | tse_mac_control_port_readdata_from_sa);


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_ext_flash_s1,
                                            cpu_instruction_master_granted_ssram_avalon_tristate_slave,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_ext_flash_s1,
                                            cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_ext_flash_s1,
                                            cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_ext_flash_s1,
                                            cpu_instruction_master_requests_ssram_avalon_tristate_slave,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                            ext_flash_s1_wait_counter_eq_0,
                                            ext_flash_s1_wait_counter_eq_1,
                                            incoming_flash_tristate_bridge_data,
                                            reset_n,
                                            ssram_avalon_tristate_slave_wait_counter_eq_0,
                                            ssram_avalon_tristate_slave_wait_counter_eq_1,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 27: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  2: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 27: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_ext_flash_s1;
  input            cpu_instruction_master_granted_ssram_avalon_tristate_slave;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_ext_flash_s1;
  input            cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_ext_flash_s1;
  input            cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_ext_flash_s1;
  input            cpu_instruction_master_requests_ssram_avalon_tristate_slave;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_flash_tristate_bridge_avalon_slave_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input   [ 31: 0] incoming_flash_tristate_bridge_data;
  input            reset_n;
  input            ssram_avalon_tristate_slave_wait_counter_eq_0;
  input            ssram_avalon_tristate_slave_wait_counter_eq_1;

  reg              active_and_waiting_last_time;
  reg     [ 27: 0] cpu_instruction_master_address_last_time;
  wire    [ 27: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  2: 0] cpu_instruction_master_latency_counter;
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
  wire    [  2: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  2: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_ext_flash_s1 | ~cpu_instruction_master_requests_ext_flash_s1) & (cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave | ~cpu_instruction_master_requests_ssram_avalon_tristate_slave) & (cpu_instruction_master_granted_ext_flash_s1 | ~cpu_instruction_master_qualified_request_ext_flash_s1) & (cpu_instruction_master_granted_ssram_avalon_tristate_slave | ~cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave) & ((~cpu_instruction_master_qualified_request_ext_flash_s1 | ~cpu_instruction_master_read | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read))) & ((~cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave | ~cpu_instruction_master_read | (1 & ((ssram_avalon_tristate_slave_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = {cpu_instruction_master_address[27],
    1'b0,
    cpu_instruction_master_address[25 : 0]};

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_ext_flash_s1 |
    cpu_instruction_master_granted_ssram_avalon_tristate_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = (cpu_instruction_master_read_data_valid_ext_flash_s1 & dbs_rdv_counter_overflow) |
    cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_ext_flash_s1}} | {incoming_flash_tristate_bridge_data[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave}} | incoming_flash_tristate_bridge_data);

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
  assign latency_load_value = ({3 {cpu_instruction_master_requests_ext_flash_s1}} & 2) |
    ({3 {cpu_instruction_master_requests_ssram_avalon_tristate_slave}} & 4);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_flash_tristate_bridge_data;

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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_descriptor_memory_s1_from_cpu_data_master;
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

  assign cpu_data_master_requests_descriptor_memory_s1 = ({cpu_data_master_address_to_slave[27 : 12] , 12'b0} == 28'h800000) & (cpu_data_master_read | cpu_data_master_write);
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

  assign sgdma_rx_descriptor_read_requests_descriptor_memory_s1 = (({sgdma_rx_descriptor_read_address_to_slave[31 : 12] , 12'b0} == 32'h800000) & (sgdma_rx_descriptor_read_read)) & sgdma_rx_descriptor_read_read;
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

  assign sgdma_rx_descriptor_write_requests_descriptor_memory_s1 = (({sgdma_rx_descriptor_write_address_to_slave[31 : 12] , 12'b0} == 32'h800000) & (sgdma_rx_descriptor_write_write)) & sgdma_rx_descriptor_write_write;
  assign sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 = sgdma_rx_descriptor_write_requests_descriptor_memory_s1 & ~(cpu_data_master_arbiterlock | sgdma_rx_descriptor_read_arbiterlock | sgdma_tx_descriptor_read_arbiterlock | sgdma_tx_descriptor_write_arbiterlock);
  assign sgdma_tx_descriptor_read_requests_descriptor_memory_s1 = (({sgdma_tx_descriptor_read_address_to_slave[31 : 12] , 12'b0} == 32'h800000) & (sgdma_tx_descriptor_read_read)) & sgdma_tx_descriptor_read_read;
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

  assign sgdma_tx_descriptor_write_requests_descriptor_memory_s1 = (({sgdma_tx_descriptor_write_address_to_slave[31 : 12] , 12'b0} == 32'h800000) & (sgdma_tx_descriptor_write_write)) & sgdma_tx_descriptor_write_write;
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
                                                        cpu_data_master_writedata,
                                                        cpu_instruction_master_address_to_slave,
                                                        cpu_instruction_master_dbs_address,
                                                        cpu_instruction_master_latency_counter,
                                                        cpu_instruction_master_read,
                                                        reset_n,
                                                        sgdma_rx_m_write_address_to_slave,
                                                        sgdma_rx_m_write_byteenable,
                                                        sgdma_rx_m_write_dbs_address,
                                                        sgdma_rx_m_write_dbs_write_16,
                                                        sgdma_rx_m_write_write,
                                                        sgdma_rx_m_write_writedata,
                                                        sgdma_tx_m_read_address_to_slave,
                                                        sgdma_tx_m_read_dbs_address,
                                                        sgdma_tx_m_read_latency_counter,
                                                        sgdma_tx_m_read_read,

                                                       // outputs:
                                                        cpu_data_master_byteenable_ext_flash_s1,
                                                        cpu_data_master_granted_ext_flash_s1,
                                                        cpu_data_master_granted_ssram_avalon_tristate_slave,
                                                        cpu_data_master_qualified_request_ext_flash_s1,
                                                        cpu_data_master_qualified_request_ssram_avalon_tristate_slave,
                                                        cpu_data_master_read_data_valid_ext_flash_s1,
                                                        cpu_data_master_read_data_valid_ssram_avalon_tristate_slave,
                                                        cpu_data_master_requests_ext_flash_s1,
                                                        cpu_data_master_requests_ssram_avalon_tristate_slave,
                                                        cpu_instruction_master_granted_ext_flash_s1,
                                                        cpu_instruction_master_granted_ssram_avalon_tristate_slave,
                                                        cpu_instruction_master_qualified_request_ext_flash_s1,
                                                        cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave,
                                                        cpu_instruction_master_read_data_valid_ext_flash_s1,
                                                        cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave,
                                                        cpu_instruction_master_requests_ext_flash_s1,
                                                        cpu_instruction_master_requests_ssram_avalon_tristate_slave,
                                                        d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                                        ext_flash_s1_wait_counter_eq_0,
                                                        ext_flash_s1_wait_counter_eq_1,
                                                        flash_tristate_bridge_address,
                                                        flash_tristate_bridge_data,
                                                        incoming_flash_tristate_bridge_data,
                                                        incoming_flash_tristate_bridge_data_with_Xs_converted_to_0,
                                                        read_n_to_the_ext_flash,
                                                        registered_cpu_data_master_read_data_valid_ext_flash_s1,
                                                        registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave,
                                                        select_n_to_the_ext_flash,
                                                        sgdma_rx_m_write_byteenable_ext_flash_s1,
                                                        sgdma_rx_m_write_granted_ext_flash_s1,
                                                        sgdma_rx_m_write_granted_ssram_avalon_tristate_slave,
                                                        sgdma_rx_m_write_qualified_request_ext_flash_s1,
                                                        sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave,
                                                        sgdma_rx_m_write_requests_ext_flash_s1,
                                                        sgdma_rx_m_write_requests_ssram_avalon_tristate_slave,
                                                        sgdma_tx_m_read_granted_ext_flash_s1,
                                                        sgdma_tx_m_read_granted_ssram_avalon_tristate_slave,
                                                        sgdma_tx_m_read_qualified_request_ext_flash_s1,
                                                        sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave,
                                                        sgdma_tx_m_read_read_data_valid_ext_flash_s1,
                                                        sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave,
                                                        sgdma_tx_m_read_requests_ext_flash_s1,
                                                        sgdma_tx_m_read_requests_ssram_avalon_tristate_slave,
                                                        ssram_avalon_tristate_slave_wait_counter_eq_0,
                                                        ssram_avalon_tristate_slave_wait_counter_eq_1,
                                                        ssram_bwn_to_the_ssram,
                                                        ssram_cen_to_the_ssram,
                                                        ssram_oen_to_the_ssram,
                                                        ssram_wen_to_the_ssram,
                                                        write_n_to_the_ext_flash
                                                     )
;

  output  [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  output           cpu_data_master_granted_ext_flash_s1;
  output           cpu_data_master_granted_ssram_avalon_tristate_slave;
  output           cpu_data_master_qualified_request_ext_flash_s1;
  output           cpu_data_master_qualified_request_ssram_avalon_tristate_slave;
  output           cpu_data_master_read_data_valid_ext_flash_s1;
  output           cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  output           cpu_data_master_requests_ext_flash_s1;
  output           cpu_data_master_requests_ssram_avalon_tristate_slave;
  output           cpu_instruction_master_granted_ext_flash_s1;
  output           cpu_instruction_master_granted_ssram_avalon_tristate_slave;
  output           cpu_instruction_master_qualified_request_ext_flash_s1;
  output           cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave;
  output           cpu_instruction_master_read_data_valid_ext_flash_s1;
  output           cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave;
  output           cpu_instruction_master_requests_ext_flash_s1;
  output           cpu_instruction_master_requests_ssram_avalon_tristate_slave;
  output           d1_flash_tristate_bridge_avalon_slave_end_xfer;
  output           ext_flash_s1_wait_counter_eq_0;
  output           ext_flash_s1_wait_counter_eq_1;
  output  [ 25: 0] flash_tristate_bridge_address;
  inout   [ 31: 0] flash_tristate_bridge_data;
  output  [ 31: 0] incoming_flash_tristate_bridge_data;
  output  [ 15: 0] incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;
  output           read_n_to_the_ext_flash;
  output           registered_cpu_data_master_read_data_valid_ext_flash_s1;
  output           registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  output           select_n_to_the_ext_flash;
  output  [  1: 0] sgdma_rx_m_write_byteenable_ext_flash_s1;
  output           sgdma_rx_m_write_granted_ext_flash_s1;
  output           sgdma_rx_m_write_granted_ssram_avalon_tristate_slave;
  output           sgdma_rx_m_write_qualified_request_ext_flash_s1;
  output           sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave;
  output           sgdma_rx_m_write_requests_ext_flash_s1;
  output           sgdma_rx_m_write_requests_ssram_avalon_tristate_slave;
  output           sgdma_tx_m_read_granted_ext_flash_s1;
  output           sgdma_tx_m_read_granted_ssram_avalon_tristate_slave;
  output           sgdma_tx_m_read_qualified_request_ext_flash_s1;
  output           sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave;
  output           sgdma_tx_m_read_read_data_valid_ext_flash_s1;
  output           sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave;
  output           sgdma_tx_m_read_requests_ext_flash_s1;
  output           sgdma_tx_m_read_requests_ssram_avalon_tristate_slave;
  output           ssram_avalon_tristate_slave_wait_counter_eq_0;
  output           ssram_avalon_tristate_slave_wait_counter_eq_1;
  output  [  3: 0] ssram_bwn_to_the_ssram;
  output           ssram_cen_to_the_ssram;
  output           ssram_oen_to_the_ssram;
  output           ssram_wen_to_the_ssram;
  output           write_n_to_the_ext_flash;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  2: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_m_write_address_to_slave;
  input   [  3: 0] sgdma_rx_m_write_byteenable;
  input   [  1: 0] sgdma_rx_m_write_dbs_address;
  input   [ 15: 0] sgdma_rx_m_write_dbs_write_16;
  input            sgdma_rx_m_write_write;
  input   [ 31: 0] sgdma_rx_m_write_writedata;
  input   [ 31: 0] sgdma_tx_m_read_address_to_slave;
  input   [  1: 0] sgdma_tx_m_read_dbs_address;
  input   [  2: 0] sgdma_tx_m_read_latency_counter;
  input            sgdma_tx_m_read_read;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ext_flash_s1;
  wire             cpu_data_master_granted_ssram_avalon_tristate_slave;
  wire             cpu_data_master_qualified_request_ext_flash_s1;
  wire             cpu_data_master_qualified_request_ssram_avalon_tristate_slave;
  wire             cpu_data_master_read_data_valid_ext_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in;
  wire             cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  reg     [  3: 0] cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register;
  wire             cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in;
  wire             cpu_data_master_requests_ext_flash_s1;
  wire             cpu_data_master_requests_ssram_avalon_tristate_slave;
  wire             cpu_data_master_saved_grant_ext_flash_s1;
  wire             cpu_data_master_saved_grant_ssram_avalon_tristate_slave;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_ext_flash_s1;
  wire             cpu_instruction_master_granted_ssram_avalon_tristate_slave;
  wire             cpu_instruction_master_qualified_request_ext_flash_s1;
  wire             cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in;
  wire             cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave;
  reg     [  3: 0] cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register;
  wire             cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in;
  wire             cpu_instruction_master_requests_ext_flash_s1;
  wire             cpu_instruction_master_requests_ssram_avalon_tristate_slave;
  wire             cpu_instruction_master_saved_grant_ext_flash_s1;
  wire             cpu_instruction_master_saved_grant_ssram_avalon_tristate_slave;
  reg              d1_flash_tristate_bridge_avalon_slave_end_xfer;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 31: 0] d1_outgoing_flash_tristate_bridge_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
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
  reg     [ 25: 0] flash_tristate_bridge_address /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             flash_tristate_bridge_avalon_slave_allgrants;
  wire             flash_tristate_bridge_avalon_slave_allow_new_arb_cycle;
  wire             flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             flash_tristate_bridge_avalon_slave_any_continuerequest;
  reg     [  7: 0] flash_tristate_bridge_avalon_slave_arb_addend;
  wire             flash_tristate_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] flash_tristate_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] flash_tristate_bridge_avalon_slave_arb_share_set_values;
  wire    [  7: 0] flash_tristate_bridge_avalon_slave_arb_winner;
  wire             flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             flash_tristate_bridge_avalon_slave_beginbursttransfer_internal;
  wire             flash_tristate_bridge_avalon_slave_begins_xfer;
  wire    [ 15: 0] flash_tristate_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  7: 0] flash_tristate_bridge_avalon_slave_chosen_master_rot_left;
  wire             flash_tristate_bridge_avalon_slave_end_xfer;
  wire             flash_tristate_bridge_avalon_slave_firsttransfer;
  wire    [  7: 0] flash_tristate_bridge_avalon_slave_grant_vector;
  wire    [  7: 0] flash_tristate_bridge_avalon_slave_master_qreq_vector;
  wire             flash_tristate_bridge_avalon_slave_non_bursting_master_requests;
  wire             flash_tristate_bridge_avalon_slave_read_pending;
  reg              flash_tristate_bridge_avalon_slave_reg_firsttransfer;
  reg     [  7: 0] flash_tristate_bridge_avalon_slave_saved_chosen_master_vector;
  reg              flash_tristate_bridge_avalon_slave_slavearbiterlockenable;
  wire             flash_tristate_bridge_avalon_slave_slavearbiterlockenable2;
  wire             flash_tristate_bridge_avalon_slave_unreg_firsttransfer;
  wire             flash_tristate_bridge_avalon_slave_write_pending;
  wire    [ 31: 0] flash_tristate_bridge_data;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 31: 0] incoming_flash_tristate_bridge_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_flash_tristate_bridge_data_bit_0_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_10_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_11_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_12_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_13_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_14_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_15_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_1_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_2_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_3_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_4_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_5_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_6_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_7_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_8_is_x;
  wire             incoming_flash_tristate_bridge_data_bit_9_is_x;
  wire    [ 15: 0] incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_ext_flash_s1;
  reg              last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave;
  reg              last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave;
  reg              last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1;
  reg              last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave;
  reg              last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1;
  reg              last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave;
  wire    [ 31: 0] outgoing_flash_tristate_bridge_data;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
  wire    [  3: 0] p1_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
  wire    [  3: 0] p1_cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register;
  wire    [ 25: 0] p1_flash_tristate_bridge_address;
  wire             p1_read_n_to_the_ext_flash;
  wire             p1_select_n_to_the_ext_flash;
  wire    [  1: 0] p1_sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register;
  wire    [  3: 0] p1_sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register;
  wire    [  3: 0] p1_ssram_bwn_to_the_ssram;
  wire             p1_ssram_cen_to_the_ssram;
  wire             p1_ssram_oen_to_the_ssram;
  wire             p1_ssram_wen_to_the_ssram;
  wire             p1_write_n_to_the_ext_flash;
  reg              read_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             registered_cpu_data_master_read_data_valid_ext_flash_s1;
  wire             registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  reg              select_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             sgdma_rx_m_write_arbiterlock;
  wire             sgdma_rx_m_write_arbiterlock2;
  wire    [  1: 0] sgdma_rx_m_write_byteenable_ext_flash_s1;
  wire    [  1: 0] sgdma_rx_m_write_byteenable_ext_flash_s1_segment_0;
  wire    [  1: 0] sgdma_rx_m_write_byteenable_ext_flash_s1_segment_1;
  wire             sgdma_rx_m_write_continuerequest;
  wire             sgdma_rx_m_write_granted_ext_flash_s1;
  wire             sgdma_rx_m_write_granted_ssram_avalon_tristate_slave;
  wire             sgdma_rx_m_write_qualified_request_ext_flash_s1;
  wire             sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave;
  wire             sgdma_rx_m_write_requests_ext_flash_s1;
  wire             sgdma_rx_m_write_requests_ssram_avalon_tristate_slave;
  wire             sgdma_rx_m_write_saved_grant_ext_flash_s1;
  wire             sgdma_rx_m_write_saved_grant_ssram_avalon_tristate_slave;
  wire             sgdma_tx_m_read_arbiterlock;
  wire             sgdma_tx_m_read_arbiterlock2;
  wire             sgdma_tx_m_read_continuerequest;
  wire             sgdma_tx_m_read_granted_ext_flash_s1;
  wire             sgdma_tx_m_read_granted_ssram_avalon_tristate_slave;
  wire             sgdma_tx_m_read_qualified_request_ext_flash_s1;
  wire             sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave;
  wire             sgdma_tx_m_read_read_data_valid_ext_flash_s1;
  reg     [  1: 0] sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register;
  wire             sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register_in;
  wire             sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave;
  reg     [  3: 0] sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register;
  wire             sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register_in;
  wire             sgdma_tx_m_read_requests_ext_flash_s1;
  wire             sgdma_tx_m_read_requests_ssram_avalon_tristate_slave;
  wire             sgdma_tx_m_read_saved_grant_ext_flash_s1;
  wire             sgdma_tx_m_read_saved_grant_ssram_avalon_tristate_slave;
  wire    [  4: 0] ssram_avalon_tristate_slave_counter_load_value;
  wire             ssram_avalon_tristate_slave_in_a_read_cycle;
  wire             ssram_avalon_tristate_slave_in_a_write_cycle;
  reg     [  4: 0] ssram_avalon_tristate_slave_wait_counter;
  wire             ssram_avalon_tristate_slave_wait_counter_eq_0;
  wire             ssram_avalon_tristate_slave_wait_counter_eq_1;
  wire             ssram_avalon_tristate_slave_waits_for_read;
  wire             ssram_avalon_tristate_slave_waits_for_write;
  wire             ssram_avalon_tristate_slave_with_write_latency;
  reg     [  3: 0] ssram_bwn_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              ssram_cen_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              ssram_oen_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              ssram_wen_to_the_ssram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             wait_for_ext_flash_s1_counter;
  wire             wait_for_ssram_avalon_tristate_slave_counter;
  reg              write_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~flash_tristate_bridge_avalon_slave_end_xfer;
    end


  assign flash_tristate_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ext_flash_s1 | cpu_instruction_master_qualified_request_ext_flash_s1 | sgdma_rx_m_write_qualified_request_ext_flash_s1 | sgdma_tx_m_read_qualified_request_ext_flash_s1 | cpu_data_master_qualified_request_ssram_avalon_tristate_slave | cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave | sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave | sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave));
  assign cpu_data_master_requests_ext_flash_s1 = ({cpu_data_master_address_to_slave[27 : 26] , 26'b0} == 28'h8000000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_ext_flash of type chipselect to ~p1_select_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_ext_flash <= ~0;
      else 
        select_n_to_the_ext_flash <= p1_select_n_to_the_ext_flash;
    end


  //~ssram_cen_to_the_ssram of type chipselect to ~p1_ssram_cen_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ssram_cen_to_the_ssram <= ~0;
      else 
        ssram_cen_to_the_ssram <= p1_ssram_cen_to_the_ssram;
    end


  assign flash_tristate_bridge_avalon_slave_write_pending = 0;
  //flash_tristate_bridge/avalon_slave read pending calc, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_read_pending = (|cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]);

  //registered rdv signal_name registered_cpu_data_master_read_data_valid_ext_flash_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_ext_flash_s1 = cpu_data_master_read_data_valid_ext_flash_s1_shift_register[0];

  //flash_tristate_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_arb_share_set_values = (cpu_data_master_granted_ext_flash_s1)? 2 :
    (cpu_instruction_master_granted_ext_flash_s1)? 2 :
    (sgdma_rx_m_write_granted_ext_flash_s1)? 2 :
    (sgdma_tx_m_read_granted_ext_flash_s1)? 2 :
    (cpu_data_master_granted_ext_flash_s1)? 2 :
    (cpu_instruction_master_granted_ext_flash_s1)? 2 :
    (sgdma_rx_m_write_granted_ext_flash_s1)? 2 :
    (sgdma_tx_m_read_granted_ext_flash_s1)? 2 :
    (cpu_data_master_granted_ext_flash_s1)? 2 :
    (cpu_instruction_master_granted_ext_flash_s1)? 2 :
    (sgdma_rx_m_write_granted_ext_flash_s1)? 2 :
    (sgdma_tx_m_read_granted_ext_flash_s1)? 2 :
    (cpu_data_master_granted_ext_flash_s1)? 2 :
    (cpu_instruction_master_granted_ext_flash_s1)? 2 :
    (sgdma_rx_m_write_granted_ext_flash_s1)? 2 :
    (sgdma_tx_m_read_granted_ext_flash_s1)? 2 :
    1;

  //flash_tristate_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1 |
    sgdma_rx_m_write_requests_ext_flash_s1 |
    sgdma_tx_m_read_requests_ext_flash_s1 |
    cpu_data_master_requests_ssram_avalon_tristate_slave |
    cpu_instruction_master_requests_ssram_avalon_tristate_slave |
    sgdma_rx_m_write_requests_ssram_avalon_tristate_slave |
    sgdma_tx_m_read_requests_ssram_avalon_tristate_slave |
    cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1 |
    sgdma_rx_m_write_requests_ext_flash_s1 |
    sgdma_tx_m_read_requests_ext_flash_s1 |
    cpu_data_master_requests_ssram_avalon_tristate_slave |
    cpu_instruction_master_requests_ssram_avalon_tristate_slave |
    sgdma_rx_m_write_requests_ssram_avalon_tristate_slave |
    sgdma_tx_m_read_requests_ssram_avalon_tristate_slave |
    cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1 |
    sgdma_rx_m_write_requests_ext_flash_s1 |
    sgdma_tx_m_read_requests_ext_flash_s1 |
    cpu_data_master_requests_ssram_avalon_tristate_slave |
    cpu_instruction_master_requests_ssram_avalon_tristate_slave |
    sgdma_rx_m_write_requests_ssram_avalon_tristate_slave |
    sgdma_tx_m_read_requests_ssram_avalon_tristate_slave |
    cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1 |
    sgdma_rx_m_write_requests_ext_flash_s1 |
    sgdma_tx_m_read_requests_ext_flash_s1 |
    cpu_data_master_requests_ssram_avalon_tristate_slave |
    cpu_instruction_master_requests_ssram_avalon_tristate_slave |
    sgdma_rx_m_write_requests_ssram_avalon_tristate_slave |
    sgdma_tx_m_read_requests_ssram_avalon_tristate_slave;

  //flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //flash_tristate_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_arb_share_counter_next_value = flash_tristate_bridge_avalon_slave_firsttransfer ? (flash_tristate_bridge_avalon_slave_arb_share_set_values - 1) : |flash_tristate_bridge_avalon_slave_arb_share_counter ? (flash_tristate_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //flash_tristate_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_allgrants = (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector) |
    (|flash_tristate_bridge_avalon_slave_grant_vector);

  //flash_tristate_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_end_xfer = ~(ext_flash_s1_waits_for_read | ext_flash_s1_waits_for_write | ssram_avalon_tristate_slave_waits_for_read | ssram_avalon_tristate_slave_waits_for_write);

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
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 & cpu_instruction_master_requests_ext_flash_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave & cpu_instruction_master_requests_ssram_avalon_tristate_slave) |
    (last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 & cpu_instruction_master_requests_ext_flash_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave & cpu_instruction_master_requests_ssram_avalon_tristate_slave) |
    (last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 & cpu_instruction_master_requests_ext_flash_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave & cpu_instruction_master_requests_ssram_avalon_tristate_slave);

  //flash_tristate_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign flash_tristate_bridge_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    sgdma_rx_m_write_continuerequest |
    sgdma_tx_m_read_continuerequest |
    cpu_instruction_master_continuerequest |
    sgdma_rx_m_write_continuerequest |
    sgdma_tx_m_read_continuerequest |
    cpu_data_master_continuerequest |
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
    sgdma_tx_m_read_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    sgdma_rx_m_write_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    sgdma_rx_m_write_continuerequest;

  //sgdma_rx/m_write flash_tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign sgdma_rx_m_write_arbiterlock = flash_tristate_bridge_avalon_slave_slavearbiterlockenable & sgdma_rx_m_write_continuerequest;

  //sgdma_rx/m_write flash_tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign sgdma_rx_m_write_arbiterlock2 = flash_tristate_bridge_avalon_slave_slavearbiterlockenable2 & sgdma_rx_m_write_continuerequest;

  //sgdma_rx/m_write granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1 <= sgdma_rx_m_write_saved_grant_ext_flash_s1 ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~sgdma_rx_m_write_requests_ext_flash_s1) ? 0 : last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1;
    end


  //sgdma_rx_m_write_continuerequest continued request, which is an e_mux
  assign sgdma_rx_m_write_continuerequest = (last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1 & sgdma_rx_m_write_requests_ext_flash_s1) |
    (last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave & sgdma_rx_m_write_requests_ssram_avalon_tristate_slave) |
    (last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1 & sgdma_rx_m_write_requests_ext_flash_s1) |
    (last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave & sgdma_rx_m_write_requests_ssram_avalon_tristate_slave) |
    (last_cycle_sgdma_rx_m_write_granted_slave_ext_flash_s1 & sgdma_rx_m_write_requests_ext_flash_s1) |
    (last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave & sgdma_rx_m_write_requests_ssram_avalon_tristate_slave);

  //sgdma_tx/m_read flash_tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign sgdma_tx_m_read_arbiterlock = flash_tristate_bridge_avalon_slave_slavearbiterlockenable & sgdma_tx_m_read_continuerequest;

  //sgdma_tx/m_read flash_tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign sgdma_tx_m_read_arbiterlock2 = flash_tristate_bridge_avalon_slave_slavearbiterlockenable2 & sgdma_tx_m_read_continuerequest;

  //sgdma_tx/m_read granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1 <= sgdma_tx_m_read_saved_grant_ext_flash_s1 ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~sgdma_tx_m_read_requests_ext_flash_s1) ? 0 : last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1;
    end


  //sgdma_tx_m_read_continuerequest continued request, which is an e_mux
  assign sgdma_tx_m_read_continuerequest = (last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1 & sgdma_tx_m_read_requests_ext_flash_s1) |
    (last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave & sgdma_tx_m_read_requests_ssram_avalon_tristate_slave) |
    (last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1 & sgdma_tx_m_read_requests_ext_flash_s1) |
    (last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave & sgdma_tx_m_read_requests_ssram_avalon_tristate_slave) |
    (last_cycle_sgdma_tx_m_read_granted_slave_ext_flash_s1 & sgdma_tx_m_read_requests_ext_flash_s1) |
    (last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave & sgdma_tx_m_read_requests_ssram_avalon_tristate_slave);

  assign cpu_data_master_qualified_request_ext_flash_s1 = cpu_data_master_requests_ext_flash_s1 & ~((cpu_data_master_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending) | (|cpu_data_master_read_data_valid_ext_flash_s1_shift_register))) | ((flash_tristate_bridge_avalon_slave_read_pending | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_ext_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock | sgdma_rx_m_write_arbiterlock | sgdma_tx_m_read_arbiterlock);
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

  //flash_tristate_bridge_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_flash_tristate_bridge_data <= 0;
      else 
        incoming_flash_tristate_bridge_data <= flash_tristate_bridge_data;
    end


  //ext_flash_s1_with_write_latency assignment, which is an e_assign
  assign ext_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_ext_flash_s1 | cpu_instruction_master_qualified_request_ext_flash_s1 | sgdma_rx_m_write_qualified_request_ext_flash_s1 | sgdma_tx_m_read_qualified_request_ext_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (ext_flash_s1_with_write_latency)? 1 :
    (ssram_avalon_tristate_slave_with_write_latency)? 1 :
    (ext_flash_s1_with_write_latency)? 1 :
    (ssram_avalon_tristate_slave_with_write_latency)? 1 :
    0;

  //d1_outgoing_flash_tristate_bridge_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_flash_tristate_bridge_data <= 0;
      else 
        d1_outgoing_flash_tristate_bridge_data <= outgoing_flash_tristate_bridge_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_flash_tristate_bridge_data tristate driver, which is an e_assign
  assign flash_tristate_bridge_data = (d1_in_a_write_cycle)? d1_outgoing_flash_tristate_bridge_data:{32{1'bz}};

  //outgoing_flash_tristate_bridge_data mux, which is an e_mux
  assign outgoing_flash_tristate_bridge_data = (cpu_data_master_granted_ext_flash_s1)? cpu_data_master_dbs_write_16 :
    (cpu_data_master_granted_ssram_avalon_tristate_slave)? cpu_data_master_writedata :
    (sgdma_rx_m_write_granted_ext_flash_s1)? sgdma_rx_m_write_dbs_write_16 :
    sgdma_rx_m_write_writedata;

  assign cpu_data_master_requests_ssram_avalon_tristate_slave = ({cpu_data_master_address_to_slave[27 : 23] , 23'b0} == 28'h0) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave = cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[2];

  //cpu/instruction_master granted ssram/avalon_tristate_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave <= cpu_instruction_master_saved_grant_ssram_avalon_tristate_slave ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_ssram_avalon_tristate_slave) ? 0 : last_cycle_cpu_instruction_master_granted_slave_ssram_avalon_tristate_slave;
    end


  //sgdma_rx/m_write granted ssram/avalon_tristate_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave <= 0;
      else 
        last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave <= sgdma_rx_m_write_saved_grant_ssram_avalon_tristate_slave ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~sgdma_rx_m_write_requests_ssram_avalon_tristate_slave) ? 0 : last_cycle_sgdma_rx_m_write_granted_slave_ssram_avalon_tristate_slave;
    end


  //sgdma_tx/m_read granted ssram/avalon_tristate_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave <= 0;
      else 
        last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave <= sgdma_tx_m_read_saved_grant_ssram_avalon_tristate_slave ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~sgdma_tx_m_read_requests_ssram_avalon_tristate_slave) ? 0 : last_cycle_sgdma_tx_m_read_granted_slave_ssram_avalon_tristate_slave;
    end


  assign cpu_data_master_qualified_request_ssram_avalon_tristate_slave = cpu_data_master_requests_ssram_avalon_tristate_slave & ~((cpu_data_master_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending & !((((|cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]))))) | (|cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register))) | ((flash_tristate_bridge_avalon_slave_read_pending) & cpu_data_master_write) | cpu_instruction_master_arbiterlock | sgdma_rx_m_write_arbiterlock | sgdma_tx_m_read_arbiterlock);
  //cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in = cpu_data_master_granted_ssram_avalon_tristate_slave & cpu_data_master_read & ~ssram_avalon_tristate_slave_waits_for_read & ~(|cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register = {cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register, cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in};

  //cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register <= p1_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_ssram_avalon_tristate_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_ssram_avalon_tristate_slave = cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[3];

  //ssram_avalon_tristate_slave_with_write_latency assignment, which is an e_assign
  assign ssram_avalon_tristate_slave_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_ssram_avalon_tristate_slave | cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave | sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave | sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave);

  assign cpu_instruction_master_requests_ext_flash_s1 = (({cpu_instruction_master_address_to_slave[27 : 26] , 26'b0} == 28'h8000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= cpu_data_master_saved_grant_ext_flash_s1 ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_ext_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_ext_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_ext_flash_s1 & cpu_data_master_requests_ext_flash_s1) |
    (last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave & cpu_data_master_requests_ssram_avalon_tristate_slave) |
    (last_cycle_cpu_data_master_granted_slave_ext_flash_s1 & cpu_data_master_requests_ext_flash_s1) |
    (last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave & cpu_data_master_requests_ssram_avalon_tristate_slave) |
    (last_cycle_cpu_data_master_granted_slave_ext_flash_s1 & cpu_data_master_requests_ext_flash_s1) |
    (last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave & cpu_data_master_requests_ssram_avalon_tristate_slave);

  assign cpu_instruction_master_qualified_request_ext_flash_s1 = cpu_instruction_master_requests_ext_flash_s1 & ~((cpu_instruction_master_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock | sgdma_rx_m_write_arbiterlock | sgdma_tx_m_read_arbiterlock);
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

  assign cpu_instruction_master_requests_ssram_avalon_tristate_slave = (({cpu_instruction_master_address_to_slave[27 : 23] , 23'b0} == 28'h0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted ssram/avalon_tristate_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave <= cpu_data_master_saved_grant_ssram_avalon_tristate_slave ? 1 : (flash_tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_ssram_avalon_tristate_slave) ? 0 : last_cycle_cpu_data_master_granted_slave_ssram_avalon_tristate_slave;
    end


  assign cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave = cpu_instruction_master_requests_ssram_avalon_tristate_slave & ~((cpu_instruction_master_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending & !((((|cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]))))) | (4 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock | sgdma_rx_m_write_arbiterlock | sgdma_tx_m_read_arbiterlock);
  //cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in = cpu_instruction_master_granted_ssram_avalon_tristate_slave & cpu_instruction_master_read & ~ssram_avalon_tristate_slave_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register = {cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register, cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register_in};

  //cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register <= p1_cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave, which is an e_mux
  assign cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave = cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[3];

  assign sgdma_rx_m_write_requests_ext_flash_s1 = (({sgdma_rx_m_write_address_to_slave[31 : 26] , 26'b0} == 32'h8000000) & (sgdma_rx_m_write_write)) & sgdma_rx_m_write_write;
  assign sgdma_rx_m_write_qualified_request_ext_flash_s1 = sgdma_rx_m_write_requests_ext_flash_s1 & ~(((flash_tristate_bridge_avalon_slave_read_pending | !sgdma_rx_m_write_byteenable_ext_flash_s1) & sgdma_rx_m_write_write) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | sgdma_tx_m_read_arbiterlock);
  assign sgdma_rx_m_write_requests_ssram_avalon_tristate_slave = (({sgdma_rx_m_write_address_to_slave[31 : 23] , 23'b0} == 32'h0) & (sgdma_rx_m_write_write)) & sgdma_rx_m_write_write;
  assign sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave = sgdma_rx_m_write_requests_ssram_avalon_tristate_slave & ~(((flash_tristate_bridge_avalon_slave_read_pending) & sgdma_rx_m_write_write) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | sgdma_tx_m_read_arbiterlock);
  assign sgdma_tx_m_read_requests_ext_flash_s1 = (({sgdma_tx_m_read_address_to_slave[31 : 26] , 26'b0} == 32'h8000000) & (sgdma_tx_m_read_read)) & sgdma_tx_m_read_read;
  assign sgdma_tx_m_read_qualified_request_ext_flash_s1 = sgdma_tx_m_read_requests_ext_flash_s1 & ~((sgdma_tx_m_read_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending) | (2 < sgdma_tx_m_read_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | sgdma_rx_m_write_arbiterlock);
  //sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register_in = sgdma_tx_m_read_granted_ext_flash_s1 & sgdma_tx_m_read_read & ~ext_flash_s1_waits_for_read;

  //shift register p1 sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register = {sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register, sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register_in};

  //sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register <= 0;
      else 
        sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register <= p1_sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register;
    end


  //local readdatavalid sgdma_tx_m_read_read_data_valid_ext_flash_s1, which is an e_mux
  assign sgdma_tx_m_read_read_data_valid_ext_flash_s1 = sgdma_tx_m_read_read_data_valid_ext_flash_s1_shift_register[1];

  assign sgdma_tx_m_read_requests_ssram_avalon_tristate_slave = (({sgdma_tx_m_read_address_to_slave[31 : 23] , 23'b0} == 32'h0) & (sgdma_tx_m_read_read)) & sgdma_tx_m_read_read;
  assign sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave = sgdma_tx_m_read_requests_ssram_avalon_tristate_slave & ~((sgdma_tx_m_read_read & (flash_tristate_bridge_avalon_slave_write_pending | (flash_tristate_bridge_avalon_slave_read_pending & !((((|cpu_data_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]) | (|sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register[1 : 0]))))) | (4 < sgdma_tx_m_read_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | sgdma_rx_m_write_arbiterlock);
  //sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register_in = sgdma_tx_m_read_granted_ssram_avalon_tristate_slave & sgdma_tx_m_read_read & ~ssram_avalon_tristate_slave_waits_for_read;

  //shift register p1 sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register = {sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register, sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register_in};

  //sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register <= 0;
      else 
        sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register <= p1_sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register;
    end


  //local readdatavalid sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave, which is an e_mux
  assign sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave = sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave_shift_register[3];

  //allow new arb cycle for flash_tristate_bridge/avalon_slave, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~sgdma_rx_m_write_arbiterlock & ~sgdma_tx_m_read_arbiterlock;

  //sgdma_tx/m_read assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[0] = sgdma_tx_m_read_qualified_request_ext_flash_s1;

  //sgdma_tx/m_read grant ext_flash/s1, which is an e_assign
  assign sgdma_tx_m_read_granted_ext_flash_s1 = flash_tristate_bridge_avalon_slave_grant_vector[0];

  //sgdma_tx/m_read saved-grant ext_flash/s1, which is an e_assign
  assign sgdma_tx_m_read_saved_grant_ext_flash_s1 = flash_tristate_bridge_avalon_slave_arb_winner[0] && sgdma_tx_m_read_requests_ext_flash_s1;

  //sgdma_rx/m_write assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[1] = sgdma_rx_m_write_qualified_request_ext_flash_s1;

  //sgdma_rx/m_write grant ext_flash/s1, which is an e_assign
  assign sgdma_rx_m_write_granted_ext_flash_s1 = flash_tristate_bridge_avalon_slave_grant_vector[1];

  //sgdma_rx/m_write saved-grant ext_flash/s1, which is an e_assign
  assign sgdma_rx_m_write_saved_grant_ext_flash_s1 = flash_tristate_bridge_avalon_slave_arb_winner[1] && sgdma_rx_m_write_requests_ext_flash_s1;

  //cpu/instruction_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[2] = cpu_instruction_master_qualified_request_ext_flash_s1;

  //cpu/instruction_master grant ext_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_ext_flash_s1 = flash_tristate_bridge_avalon_slave_grant_vector[2];

  //cpu/instruction_master saved-grant ext_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_ext_flash_s1 = flash_tristate_bridge_avalon_slave_arb_winner[2] && cpu_instruction_master_requests_ext_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[3] = cpu_data_master_qualified_request_ext_flash_s1;

  //cpu/data_master grant ext_flash/s1, which is an e_assign
  assign cpu_data_master_granted_ext_flash_s1 = flash_tristate_bridge_avalon_slave_grant_vector[3];

  //cpu/data_master saved-grant ext_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_ext_flash_s1 = flash_tristate_bridge_avalon_slave_arb_winner[3] && cpu_data_master_requests_ext_flash_s1;

  //sgdma_tx/m_read assignment into master qualified-requests vector for ssram/avalon_tristate_slave, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[4] = sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave;

  //sgdma_tx/m_read grant ssram/avalon_tristate_slave, which is an e_assign
  assign sgdma_tx_m_read_granted_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_grant_vector[4];

  //sgdma_tx/m_read saved-grant ssram/avalon_tristate_slave, which is an e_assign
  assign sgdma_tx_m_read_saved_grant_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_arb_winner[4] && sgdma_tx_m_read_requests_ssram_avalon_tristate_slave;

  //sgdma_rx/m_write assignment into master qualified-requests vector for ssram/avalon_tristate_slave, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[5] = sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave;

  //sgdma_rx/m_write grant ssram/avalon_tristate_slave, which is an e_assign
  assign sgdma_rx_m_write_granted_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_grant_vector[5];

  //sgdma_rx/m_write saved-grant ssram/avalon_tristate_slave, which is an e_assign
  assign sgdma_rx_m_write_saved_grant_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_arb_winner[5] && sgdma_rx_m_write_requests_ssram_avalon_tristate_slave;

  //cpu/instruction_master assignment into master qualified-requests vector for ssram/avalon_tristate_slave, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[6] = cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave;

  //cpu/instruction_master grant ssram/avalon_tristate_slave, which is an e_assign
  assign cpu_instruction_master_granted_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_grant_vector[6];

  //cpu/instruction_master saved-grant ssram/avalon_tristate_slave, which is an e_assign
  assign cpu_instruction_master_saved_grant_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_arb_winner[6] && cpu_instruction_master_requests_ssram_avalon_tristate_slave;

  //cpu/data_master assignment into master qualified-requests vector for ssram/avalon_tristate_slave, which is an e_assign
  assign flash_tristate_bridge_avalon_slave_master_qreq_vector[7] = cpu_data_master_qualified_request_ssram_avalon_tristate_slave;

  //cpu/data_master grant ssram/avalon_tristate_slave, which is an e_assign
  assign cpu_data_master_granted_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_grant_vector[7];

  //cpu/data_master saved-grant ssram/avalon_tristate_slave, which is an e_assign
  assign cpu_data_master_saved_grant_ssram_avalon_tristate_slave = flash_tristate_bridge_avalon_slave_arb_winner[7] && cpu_data_master_requests_ssram_avalon_tristate_slave;

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
  assign flash_tristate_bridge_avalon_slave_grant_vector = {(flash_tristate_bridge_avalon_slave_chosen_master_double_vector[7] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[15]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[6] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[14]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[5] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[13]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[4] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[12]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[3] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[11]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[2] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[10]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[1] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[9]),
    (flash_tristate_bridge_avalon_slave_chosen_master_double_vector[0] | flash_tristate_bridge_avalon_slave_chosen_master_double_vector[8])};

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


  assign p1_select_n_to_the_ext_flash = ~(cpu_data_master_granted_ext_flash_s1 | cpu_instruction_master_granted_ext_flash_s1 | sgdma_rx_m_write_granted_ext_flash_s1 | sgdma_tx_m_read_granted_ext_flash_s1);
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
  assign p1_read_n_to_the_ext_flash = ~(((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read) | (sgdma_tx_m_read_granted_ext_flash_s1 & sgdma_tx_m_read_read))& ~flash_tristate_bridge_avalon_slave_begins_xfer & (ext_flash_s1_wait_counter < 7));

  //~write_n_to_the_ext_flash of type write to ~p1_write_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_ext_flash <= ~0;
      else 
        write_n_to_the_ext_flash <= p1_write_n_to_the_ext_flash;
    end


  //~p1_write_n_to_the_ext_flash assignment, which is an e_mux
  assign p1_write_n_to_the_ext_flash = ~(((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write) | (sgdma_rx_m_write_granted_ext_flash_s1 & sgdma_rx_m_write_write)) & ~flash_tristate_bridge_avalon_slave_begins_xfer & (ext_flash_s1_wait_counter >= 2) & (ext_flash_s1_wait_counter < 9));

  //flash_tristate_bridge_address of type address to p1_flash_tristate_bridge_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          flash_tristate_bridge_address <= 0;
      else 
        flash_tristate_bridge_address <= p1_flash_tristate_bridge_address;
    end


  //p1_flash_tristate_bridge_address mux, which is an e_mux
  assign p1_flash_tristate_bridge_address = (cpu_data_master_granted_ext_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    (cpu_instruction_master_granted_ext_flash_s1)? ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}}) :
    (sgdma_rx_m_write_granted_ext_flash_s1)? ({sgdma_rx_m_write_address_to_slave >> 2,
    sgdma_rx_m_write_dbs_address[1],
    {1 {1'b0}}}) :
    (sgdma_tx_m_read_granted_ext_flash_s1)? ({sgdma_tx_m_read_address_to_slave >> 2,
    sgdma_tx_m_read_dbs_address[1],
    {1 {1'b0}}}) :
    (cpu_data_master_granted_ssram_avalon_tristate_slave)? cpu_data_master_address_to_slave :
    (cpu_instruction_master_granted_ssram_avalon_tristate_slave)? cpu_instruction_master_address_to_slave :
    (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave)? sgdma_rx_m_write_address_to_slave :
    sgdma_tx_m_read_address_to_slave;

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
  assign ext_flash_s1_in_a_read_cycle = (cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read) | (sgdma_tx_m_read_granted_ext_flash_s1 & sgdma_tx_m_read_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ext_flash_s1_in_a_read_cycle |
    ssram_avalon_tristate_slave_in_a_read_cycle;

  //ext_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_write = ext_flash_s1_in_a_write_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_write_cycle = (cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write) | (sgdma_rx_m_write_granted_ext_flash_s1 & sgdma_rx_m_write_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ext_flash_s1_in_a_write_cycle |
    ssram_avalon_tristate_slave_in_a_write_cycle;

  assign ext_flash_s1_wait_counter_eq_0 = ext_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ext_flash_s1_wait_counter <= 0;
      else 
        ext_flash_s1_wait_counter <= ext_flash_s1_counter_load_value;
    end


  assign ext_flash_s1_counter_load_value = ((ext_flash_s1_in_a_read_cycle & flash_tristate_bridge_avalon_slave_begins_xfer))? 7 :
    ((ext_flash_s1_in_a_write_cycle & flash_tristate_bridge_avalon_slave_begins_xfer))? 9 :
    (~ext_flash_s1_wait_counter_eq_0)? ext_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_ext_flash_s1_counter = flash_tristate_bridge_avalon_slave_begins_xfer | ~ext_flash_s1_wait_counter_eq_0;
  assign {cpu_data_master_byteenable_ext_flash_s1_segment_1,
cpu_data_master_byteenable_ext_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_ext_flash_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_ext_flash_s1_segment_0 :
    cpu_data_master_byteenable_ext_flash_s1_segment_1;

  assign {sgdma_rx_m_write_byteenable_ext_flash_s1_segment_1,
sgdma_rx_m_write_byteenable_ext_flash_s1_segment_0} = sgdma_rx_m_write_byteenable;
  assign sgdma_rx_m_write_byteenable_ext_flash_s1 = ((sgdma_rx_m_write_dbs_address[1] == 0))? sgdma_rx_m_write_byteenable_ext_flash_s1_segment_0 :
    sgdma_rx_m_write_byteenable_ext_flash_s1_segment_1;

  assign p1_ssram_cen_to_the_ssram = ~(cpu_data_master_granted_ssram_avalon_tristate_slave | cpu_instruction_master_granted_ssram_avalon_tristate_slave | sgdma_rx_m_write_granted_ssram_avalon_tristate_slave | sgdma_tx_m_read_granted_ssram_avalon_tristate_slave);
  //~ssram_oen_to_the_ssram of type read to ~p1_ssram_oen_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ssram_oen_to_the_ssram <= ~0;
      else 
        ssram_oen_to_the_ssram <= p1_ssram_oen_to_the_ssram;
    end


  //~p1_ssram_oen_to_the_ssram assignment, which is an e_mux
  assign p1_ssram_oen_to_the_ssram = ~(((cpu_data_master_granted_ssram_avalon_tristate_slave & cpu_data_master_read) | (cpu_instruction_master_granted_ssram_avalon_tristate_slave & cpu_instruction_master_read) | (sgdma_tx_m_read_granted_ssram_avalon_tristate_slave & sgdma_tx_m_read_read))& ~flash_tristate_bridge_avalon_slave_begins_xfer & (ssram_avalon_tristate_slave_wait_counter < 10));

  //~ssram_wen_to_the_ssram of type write to ~p1_ssram_wen_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ssram_wen_to_the_ssram <= ~0;
      else 
        ssram_wen_to_the_ssram <= p1_ssram_wen_to_the_ssram;
    end


  //~ssram_bwn_to_the_ssram of type byteenable to ~p1_ssram_bwn_to_the_ssram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ssram_bwn_to_the_ssram <= ~0;
      else 
        ssram_bwn_to_the_ssram <= p1_ssram_bwn_to_the_ssram;
    end


  //~p1_ssram_wen_to_the_ssram assignment, which is an e_mux
  assign p1_ssram_wen_to_the_ssram = ~(((cpu_data_master_granted_ssram_avalon_tristate_slave & cpu_data_master_write) | (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave & sgdma_rx_m_write_write)) & ~flash_tristate_bridge_avalon_slave_begins_xfer & (ssram_avalon_tristate_slave_wait_counter >= 10) & (ssram_avalon_tristate_slave_wait_counter < 20));

  //ssram_avalon_tristate_slave_wait_counter_eq_1 assignment, which is an e_assign
  assign ssram_avalon_tristate_slave_wait_counter_eq_1 = ssram_avalon_tristate_slave_wait_counter == 1;

  //ssram_avalon_tristate_slave_waits_for_read in a cycle, which is an e_mux
  assign ssram_avalon_tristate_slave_waits_for_read = ssram_avalon_tristate_slave_in_a_read_cycle & wait_for_ssram_avalon_tristate_slave_counter;

  //ssram_avalon_tristate_slave_in_a_read_cycle assignment, which is an e_assign
  assign ssram_avalon_tristate_slave_in_a_read_cycle = (cpu_data_master_granted_ssram_avalon_tristate_slave & cpu_data_master_read) | (cpu_instruction_master_granted_ssram_avalon_tristate_slave & cpu_instruction_master_read) | (sgdma_tx_m_read_granted_ssram_avalon_tristate_slave & sgdma_tx_m_read_read);

  //ssram_avalon_tristate_slave_waits_for_write in a cycle, which is an e_mux
  assign ssram_avalon_tristate_slave_waits_for_write = ssram_avalon_tristate_slave_in_a_write_cycle & wait_for_ssram_avalon_tristate_slave_counter;

  //ssram_avalon_tristate_slave_in_a_write_cycle assignment, which is an e_assign
  assign ssram_avalon_tristate_slave_in_a_write_cycle = (cpu_data_master_granted_ssram_avalon_tristate_slave & cpu_data_master_write) | (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave & sgdma_rx_m_write_write);

  assign ssram_avalon_tristate_slave_wait_counter_eq_0 = ssram_avalon_tristate_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ssram_avalon_tristate_slave_wait_counter <= 0;
      else 
        ssram_avalon_tristate_slave_wait_counter <= ssram_avalon_tristate_slave_counter_load_value;
    end


  assign ssram_avalon_tristate_slave_counter_load_value = ((ssram_avalon_tristate_slave_in_a_read_cycle & flash_tristate_bridge_avalon_slave_begins_xfer))? 18 :
    ((ssram_avalon_tristate_slave_in_a_write_cycle & flash_tristate_bridge_avalon_slave_begins_xfer))? 28 :
    (~ssram_avalon_tristate_slave_wait_counter_eq_0)? ssram_avalon_tristate_slave_wait_counter - 1 :
    0;

  assign wait_for_ssram_avalon_tristate_slave_counter = flash_tristate_bridge_avalon_slave_begins_xfer | ~ssram_avalon_tristate_slave_wait_counter_eq_0;
  //~p1_ssram_bwn_to_the_ssram byte enable port mux, which is an e_mux
  assign p1_ssram_bwn_to_the_ssram = ~((cpu_data_master_granted_ssram_avalon_tristate_slave)? cpu_data_master_byteenable :
    (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave)? sgdma_rx_m_write_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_flash_tristate_bridge_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_0_is_x = ^(incoming_flash_tristate_bridge_data[0]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[0] = incoming_flash_tristate_bridge_data_bit_0_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[0];

  //incoming_flash_tristate_bridge_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_1_is_x = ^(incoming_flash_tristate_bridge_data[1]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[1] = incoming_flash_tristate_bridge_data_bit_1_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[1];

  //incoming_flash_tristate_bridge_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_2_is_x = ^(incoming_flash_tristate_bridge_data[2]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[2] = incoming_flash_tristate_bridge_data_bit_2_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[2];

  //incoming_flash_tristate_bridge_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_3_is_x = ^(incoming_flash_tristate_bridge_data[3]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[3] = incoming_flash_tristate_bridge_data_bit_3_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[3];

  //incoming_flash_tristate_bridge_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_4_is_x = ^(incoming_flash_tristate_bridge_data[4]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[4] = incoming_flash_tristate_bridge_data_bit_4_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[4];

  //incoming_flash_tristate_bridge_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_5_is_x = ^(incoming_flash_tristate_bridge_data[5]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[5] = incoming_flash_tristate_bridge_data_bit_5_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[5];

  //incoming_flash_tristate_bridge_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_6_is_x = ^(incoming_flash_tristate_bridge_data[6]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[6] = incoming_flash_tristate_bridge_data_bit_6_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[6];

  //incoming_flash_tristate_bridge_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_7_is_x = ^(incoming_flash_tristate_bridge_data[7]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[7] = incoming_flash_tristate_bridge_data_bit_7_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[7];

  //incoming_flash_tristate_bridge_data_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_8_is_x = ^(incoming_flash_tristate_bridge_data[8]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[8] = incoming_flash_tristate_bridge_data_bit_8_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[8];

  //incoming_flash_tristate_bridge_data_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_9_is_x = ^(incoming_flash_tristate_bridge_data[9]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[9] = incoming_flash_tristate_bridge_data_bit_9_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[9];

  //incoming_flash_tristate_bridge_data_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_10_is_x = ^(incoming_flash_tristate_bridge_data[10]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[10] = incoming_flash_tristate_bridge_data_bit_10_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[10];

  //incoming_flash_tristate_bridge_data_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_11_is_x = ^(incoming_flash_tristate_bridge_data[11]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[11] = incoming_flash_tristate_bridge_data_bit_11_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[11];

  //incoming_flash_tristate_bridge_data_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_12_is_x = ^(incoming_flash_tristate_bridge_data[12]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[12] = incoming_flash_tristate_bridge_data_bit_12_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[12];

  //incoming_flash_tristate_bridge_data_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_13_is_x = ^(incoming_flash_tristate_bridge_data[13]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[13] = incoming_flash_tristate_bridge_data_bit_13_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[13];

  //incoming_flash_tristate_bridge_data_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_14_is_x = ^(incoming_flash_tristate_bridge_data[14]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[14] = incoming_flash_tristate_bridge_data_bit_14_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[14];

  //incoming_flash_tristate_bridge_data_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_flash_tristate_bridge_data_bit_15_is_x = ^(incoming_flash_tristate_bridge_data[15]) === 1'bx;

  //Crush incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[15] = incoming_flash_tristate_bridge_data_bit_15_is_x ? 1'b0 : incoming_flash_tristate_bridge_data[15];

  //ext_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //ssram/avalon_tristate_slave enable non-zero assertions, which is an e_register
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
      if (cpu_data_master_granted_ext_flash_s1 + cpu_data_master_granted_ssram_avalon_tristate_slave + cpu_instruction_master_granted_ext_flash_s1 + cpu_instruction_master_granted_ssram_avalon_tristate_slave + sgdma_rx_m_write_granted_ext_flash_s1 + sgdma_rx_m_write_granted_ssram_avalon_tristate_slave + sgdma_tx_m_read_granted_ext_flash_s1 + sgdma_tx_m_read_granted_ssram_avalon_tristate_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_ext_flash_s1 + cpu_data_master_saved_grant_ssram_avalon_tristate_slave + cpu_instruction_master_saved_grant_ext_flash_s1 + cpu_instruction_master_saved_grant_ssram_avalon_tristate_slave + sgdma_rx_m_write_saved_grant_ext_flash_s1 + sgdma_rx_m_write_saved_grant_ssram_avalon_tristate_slave + sgdma_tx_m_read_saved_grant_ext_flash_s1 + sgdma_tx_m_read_saved_grant_ssram_avalon_tristate_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_flash_tristate_bridge_data_with_Xs_converted_to_0 = incoming_flash_tristate_bridge_data;
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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_high_res_timer_s1_from_cpu_data_master;
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

  assign cpu_data_master_requests_high_res_timer_s1 = ({cpu_data_master_address_to_slave[27 : 5] , 5'b0} == 28'h8025a0) & (cpu_data_master_read | cpu_data_master_write);
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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
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

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h8025e0) & (cpu_data_master_read | cpu_data_master_write);
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

module lcd_control_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_byteenable,
                                       cpu_data_master_read,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       lcd_control_slave_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_data_master_granted_lcd_control_slave,
                                       cpu_data_master_qualified_request_lcd_control_slave,
                                       cpu_data_master_read_data_valid_lcd_control_slave,
                                       cpu_data_master_requests_lcd_control_slave,
                                       d1_lcd_control_slave_end_xfer,
                                       lcd_control_slave_address,
                                       lcd_control_slave_begintransfer,
                                       lcd_control_slave_read,
                                       lcd_control_slave_readdata_from_sa,
                                       lcd_control_slave_reset_n,
                                       lcd_control_slave_wait_counter_eq_0,
                                       lcd_control_slave_wait_counter_eq_1,
                                       lcd_control_slave_write,
                                       lcd_control_slave_writedata
                                    )
;

  output           cpu_data_master_granted_lcd_control_slave;
  output           cpu_data_master_qualified_request_lcd_control_slave;
  output           cpu_data_master_read_data_valid_lcd_control_slave;
  output           cpu_data_master_requests_lcd_control_slave;
  output           d1_lcd_control_slave_end_xfer;
  output  [  1: 0] lcd_control_slave_address;
  output           lcd_control_slave_begintransfer;
  output           lcd_control_slave_read;
  output  [  7: 0] lcd_control_slave_readdata_from_sa;
  output           lcd_control_slave_reset_n;
  output           lcd_control_slave_wait_counter_eq_0;
  output           lcd_control_slave_wait_counter_eq_1;
  output           lcd_control_slave_write;
  output  [  7: 0] lcd_control_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  7: 0] lcd_control_slave_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_lcd_control_slave;
  wire             cpu_data_master_qualified_request_lcd_control_slave;
  wire             cpu_data_master_read_data_valid_lcd_control_slave;
  wire             cpu_data_master_requests_lcd_control_slave;
  wire             cpu_data_master_saved_grant_lcd_control_slave;
  reg              d1_lcd_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_allgrants;
  wire             lcd_control_slave_allow_new_arb_cycle;
  wire             lcd_control_slave_any_bursting_master_saved_grant;
  wire             lcd_control_slave_any_continuerequest;
  wire             lcd_control_slave_arb_counter_enable;
  reg     [  1: 0] lcd_control_slave_arb_share_counter;
  wire    [  1: 0] lcd_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] lcd_control_slave_arb_share_set_values;
  wire             lcd_control_slave_beginbursttransfer_internal;
  wire             lcd_control_slave_begins_xfer;
  wire             lcd_control_slave_begintransfer;
  wire    [  5: 0] lcd_control_slave_counter_load_value;
  wire             lcd_control_slave_end_xfer;
  wire             lcd_control_slave_firsttransfer;
  wire             lcd_control_slave_grant_vector;
  wire             lcd_control_slave_in_a_read_cycle;
  wire             lcd_control_slave_in_a_write_cycle;
  wire             lcd_control_slave_master_qreq_vector;
  wire             lcd_control_slave_non_bursting_master_requests;
  wire             lcd_control_slave_pretend_byte_enable;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  reg              lcd_control_slave_reg_firsttransfer;
  wire             lcd_control_slave_reset_n;
  reg              lcd_control_slave_slavearbiterlockenable;
  wire             lcd_control_slave_slavearbiterlockenable2;
  wire             lcd_control_slave_unreg_firsttransfer;
  reg     [  5: 0] lcd_control_slave_wait_counter;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_wait_counter_eq_1;
  wire             lcd_control_slave_waits_for_read;
  wire             lcd_control_slave_waits_for_write;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire    [ 27: 0] shifted_address_to_lcd_control_slave_from_cpu_data_master;
  wire             wait_for_lcd_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_control_slave_end_xfer;
    end


  assign lcd_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_lcd_control_slave));
  //assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata;

  assign cpu_data_master_requests_lcd_control_slave = ({cpu_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h801000) & (cpu_data_master_read | cpu_data_master_write);
  //lcd_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_control_slave_arb_share_set_values = 1;

  //lcd_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_control_slave_non_bursting_master_requests = cpu_data_master_requests_lcd_control_slave;

  //lcd_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_control_slave_arb_share_counter_next_value = lcd_control_slave_firsttransfer ? (lcd_control_slave_arb_share_set_values - 1) : |lcd_control_slave_arb_share_counter ? (lcd_control_slave_arb_share_counter - 1) : 0;

  //lcd_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_control_slave_allgrants = |lcd_control_slave_grant_vector;

  //lcd_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_control_slave_end_xfer = ~(lcd_control_slave_waits_for_read | lcd_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_control_slave = lcd_control_slave_end_xfer & (~lcd_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_control_slave & lcd_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests);

  //lcd_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_arb_share_counter <= 0;
      else if (lcd_control_slave_arb_counter_enable)
          lcd_control_slave_arb_share_counter <= lcd_control_slave_arb_share_counter_next_value;
    end


  //lcd_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_control_slave) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests))
          lcd_control_slave_slavearbiterlockenable <= |lcd_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master lcd/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = lcd_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //lcd_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_control_slave_slavearbiterlockenable2 = |lcd_control_slave_arb_share_counter_next_value;

  //cpu/data_master lcd/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = lcd_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //lcd_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_lcd_control_slave = cpu_data_master_requests_lcd_control_slave;
  //lcd_control_slave_writedata mux, which is an e_mux
  assign lcd_control_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_lcd_control_slave = cpu_data_master_qualified_request_lcd_control_slave;

  //cpu/data_master saved-grant lcd/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_lcd_control_slave = cpu_data_master_requests_lcd_control_slave;

  //allow new arb cycle for lcd/control_slave, which is an e_assign
  assign lcd_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_control_slave_master_qreq_vector = 1;

  assign lcd_control_slave_begintransfer = lcd_control_slave_begins_xfer;
  //lcd_control_slave_reset_n assignment, which is an e_assign
  assign lcd_control_slave_reset_n = reset_n;

  //lcd_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_firsttransfer = lcd_control_slave_begins_xfer ? lcd_control_slave_unreg_firsttransfer : lcd_control_slave_reg_firsttransfer;

  //lcd_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_unreg_firsttransfer = ~(lcd_control_slave_slavearbiterlockenable & lcd_control_slave_any_continuerequest);

  //lcd_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_control_slave_begins_xfer)
          lcd_control_slave_reg_firsttransfer <= lcd_control_slave_unreg_firsttransfer;
    end


  //lcd_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_control_slave_beginbursttransfer_internal = lcd_control_slave_begins_xfer;

  //lcd_control_slave_read assignment, which is an e_mux
  assign lcd_control_slave_read = ((cpu_data_master_granted_lcd_control_slave & cpu_data_master_read))& ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter < 13);

  //lcd_control_slave_write assignment, which is an e_mux
  assign lcd_control_slave_write = ((cpu_data_master_granted_lcd_control_slave & cpu_data_master_write)) & ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter >= 13) & (lcd_control_slave_wait_counter < 26) & lcd_control_slave_pretend_byte_enable;

  assign shifted_address_to_lcd_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //lcd_control_slave_address mux, which is an e_mux
  assign lcd_control_slave_address = shifted_address_to_lcd_control_slave_from_cpu_data_master >> 2;

  //d1_lcd_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_control_slave_end_xfer <= 1;
      else 
        d1_lcd_control_slave_end_xfer <= lcd_control_slave_end_xfer;
    end


  //lcd_control_slave_wait_counter_eq_1 assignment, which is an e_assign
  assign lcd_control_slave_wait_counter_eq_1 = lcd_control_slave_wait_counter == 1;

  //lcd_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_read = lcd_control_slave_in_a_read_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_read_cycle = cpu_data_master_granted_lcd_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_control_slave_in_a_read_cycle;

  //lcd_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_write = lcd_control_slave_in_a_write_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_write_cycle = cpu_data_master_granted_lcd_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_control_slave_in_a_write_cycle;

  assign lcd_control_slave_wait_counter_eq_0 = lcd_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_wait_counter <= 0;
      else 
        lcd_control_slave_wait_counter <= lcd_control_slave_counter_load_value;
    end


  assign lcd_control_slave_counter_load_value = ((lcd_control_slave_in_a_read_cycle & lcd_control_slave_begins_xfer))? 24 :
    ((lcd_control_slave_in_a_write_cycle & lcd_control_slave_begins_xfer))? 37 :
    (~lcd_control_slave_wait_counter_eq_0)? lcd_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_control_slave_counter = lcd_control_slave_begins_xfer | ~lcd_control_slave_wait_counter_eq_0;
  //lcd_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_control_slave_pretend_byte_enable = (cpu_data_master_granted_lcd_control_slave)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd/control_slave enable non-zero assertions, which is an e_register
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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_led_pio_s1_from_cpu_data_master;
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

  assign cpu_data_master_requests_led_pio_s1 = ({cpu_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h8025c0) & (cpu_data_master_read | cpu_data_master_write);
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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_sgdma_rx_csr_from_cpu_data_master;
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

  assign cpu_data_master_requests_sgdma_rx_csr = ({cpu_data_master_address_to_slave[27 : 6] , 6'b0} == 28'h802540) & (cpu_data_master_read | cpu_data_master_write);
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
  wire             r_0;
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
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_rx_descriptor_read_requests_descriptor_memory_s1) & (sgdma_rx_descriptor_read_granted_descriptor_memory_s1 | ~sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1) & ((~sgdma_rx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_rx_descriptor_read_read | (1 & sgdma_rx_descriptor_read_read)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_rx_descriptor_read_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_rx_descriptor_read_address_to_slave = {20'b100000000000,
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
  wire             r_0;
  reg     [ 31: 0] sgdma_rx_descriptor_write_address_last_time;
  wire    [ 31: 0] sgdma_rx_descriptor_write_address_to_slave;
  wire             sgdma_rx_descriptor_write_run;
  wire             sgdma_rx_descriptor_write_waitrequest;
  reg              sgdma_rx_descriptor_write_write_last_time;
  reg     [ 31: 0] sgdma_rx_descriptor_write_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 | ~sgdma_rx_descriptor_write_requests_descriptor_memory_s1) & (sgdma_rx_descriptor_write_granted_descriptor_memory_s1 | ~sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1) & ((~sgdma_rx_descriptor_write_qualified_request_descriptor_memory_s1 | ~(sgdma_rx_descriptor_write_write) | (1 & (sgdma_rx_descriptor_write_write))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_rx_descriptor_write_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_rx_descriptor_write_address_to_slave = {20'b100000000000,
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
                                      clk,
                                      d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                      ext_flash_s1_wait_counter_eq_0,
                                      ext_flash_s1_wait_counter_eq_1,
                                      reset_n,
                                      sgdma_rx_m_write_address,
                                      sgdma_rx_m_write_byteenable,
                                      sgdma_rx_m_write_byteenable_ext_flash_s1,
                                      sgdma_rx_m_write_granted_ext_flash_s1,
                                      sgdma_rx_m_write_granted_ssram_avalon_tristate_slave,
                                      sgdma_rx_m_write_qualified_request_ext_flash_s1,
                                      sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave,
                                      sgdma_rx_m_write_requests_ext_flash_s1,
                                      sgdma_rx_m_write_requests_ssram_avalon_tristate_slave,
                                      sgdma_rx_m_write_write,
                                      sgdma_rx_m_write_writedata,
                                      ssram_avalon_tristate_slave_wait_counter_eq_0,
                                      ssram_avalon_tristate_slave_wait_counter_eq_1,

                                     // outputs:
                                      sgdma_rx_m_write_address_to_slave,
                                      sgdma_rx_m_write_dbs_address,
                                      sgdma_rx_m_write_dbs_write_16,
                                      sgdma_rx_m_write_waitrequest
                                   )
;

  output  [ 31: 0] sgdma_rx_m_write_address_to_slave;
  output  [  1: 0] sgdma_rx_m_write_dbs_address;
  output  [ 15: 0] sgdma_rx_m_write_dbs_write_16;
  output           sgdma_rx_m_write_waitrequest;
  input            clk;
  input            d1_flash_tristate_bridge_avalon_slave_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input            reset_n;
  input   [ 31: 0] sgdma_rx_m_write_address;
  input   [  3: 0] sgdma_rx_m_write_byteenable;
  input   [  1: 0] sgdma_rx_m_write_byteenable_ext_flash_s1;
  input            sgdma_rx_m_write_granted_ext_flash_s1;
  input            sgdma_rx_m_write_granted_ssram_avalon_tristate_slave;
  input            sgdma_rx_m_write_qualified_request_ext_flash_s1;
  input            sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave;
  input            sgdma_rx_m_write_requests_ext_flash_s1;
  input            sgdma_rx_m_write_requests_ssram_avalon_tristate_slave;
  input            sgdma_rx_m_write_write;
  input   [ 31: 0] sgdma_rx_m_write_writedata;
  input            ssram_avalon_tristate_slave_wait_counter_eq_0;
  input            ssram_avalon_tristate_slave_wait_counter_eq_1;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire             pre_dbs_count_enable;
  wire             r_0;
  reg     [ 31: 0] sgdma_rx_m_write_address_last_time;
  wire    [ 31: 0] sgdma_rx_m_write_address_to_slave;
  reg     [  3: 0] sgdma_rx_m_write_byteenable_last_time;
  reg     [  1: 0] sgdma_rx_m_write_dbs_address;
  wire    [  1: 0] sgdma_rx_m_write_dbs_increment;
  wire    [ 15: 0] sgdma_rx_m_write_dbs_write_16;
  wire             sgdma_rx_m_write_run;
  wire             sgdma_rx_m_write_waitrequest;
  reg              sgdma_rx_m_write_write_last_time;
  reg     [ 31: 0] sgdma_rx_m_write_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_rx_m_write_qualified_request_ext_flash_s1 | (sgdma_rx_m_write_write & !sgdma_rx_m_write_byteenable_ext_flash_s1 & sgdma_rx_m_write_dbs_address[1]) | ~sgdma_rx_m_write_requests_ext_flash_s1) & (sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave | ~sgdma_rx_m_write_requests_ssram_avalon_tristate_slave) & (sgdma_rx_m_write_granted_ext_flash_s1 | ~sgdma_rx_m_write_qualified_request_ext_flash_s1) & (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave | ~sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave) & ((~sgdma_rx_m_write_qualified_request_ext_flash_s1 | ~sgdma_rx_m_write_write | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & (sgdma_rx_m_write_dbs_address[1]) & sgdma_rx_m_write_write))) & ((~sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave | ~sgdma_rx_m_write_write | (1 & ((ssram_avalon_tristate_slave_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & sgdma_rx_m_write_write)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_rx_m_write_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_rx_m_write_address_to_slave = {4'b0,
    sgdma_rx_m_write_address[27],
    1'b0,
    sgdma_rx_m_write_address[25 : 0]};

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & sgdma_rx_m_write_requests_ext_flash_s1 & sgdma_rx_m_write_write & !sgdma_rx_m_write_byteenable_ext_flash_s1)) |
    ((sgdma_rx_m_write_granted_ext_flash_s1 & sgdma_rx_m_write_write & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer})));

  //mux write dbs 1, which is an e_mux
  assign sgdma_rx_m_write_dbs_write_16 = (sgdma_rx_m_write_dbs_address[1])? sgdma_rx_m_write_writedata[31 : 16] :
    sgdma_rx_m_write_writedata[15 : 0];

  //actual waitrequest port, which is an e_assign
  assign sgdma_rx_m_write_waitrequest = ~sgdma_rx_m_write_run;

  //dbs count increment, which is an e_mux
  assign sgdma_rx_m_write_dbs_increment = (sgdma_rx_m_write_requests_ext_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = sgdma_rx_m_write_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = sgdma_rx_m_write_dbs_address + sgdma_rx_m_write_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_rx_m_write_dbs_address <= 0;
      else if (dbs_count_enable)
          sgdma_rx_m_write_dbs_address <= next_dbs_address;
    end



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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_sgdma_tx_csr_from_cpu_data_master;
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

  assign cpu_data_master_requests_sgdma_tx_csr = ({cpu_data_master_address_to_slave[27 : 6] , 6'b0} == 28'h802500) & (cpu_data_master_read | cpu_data_master_write);
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
  wire             r_0;
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
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_tx_descriptor_read_requests_descriptor_memory_s1) & (sgdma_tx_descriptor_read_granted_descriptor_memory_s1 | ~sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1) & ((~sgdma_tx_descriptor_read_qualified_request_descriptor_memory_s1 | ~sgdma_tx_descriptor_read_read | (1 & sgdma_tx_descriptor_read_read)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_tx_descriptor_read_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_tx_descriptor_read_address_to_slave = {20'b100000000000,
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
  wire             r_0;
  reg     [ 31: 0] sgdma_tx_descriptor_write_address_last_time;
  wire    [ 31: 0] sgdma_tx_descriptor_write_address_to_slave;
  wire             sgdma_tx_descriptor_write_run;
  wire             sgdma_tx_descriptor_write_waitrequest;
  reg              sgdma_tx_descriptor_write_write_last_time;
  reg     [ 31: 0] sgdma_tx_descriptor_write_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 | ~sgdma_tx_descriptor_write_requests_descriptor_memory_s1) & (sgdma_tx_descriptor_write_granted_descriptor_memory_s1 | ~sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1) & ((~sgdma_tx_descriptor_write_qualified_request_descriptor_memory_s1 | ~(sgdma_tx_descriptor_write_write) | (1 & (sgdma_tx_descriptor_write_write))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_tx_descriptor_write_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_tx_descriptor_write_address_to_slave = {20'b100000000000,
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
                                     clk,
                                     d1_flash_tristate_bridge_avalon_slave_end_xfer,
                                     ext_flash_s1_wait_counter_eq_0,
                                     ext_flash_s1_wait_counter_eq_1,
                                     incoming_flash_tristate_bridge_data,
                                     incoming_flash_tristate_bridge_data_with_Xs_converted_to_0,
                                     reset_n,
                                     sgdma_tx_m_read_address,
                                     sgdma_tx_m_read_granted_ext_flash_s1,
                                     sgdma_tx_m_read_granted_ssram_avalon_tristate_slave,
                                     sgdma_tx_m_read_qualified_request_ext_flash_s1,
                                     sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave,
                                     sgdma_tx_m_read_read,
                                     sgdma_tx_m_read_read_data_valid_ext_flash_s1,
                                     sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave,
                                     sgdma_tx_m_read_requests_ext_flash_s1,
                                     sgdma_tx_m_read_requests_ssram_avalon_tristate_slave,
                                     ssram_avalon_tristate_slave_wait_counter_eq_0,
                                     ssram_avalon_tristate_slave_wait_counter_eq_1,

                                    // outputs:
                                     sgdma_tx_m_read_address_to_slave,
                                     sgdma_tx_m_read_dbs_address,
                                     sgdma_tx_m_read_latency_counter,
                                     sgdma_tx_m_read_readdata,
                                     sgdma_tx_m_read_readdatavalid,
                                     sgdma_tx_m_read_waitrequest
                                  )
;

  output  [ 31: 0] sgdma_tx_m_read_address_to_slave;
  output  [  1: 0] sgdma_tx_m_read_dbs_address;
  output  [  2: 0] sgdma_tx_m_read_latency_counter;
  output  [ 31: 0] sgdma_tx_m_read_readdata;
  output           sgdma_tx_m_read_readdatavalid;
  output           sgdma_tx_m_read_waitrequest;
  input            clk;
  input            d1_flash_tristate_bridge_avalon_slave_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input   [ 31: 0] incoming_flash_tristate_bridge_data;
  input   [ 15: 0] incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;
  input            reset_n;
  input   [ 31: 0] sgdma_tx_m_read_address;
  input            sgdma_tx_m_read_granted_ext_flash_s1;
  input            sgdma_tx_m_read_granted_ssram_avalon_tristate_slave;
  input            sgdma_tx_m_read_qualified_request_ext_flash_s1;
  input            sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave;
  input            sgdma_tx_m_read_read;
  input            sgdma_tx_m_read_read_data_valid_ext_flash_s1;
  input            sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave;
  input            sgdma_tx_m_read_requests_ext_flash_s1;
  input            sgdma_tx_m_read_requests_ssram_avalon_tristate_slave;
  input            ssram_avalon_tristate_slave_wait_counter_eq_0;
  input            ssram_avalon_tristate_slave_wait_counter_eq_1;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  2: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire    [  2: 0] p1_sgdma_tx_m_read_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_sgdma_tx_m_read_readdatavalid;
  wire             r_0;
  reg     [ 31: 0] sgdma_tx_m_read_address_last_time;
  wire    [ 31: 0] sgdma_tx_m_read_address_to_slave;
  reg     [  1: 0] sgdma_tx_m_read_dbs_address;
  wire    [  1: 0] sgdma_tx_m_read_dbs_increment;
  reg     [  1: 0] sgdma_tx_m_read_dbs_rdv_counter;
  wire    [  1: 0] sgdma_tx_m_read_dbs_rdv_counter_inc;
  wire             sgdma_tx_m_read_is_granted_some_slave;
  reg     [  2: 0] sgdma_tx_m_read_latency_counter;
  wire    [  1: 0] sgdma_tx_m_read_next_dbs_rdv_counter;
  reg              sgdma_tx_m_read_read_but_no_slave_selected;
  reg              sgdma_tx_m_read_read_last_time;
  wire    [ 31: 0] sgdma_tx_m_read_readdata;
  wire             sgdma_tx_m_read_readdatavalid;
  wire             sgdma_tx_m_read_run;
  wire             sgdma_tx_m_read_waitrequest;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_tx_m_read_qualified_request_ext_flash_s1 | ~sgdma_tx_m_read_requests_ext_flash_s1) & (sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave | ~sgdma_tx_m_read_requests_ssram_avalon_tristate_slave) & (sgdma_tx_m_read_granted_ext_flash_s1 | ~sgdma_tx_m_read_qualified_request_ext_flash_s1) & (sgdma_tx_m_read_granted_ssram_avalon_tristate_slave | ~sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave) & ((~sgdma_tx_m_read_qualified_request_ext_flash_s1 | ~sgdma_tx_m_read_read | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & (sgdma_tx_m_read_dbs_address[1]) & sgdma_tx_m_read_read))) & ((~sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave | ~sgdma_tx_m_read_read | (1 & ((ssram_avalon_tristate_slave_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer)) & sgdma_tx_m_read_read)));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_tx_m_read_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_tx_m_read_address_to_slave = {4'b0,
    sgdma_tx_m_read_address[27],
    1'b0,
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
  assign sgdma_tx_m_read_is_granted_some_slave = sgdma_tx_m_read_granted_ext_flash_s1 |
    sgdma_tx_m_read_granted_ssram_avalon_tristate_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_sgdma_tx_m_read_readdatavalid = (sgdma_tx_m_read_read_data_valid_ext_flash_s1 & dbs_rdv_counter_overflow) |
    sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign sgdma_tx_m_read_readdatavalid = sgdma_tx_m_read_read_but_no_slave_selected |
    pre_flush_sgdma_tx_m_read_readdatavalid |
    sgdma_tx_m_read_read_but_no_slave_selected |
    pre_flush_sgdma_tx_m_read_readdatavalid;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((sgdma_tx_m_read_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //sgdma_tx/m_read readdata mux, which is an e_mux
  assign sgdma_tx_m_read_readdata = ({32 {~sgdma_tx_m_read_read_data_valid_ext_flash_s1}} | {incoming_flash_tristate_bridge_data_with_Xs_converted_to_0[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave}} | incoming_flash_tristate_bridge_data);

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
  assign latency_load_value = ({3 {sgdma_tx_m_read_requests_ext_flash_s1}} & 2) |
    ({3 {sgdma_tx_m_read_requests_ssram_avalon_tristate_slave}} & 4);

  //dbs count increment, which is an e_mux
  assign sgdma_tx_m_read_dbs_increment = (sgdma_tx_m_read_requests_ext_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = sgdma_tx_m_read_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = sgdma_tx_m_read_dbs_address + sgdma_tx_m_read_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_dbs_address <= 0;
      else if (dbs_count_enable)
          sgdma_tx_m_read_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign sgdma_tx_m_read_next_dbs_rdv_counter = sgdma_tx_m_read_dbs_rdv_counter + sgdma_tx_m_read_dbs_rdv_counter_inc;

  //sgdma_tx_m_read_rdv_inc_mux, which is an e_mux
  assign sgdma_tx_m_read_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = sgdma_tx_m_read_read_data_valid_ext_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_tx_m_read_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          sgdma_tx_m_read_dbs_rdv_counter <= sgdma_tx_m_read_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = sgdma_tx_m_read_dbs_rdv_counter[1] & ~sgdma_tx_m_read_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = sgdma_tx_m_read_granted_ext_flash_s1 & sgdma_tx_m_read_read & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_flash_tristate_bridge_avalon_slave_end_xfer});


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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_sys_clk_timer_s1_from_cpu_data_master;
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

  assign cpu_data_master_requests_sys_clk_timer_s1 = ({cpu_data_master_address_to_slave[27 : 5] , 5'b0} == 28'h802580) & (cpu_data_master_read | cpu_data_master_write);
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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
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

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h8025e8) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
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
  input   [ 27: 0] cpu_data_master_address_to_slave;
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
  wire    [ 27: 0] shifted_address_to_tse_mac_control_port_from_cpu_data_master;
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

  assign cpu_data_master_requests_tse_mac_control_port = ({cpu_data_master_address_to_slave[27 : 10] , 10'b0} == 28'h802000) & (cpu_data_master_read | cpu_data_master_write);
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

module bup_3c120_fpga_sopc_reset_osc_clk_domain_synch_module (
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

module bup_3c120_fpga_sopc (
                             // 1) global signals:
                              osc_clk,
                              reset_n,

                             // the_flash_tristate_bridge_avalon_slave
                              flash_tristate_bridge_address,
                              flash_tristate_bridge_data,
                              read_n_to_the_ext_flash,
                              select_n_to_the_ext_flash,
                              ssram_bwn_to_the_ssram,
                              ssram_cen_to_the_ssram,
                              ssram_oen_to_the_ssram,
                              ssram_wen_to_the_ssram,
                              write_n_to_the_ext_flash,

                             // the_lcd
                              LCD_E_from_the_lcd,
                              LCD_RS_from_the_lcd,
                              LCD_RW_from_the_lcd,
                              LCD_data_to_and_from_the_lcd,

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

  output           LCD_E_from_the_lcd;
  output           LCD_RS_from_the_lcd;
  output           LCD_RW_from_the_lcd;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd;
  output           ena_10_from_the_tse_mac;
  output           eth_mode_from_the_tse_mac;
  output  [ 25: 0] flash_tristate_bridge_address;
  inout   [ 31: 0] flash_tristate_bridge_data;
  output           mdc_from_the_tse_mac;
  output           mdio_oen_from_the_tse_mac;
  output           mdio_out_from_the_tse_mac;
  output  [  7: 0] out_port_from_the_led_pio;
  output           read_n_to_the_ext_flash;
  output  [  3: 0] rgmii_out_from_the_tse_mac;
  output           select_n_to_the_ext_flash;
  output  [  3: 0] ssram_bwn_to_the_ssram;
  output           ssram_cen_to_the_ssram;
  output           ssram_oen_to_the_ssram;
  output           ssram_wen_to_the_ssram;
  output           tx_control_from_the_tse_mac;
  output           write_n_to_the_ext_flash;
  input            mdio_in_to_the_tse_mac;
  input            osc_clk;
  input            reset_n;
  input   [  3: 0] rgmii_in_to_the_tse_mac;
  input            rx_clk_to_the_tse_mac;
  input            rx_control_to_the_tse_mac;
  input            set_1000_to_the_tse_mac;
  input            set_10_to_the_tse_mac;
  input            tx_clk_to_the_tse_mac;

  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire    [ 27: 0] cpu_data_master_address;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_ext_flash_s1;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_descriptor_memory_s1;
  wire             cpu_data_master_granted_ext_flash_s1;
  wire             cpu_data_master_granted_high_res_timer_s1;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_lcd_control_slave;
  wire             cpu_data_master_granted_led_pio_s1;
  wire             cpu_data_master_granted_sgdma_rx_csr;
  wire             cpu_data_master_granted_sgdma_tx_csr;
  wire             cpu_data_master_granted_ssram_avalon_tristate_slave;
  wire             cpu_data_master_granted_sys_clk_timer_s1;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_tse_mac_control_port;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_no_byte_enables_and_last_term;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_descriptor_memory_s1;
  wire             cpu_data_master_qualified_request_ext_flash_s1;
  wire             cpu_data_master_qualified_request_high_res_timer_s1;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_lcd_control_slave;
  wire             cpu_data_master_qualified_request_led_pio_s1;
  wire             cpu_data_master_qualified_request_sgdma_rx_csr;
  wire             cpu_data_master_qualified_request_sgdma_tx_csr;
  wire             cpu_data_master_qualified_request_ssram_avalon_tristate_slave;
  wire             cpu_data_master_qualified_request_sys_clk_timer_s1;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_tse_mac_control_port;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_descriptor_memory_s1;
  wire             cpu_data_master_read_data_valid_ext_flash_s1;
  wire             cpu_data_master_read_data_valid_high_res_timer_s1;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_lcd_control_slave;
  wire             cpu_data_master_read_data_valid_led_pio_s1;
  wire             cpu_data_master_read_data_valid_sgdma_rx_csr;
  wire             cpu_data_master_read_data_valid_sgdma_tx_csr;
  wire             cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  wire             cpu_data_master_read_data_valid_sys_clk_timer_s1;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_tse_mac_control_port;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_descriptor_memory_s1;
  wire             cpu_data_master_requests_ext_flash_s1;
  wire             cpu_data_master_requests_high_res_timer_s1;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_lcd_control_slave;
  wire             cpu_data_master_requests_led_pio_s1;
  wire             cpu_data_master_requests_sgdma_rx_csr;
  wire             cpu_data_master_requests_sgdma_tx_csr;
  wire             cpu_data_master_requests_ssram_avalon_tristate_slave;
  wire             cpu_data_master_requests_sys_clk_timer_s1;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_tse_mac_control_port;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 27: 0] cpu_instruction_master_address;
  wire    [ 27: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_ext_flash_s1;
  wire             cpu_instruction_master_granted_ssram_avalon_tristate_slave;
  wire    [  2: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_ext_flash_s1;
  wire             cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1;
  wire             cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_ext_flash_s1;
  wire             cpu_instruction_master_requests_ssram_avalon_tristate_slave;
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
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_descriptor_memory_s1_end_xfer;
  wire             d1_flash_tristate_bridge_avalon_slave_end_xfer;
  wire             d1_high_res_timer_s1_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_control_slave_end_xfer;
  wire             d1_led_pio_s1_end_xfer;
  wire             d1_sgdma_rx_csr_end_xfer;
  wire             d1_sgdma_tx_csr_end_xfer;
  wire             d1_sys_clk_timer_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_tse_mac_control_port_end_xfer;
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
  wire    [ 25: 0] flash_tristate_bridge_address;
  wire    [ 31: 0] flash_tristate_bridge_data;
  wire    [  2: 0] high_res_timer_s1_address;
  wire             high_res_timer_s1_chipselect;
  wire             high_res_timer_s1_irq;
  wire             high_res_timer_s1_irq_from_sa;
  wire    [ 15: 0] high_res_timer_s1_readdata;
  wire    [ 15: 0] high_res_timer_s1_readdata_from_sa;
  wire             high_res_timer_s1_reset_n;
  wire             high_res_timer_s1_write_n;
  wire    [ 15: 0] high_res_timer_s1_writedata;
  wire    [ 31: 0] incoming_flash_tristate_bridge_data;
  wire    [ 15: 0] incoming_flash_tristate_bridge_data_with_Xs_converted_to_0;
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
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_begintransfer;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  wire             lcd_control_slave_reset_n;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_wait_counter_eq_1;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_chipselect;
  wire    [ 31: 0] led_pio_s1_readdata;
  wire    [ 31: 0] led_pio_s1_readdata_from_sa;
  wire             led_pio_s1_reset_n;
  wire             led_pio_s1_write_n;
  wire    [ 31: 0] led_pio_s1_writedata;
  wire             mdc_from_the_tse_mac;
  wire             mdio_oen_from_the_tse_mac;
  wire             mdio_out_from_the_tse_mac;
  wire             osc_clk_reset_n;
  wire    [  7: 0] out_port_from_the_led_pio;
  wire             read_n_to_the_ext_flash;
  wire             registered_cpu_data_master_read_data_valid_descriptor_memory_s1;
  wire             registered_cpu_data_master_read_data_valid_ext_flash_s1;
  wire             registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave;
  wire             reset_n_sources;
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
  wire    [  1: 0] sgdma_rx_m_write_byteenable_ext_flash_s1;
  wire    [  1: 0] sgdma_rx_m_write_dbs_address;
  wire    [ 15: 0] sgdma_rx_m_write_dbs_write_16;
  wire             sgdma_rx_m_write_granted_ext_flash_s1;
  wire             sgdma_rx_m_write_granted_ssram_avalon_tristate_slave;
  wire             sgdma_rx_m_write_qualified_request_ext_flash_s1;
  wire             sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave;
  wire             sgdma_rx_m_write_requests_ext_flash_s1;
  wire             sgdma_rx_m_write_requests_ssram_avalon_tristate_slave;
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
  wire    [  1: 0] sgdma_tx_m_read_dbs_address;
  wire             sgdma_tx_m_read_granted_ext_flash_s1;
  wire             sgdma_tx_m_read_granted_ssram_avalon_tristate_slave;
  wire    [  2: 0] sgdma_tx_m_read_latency_counter;
  wire             sgdma_tx_m_read_qualified_request_ext_flash_s1;
  wire             sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave;
  wire             sgdma_tx_m_read_read;
  wire             sgdma_tx_m_read_read_data_valid_ext_flash_s1;
  wire             sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave;
  wire    [ 31: 0] sgdma_tx_m_read_readdata;
  wire             sgdma_tx_m_read_readdatavalid;
  wire             sgdma_tx_m_read_requests_ext_flash_s1;
  wire             sgdma_tx_m_read_requests_ssram_avalon_tristate_slave;
  wire             sgdma_tx_m_read_waitrequest;
  wire    [ 31: 0] sgdma_tx_out_data;
  wire    [  1: 0] sgdma_tx_out_empty;
  wire             sgdma_tx_out_endofpacket;
  wire             sgdma_tx_out_error;
  wire             sgdma_tx_out_ready;
  wire             sgdma_tx_out_startofpacket;
  wire             sgdma_tx_out_valid;
  wire             ssram_avalon_tristate_slave_wait_counter_eq_0;
  wire             ssram_avalon_tristate_slave_wait_counter_eq_1;
  wire    [  3: 0] ssram_bwn_to_the_ssram;
  wire             ssram_cen_to_the_ssram;
  wire             ssram_oen_to_the_ssram;
  wire             ssram_wen_to_the_ssram;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_irq;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_clk_timer_s1_readdata;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  wire             sys_clk_timer_s1_reset_n;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
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
  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (osc_clk),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (osc_clk_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .clk                                                                    (osc_clk),
      .cpu_data_master_address                                                (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                       (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable_ext_flash_s1                                (cpu_data_master_byteenable_ext_flash_s1),
      .cpu_data_master_dbs_address                                            (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                           (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_cpu_jtag_debug_module                          (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_descriptor_memory_s1                           (cpu_data_master_granted_descriptor_memory_s1),
      .cpu_data_master_granted_ext_flash_s1                                   (cpu_data_master_granted_ext_flash_s1),
      .cpu_data_master_granted_high_res_timer_s1                              (cpu_data_master_granted_high_res_timer_s1),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                    (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_lcd_control_slave                              (cpu_data_master_granted_lcd_control_slave),
      .cpu_data_master_granted_led_pio_s1                                     (cpu_data_master_granted_led_pio_s1),
      .cpu_data_master_granted_sgdma_rx_csr                                   (cpu_data_master_granted_sgdma_rx_csr),
      .cpu_data_master_granted_sgdma_tx_csr                                   (cpu_data_master_granted_sgdma_tx_csr),
      .cpu_data_master_granted_ssram_avalon_tristate_slave                    (cpu_data_master_granted_ssram_avalon_tristate_slave),
      .cpu_data_master_granted_sys_clk_timer_s1                               (cpu_data_master_granted_sys_clk_timer_s1),
      .cpu_data_master_granted_sysid_control_slave                            (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_tse_mac_control_port                           (cpu_data_master_granted_tse_mac_control_port),
      .cpu_data_master_irq                                                    (cpu_data_master_irq),
      .cpu_data_master_no_byte_enables_and_last_term                          (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_descriptor_memory_s1                 (cpu_data_master_qualified_request_descriptor_memory_s1),
      .cpu_data_master_qualified_request_ext_flash_s1                         (cpu_data_master_qualified_request_ext_flash_s1),
      .cpu_data_master_qualified_request_high_res_timer_s1                    (cpu_data_master_qualified_request_high_res_timer_s1),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave          (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_lcd_control_slave                    (cpu_data_master_qualified_request_lcd_control_slave),
      .cpu_data_master_qualified_request_led_pio_s1                           (cpu_data_master_qualified_request_led_pio_s1),
      .cpu_data_master_qualified_request_sgdma_rx_csr                         (cpu_data_master_qualified_request_sgdma_rx_csr),
      .cpu_data_master_qualified_request_sgdma_tx_csr                         (cpu_data_master_qualified_request_sgdma_tx_csr),
      .cpu_data_master_qualified_request_ssram_avalon_tristate_slave          (cpu_data_master_qualified_request_ssram_avalon_tristate_slave),
      .cpu_data_master_qualified_request_sys_clk_timer_s1                     (cpu_data_master_qualified_request_sys_clk_timer_s1),
      .cpu_data_master_qualified_request_sysid_control_slave                  (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_tse_mac_control_port                 (cpu_data_master_qualified_request_tse_mac_control_port),
      .cpu_data_master_read                                                   (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                  (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_descriptor_memory_s1                   (cpu_data_master_read_data_valid_descriptor_memory_s1),
      .cpu_data_master_read_data_valid_ext_flash_s1                           (cpu_data_master_read_data_valid_ext_flash_s1),
      .cpu_data_master_read_data_valid_high_res_timer_s1                      (cpu_data_master_read_data_valid_high_res_timer_s1),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave            (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_lcd_control_slave                      (cpu_data_master_read_data_valid_lcd_control_slave),
      .cpu_data_master_read_data_valid_led_pio_s1                             (cpu_data_master_read_data_valid_led_pio_s1),
      .cpu_data_master_read_data_valid_sgdma_rx_csr                           (cpu_data_master_read_data_valid_sgdma_rx_csr),
      .cpu_data_master_read_data_valid_sgdma_tx_csr                           (cpu_data_master_read_data_valid_sgdma_tx_csr),
      .cpu_data_master_read_data_valid_ssram_avalon_tristate_slave            (cpu_data_master_read_data_valid_ssram_avalon_tristate_slave),
      .cpu_data_master_read_data_valid_sys_clk_timer_s1                       (cpu_data_master_read_data_valid_sys_clk_timer_s1),
      .cpu_data_master_read_data_valid_sysid_control_slave                    (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_tse_mac_control_port                   (cpu_data_master_read_data_valid_tse_mac_control_port),
      .cpu_data_master_readdata                                               (cpu_data_master_readdata),
      .cpu_data_master_requests_cpu_jtag_debug_module                         (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_descriptor_memory_s1                          (cpu_data_master_requests_descriptor_memory_s1),
      .cpu_data_master_requests_ext_flash_s1                                  (cpu_data_master_requests_ext_flash_s1),
      .cpu_data_master_requests_high_res_timer_s1                             (cpu_data_master_requests_high_res_timer_s1),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                   (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_lcd_control_slave                             (cpu_data_master_requests_lcd_control_slave),
      .cpu_data_master_requests_led_pio_s1                                    (cpu_data_master_requests_led_pio_s1),
      .cpu_data_master_requests_sgdma_rx_csr                                  (cpu_data_master_requests_sgdma_rx_csr),
      .cpu_data_master_requests_sgdma_tx_csr                                  (cpu_data_master_requests_sgdma_tx_csr),
      .cpu_data_master_requests_ssram_avalon_tristate_slave                   (cpu_data_master_requests_ssram_avalon_tristate_slave),
      .cpu_data_master_requests_sys_clk_timer_s1                              (cpu_data_master_requests_sys_clk_timer_s1),
      .cpu_data_master_requests_sysid_control_slave                           (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_tse_mac_control_port                          (cpu_data_master_requests_tse_mac_control_port),
      .cpu_data_master_waitrequest                                            (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                  (cpu_data_master_write),
      .cpu_data_master_writedata                                              (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                 (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                      (d1_cpu_jtag_debug_module_end_xfer),
      .d1_descriptor_memory_s1_end_xfer                                       (d1_descriptor_memory_s1_end_xfer),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                         (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .d1_high_res_timer_s1_end_xfer                                          (d1_high_res_timer_s1_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_lcd_control_slave_end_xfer                                          (d1_lcd_control_slave_end_xfer),
      .d1_led_pio_s1_end_xfer                                                 (d1_led_pio_s1_end_xfer),
      .d1_sgdma_rx_csr_end_xfer                                               (d1_sgdma_rx_csr_end_xfer),
      .d1_sgdma_tx_csr_end_xfer                                               (d1_sgdma_tx_csr_end_xfer),
      .d1_sys_clk_timer_s1_end_xfer                                           (d1_sys_clk_timer_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                        (d1_sysid_control_slave_end_xfer),
      .d1_tse_mac_control_port_end_xfer                                       (d1_tse_mac_control_port_end_xfer),
      .descriptor_memory_s1_readdata_from_sa                                  (descriptor_memory_s1_readdata_from_sa),
      .ext_flash_s1_wait_counter_eq_0                                         (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                         (ext_flash_s1_wait_counter_eq_1),
      .high_res_timer_s1_irq_from_sa                                          (high_res_timer_s1_irq_from_sa),
      .high_res_timer_s1_readdata_from_sa                                     (high_res_timer_s1_readdata_from_sa),
      .incoming_flash_tristate_bridge_data                                    (incoming_flash_tristate_bridge_data),
      .incoming_flash_tristate_bridge_data_with_Xs_converted_to_0             (incoming_flash_tristate_bridge_data_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                           (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                        (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .lcd_control_slave_readdata_from_sa                                     (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_wait_counter_eq_0                                    (lcd_control_slave_wait_counter_eq_0),
      .lcd_control_slave_wait_counter_eq_1                                    (lcd_control_slave_wait_counter_eq_1),
      .led_pio_s1_readdata_from_sa                                            (led_pio_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_descriptor_memory_s1        (registered_cpu_data_master_read_data_valid_descriptor_memory_s1),
      .registered_cpu_data_master_read_data_valid_ext_flash_s1                (registered_cpu_data_master_read_data_valid_ext_flash_s1),
      .registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave (registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave),
      .reset_n                                                                (osc_clk_reset_n),
      .sgdma_rx_csr_irq_from_sa                                               (sgdma_rx_csr_irq_from_sa),
      .sgdma_rx_csr_readdata_from_sa                                          (sgdma_rx_csr_readdata_from_sa),
      .sgdma_tx_csr_irq_from_sa                                               (sgdma_tx_csr_irq_from_sa),
      .sgdma_tx_csr_readdata_from_sa                                          (sgdma_tx_csr_readdata_from_sa),
      .ssram_avalon_tristate_slave_wait_counter_eq_0                          (ssram_avalon_tristate_slave_wait_counter_eq_0),
      .ssram_avalon_tristate_slave_wait_counter_eq_1                          (ssram_avalon_tristate_slave_wait_counter_eq_1),
      .sys_clk_timer_s1_irq_from_sa                                           (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata_from_sa                                      (sys_clk_timer_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                   (sysid_control_slave_readdata_from_sa),
      .tse_mac_control_port_readdata_from_sa                                  (tse_mac_control_port_readdata_from_sa),
      .tse_mac_control_port_waitrequest_from_sa                               (tse_mac_control_port_waitrequest_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                                  (osc_clk),
      .cpu_instruction_master_address                                       (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                   (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                 (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_ext_flash_s1                          (cpu_instruction_master_granted_ext_flash_s1),
      .cpu_instruction_master_granted_ssram_avalon_tristate_slave           (cpu_instruction_master_granted_ssram_avalon_tristate_slave),
      .cpu_instruction_master_latency_counter                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module       (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_ext_flash_s1                (cpu_instruction_master_qualified_request_ext_flash_s1),
      .cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave (cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave),
      .cpu_instruction_master_read                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module         (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_ext_flash_s1                  (cpu_instruction_master_read_data_valid_ext_flash_s1),
      .cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave   (cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave),
      .cpu_instruction_master_readdata                                      (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                                 (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_ext_flash_s1                         (cpu_instruction_master_requests_ext_flash_s1),
      .cpu_instruction_master_requests_ssram_avalon_tristate_slave          (cpu_instruction_master_requests_ssram_avalon_tristate_slave),
      .cpu_instruction_master_waitrequest                                   (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                               (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                    (d1_cpu_jtag_debug_module_end_xfer),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                       (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                       (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                       (ext_flash_s1_wait_counter_eq_1),
      .incoming_flash_tristate_bridge_data                                  (incoming_flash_tristate_bridge_data),
      .reset_n                                                              (osc_clk_reset_n),
      .ssram_avalon_tristate_slave_wait_counter_eq_0                        (ssram_avalon_tristate_slave_wait_counter_eq_0),
      .ssram_avalon_tristate_slave_wait_counter_eq_1                        (ssram_avalon_tristate_slave_wait_counter_eq_1)
    );

  cpu the_cpu
    (
      .clk                                   (osc_clk),
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

  descriptor_memory_s1_arbitrator the_descriptor_memory_s1
    (
      .clk                                                              (osc_clk),
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
      .reset_n                                                          (osc_clk_reset_n),
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
      .clk        (osc_clk),
      .clken      (descriptor_memory_s1_clken),
      .readdata   (descriptor_memory_s1_readdata),
      .reset      (descriptor_memory_s1_reset),
      .write      (descriptor_memory_s1_write),
      .writedata  (descriptor_memory_s1_writedata)
    );

  flash_tristate_bridge_avalon_slave_arbitrator the_flash_tristate_bridge_avalon_slave
    (
      .clk                                                                    (osc_clk),
      .cpu_data_master_address_to_slave                                       (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                             (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_ext_flash_s1                                (cpu_data_master_byteenable_ext_flash_s1),
      .cpu_data_master_dbs_address                                            (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                           (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_ext_flash_s1                                   (cpu_data_master_granted_ext_flash_s1),
      .cpu_data_master_granted_ssram_avalon_tristate_slave                    (cpu_data_master_granted_ssram_avalon_tristate_slave),
      .cpu_data_master_no_byte_enables_and_last_term                          (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_ext_flash_s1                         (cpu_data_master_qualified_request_ext_flash_s1),
      .cpu_data_master_qualified_request_ssram_avalon_tristate_slave          (cpu_data_master_qualified_request_ssram_avalon_tristate_slave),
      .cpu_data_master_read                                                   (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ext_flash_s1                           (cpu_data_master_read_data_valid_ext_flash_s1),
      .cpu_data_master_read_data_valid_ssram_avalon_tristate_slave            (cpu_data_master_read_data_valid_ssram_avalon_tristate_slave),
      .cpu_data_master_requests_ext_flash_s1                                  (cpu_data_master_requests_ext_flash_s1),
      .cpu_data_master_requests_ssram_avalon_tristate_slave                   (cpu_data_master_requests_ssram_avalon_tristate_slave),
      .cpu_data_master_write                                                  (cpu_data_master_write),
      .cpu_data_master_writedata                                              (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                     (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_ext_flash_s1                            (cpu_instruction_master_granted_ext_flash_s1),
      .cpu_instruction_master_granted_ssram_avalon_tristate_slave             (cpu_instruction_master_granted_ssram_avalon_tristate_slave),
      .cpu_instruction_master_latency_counter                                 (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_ext_flash_s1                  (cpu_instruction_master_qualified_request_ext_flash_s1),
      .cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave   (cpu_instruction_master_qualified_request_ssram_avalon_tristate_slave),
      .cpu_instruction_master_read                                            (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_ext_flash_s1                    (cpu_instruction_master_read_data_valid_ext_flash_s1),
      .cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave     (cpu_instruction_master_read_data_valid_ssram_avalon_tristate_slave),
      .cpu_instruction_master_requests_ext_flash_s1                           (cpu_instruction_master_requests_ext_flash_s1),
      .cpu_instruction_master_requests_ssram_avalon_tristate_slave            (cpu_instruction_master_requests_ssram_avalon_tristate_slave),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                         (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                         (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                         (ext_flash_s1_wait_counter_eq_1),
      .flash_tristate_bridge_address                                          (flash_tristate_bridge_address),
      .flash_tristate_bridge_data                                             (flash_tristate_bridge_data),
      .incoming_flash_tristate_bridge_data                                    (incoming_flash_tristate_bridge_data),
      .incoming_flash_tristate_bridge_data_with_Xs_converted_to_0             (incoming_flash_tristate_bridge_data_with_Xs_converted_to_0),
      .read_n_to_the_ext_flash                                                (read_n_to_the_ext_flash),
      .registered_cpu_data_master_read_data_valid_ext_flash_s1                (registered_cpu_data_master_read_data_valid_ext_flash_s1),
      .registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave (registered_cpu_data_master_read_data_valid_ssram_avalon_tristate_slave),
      .reset_n                                                                (osc_clk_reset_n),
      .select_n_to_the_ext_flash                                              (select_n_to_the_ext_flash),
      .sgdma_rx_m_write_address_to_slave                                      (sgdma_rx_m_write_address_to_slave),
      .sgdma_rx_m_write_byteenable                                            (sgdma_rx_m_write_byteenable),
      .sgdma_rx_m_write_byteenable_ext_flash_s1                               (sgdma_rx_m_write_byteenable_ext_flash_s1),
      .sgdma_rx_m_write_dbs_address                                           (sgdma_rx_m_write_dbs_address),
      .sgdma_rx_m_write_dbs_write_16                                          (sgdma_rx_m_write_dbs_write_16),
      .sgdma_rx_m_write_granted_ext_flash_s1                                  (sgdma_rx_m_write_granted_ext_flash_s1),
      .sgdma_rx_m_write_granted_ssram_avalon_tristate_slave                   (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave),
      .sgdma_rx_m_write_qualified_request_ext_flash_s1                        (sgdma_rx_m_write_qualified_request_ext_flash_s1),
      .sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave         (sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave),
      .sgdma_rx_m_write_requests_ext_flash_s1                                 (sgdma_rx_m_write_requests_ext_flash_s1),
      .sgdma_rx_m_write_requests_ssram_avalon_tristate_slave                  (sgdma_rx_m_write_requests_ssram_avalon_tristate_slave),
      .sgdma_rx_m_write_write                                                 (sgdma_rx_m_write_write),
      .sgdma_rx_m_write_writedata                                             (sgdma_rx_m_write_writedata),
      .sgdma_tx_m_read_address_to_slave                                       (sgdma_tx_m_read_address_to_slave),
      .sgdma_tx_m_read_dbs_address                                            (sgdma_tx_m_read_dbs_address),
      .sgdma_tx_m_read_granted_ext_flash_s1                                   (sgdma_tx_m_read_granted_ext_flash_s1),
      .sgdma_tx_m_read_granted_ssram_avalon_tristate_slave                    (sgdma_tx_m_read_granted_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_latency_counter                                        (sgdma_tx_m_read_latency_counter),
      .sgdma_tx_m_read_qualified_request_ext_flash_s1                         (sgdma_tx_m_read_qualified_request_ext_flash_s1),
      .sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave          (sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_read                                                   (sgdma_tx_m_read_read),
      .sgdma_tx_m_read_read_data_valid_ext_flash_s1                           (sgdma_tx_m_read_read_data_valid_ext_flash_s1),
      .sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave            (sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_requests_ext_flash_s1                                  (sgdma_tx_m_read_requests_ext_flash_s1),
      .sgdma_tx_m_read_requests_ssram_avalon_tristate_slave                   (sgdma_tx_m_read_requests_ssram_avalon_tristate_slave),
      .ssram_avalon_tristate_slave_wait_counter_eq_0                          (ssram_avalon_tristate_slave_wait_counter_eq_0),
      .ssram_avalon_tristate_slave_wait_counter_eq_1                          (ssram_avalon_tristate_slave_wait_counter_eq_1),
      .ssram_bwn_to_the_ssram                                                 (ssram_bwn_to_the_ssram),
      .ssram_cen_to_the_ssram                                                 (ssram_cen_to_the_ssram),
      .ssram_oen_to_the_ssram                                                 (ssram_oen_to_the_ssram),
      .ssram_wen_to_the_ssram                                                 (ssram_wen_to_the_ssram),
      .write_n_to_the_ext_flash                                               (write_n_to_the_ext_flash)
    );

  high_res_timer_s1_arbitrator the_high_res_timer_s1
    (
      .clk                                                 (osc_clk),
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
      .reset_n                                             (osc_clk_reset_n)
    );

  high_res_timer the_high_res_timer
    (
      .address    (high_res_timer_s1_address),
      .chipselect (high_res_timer_s1_chipselect),
      .clk        (osc_clk),
      .irq        (high_res_timer_s1_irq),
      .readdata   (high_res_timer_s1_readdata),
      .reset_n    (high_res_timer_s1_reset_n),
      .write_n    (high_res_timer_s1_write_n),
      .writedata  (high_res_timer_s1_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (osc_clk),
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
      .reset_n                                                       (osc_clk_reset_n)
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
      .clk            (osc_clk),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  lcd_control_slave_arbitrator the_lcd_control_slave
    (
      .clk                                                 (osc_clk),
      .cpu_data_master_address_to_slave                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_lcd_control_slave           (cpu_data_master_granted_lcd_control_slave),
      .cpu_data_master_qualified_request_lcd_control_slave (cpu_data_master_qualified_request_lcd_control_slave),
      .cpu_data_master_read                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_lcd_control_slave   (cpu_data_master_read_data_valid_lcd_control_slave),
      .cpu_data_master_requests_lcd_control_slave          (cpu_data_master_requests_lcd_control_slave),
      .cpu_data_master_write                               (cpu_data_master_write),
      .cpu_data_master_writedata                           (cpu_data_master_writedata),
      .d1_lcd_control_slave_end_xfer                       (d1_lcd_control_slave_end_xfer),
      .lcd_control_slave_address                           (lcd_control_slave_address),
      .lcd_control_slave_begintransfer                     (lcd_control_slave_begintransfer),
      .lcd_control_slave_read                              (lcd_control_slave_read),
      .lcd_control_slave_readdata                          (lcd_control_slave_readdata),
      .lcd_control_slave_readdata_from_sa                  (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_reset_n                           (lcd_control_slave_reset_n),
      .lcd_control_slave_wait_counter_eq_0                 (lcd_control_slave_wait_counter_eq_0),
      .lcd_control_slave_wait_counter_eq_1                 (lcd_control_slave_wait_counter_eq_1),
      .lcd_control_slave_write                             (lcd_control_slave_write),
      .lcd_control_slave_writedata                         (lcd_control_slave_writedata),
      .reset_n                                             (osc_clk_reset_n)
    );

  lcd the_lcd
    (
      .LCD_E         (LCD_E_from_the_lcd),
      .LCD_RS        (LCD_RS_from_the_lcd),
      .LCD_RW        (LCD_RW_from_the_lcd),
      .LCD_data      (LCD_data_to_and_from_the_lcd),
      .address       (lcd_control_slave_address),
      .begintransfer (lcd_control_slave_begintransfer),
      .clk           (osc_clk),
      .read          (lcd_control_slave_read),
      .readdata      (lcd_control_slave_readdata),
      .reset_n       (lcd_control_slave_reset_n),
      .write         (lcd_control_slave_write),
      .writedata     (lcd_control_slave_writedata)
    );

  led_pio_s1_arbitrator the_led_pio_s1
    (
      .clk                                          (osc_clk),
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
      .reset_n                                      (osc_clk_reset_n)
    );

  led_pio the_led_pio
    (
      .address    (led_pio_s1_address),
      .chipselect (led_pio_s1_chipselect),
      .clk        (osc_clk),
      .out_port   (out_port_from_the_led_pio),
      .readdata   (led_pio_s1_readdata),
      .reset_n    (led_pio_s1_reset_n),
      .write_n    (led_pio_s1_write_n),
      .writedata  (led_pio_s1_writedata)
    );

  sgdma_rx_csr_arbitrator the_sgdma_rx_csr
    (
      .clk                                            (osc_clk),
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
      .reset_n                                        (osc_clk_reset_n),
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
      .clk                           (osc_clk),
      .reset_n                       (osc_clk_reset_n),
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
      .clk                                                             (osc_clk),
      .d1_descriptor_memory_s1_end_xfer                                (d1_descriptor_memory_s1_end_xfer),
      .descriptor_memory_s1_readdata_from_sa                           (descriptor_memory_s1_readdata_from_sa),
      .reset_n                                                         (osc_clk_reset_n),
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
      .clk                                                              (osc_clk),
      .d1_descriptor_memory_s1_end_xfer                                 (d1_descriptor_memory_s1_end_xfer),
      .reset_n                                                          (osc_clk_reset_n),
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
      .clk                                                            (osc_clk),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                 (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                 (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                 (ext_flash_s1_wait_counter_eq_1),
      .reset_n                                                        (osc_clk_reset_n),
      .sgdma_rx_m_write_address                                       (sgdma_rx_m_write_address),
      .sgdma_rx_m_write_address_to_slave                              (sgdma_rx_m_write_address_to_slave),
      .sgdma_rx_m_write_byteenable                                    (sgdma_rx_m_write_byteenable),
      .sgdma_rx_m_write_byteenable_ext_flash_s1                       (sgdma_rx_m_write_byteenable_ext_flash_s1),
      .sgdma_rx_m_write_dbs_address                                   (sgdma_rx_m_write_dbs_address),
      .sgdma_rx_m_write_dbs_write_16                                  (sgdma_rx_m_write_dbs_write_16),
      .sgdma_rx_m_write_granted_ext_flash_s1                          (sgdma_rx_m_write_granted_ext_flash_s1),
      .sgdma_rx_m_write_granted_ssram_avalon_tristate_slave           (sgdma_rx_m_write_granted_ssram_avalon_tristate_slave),
      .sgdma_rx_m_write_qualified_request_ext_flash_s1                (sgdma_rx_m_write_qualified_request_ext_flash_s1),
      .sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave (sgdma_rx_m_write_qualified_request_ssram_avalon_tristate_slave),
      .sgdma_rx_m_write_requests_ext_flash_s1                         (sgdma_rx_m_write_requests_ext_flash_s1),
      .sgdma_rx_m_write_requests_ssram_avalon_tristate_slave          (sgdma_rx_m_write_requests_ssram_avalon_tristate_slave),
      .sgdma_rx_m_write_waitrequest                                   (sgdma_rx_m_write_waitrequest),
      .sgdma_rx_m_write_write                                         (sgdma_rx_m_write_write),
      .sgdma_rx_m_write_writedata                                     (sgdma_rx_m_write_writedata),
      .ssram_avalon_tristate_slave_wait_counter_eq_0                  (ssram_avalon_tristate_slave_wait_counter_eq_0),
      .ssram_avalon_tristate_slave_wait_counter_eq_1                  (ssram_avalon_tristate_slave_wait_counter_eq_1)
    );

  sgdma_rx the_sgdma_rx
    (
      .clk                           (osc_clk),
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
      .clk                                            (osc_clk),
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
      .reset_n                                        (osc_clk_reset_n),
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
      .clk                                                             (osc_clk),
      .d1_descriptor_memory_s1_end_xfer                                (d1_descriptor_memory_s1_end_xfer),
      .descriptor_memory_s1_readdata_from_sa                           (descriptor_memory_s1_readdata_from_sa),
      .reset_n                                                         (osc_clk_reset_n),
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
      .clk                                                              (osc_clk),
      .d1_descriptor_memory_s1_end_xfer                                 (d1_descriptor_memory_s1_end_xfer),
      .reset_n                                                          (osc_clk_reset_n),
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
      .clk                                                           (osc_clk),
      .d1_flash_tristate_bridge_avalon_slave_end_xfer                (d1_flash_tristate_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                (ext_flash_s1_wait_counter_eq_1),
      .incoming_flash_tristate_bridge_data                           (incoming_flash_tristate_bridge_data),
      .incoming_flash_tristate_bridge_data_with_Xs_converted_to_0    (incoming_flash_tristate_bridge_data_with_Xs_converted_to_0),
      .reset_n                                                       (osc_clk_reset_n),
      .sgdma_tx_m_read_address                                       (sgdma_tx_m_read_address),
      .sgdma_tx_m_read_address_to_slave                              (sgdma_tx_m_read_address_to_slave),
      .sgdma_tx_m_read_dbs_address                                   (sgdma_tx_m_read_dbs_address),
      .sgdma_tx_m_read_granted_ext_flash_s1                          (sgdma_tx_m_read_granted_ext_flash_s1),
      .sgdma_tx_m_read_granted_ssram_avalon_tristate_slave           (sgdma_tx_m_read_granted_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_latency_counter                               (sgdma_tx_m_read_latency_counter),
      .sgdma_tx_m_read_qualified_request_ext_flash_s1                (sgdma_tx_m_read_qualified_request_ext_flash_s1),
      .sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave (sgdma_tx_m_read_qualified_request_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_read                                          (sgdma_tx_m_read_read),
      .sgdma_tx_m_read_read_data_valid_ext_flash_s1                  (sgdma_tx_m_read_read_data_valid_ext_flash_s1),
      .sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave   (sgdma_tx_m_read_read_data_valid_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_readdata                                      (sgdma_tx_m_read_readdata),
      .sgdma_tx_m_read_readdatavalid                                 (sgdma_tx_m_read_readdatavalid),
      .sgdma_tx_m_read_requests_ext_flash_s1                         (sgdma_tx_m_read_requests_ext_flash_s1),
      .sgdma_tx_m_read_requests_ssram_avalon_tristate_slave          (sgdma_tx_m_read_requests_ssram_avalon_tristate_slave),
      .sgdma_tx_m_read_waitrequest                                   (sgdma_tx_m_read_waitrequest),
      .ssram_avalon_tristate_slave_wait_counter_eq_0                 (ssram_avalon_tristate_slave_wait_counter_eq_0),
      .ssram_avalon_tristate_slave_wait_counter_eq_1                 (ssram_avalon_tristate_slave_wait_counter_eq_1)
    );

  sgdma_tx_out_arbitrator the_sgdma_tx_out
    (
      .clk                            (osc_clk),
      .reset_n                        (osc_clk_reset_n),
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
      .clk                           (osc_clk),
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
      .clk                                                (osc_clk),
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
      .reset_n                                            (osc_clk_reset_n),
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
      .clk        (osc_clk),
      .irq        (sys_clk_timer_s1_irq),
      .readdata   (sys_clk_timer_s1_readdata),
      .reset_n    (sys_clk_timer_s1_reset_n),
      .write_n    (sys_clk_timer_s1_write_n),
      .writedata  (sys_clk_timer_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (osc_clk),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (osc_clk_reset_n),
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
      .clk                                                    (osc_clk),
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
      .reset_n                                                (osc_clk_reset_n),
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
      .clk                            (osc_clk),
      .reset_n                        (osc_clk_reset_n),
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
      .clk                           (osc_clk),
      .reset_n                       (osc_clk_reset_n),
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
      .clk         (osc_clk),
      .ena_10      (ena_10_from_the_tse_mac),
      .eth_mode    (eth_mode_from_the_tse_mac),
      .ff_rx_clk   (osc_clk),
      .ff_rx_data  (tse_mac_receive_data),
      .ff_rx_dval  (tse_mac_receive_valid),
      .ff_rx_eop   (tse_mac_receive_endofpacket),
      .ff_rx_mod   (tse_mac_receive_empty),
      .ff_rx_rdy   (tse_mac_receive_ready),
      .ff_rx_sop   (tse_mac_receive_startofpacket),
      .ff_tx_clk   (osc_clk),
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
  bup_3c120_fpga_sopc_reset_osc_clk_domain_synch_module bup_3c120_fpga_sopc_reset_osc_clk_domain_synch
    (
      .clk      (osc_clk),
      .data_in  (1'b1),
      .data_out (osc_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa);

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

`include "/tools/acdskit/11.1/171/linux64/quartus/eda/sim_lib/altera_mf.v"
`include "/tools/acdskit/11.1/171/linux64/quartus/eda/sim_lib/220model.v"
`include "/tools/acdskit/11.1/171/linux64/quartus/eda/sim_lib/sgate.v"
`include "/tools/acdskit/11.1/171/linux64/quartus/eda/sim_lib/stratixiigx_hssi_atoms.v"
`include "/tools/acdskit/11.1/171/linux64/quartus/eda/sim_lib/stratixiv_hssi_atoms.v"
`include "tse_mac.vo"
`include "tse_mac_loopback.v"
`include "descriptor_memory.v"
`include "sgdma_rx.v"
`include "sys_clk_timer.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sysid.v"
`include "sgdma_tx.v"
`include "high_res_timer.v"
`include "jtag_uart.v"
`include "led_pio.v"
`include "lcd.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire             clk;
  wire             ena_10_from_the_tse_mac;
  wire             eth_mode_from_the_tse_mac;
  wire    [ 25: 0] flash_tristate_bridge_address;
  wire    [ 31: 0] flash_tristate_bridge_data;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             mdc_from_the_tse_mac;
  wire             mdio_in_to_the_tse_mac;
  wire             mdio_oen_from_the_tse_mac;
  wire             mdio_out_from_the_tse_mac;
  reg              osc_clk;
  wire    [  7: 0] out_port_from_the_led_pio;
  wire             read_n_to_the_ext_flash;
  reg              reset_n;
  wire    [  3: 0] rgmii_in_to_the_tse_mac;
  wire    [  3: 0] rgmii_out_from_the_tse_mac;
  wire             rx_clk_to_the_tse_mac;
  wire             rx_control_to_the_tse_mac;
  wire             select_n_to_the_ext_flash;
  wire             set_1000_to_the_tse_mac;
  wire             set_10_to_the_tse_mac;
  wire    [  3: 0] ssram_bwn_to_the_ssram;
  wire             ssram_cen_to_the_ssram;
  wire             ssram_oen_to_the_ssram;
  wire             ssram_wen_to_the_ssram;
  wire             sysid_control_slave_clock;
  wire             tx_clk_to_the_tse_mac;
  wire             tx_control_from_the_tse_mac;
  wire             write_n_to_the_ext_flash;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  bup_3c120_fpga_sopc DUT
    (
      .LCD_E_from_the_lcd            (LCD_E_from_the_lcd),
      .LCD_RS_from_the_lcd           (LCD_RS_from_the_lcd),
      .LCD_RW_from_the_lcd           (LCD_RW_from_the_lcd),
      .LCD_data_to_and_from_the_lcd  (LCD_data_to_and_from_the_lcd),
      .ena_10_from_the_tse_mac       (ena_10_from_the_tse_mac),
      .eth_mode_from_the_tse_mac     (eth_mode_from_the_tse_mac),
      .flash_tristate_bridge_address (flash_tristate_bridge_address),
      .flash_tristate_bridge_data    (flash_tristate_bridge_data),
      .mdc_from_the_tse_mac          (mdc_from_the_tse_mac),
      .mdio_in_to_the_tse_mac        (mdio_in_to_the_tse_mac),
      .mdio_oen_from_the_tse_mac     (mdio_oen_from_the_tse_mac),
      .mdio_out_from_the_tse_mac     (mdio_out_from_the_tse_mac),
      .osc_clk                       (osc_clk),
      .out_port_from_the_led_pio     (out_port_from_the_led_pio),
      .read_n_to_the_ext_flash       (read_n_to_the_ext_flash),
      .reset_n                       (reset_n),
      .rgmii_in_to_the_tse_mac       (rgmii_in_to_the_tse_mac),
      .rgmii_out_from_the_tse_mac    (rgmii_out_from_the_tse_mac),
      .rx_clk_to_the_tse_mac         (rx_clk_to_the_tse_mac),
      .rx_control_to_the_tse_mac     (rx_control_to_the_tse_mac),
      .select_n_to_the_ext_flash     (select_n_to_the_ext_flash),
      .set_1000_to_the_tse_mac       (set_1000_to_the_tse_mac),
      .set_10_to_the_tse_mac         (set_10_to_the_tse_mac),
      .ssram_bwn_to_the_ssram        (ssram_bwn_to_the_ssram),
      .ssram_cen_to_the_ssram        (ssram_cen_to_the_ssram),
      .ssram_oen_to_the_ssram        (ssram_oen_to_the_ssram),
      .ssram_wen_to_the_ssram        (ssram_wen_to_the_ssram),
      .tx_clk_to_the_tse_mac         (tx_clk_to_the_tse_mac),
      .tx_control_from_the_tse_mac   (tx_control_from_the_tse_mac),
      .write_n_to_the_ext_flash      (write_n_to_the_ext_flash)
    );

  ext_flash the_ext_flash
    (
      .address  (flash_tristate_bridge_address[25 : 1]),
      .data     (flash_tristate_bridge_data),
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
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on