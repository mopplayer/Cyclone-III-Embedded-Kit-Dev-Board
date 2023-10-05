-- graphic_lcd_driver.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity graphic_lcd_driver is
	port (
		nios_s_data_in      : in    std_logic_vector(31 downto 0) := (others => '0'); --     avalon_slave_0.writedata
		nios_s_data_out     : out   std_logic_vector(31 downto 0);                    --                   .readdata
		nios_s_address      : in    std_logic_vector(2 downto 0)  := (others => '0'); --                   .address
		nios_s_chipselect_n : in    std_logic                     := '0';             --                   .chipselect_n
		nios_s_write_n      : in    std_logic                     := '0';             --                   .write_n
		nios_s_read_n       : in    std_logic                     := '0';             --                   .read_n
		nios_clk            : in    std_logic                     := '0';             --         clock_sink.clk
		nios_reset_n        : in    std_logic                     := '0';             --   clock_sink_reset.reset_n
		nios_r_data_in      : in    std_logic_vector(31 downto 0) := (others => '0'); -- avalon_read_master.readdata
		nios_r_chipselect_n : out   std_logic;                                        --                   .chipselect_n
		nios_r_read_n       : out   std_logic;                                        --                   .read_n
		nios_r_waitrequest  : in    std_logic                     := '0';             --                   .waitrequest_n
		nios_r_address      : out   std_logic_vector(31 downto 0);                    --                   .address
		lcd_en              : out   std_logic;                                        --        conduit_end.export
		lcd_rstn            : out   std_logic;                                        --                   .export
		lcd_csn             : out   std_logic;                                        --                   .export
		lcd_d_cn            : out   std_logic;                                        --                   .export
		lcd_wen             : out   std_logic;                                        --                   .export
		lcd_e_rdn           : out   std_logic;                                        --                   .export
		lcd_data            : inout std_logic_vector(7 downto 0)  := (others => '0')  --                   .export
	);
end entity graphic_lcd_driver;

architecture rtl of graphic_lcd_driver is
	component lcd_driver is
		port (
			nios_s_data_in      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			nios_s_data_out     : out   std_logic_vector(31 downto 0);                    -- readdata
			nios_s_address      : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			nios_s_chipselect_n : in    std_logic                     := 'X';             -- chipselect_n
			nios_s_write_n      : in    std_logic                     := 'X';             -- write_n
			nios_s_read_n       : in    std_logic                     := 'X';             -- read_n
			nios_clk            : in    std_logic                     := 'X';             -- clk
			nios_reset_n        : in    std_logic                     := 'X';             -- reset_n
			nios_r_data_in      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			nios_r_chipselect_n : out   std_logic;                                        -- chipselect_n
			nios_r_read_n       : out   std_logic;                                        -- read_n
			nios_r_waitrequest  : in    std_logic                     := 'X';             -- waitrequest_n
			nios_r_address      : out   std_logic_vector(31 downto 0);                    -- address
			lcd_en              : out   std_logic;                                        -- export
			lcd_rstn            : out   std_logic;                                        -- export
			lcd_csn             : out   std_logic;                                        -- export
			lcd_d_cn            : out   std_logic;                                        -- export
			lcd_wen             : out   std_logic;                                        -- export
			lcd_e_rdn           : out   std_logic;                                        -- export
			lcd_data            : inout std_logic_vector(7 downto 0)  := (others => 'X')  -- export
		);
	end component lcd_driver;

begin

	graphic_lcd_driver : component lcd_driver
		port map (
			nios_s_data_in      => nios_s_data_in,      --     avalon_slave_0.writedata
			nios_s_data_out     => nios_s_data_out,     --                   .readdata
			nios_s_address      => nios_s_address,      --                   .address
			nios_s_chipselect_n => nios_s_chipselect_n, --                   .chipselect_n
			nios_s_write_n      => nios_s_write_n,      --                   .write_n
			nios_s_read_n       => nios_s_read_n,       --                   .read_n
			nios_clk            => nios_clk,            --         clock_sink.clk
			nios_reset_n        => nios_reset_n,        --   clock_sink_reset.reset_n
			nios_r_data_in      => nios_r_data_in,      -- avalon_read_master.readdata
			nios_r_chipselect_n => nios_r_chipselect_n, --                   .chipselect_n
			nios_r_read_n       => nios_r_read_n,       --                   .read_n
			nios_r_waitrequest  => nios_r_waitrequest,  --                   .waitrequest_n
			nios_r_address      => nios_r_address,      --                   .address
			lcd_en              => lcd_en,              --        conduit_end.export
			lcd_rstn            => lcd_rstn,            --                   .export
			lcd_csn             => lcd_csn,             --                   .export
			lcd_d_cn            => lcd_d_cn,            --                   .export
			lcd_wen             => lcd_wen,             --                   .export
			lcd_e_rdn           => lcd_e_rdn,           --                   .export
			lcd_data            => lcd_data             --                   .export
		);

end architecture rtl; -- of graphic_lcd_driver
