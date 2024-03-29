library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
	generic(
		CLOCK_COUNT_BUFFER_SIZE : integer := 25
	);
	port(CLK : in std_logic;
		LCD_E : out std_logic; -- Enable do LCD
		LCD_RW : out std_logic; -- read or write
		LCD_RS : out std_logic; -- data manipulation or addressing
		DISABLE_STRATA_FLASH: out std_logic;
		SF_D: out std_logic_vector(3 downto 0);
		ZERO: out std_logic;
		NEGATIVE: out std_logic;
		CLK_OUT: out std_logic;
		RESET: in std_logic;
		LEDS: out std_logic_vector(4 downto 0)
);
end CPU;

architecture Behavioral of CPU is

--	constant mov_a_from_end 		: integer range 0 to 31 :=  1; -- std_logic_vector(4 downto 0) := "00001";
--	constant mov_end_from_a			: integer range 0 to 31 :=  2; -- std_logic_vector(4 downto 0) := "00010";
--	constant mov_a_from_b			: integer range 0 to 31 :=  3; -- std_logic_vector(4 downto 0) := "00011";
--	constant mov_b_from_a			: integer range 0 to 31 :=  4; -- std_logic_vector(4 downto 0) := "00100";
--	constant add_a_to_b 			: integer range 0 to 31 :=  5; -- std_logic_vector(4 downto 0) := "00101";
--	constant sub_a_to_b 			: integer range 0 to 31 :=  6; -- std_logic_vector(4 downto 0) := "00110";
--	constant and_a_b 				: integer range 0 to 31 :=  7; -- std_logic_vector(4 downto 0) := "00111";
--	constant or_a_b 				: integer range 0 to 31 :=  8; -- std_logic_vector(4 downto 0) := "01000";
--	constant xor_a_b 				: integer range 0 to 31 :=  9; -- std_logic_vector(4 downto 0) := "01001";
--	constant not_a 					: integer range 0 to 31 := 10; -- std_logic_vector(4 downto 0) := "01010";
--	constant nand_a_b 				: integer range 0 to 31 := 11; -- std_logic_vector(4 downto 0) := "01011";
--	constant jz_end 				: integer range 0 to 31 := 12; -- std_logic_vector(4 downto 0) := "01100";
--	constant jn_end 				: integer range 0 to 31 := 13; -- std_logic_vector(4 downto 0) := "01101";
--	constant halt 					: integer range 0 to 31 := 14; -- std_logic_vector(4 downto 0) := "01110";
--	constant jmp_end 				: integer range 0 to 31 := 15; -- std_logic_vector(4 downto 0) := "01111";
--	constant inc_a 					: integer range 0 to 31 := 16; -- std_logic_vector(4 downto 0) := "10000";
--	constant inc_b 					: integer range 0 to 31 := 17; -- std_logic_vector(4 downto 0) := "10001";
--	constant dec_a 					: integer range 0 to 31 := 18; -- std_logic_vector(4 downto 0) := "10010";
--	constant dec_b 					: integer range 0 to 31 := 19; -- std_logic_vector(4 downto 0) := "10011";

	type cpuState is (
		start,
		reading,
		processInstruction,
		mov_a_from_end, 
		mov_end_from_a, 
		mov_a_from_b, 
		mov_b_from_a, 
		add_a_to_b, 
		sub_a_to_b, 
		and_a_b, 
		or_a_b, 
		xor_a_b, 
		not_a, 
		nand_a_b, 
		jz_end, 
		jn_end,
		halt,
		jmp_end,
		inc_a,
		inc_b,
		dec_a,
		dec_b,
		load_result_A,
		load_result_B
	);
	
	type instruction_array_type is array (1 to 19) of cpuState;
	signal instruction_array : instruction_array_type := (
		1=>mov_a_from_end, 
		2=>mov_end_from_a, 
		3=>mov_a_from_b, 
		4=>mov_b_from_a, 
		5=>add_a_to_b, 
		6=>sub_a_to_b, 
		7=>and_a_b, 
		8=>or_a_b, 
		9=>xor_a_b, 
		10=>not_a, 
		11=>nand_a_b, 
		12=>jz_end, 
		13=>jn_end,
		14=>halt,
		15=>jmp_end,
		16=>inc_a,
		17=>inc_b,
		18=>dec_a,
		19=>dec_b
		);

	signal slow_clk : std_logic := '0';
	signal slow_clk_tick: std_logic := '0';
	signal slow_clk_count_reg, slow_clk_count_next : unsigned( (CLOCK_COUNT_BUFFER_SIZE - 1) downto 0) := (others => '0');

	signal processCount : integer range 0 to 31 := 0;

	signal state_reg, state_next : cpuState := start;
	signal instruction_reg, reg_end : integer range 0 to 31 := 0;

	-- ALU Signals
	signal reg_A, reg_B, result: std_logic_vector(4 downto 0) := (others => '0');
	signal opcode : integer range 0 to 31 := 0;

	-- LCD Signals
	signal INSTRUCTION : integer range 0 to 31 := 0;


	-- RAM Signals
	signal RAMData : std_logic_vector(4 downto 0) := (others => '0');
	signal writeEnabled: std_logic := '0';
	signal dataIn: std_logic_vector(4 downto 0) := (others => '0');
	signal address: integer range 0 to 31 := 0;
	signal address_next: integer range 0 to 31 := 0;
	signal zero_read: std_logic :='0';
	signal negative_read: std_logic :='0';
	signal storedRamData: std_logic_vector(4 downto 0):= (others => '0');
	signal readingAddress: std_logic := '0';

	component RAM
		port(
			clk: in std_logic;
			reset: in std_logic;
			we: in std_logic;
			address: in integer range 0 to 31;
			dataIn: in std_logic_vector(4 downto 0);
			dataOut: out std_logic_vector(4 downto 0);
			dataAt30: out std_logic_vector(4 downto 0)
		);
	end component;


	component ALU
		port(
			reset: in std_logic;
			reg_A: in std_logic_vector(4 downto 0);
			reg_B: in std_logic_vector(4 downto 0);
			opcode: in integer range 0 to 31;
			zero: out std_logic;
			negative: out std_logic;
			result: out std_logic_vector(4 downto 0)
		);
	end component;

	component LCD
		port (
			CLK : in std_logic;
			LCD_E : out std_logic; -- Enable do LCD
			LCD_RW : out std_logic; -- read or write
			LCD_RS : out std_logic; -- data manipulation or addressing
			DISABLE_STRATA_FLASH: out std_logic;
			SF_D: out std_logic_vector(3 downto 0);
			INSTRUCTION: in integer range 0 to 31
		);
	end component;
	
begin

	u_RAM : RAM port map (
		clk => slow_clk,
		reset => RESET,
		address => address_next,
		dataOut => RAMData,
		dataIn => dataIn,
		dataAt30 => LEDS,
		we => writeEnabled
	);

	u_ALU: ALU port map (
		reset => RESET,
		reg_A => reg_A,
		reg_B => reg_B,
		opcode => opcode,
		zero => ZERO_READ,
		negative => NEGATIVE_READ,
		result => result
	);

	u_LCD: LCD port map (
		CLK => CLK,
		LCD_E => LCD_E,
		LCD_RW => LCD_RW,
		LCD_RS => LCD_RS,
		DISABLE_STRATA_FLASH => DISABLE_STRATA_FLASH,
		SF_D => SF_D,
		INSTRUCTION => instruction_reg
	);

	slowClockUpdate: process (CLK)
	begin
		if rising_edge(CLK) then
			if slow_clk_tick = '1' then
				slow_clk <= not slow_clk;
				if reset = '1' then
					state_reg <= start;
				else
					state_reg <= state_next;
				end if;
			end if;
			slow_clk_count_reg <= slow_clk_count_next;
		end if;
	end process slowClockUpdate;

	slow_clk_count_next <= slow_clk_count_reg + 1;
	slow_clk_tick <= '1' when slow_clk_count_reg = to_unsigned(0, CLOCK_COUNT_BUFFER_SIZE) else '0';
	
	update: process (CLK)
	begin
		if falling_edge(CLK) then
			if slow_clk_tick = '1' then
				readingAddress <= '0';
				case state_reg is
					when start =>
						writeEnabled <= '0';
						processCount <= 0;
						reg_a <= "00100";
						reg_B <= "10000";
						state_next <= reading;
						
					when reading =>
						writeEnabled <= '0';
						instruction_reg <= to_integer(unsigned(RAMData));
						address_next <= processCount;
						state_next <= processInstruction;
						
					when processInstruction =>
						state_next <= instruction_array(instruction_reg);
					when mov_a_from_end =>
						if readingAddress = '0' then
							readingAddress <= '1';
						else
							state_next <= reading;
							reg_a <= RAMData;
						end if;
						processCount <= processCount + 1;
					when mov_end_from_a =>
						if readingAddress = '0' then
							readingAddress <= '1';
						else
							writeEnabled <= '1';
							dataIn <= reg_a;
							state_next <= reading;
						end if;
						processCount <= processCount + 1;
					when mov_a_from_b =>
						reg_A <= reg_B;
						state_next <= reading;
						processCount <= processCount + 1;
					when mov_b_from_a =>
						reg_B <= reg_A;
						state_next <= reading; 
						processCount <= processCount + 1;
					when add_a_to_b =>
						opcode <= 5;
						state_next <= load_result_A;
					when sub_a_to_b =>
						opcode <= 6;
						state_next <= load_result_A;
					when and_a_b =>
						opcode <= 7;
						state_next <= load_result_A;
					when or_a_b =>
						opcode <= 8;
						state_next <= load_result_A;
					when xor_a_b =>
						opcode <= 9;
						state_next <= load_result_A;
					when not_a =>
						opcode <= 10;
						state_next <= load_result_A;
					when nand_a_b =>
						opcode <= 11;
						state_next <= load_result_A;
					when jn_end =>
						if readingAddress = '0' then
							readingAddress <= '1';
							processCount <= processCount + 1;
						else
							if NEGATIVE_READ = '1' then
								processCount <= reg_end;
							else
								processCount <= processCount + 1;
							end if;
							state_next <= reading;
						end if;
					when jz_end =>
						if readingAddress = '0' then
							readingAddress <= '1';
						else
							if ZERO_READ = '1' then
								processCount <= reg_end;
							else
								processCount <= processCount + 1;
							end if;
							state_next <= reading;
						end if;
					when inc_a =>
						opcode <= 16;
						state_next <= load_result_A;
						state_next <= reading;
					when inc_b =>
						opcode <= 17;
						state_next <= load_result_B;
						state_next <= reading;
					when dec_a =>
						opcode <= 18;
						state_next <= load_result_A;
						state_next <= reading;
					when dec_b =>
						opcode <= 19;
						state_next <= load_result_B;
						state_next <= reading;
					when halt =>
						state_next <= halt;
					when load_result_A =>
						reg_A <= result;
						processCount <= processCount + 1;
						state_next <= reading;
					when load_result_B =>
						reg_B <= result;
						processCount <= processCount + 1;
						state_next <= reading;
					when others =>
						state_next <= start;
				end case;
			end if;
		end if;
	end process update;
	
	readingAddressProcess: process(readingAddress)
	begin
		if readingAddress = '1' then
			reg_end <= to_integer(unsigned(RAMData));
		end if;
	end process readingAddressProcess;
	
	ZERO<=ZERO_READ;
	NEGATIVE<=NEGATIVE_READ;
end Behavioral;

