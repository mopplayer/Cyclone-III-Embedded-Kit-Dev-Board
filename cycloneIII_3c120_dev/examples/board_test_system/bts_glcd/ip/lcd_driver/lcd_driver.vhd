library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lcd_driver is 
        port (
			nios_clk : in std_logic;
			nios_reset_n : in std_logic;

		-- for slave
			nios_s_address : in std_logic_vector(2 downto 0);
			nios_s_data_in : in std_logic_vector(31 downto 0);
			nios_s_data_out : out std_logic_vector(31 downto 0);
			nios_s_chipselect_n : in std_logic;
			nios_s_write_n : in std_logic;
			nios_s_read_n : in std_logic;

		-- for read master
			nios_r_address : out std_logic_vector(31 downto 0);
			nios_r_data_in : in std_logic_vector(31 downto 0);
			nios_r_chipselect_n : out std_logic;
			nios_r_read_n : out std_logic;
			nios_r_waitrequest : in std_logic;

		-- LCD signals
			lcd_en : out std_logic;
			lcd_rstn : out std_logic;
			lcd_csn : out std_logic;
			lcd_d_cn : out std_logic;
			lcd_wen : out std_logic;
			lcd_e_rdn : out std_logic;
			lcd_data : inout std_logic_vector(7 downto 0)
		);
end entity lcd_driver;


architecture rtl of lcd_driver is

	signal reg_0, cont_reg : std_logic_vector(31 downto 0);
	signal dma_data_in : std_logic_vector(31 downto 0); -- data from onchipmemory
	signal dma_w_data : std_logic_vector(7 downto 0); -- data to LCD
	signal read_address : std_logic_vector(31 downto 0);
	signal write_address : std_logic;
	signal read_cnt, write_cnt : integer range 0 to 15;
	signal output_start, input_start : std_logic;
	signal page : std_logic_vector(2 downto 0);
	signal dma_done, dma_w_done : std_logic;
	
	type STATE is (STATE_INI, STATE_end_INI, STATE0, STATE1, STATE2, STATE_IDL);
	signal IS_STATE : STATE;
	signal go, go_int1, go_int2 : std_logic;

	type STATE_page is (set_page, set_IDL1, set_line_u, set_IDL2, set_line_l, get4bytes, IDL1, put1, IDL2, put2, IDL3, put3, IDL4, put4, stm_IDL);
	signal stm : STATE_page;

	type STATE_cont is (cnt_state1, cnt_IDL1, cnt_IDL);
	signal stm_cnt : STATE_cont;
	
	signal address_counter : std_logic_vector(31 downto 0);

	signal page_start, page_done : std_logic;
	signal com_count : integer range 0 to 255;
	signal cnt_start, cnt_done : std_logic;
	signal input_cnt_start : std_logic;
	signal cnt_data : std_logic_vector(7 downto 0);
	signal cnt_address : std_logic;
	
	signal loop_7 : integer range 0 to 15;
	
	type cnt_set_data is array (0 to 4) of std_logic_vector(7 downto 0);
	constant set_data : cnt_set_data := ((x"af"), (x"e7"), (x"2f"), (x"a7") ,(x"40"));
	signal set_data_ad : integer range 0 to 7;
	
	signal all_done : std_logic;

begin

----  CPU interface  --------------------------------------------------------------------------------------------------------------------------------------

	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			reg_0 <= (others => '0');
			cont_reg <= (others => '0');
		elsif(nios_clk'event and nios_clk = '1')then
			if(nios_s_address = "000" and nios_s_write_n = '0')then
				reg_0 <= nios_s_data_in; -- read from
			elsif(nios_s_address = "010" and nios_s_write_n = '0')then -- write data
				cont_reg <= nios_s_data_in; -- control
			elsif(all_done = '1')then
				cont_reg(0) <= '0';
			end if;
		end if;
	end process;

	
	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			go_int1 <= '0';
			go_int2 <= '1';
		elsif(nios_clk'event and nios_clk = '1')then
			go_int2 <= not go_int1;
			go_int1 <= cont_reg(0); -- bit 0 is the go bit
		end if;
	end process;
	go <= go_int2 and go_int1;




----  State machie for whole procress  --------------------------------------------------------------------------------------------------------------------------------------

	process (nios_reset_n, nios_clk) begin
		if (nios_reset_n='0') then
			IS_STATE <= STATE_IDL;
			cnt_start <= '0';
			all_done <= '0';
		elsif(nios_clk'event and nios_clk = '1')then

			if(go = '1')then -- go is the 1 clk width of 'H' plus
				IS_STATE <= STATE_INI;
				loop_7 <= 0;
			else
	
			case IS_STATE is
				when STATE_INI => -- LCD set					
					cnt_start <= '1';
					IS_STATE <= STATE_end_INI;
				when STATE_end_INI =>
					cnt_start <= '0';
					if(cnt_done = '1')then
						IS_STATE <= STATE0;
						page <= "000";
					end if;
				when STATE0 => -- page0
					page_start <= '1';
					IS_STATE <= STATE1;
				when STATE1 =>
					page_start <= '0';
					if (page_done = '1') then
--						if(loop_7 < 8)then -- do this for 8 pages
						if(loop_7 < 7)then -- do this for 8 pages
							IS_STATE <= STATE0;
							page <= page + 1;
							loop_7 <= loop_7 + 1;
						else
							IS_STATE <= STATE2;
						end if;
					end if;
				when STATE2 =>
						IS_STATE <= STATE_IDL;
						all_done <= '1';
				when STATE_IDL => -- idol state
					IS_STATE <= STATE_IDL;
					all_done <= '0';
				when others =>
				end case;
			end if;
		end if;
	end process;

----- page write control -------------------------------------------------------
	process (nios_reset_n, nios_clk) begin
		if (nios_reset_n='0') then
			stm <= stm_IDL;
			page_done <= '0';
			output_start <= '0';
			com_count <= 0;
		elsif(nios_clk'event and nios_clk = '1')then
			if(go = '1')then -- go is the 1 clk width of 'H' plus
				address_counter <= reg_0;
			elsif(page_start = '1')then -- go is the 1 clk width of 'H' plus
				stm <= set_page;
				page_done <= '0';
				output_start <= '0';
				com_count <= 0;
				write_address <= '0';
			elsif(com_count < 127)then
				case stm is
				when set_page =>
					if (dma_w_done = '1') then
						stm <= set_IDL1;
						input_start <= '0';
						write_address <= '0';
					else
						dma_w_data(7 downto 3) <= "10110";
						dma_w_data(2 downto 0) <= page(2 downto 0);
						input_start <= '1';
						stm <= stm;
					end if;
				when set_IDL1 =>
						stm <= set_line_u;
				when set_line_u =>
					if (dma_w_done = '1') then
						stm <= set_IDL2;
						input_start <= '0';
					else
						dma_w_data(7 downto 0) <= x"10";
						input_start <= '1';
						stm <= stm;
					end if;				
				when set_IDL2 =>
						stm <= set_line_l;
						write_address <= '0';
				when set_line_l =>
					if (dma_w_done = '1') then
						stm <= get4bytes;
						input_start <= '0';
						write_address <= '1'; --reg_1 or x"00000004"; -- 0x04 is the offset for data write
						read_address <= address_counter;
					else
						dma_w_data(7 downto 0) <= x"04";
						input_start <= '1';
						stm <= stm;
					end if;				
				when get4bytes =>				
					if (dma_done = '1') then
						stm <= IDL1;
						output_start <= '0';
						address_counter <= address_counter + 4;
					else
						output_start <= '1';
						stm <= stm;
					end if;
				when IDL1 =>
						stm <= put1;
				when put1 =>
					if (dma_w_done = '1') then
						stm <= IDL2;
						input_start <= '0';
					else
						dma_w_data(7 downto 0) <= dma_data_in(7 downto 0);
						input_start <= '1';
						stm <= stm;
					end if;
				when IDL2 =>
						stm <= put2;
				when put2 =>
					if (dma_w_done = '1') then
						stm <= IDL3;
						input_start <= '0';
					else
						dma_w_data(7 downto 0) <= dma_data_in(15 downto 8);
						input_start <= '1';
						stm <= stm;
					end if;
				when IDL3 =>
						stm <= put3;
				when put3 =>
					if (dma_w_done = '1') then
						stm <= IDL4;
						input_start <= '0';
					else
						dma_w_data(7 downto 0) <= dma_data_in(23 downto 16);
						input_start <= '1';
						stm <= stm;
					end if;
				when IDL4 =>
						stm <= put4;
				when put4 =>
					if (dma_w_done = '1') then
						input_start <= '0';
						if(com_count = 124)then -- (128 - 4) = 124
							stm <= stm_IDL;
							page_done <= '1';
						else
							com_count <= com_count + 4; -- reads 4 bytes at a time
							stm <= get4bytes;
							output_start <= '0';
							read_address <= address_counter;
						end if;
					else
						dma_w_data(7 downto 0) <= dma_data_in(31 downto 24);
						input_start <= '1';
						stm <= stm;
					end if;
				when stm_IDL => -- idol state
					stm <= stm_IDL;
					page_done <= '0';
					write_address <= '0';
				when others =>
				end case;
			end if;
		end if;
	end process;





------ LCD Cont -----------------------------------------------
	process (nios_reset_n, nios_clk) begin
		if (nios_reset_n='0') then
			stm_cnt <= cnt_IDL;
		elsif(nios_clk'event and nios_clk = '1')then
			if(cnt_start = '1')then -- go is the 1 clk width of 'H' plus
				stm_cnt <= cnt_state1;
				cnt_done <= '0';
				cnt_address <= '0';
				set_data_ad <= 0;
			else
				case stm_cnt is
				when cnt_state1 =>
					if (dma_w_done = '1') then
						stm_cnt <= cnt_IDL1;
						input_cnt_start <= '0';
						set_data_ad <= set_data_ad + 1;
					else
						--cnt_data(7 downto 0) <= x"AF";
						cnt_data(7 downto 0) <= set_data(set_data_ad);
						input_cnt_start <= '1';
						stm_cnt <= stm_cnt;
					end if;				
				when cnt_IDL1 =>
					if(set_data_ad < 5)then
						stm_cnt <= cnt_state1;
					else
						stm_cnt <= cnt_IDL;
						cnt_done <= '1';
					end if;
				when cnt_IDL => -- idle state
					stm_cnt <= cnt_IDL;
					cnt_done <= '0';
					set_data_ad <= 0;
				when others =>
				end case;
			end if;
		end if;
	end process;
	
----  D M A  --------------------------------------------------------------------------------------------------------------------------------------

	-- grabbing data from on chip ram
	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			read_cnt <= 0;
			dma_done <= '0';
		elsif(nios_clk'event and nios_clk = '1')then
			if(output_start = '0')then
				read_cnt <= 0;
				dma_done <= '0';
			elsif(read_cnt = 5)then
				read_cnt <= 5;
				dma_done <= '1';
			else
				if(nios_r_waitrequest = '1')then
					read_cnt <= read_cnt + 1;
					dma_done <= '0';
				end if;
			end if;
		end if;
	end process;
		
	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			nios_r_address <= (others => '0');
			nios_r_chipselect_n <= '1';
			nios_r_read_n <= '1';
		elsif(nios_clk'event and nios_clk = '1')then
			if(read_cnt = 1)then
				nios_r_address <= read_address;
				nios_r_chipselect_n <= '0';
				nios_r_read_n <= '0';
				dma_data_in <= nios_r_data_in;
			elsif(read_cnt = 4)then
				dma_data_in <= nios_r_data_in;
			elsif(read_cnt = 5)then
				nios_r_chipselect_n <= '1';
				nios_r_read_n <= '1';
				dma_data_in <= dma_data_in;
			end if;			
		end if;
	end process;


---  DMA write Control  -------------------------------------------------------------------------------------------------------------------------------------
	-- grabbing data from on chip ram
	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			write_cnt <= 0;
			dma_w_done <= '0';
		elsif(nios_clk'event and nios_clk = '1')then
			if(input_start = '0' and input_cnt_start = '0')then
				write_cnt <= 0;
				dma_w_done <= '0';
			elsif(write_cnt = 15)then
				write_cnt <= 15;
				dma_w_done <= '1';
			else
				write_cnt <= write_cnt + 1;
				dma_w_done <= '0';
			end if;
		end if;
	end process;
		
	process(nios_reset_n, nios_clk)begin
		if(nios_reset_n = '0')then
			lcd_d_cn <= '0';
			lcd_csn <= '1';
			lcd_wen <= '1';
		elsif(nios_clk'event and nios_clk = '1')then
			if(write_cnt = 0)then
				lcd_d_cn <= '0';
				lcd_csn <= '1';
				lcd_wen <= '1';
				lcd_data <= (others => '0');
			elsif(write_cnt = 1)then
				if(input_cnt_start = '1')then
					lcd_data(7 downto 0) <= cnt_data;
					lcd_d_cn <= cnt_address;
				else
					lcd_data <= dma_w_data(7 downto 0);
					lcd_d_cn <= write_address;
				end if;
				lcd_csn <= '0';
				lcd_wen <= '0';
			elsif(write_cnt = 10)then
				lcd_wen <= '1';
			elsif(write_cnt = 11)then
				lcd_csn <= '1';
			end if;			
		end if;
	end process;
----------------------------------------------------------------------------------------------------------------------------------------

	lcd_en <= '0';
	lcd_rstn <= '1';
	lcd_e_rdn <= '1';
	
end rtl;
