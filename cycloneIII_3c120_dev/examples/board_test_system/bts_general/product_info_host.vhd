-- product_info_host.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity product_info_host is
	port (
		clk          : in  std_logic                     := '0';             --       clock_reset.clk
		reset_n      : in  std_logic                     := '0';             -- clock_reset_reset.reset_n
		chipselect_n : in  std_logic                     := '0';             --    avalon_slave_0.chipselect_n
		read_n       : in  std_logic                     := '0';             --                  .read_n
		av_data_read : out std_logic_vector(31 downto 0);                    --                  .readdata
		av_address   : in  std_logic_vector(1 downto 0)  := (others => '0')  --                  .address
	);
end entity product_info_host;

architecture rtl of product_info_host is
	component product_info is
		port (
			clk          : in  std_logic                     := 'X';             -- clk
			reset_n      : in  std_logic                     := 'X';             -- reset_n
			chipselect_n : in  std_logic                     := 'X';             -- chipselect_n
			read_n       : in  std_logic                     := 'X';             -- read_n
			av_data_read : out std_logic_vector(31 downto 0);                    -- readdata
			av_address   : in  std_logic_vector(1 downto 0)  := (others => 'X')  -- address
		);
	end component product_info;

begin

	product_info_host : component product_info
		port map (
			clk          => clk,          --       clock_reset.clk
			reset_n      => reset_n,      -- clock_reset_reset.reset_n
			chipselect_n => chipselect_n, --    avalon_slave_0.chipselect_n
			read_n       => read_n,       --                  .read_n
			av_data_read => av_data_read, --                  .readdata
			av_address   => av_address    --                  .address
		);

end architecture rtl; -- of product_info_host
