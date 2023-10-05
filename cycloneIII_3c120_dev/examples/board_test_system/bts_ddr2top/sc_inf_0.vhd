-- sc_inf_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sc_inf_0 is
	port (
		nios_address      : in  std_logic_vector(7 downto 0)  := (others => '0'); --             nios.address
		nios_chipselect_n : in  std_logic                     := '0';             --                 .chipselect_n
		nios_write_n      : in  std_logic                     := '0';             --                 .write_n
		nios_read_n       : in  std_logic                     := '0';             --                 .read_n
		nios_writedata    : in  std_logic_vector(31 downto 0) := (others => '0'); --                 .writedata
		nios_readdata     : out std_logic_vector(31 downto 0);                    --                 .readdata
		nios_clk          : in  std_logic                     := '0';             --       clock_sink.clk
		nios_reset_n      : in  std_logic                     := '0';             -- clock_sink_reset.reset_n
		nios_irq          : out std_logic                                         -- interrupt_sender.irq
	);
end entity sc_inf_0;

architecture rtl of sc_inf_0 is
	component sc_inf is
		port (
			nios_address      : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			nios_chipselect_n : in  std_logic                     := 'X';             -- chipselect_n
			nios_write_n      : in  std_logic                     := 'X';             -- write_n
			nios_read_n       : in  std_logic                     := 'X';             -- read_n
			nios_writedata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			nios_readdata     : out std_logic_vector(31 downto 0);                    -- readdata
			nios_clk          : in  std_logic                     := 'X';             -- clk
			nios_reset_n      : in  std_logic                     := 'X';             -- reset_n
			nios_irq          : out std_logic                                         -- irq
		);
	end component sc_inf;

begin

	sc_inf_0 : component sc_inf
		port map (
			nios_address      => nios_address,      --             nios.address
			nios_chipselect_n => nios_chipselect_n, --                 .chipselect_n
			nios_write_n      => nios_write_n,      --                 .write_n
			nios_read_n       => nios_read_n,       --                 .read_n
			nios_writedata    => nios_writedata,    --                 .writedata
			nios_readdata     => nios_readdata,     --                 .readdata
			nios_clk          => nios_clk,          --       clock_sink.clk
			nios_reset_n      => nios_reset_n,      -- clock_sink_reset.reset_n
			nios_irq          => nios_irq           -- interrupt_sender.irq
		);

end architecture rtl; -- of sc_inf_0
