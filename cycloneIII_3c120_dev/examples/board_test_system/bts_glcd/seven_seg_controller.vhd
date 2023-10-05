-- seven_seg_controller.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity seven_seg_controller is
	port (
		nios_s_data_in      : in  std_logic_vector(31 downto 0) := (others => '0'); --   avalon_slave_0.writedata
		nios_s_data_out     : out std_logic_vector(31 downto 0);                    --                 .readdata
		nios_s_address      : in  std_logic_vector(2 downto 0)  := (others => '0'); --                 .address
		nios_s_chipselect_n : in  std_logic                     := '0';             --                 .chipselect_n
		nios_s_write_n      : in  std_logic                     := '0';             --                 .write_n
		nios_s_read_n       : in  std_logic                     := '0';             --                 .read_n
		nios_clk            : in  std_logic                     := '0';             --       clock_sink.clk
		nios_reset_n        : in  std_logic                     := '0';             -- clock_sink_reset.reset_n
		ss_data             : out std_logic_vector(6 downto 0);                     --      conduit_end.export
		ss_sel              : out std_logic_vector(3 downto 0)                      --                 .export
	);
end entity seven_seg_controller;

architecture rtl of seven_seg_controller is
	component sseg_controller is
		port (
			nios_s_data_in      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			nios_s_data_out     : out std_logic_vector(31 downto 0);                    -- readdata
			nios_s_address      : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			nios_s_chipselect_n : in  std_logic                     := 'X';             -- chipselect_n
			nios_s_write_n      : in  std_logic                     := 'X';             -- write_n
			nios_s_read_n       : in  std_logic                     := 'X';             -- read_n
			nios_clk            : in  std_logic                     := 'X';             -- clk
			nios_reset_n        : in  std_logic                     := 'X';             -- reset_n
			ss_data             : out std_logic_vector(6 downto 0);                     -- export
			ss_sel              : out std_logic_vector(3 downto 0)                      -- export
		);
	end component sseg_controller;

begin

	seven_seg_controller : component sseg_controller
		port map (
			nios_s_data_in      => nios_s_data_in,      --   avalon_slave_0.writedata
			nios_s_data_out     => nios_s_data_out,     --                 .readdata
			nios_s_address      => nios_s_address,      --                 .address
			nios_s_chipselect_n => nios_s_chipselect_n, --                 .chipselect_n
			nios_s_write_n      => nios_s_write_n,      --                 .write_n
			nios_s_read_n       => nios_s_read_n,       --                 .read_n
			nios_clk            => nios_clk,            --       clock_sink.clk
			nios_reset_n        => nios_reset_n,        -- clock_sink_reset.reset_n
			ss_data             => ss_data,             --      conduit_end.export
			ss_sel              => ss_sel               --                 .export
		);

end architecture rtl; -- of seven_seg_controller
