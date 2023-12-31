library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_UNSIGNED.all;

						
entity product_info is
	port (
		clk: in std_logic;
		reset_n : in std_logic;
		
		chipselect_n : in std_logic; -- chip select signal
		read_n : in std_logic; -- output enable
		av_address : in std_logic_vector(1 downto 0);
		av_data_read : out std_logic_vector(31 downto 0)
		
	);
end product_info;

architecture rtl of product_info is
--	constant sof : std_logic_vector(31 downto 0):=x"4750494F"; -- GPIO project
--	constant sof : std_logic_vector(31 downto 0):=x"56494445"; -- VIDE project
--	constant sof : std_logic_vector(31 downto 0):=x"48534D43"; -- HSMC project
--	constant sof : std_logic_vector(31 downto 0):=x"51445232"; -- QDR2 project
--	constant sof : std_logic_vector(31 downto 0):=x"44445233"; -- DDR3 project

	constant sof : std_logic_vector(31 downto 0):=x"44445232"; 		-- DDR2
	constant board : std_logic_vector(31 downto 0):=x"45504333"; 	-- EPC3
	constant product : std_logic_vector(31 downto 0):=x"30323634"; 	-- 40264
	constant version : std_logic_vector(31 downto 0):=x"00000031"; 	-- version 01


begin

	process(reset_n, clk)begin
		if(reset_n = '0')then
			av_data_read <= (others => '0');
		elsif(clk'event and clk = '1')then
			if(chipselect_n = '0' and read_n = '0')then
				case av_address is
					when "00" => av_data_read <= product;
					when "01" => av_data_read <= board;
					when "10" => av_data_read <= sof;
					when "11" => av_data_read <= version;
				end case;
			end if;
		end if;
	end process;
end rtl;

