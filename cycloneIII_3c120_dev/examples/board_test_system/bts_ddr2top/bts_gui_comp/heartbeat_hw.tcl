# TCL File Generated by Component Editor 9.0
# Tue Apr 14 20:57:08 PDT 2009
# DO NOT MODIFY


# +-----------------------------------
# | 
# | heartbeat "heartbeat" v1.0
# | null 2009.04.14.20:57:08
# | 
# | 
# | D:/cvs_sandbox/boards/stratix4/stratix4_gx_pcie/pld/ddr3/ddr3_nios_bts/heartbeat.vhd
# | 
# |    ./heartbeat.vhd syn, sim
# | 
# +-----------------------------------


# +-----------------------------------
# | module heartbeat
# | 
set_module_property NAME heartbeat
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property GROUP ""
set_module_property DISPLAY_NAME heartbeat
set_module_property LIBRARIES {ieee.std_logic_1164.all std.standard.all}
set_module_property TOP_LEVEL_HDL_FILE heartbeat.vhd
set_module_property TOP_LEVEL_HDL_MODULE heartbeat
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file heartbeat.vhd {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point nios
# | 
add_interface nios avalon end
set_interface_property nios addressAlignment DYNAMIC
set_interface_property nios bridgesToMaster ""
set_interface_property nios burstOnBurstBoundariesOnly false
set_interface_property nios holdTime 0
set_interface_property nios isMemoryDevice false
set_interface_property nios isNonVolatileStorage false
set_interface_property nios linewrapBursts false
set_interface_property nios maximumPendingReadTransactions 0
set_interface_property nios printableDevice false
set_interface_property nios readLatency 0
set_interface_property nios readWaitTime 1
set_interface_property nios setupTime 0
set_interface_property nios timingUnits Cycles
set_interface_property nios writeWaitTime 0

set_interface_property nios ASSOCIATED_CLOCK clock_sink
set_interface_property nios ENABLED true

add_interface_port nios nios_address address Input 1
add_interface_port nios nios_chipselect_n chipselect_n Input 1
add_interface_port nios nios_read_n read_n Input 1
add_interface_port nios nios_write_n write_n Input 1
add_interface_port nios nios_writedata writedata Input 32
add_interface_port nios nios_readdata readdata Output 32
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock_sink
# | 
add_interface clock_sink clock end
set_interface_property clock_sink ptfSchematicName ""

set_interface_property clock_sink ENABLED true

add_interface_port clock_sink nios_clk clk Input 1
add_interface_port clock_sink nios_reset_n reset_n Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point interrupt_sender
# | 
add_interface interrupt_sender interrupt end
set_interface_property interrupt_sender associatedAddressablePoint nios

set_interface_property interrupt_sender ASSOCIATED_CLOCK clock_sink
set_interface_property interrupt_sender ENABLED true

add_interface_port interrupt_sender nios_irq irq Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end
# | 
add_interface conduit_end conduit end

set_interface_property conduit_end ENABLED true

add_interface_port conduit_end led export Output 1
# | 
# +-----------------------------------
