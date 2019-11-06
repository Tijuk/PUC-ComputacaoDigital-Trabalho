library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity LCD is
	generic(	N: integer :=20 );
	port(	CLK : in std_logic;
			LCD_E : out std_logic; -- Enable do LCD
			LCD_RW : out std_logic; -- read or write
			LCD_RS : out std_logic; -- data manipulation or addressing
			DISABLE_STRATA_FLASH: out std_logic;
			SF_D: out std_logic_vector(3 downto 0);
			INSTRUCTION: in std_logic_vector(4 downto 0));
end LCD;

architecture Behavioral of LCD is
	type state is (
		-- Initial State
		initial,

		-- Write
		write_1, write_2, write_3, write_4,

		-- Wait
		wait_1, wait_2, wait_3, wait_4,

		-- Function Set
		function_set_1, function_set_2, function_set_3, function_set_4,
			function_wait_long, wait_function_set_operation_time,

		-- Entry Set
		entry_set_1, entry_set_2, entry_set_3, entry_set_4,
			entry_wait_long, wait_entry_set_operation_time,

		-- Display On/Off
		display_on_off_1, display_on_off_2, display_on_off_3, display_on_off_4,
			display_on_off_wait_long, wait_display_on_off_operation_time,

		-- Clear Display
		clear_display_1, clear_display_2, clear_display_3, clear_display_4,
			clear_display_wait_long, wait_clear_display_operation_time,

		-- Set DD Ram
		set_dd_ram_1_1, set_dd_ram_1_2, set_dd_ram_1_3, set_dd_ram_1_4,
			set_dd_ram_1_wait_long, wait_set_dd_ram_1_operation_time,

		-- Write Character
		writingChar_1, writingChar_2, writingChar_3, writingChar_4, writingChar_5, writingChar_6,

		-- Idle State
		idle);
	signal state_reg, state_next : state := initial;
	signal count: unsigned((N-1) downto 0) := to_unsigned(750000, N);
	signal count_next, count_reg : unsigned ((N-1) downto 0) := to_unsigned(0,N);
	signal count_tick : std_logic := '0';
	signal data_buffer: std_logic_vector(3 downto 0);

	signal charAt: unsigned(3 downto 0) := to_unsigned(0, 4);
begin
	
	sincrono: process (CLK)
	begin
		if (rising_edge(CLK)) then
			if (count_tick = '0') then
				count_reg <= count_next;
			else
				count_reg <= to_unsigned(0,N);
			end if;
			state_reg <= state_next;
		end if;
		
	end process sincrono;

	count_next <= to_unsigned(0,N) when count_reg = (count - 1) else count_reg + 1;
	count_tick <='1' when count_reg = (count - 1) else '0';
	mapChar : entity work.MapChar(Behavioral) port map (INPUT=>"01001101",OUTPUT=>data_buffer);

	combinatorial: process (CLK)
	begin
		if (falling_edge(CLK)) then
			LCD_RW <= '0';
			LCD_RS <= '0';
			case state_reg is
				-- Initialization steps
				when initial =>
					if (count_tick = '1') then
						state_next <= write_1;
					end if;
				when write_1 =>
					LCD_E <= '1';
					data_buffer <= "0011";
					count <= to_unsigned(12,N);
					if (count_tick = '1') then
						state_next <= wait_1;
						LCD_E <= '0';
					end if;
				when wait_1 =>
					count <= to_unsigned(205000,N);
					if (count_tick = '1') then
						state_next <= write_2;
					end if;
				when write_2 =>
					LCD_E <= '1';
					data_buffer <= "0011";
					count <= to_unsigned(12,N);
					if (count_tick = '1') then
						state_next <= wait_3;
						LCD_E <= '0';
					end if;
				when wait_2 =>
					count <= to_unsigned(5000,N);
					if (count_tick = '1') then
						state_next <= write_3;
					end if;
				when write_3 =>
					LCD_E <= '1';
					data_buffer <= "0011";
					count <= to_unsigned(12,N);
					if (count_tick = '1') then
						state_next <= wait_3;
						LCD_E <= '0';
					end if;
				when wait_3 =>
					count <= to_unsigned(2000,N);
					if (count_tick = '1') then
						state_next <= write_4;
					end if;
				when write_4 =>
					LCD_E <= '1';
					data_buffer <= "0010";
					count <= to_unsigned(12,N);
					if (count_tick = '1') then
						state_next <= wait_4;
						LCD_E <= '0';
					end if;
				when wait_4 =>
					count <= to_unsigned(2000,N);
					if (count_tick = '1') then
						state_next <= function_set_1;
					end if;
					
				-- Function Set Steps
				when function_set_1 =>
					data_buffer <= "0010";
					count <= to_unsigned(10,N); -- wait for signal estabilization
					if (count_tick = '1') then
						state_next <= function_set_2;
					end if;
				when function_set_2 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= function_wait_long;
						LCD_E <= '0';
					end if;
				when function_wait_long =>
					count <= to_unsigned(50,N);
					if (count_tick = '1') then
						state_next <= function_set_3;
					end if;
				when function_set_3 =>
					data_buffer <= "1000";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= function_set_4;
					end if;
				when function_set_4 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= wait_function_set_operation_time;
						LCD_E <= '0';
					end if;
				when wait_function_set_operation_time =>
					count <= to_unsigned(2500,N);
						if (count_tick = '1') then
							state_next <= entry_set_1;
						end if;
						
			-- Entry Set Steps
				when entry_set_1 =>
					data_buffer <= "0000";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= entry_set_2;
					end if;
				when entry_set_2 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= entry_wait_long;
						LCD_E <= '0';
					end if;
				when entry_wait_long =>
					count <= to_unsigned(50,N);
					if (count_tick = '1') then
						state_next <= entry_set_3;
					end if;
				when entry_set_3 =>
					data_buffer <= "0110";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= entry_set_4;
					end if;
				when entry_set_4 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= wait_entry_set_operation_time;
						LCD_E <= '0';
					end if;
				when wait_entry_set_operation_time =>
					count <= to_unsigned(2500,N);
						if (count_tick = '1') then
							state_next <= display_on_off_1;
						end if;		
						
			-- Display On/Off Steps
				when display_on_off_1 =>
					data_buffer <= "0000";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= display_on_off_2;
					end if;
				when display_on_off_2 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= display_on_off_wait_long;
						LCD_E <= '0';
					end if;
				when display_on_off_wait_long =>
					count <= to_unsigned(50,N);
					if (count_tick = '1') then
						state_next <= display_on_off_3;
					end if;
				when display_on_off_3 =>
					data_buffer <= "1111";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= display_on_off_4;
					end if;
				when display_on_off_4 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= wait_display_on_off_operation_time;
						LCD_E <= '0';
					end if;
				when wait_display_on_off_operation_time =>
					count <= to_unsigned(2500,N);
						if (count_tick = '1') then
							state_next <= clear_display_1;
						end if;
				-- Clear Display
				when clear_display_1 =>
					data_buffer <= "0000";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= clear_display_2;
					end if;
				when clear_display_2 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= clear_display_wait_long;
						LCD_E <= '0';
					end if;
				when clear_display_wait_long =>
					count <= to_unsigned(50,N);
					if (count_tick = '1') then
						state_next <= clear_display_3;
					end if;
				when clear_display_3 =>
					data_buffer <= "0001";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= clear_display_4;
					end if;
				when clear_display_4 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= wait_clear_display_operation_time;
						LCD_E <= '0';
					end if;
				when wait_clear_display_operation_time =>
					count <= to_unsigned(85000,N);
						if (count_tick = '1') then
							state_next <= set_dd_ram_1_1;
						end if;
				
				-- Set DD RAM #
				when set_dd_ram_1_1 =>
					data_buffer <= "1000";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= set_dd_ram_1_2;
					end if;
				when set_dd_ram_1_2 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= set_dd_ram_1_wait_long;
						LCD_E <= '0';
					end if;
				when set_dd_ram_1_wait_long =>
					count <= to_unsigned(50,N);
					if (count_tick = '1') then
						state_next <= set_dd_ram_1_3;
					end if;
				when set_dd_ram_1_3 =>
					data_buffer <= "0000";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= set_dd_ram_1_4;
					end if;
				when set_dd_ram_1_4 =>
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= wait_set_dd_ram_1_operation_time;
						LCD_E <= '0';
					end if;
				when wait_set_dd_ram_1_operation_time =>
					count <= to_unsigned(85000,N);
						if (count_tick = '1') then
							state_next <= writingChar_1;
						end if;

				-- Write Character
				when writingChar_1 =>
					LCD_RS <= '1';
					data_buffer <= "0101";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= writingChar_2;
					end if;
				when writingChar_2 =>
					LCD_RS <= '1';
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= writingChar_3;
						LCD_E <= '0';
					end if;
				when writingChar_3 =>
					LCD_RS <= '1';
					count <= to_unsigned(50,N);
					if (count_tick = '1') then
						state_next <= writingChar_4;
					end if;
				when writingChar_4 =>
					LCD_RS <= '1';
					data_buffer <= "0010";
					count <= to_unsigned(10,N);
					if (count_tick = '1') then
						state_next <= writingChar_5;
					end if;
				when writingChar_5 =>
					LCD_RS <= '1';
					LCD_E <= '1';
					count <= to_unsigned(120,N);
					if (count_tick = '1') then
						state_next <= writingChar_6;
						LCD_E <= '0';
					end if;
				when writingChar_6 =>
					count <= to_unsigned(85000,N);
						if (count_tick = '1') then
							state_next <= o_1;
						end if;
						
				-- Write Character
				when writingChar_1 =>
				LCD_RS <= '1';
				INSTRUCTION<="01001101";
				OUTPUT<=data_buffer;
				CHAR_AT<="0000";
				LEFT<="0";
				data_buffer <= "0101";
				count <= to_unsigned(10,N);
				if (count_tick = '1') then
					state_next <= writingChar_2;
				end if;
			when writingChar_2 =>
				LCD_RS <= '1';
				LCD_E <= '1';
				count <= to_unsigned(120,N);
				if (count_tick = '1') then
					state_next <= writingChar_3;
					LCD_E <= '0';
				end if;
			when writingChar_3 =>
				LCD_RS <= '1';
				count <= to_unsigned(50,N);
				if (count_tick = '1') then
					state_next <= writingChar_4;
				end if;
			when writingChar_4 =>
				LCD_RS <= '1';
				data_buffer <= "0010";
				count <= to_unsigned(10,N);
				if (count_tick = '1') then
					state_next <= writingChar_5;
				end if;
			when writingChar_5 =>
				LCD_RS <= '1';
				LCD_E <= '1';
				count <= to_unsigned(120,N);
				if (count_tick = '1') then
					state_next <= writingChar_6;
					LCD_E <= '0';
				end if;
			when writingChar_6 =>
				count <= to_unsigned(85000,N);
					if (count_tick = '1') then
						state_next <= o_1;
					end if;
					
				-- Write Character
				when writingChar_1 =>
				LCD_RS <= '1';
				INPUT<=INSTRUCTION;
				OUTPUT<=data_buffer;
				data_buffer <= "0101";
				count <= to_unsigned(10,N);
				if (count_tick = '1') then
					state_next <= writingChar_2;
				end if;
			when writingChar_2 =>
				LCD_RS <= '1';
				LCD_E <= '1';
				count <= to_unsigned(120,N);
				if (count_tick = '1') then
					state_next <= writingChar_3;
					LCD_E <= '0';
				end if;
			when writingChar_3 =>
				LCD_RS <= '1';
				count <= to_unsigned(50,N);
				if (count_tick = '1') then
					state_next <= writingChar_4;
				end if;
			when writingChar_4 =>
				LCD_RS <= '1';
				data_buffer <= "0010";
				count <= to_unsigned(10,N);
				if (count_tick = '1') then
					state_next <= writingChar_5;
				end if;
			when writingChar_5 =>
				LCD_RS <= '1';
				LCD_E <= '1';
				count <= to_unsigned(120,N);
				if (count_tick = '1') then
					state_next <= writingChar_6;
					LCD_E <= '0';
				end if;
			when writingChar_6 =>
				count <= to_unsigned(85000,N);
					if (count_tick = '1') then
						state_next <= o_1;
					end if;
				when idle =>
			end case;
		end if;
	end process combinatorial;
		DISABLE_STRATA_FLASH <= '1';
		SF_D <= data_buffer;
end Behavioral;

