library ieee;
use ieee.std_logic_1164.all;
--use work.seven_seg_utils.all;

entity sseg_controller is
	port(
		nios_clk : in std_logic;
		nios_reset_n : in std_logic;

	-- for slave
		nios_s_address : in std_logic_vector(2 downto 0);
		nios_s_data_in : in std_logic_vector(31 downto 0);
		nios_s_data_out : out std_logic_vector(31 downto 0);
		nios_s_chipselect_n : in std_logic;
		nios_s_write_n : in std_logic;
		nios_s_read_n : in std_logic;
		
		--external seven seg interface
		ss_data: out std_logic_vector(6 downto 0);
		ss_sel: out std_logic_vector(3 downto 0)
		
	);


end sseg_controller;

architecture rtl of sseg_controller is
		constant DSRC_PMON: std_logic := '1';
		constant CLK_DIVIDER: integer := 7531;
		--constant CLK_DIVIDER: integer := 15062;
		--constant CLK_DIVIDER: integer := 30125;
		--constant CLK_DIVIDER: integer := 60_250; -- 25MHz => 42ns * 60250 => 120us
		--constant CLK_DIVIDER: integer := 120500;
		--constant CLK_DIVIDER: integer := 241000;
		--constant CLK_DIVIDER: integer := 482000;
		signal digit_update: integer range 0 to 3 := 0;
		signal ss_data_int : std_logic_vector(6 downto 0);
		signal ss_sel_int : std_logic_vector(3 downto 0);
		signal ctr: integer range 0 to CLK_DIVIDER := 0;

		signal seg_d0: std_logic_vector(3 downto 0);
		signal seg_d1: std_logic_vector(3 downto 0);
		signal seg_d2: std_logic_vector(3 downto 0);
		signal seg_d3: std_logic_vector(3 downto 0);

-----------------------------------------------------------------------------		
		function slv_to_ss(n: std_logic_vector) return std_logic_vector is
			variable ss_data: std_logic_vector(6 downto 0);
			variable tmp_n: std_logic_vector(3 downto 0);

			constant SS_A: std_logic_vector := "0000001";
			constant SS_B: std_logic_vector := "0000010";
			constant SS_C: std_logic_vector := "0000100";
			constant SS_D: std_logic_vector := "0001000";
			constant SS_E: std_logic_vector := "0010000";
			constant SS_F: std_logic_vector := "0100000";
			constant SS_G: std_logic_vector := "1000000";

			constant SS_TOP_H: std_logic_vector := (SS_A);
			constant SS_TOP_L: std_logic_vector := (SS_F);
			constant SS_TOP_R: std_logic_vector := (SS_B);
			constant SS_BTM_L: std_logic_vector := (SS_E);
			constant SS_MID_H: std_logic_vector := (SS_G);
			constant SS_BTM_R: std_logic_vector := (SS_C);
			constant SS_BTM_H: std_logic_vector := (SS_D);			
		begin
			tmp_n := n(3 downto 0);
			
			case tmp_n is
				when x"0" => ss_data := SS_TOP_H or SS_TOP_L or SS_TOP_R or SS_BTM_L or SS_BTM_R or SS_BTM_H;
				when x"1" => ss_data := SS_TOP_R or SS_BTM_R;
				when x"2" => ss_data := SS_TOP_H or SS_TOP_R or SS_MID_H or SS_BTM_L or SS_BTM_H;
				when x"3" => ss_data := SS_TOP_H or SS_TOP_R or SS_MID_H or SS_BTM_R or SS_BTM_H;
				when x"4" => ss_data := SS_TOP_L or SS_TOP_R or SS_MID_H or SS_BTM_R;
				when x"5" => ss_data := SS_TOP_H or SS_TOP_L or SS_MID_H or SS_BTM_R or SS_BTM_H;
				when x"6" => ss_data := SS_TOP_H or SS_TOP_L or SS_MID_H or SS_BTM_L or SS_BTM_R or SS_BTM_H;
				when x"7" => ss_data := SS_TOP_H or SS_TOP_R or SS_BTM_R;
				when x"8" => ss_data := SS_TOP_H or SS_TOP_L or SS_TOP_R or SS_MID_H or SS_BTM_L or SS_BTM_R or SS_BTM_H;
				when x"9" => ss_data := SS_TOP_H or SS_TOP_L or SS_TOP_R or SS_MID_H or SS_BTM_R;
				when x"A" => ss_data := SS_TOP_H or SS_TOP_L or SS_TOP_R or SS_MID_H or SS_BTM_L or SS_BTM_R;
				when x"B" => ss_data := SS_TOP_L or SS_MID_H or SS_BTM_L or SS_BTM_R or SS_BTM_H;
				when x"C" => ss_data := SS_TOP_H or SS_TOP_L or SS_BTM_L or SS_BTM_H;
				when x"D" => ss_data := SS_TOP_R or SS_MID_H or SS_BTM_L or SS_BTM_R or SS_BTM_H;
				when x"E" => ss_data := SS_TOP_H or SS_TOP_L or SS_MID_H or SS_BTM_L or SS_BTM_H;
				when x"F" => ss_data := SS_TOP_H or SS_TOP_L or SS_MID_H or SS_BTM_L;
			end case;
			
			return not(ss_data);
		end slv_to_ss;
-----------------------------------------------------------------------------
		
begin

	--Optional mode display
	process(nios_clk)begin
		if(rising_edge(nios_clk))then
			if(ctr = CLK_DIVIDER)then
				ctr <= 0;
			else
				ctr <= ctr + 1;
			end if;
		end if;
	end process;

	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			seg_d0 <= "0000";
			seg_d1 <= "0000";
			seg_d2 <= "0000";
			seg_d3 <= "0000";
		elsif(nios_clk'event and nios_clk = '1')then
			if(nios_s_chipselect_n = '0')then
				if(nios_s_address = "000")then
					if(nios_s_write_n = '0')then
						seg_d0 <= nios_s_data_in(3 downto 0);
						seg_d1 <= nios_s_data_in(7 downto 4);
						seg_d2 <= nios_s_data_in(11 downto 8);
						seg_d3 <= nios_s_data_in(15 downto 12);
					elsif(nios_s_read_n = '0')then
						nios_s_data_out(3 downto 0) <= seg_d0;
						nios_s_data_out(7 downto 4) <= seg_d1;
						nios_s_data_out(11 downto 8) <= seg_d2;
						nios_s_data_out(15 downto 12) <= seg_d3;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	
	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			ss_data <= (others => '1');
			ss_sel <= "1111";
		elsif(nios_clk'event and nios_clk = '1')then
			if(ctr = CLK_DIVIDER)then
				case digit_update is
				when 0 =>
					ss_data <= slv_to_ss(seg_d0);
					ss_sel <= "0111";
					digit_update <= 1;
				when 1 => 
					ss_data <= slv_to_ss(seg_d1);
					ss_sel <= "1011";
					digit_update <= 2;
				when 2 => 
					ss_data <= slv_to_ss(seg_d2);
					ss_sel <= "1101";
					digit_update <= 3;
				when 3 => 
					ss_data <= slv_to_ss(seg_d3);
					ss_sel <= "1110";
					digit_update <= 0;
				end case;
			end if;
		end if;
	end process;
	
end rtl;

