library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CPU is
	generic(
		CLOCK_COUNT_BUFFER_SIZE : integer := 32;
		MAX_CLOCK_COUNT : unsigned(31 downto 0) := to_unsigned(50000000, 32)
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

	constant CSNT_MOV_A_FROM_END : std_logic_vector(4 downto 0) := "00001";
	constant CSNT_MOV_END_FROM_A : std_logic_vector(4 downto 0) := "00010";
	constant CSNT_MOV_A_FROM_B	: std_logic_vector(4 downto 0) := "00011";
	constant CSNT_MOV_B_FROM_A	: std_logic_vector(4 downto 0) := "00100";
	constant CSNT_ADD_A_TO_B 		: std_logic_vector(4 downto 0) := "00101";
	constant CSNT_SUB_A_TO_B 		: std_logic_vector(4 downto 0) := "00110";
	constant CSNT_AND_A_B 		: std_logic_vector(4 downto 0) := "00111";
	constant CSNT_OR_A_B 		: std_logic_vector(4 downto 0) := "01000";
	constant CSNT_XOR_A_B 		: std_logic_vector(4 downto 0) := "01001";
	constant CSNT_NOT_A 			: std_logic_vector(4 downto 0) := "01010";
	constant CSNT_NAND_A_B 		: std_logic_vector(4 downto 0) := "01011";
	constant CSNT_JZ_END 		: std_logic_vector(4 downto 0) := "01100";
	constant CSNT_JN_END 		: std_logic_vector(4 downto 0) := "01101";
	constant CSNT_HALT 			: std_logic_vector(4 downto 0) := "01110";
	constant CSNT_JMP_END 		: std_logic_vector(4 downto 0) := "01111";
	constant CSNT_INC_A 			: std_logic_vector(4 downto 0) := "10000";
	constant CSNT_INC_B 			: std_logic_vector(4 downto 0) := "10001";
	constant CSNT_DEC_A 			: std_logic_vector(4 downto 0) := "10010";
	constant CSNT_DEC_B 			: std_logic_vector(4 downto 0) := "10011";

	type cpuState is (
		start,
		reading,
		processInstruction,
		running,
		loadResult,
		halt
	);

	type instructionType is (
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
		halt
	);

	-- Mapeamento de codigo de instrução para estados correspondentes
	type instruction_array_type is array (0 to 13) of instructionType;
	signal instruction_array : instruction_array_type := (
		0=> mov_a_from_end,
		1=> mov_end_from_a,
		2=> mov_a_from_b,
		3=> mov_b_from_a,
		4=> add_a_to_b,
		5=> sub_a_to_b,
		6=> and_a_b,
		7=> or_a_b,
		8=> xor_a_b,
		9=> not_a,
		10=> nand_a_b,
		11=> jz_end,
		12=> jn_end,
		13=> halt
	);

	signal slow_clk : std_logic := '0';
	signal slow_clk_tick: std_logic := '0';
	signal slow_clk_count_reg, slow_clk_count_next : unsigned( (CLOCK_COUNT_BUFFER_SIZE - 1) downto 0) := (others => '0');
	signal slow_clk_count : unsigned ( (CLOCK_COUNT_BUFFER_SIZE - 1) downto 0) := to_unsigned (0, CLOCK_COUNT_BUFFER_SIZE);

	signal processCount : integer range 0 downto 31 := 0;

	signal state_reg, state_next : cpuState := start;
	signal instruction_reg, instruction_next : instructionType := mov_a_from_end;

	signal RegistradorIns: integer range 0 downto 31 := 0;
	-- signal RegistradorEnd : std_logic_vector(4 downto 0):= (others=>'0'); -- Registradores de instru��o e Registrador de endere�o

	-- ALU Signals
	signal opA, opB, opcode, result : std_logic_vector(4 downto 0) := (others => '0');

	-- LCD Signals
	signal INSTRUCTION : integer range 0 to 31 := 0;

	-- RAM Signals
	signal RAMData : std_logic_vector(4 downto 0) := (others => '0');
	signal writeEnabled: std_logic := '0';
	signal dataIn: std_logic_vector(4 downto 0) := (others => '0');


	component RAM
		port(
			clk: in std_logic;
			reset: in std_logic;
			we: in std_logic;
			address: in integer range 0 to 31;
			-- outAddress: out integer;
			dataIn: in std_logic_vector(4 downto 0);
			dataOut: out std_logic_vector(4 downto 0)
		);
	end component;

	component ALU
		port(
			opA: in std_logic_vector(4 downto 0); -- operandA
			opB: in std_logic_vector(4 downto 0); -- operandB
			opcode: in std_logic_vector(4 downto 0);
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
	
	signal batata : std_logic_vector(4 downto 0) := (others => '0');
begin
	LEDS <= std_logic_vector(to_unsigned(RegistradorIns, LEDS'length));

	u_RAM : RAM port map (
		clk => slow_clk,
		reset => RESET,
		address => RegistradorIns,
		-- outAddress => RegistradorIns,
		dataOut => RAMData,
		dataIn => dataIn,
		we => writeEnabled
	);
	
	INSTRUCTION <= to_integer(unsigned(RAMData));

	-- Counting controller
	slow_clk_count_next <= to_unsigned(0, slow_clk_count_next'length) when slow_clk_count_reg = MAX_CLOCK_COUNT else slow_clk_count_reg + 1;
	slow_clk_tick <= '1' when slow_clk_count_reg = MAX_CLOCK_COUNT else '0';


	u_ALU: ALU port map (
		opA => opA,
		opB => opB,
		opcode => opcode,
		zero => ZERO,
		negative => NEGATIVE,
		result => result
	);

	u_LCD: LCD port map (
		CLK => CLK,
		LCD_E => LCD_E,
		LCD_RW => LCD_RW,
		LCD_RS => LCD_RS,
		DISABLE_STRATA_FLASH => DISABLE_STRATA_FLASH,
		SF_D => SF_D,
		INSTRUCTION => INSTRUCTION
	);

	slowClockUpdate: process (CLK)
	begin
		if rising_edge(CLK) then
			if slow_clk_tick = '1' then
				slow_clk <= not slow_clk;
				state_reg <= state_next;
				instruction_reg <= instruction_next;
			end if;
			slow_clk_count_reg <= slow_clk_count_next;
		end if;
	end process slowClockUpdate;

	update: process (CLK)
	begin
		if falling_edge(CLK) then
			if slow_clk = '1' then
				case state_reg is
					when start =>
						processCount <= 0;
						-- RegistradorA <= "00000";
						-- RegistradorB <= "00000";
						-- ZERO <= '0';
						-- NEGATIVE <= '0';

						state_next <= reading;
					when reading =>
						RegistradorIns <= processCount;
						state_next <= processInstruction;

					when processInstruction =>
						-- state_next <= interpreta_instrucao;
						instruction_next <= instruction_array(RegistradorIns);
						if processCount = 31 then
							processCount <= 0;
						else
							processCount <= processCount + 1;
						end if;
						state_next <= running;
					when running =>
						 case instruction_reg is
						 	when mov_a_from_end =>
						 		-- todo
						 		state_next <= reading;
						 	when mov_end_from_a =>
						 		-- todo
						 		state_next <= reading;
						 	when mov_a_from_b =>
						 		-- todo
						 		state_next <= reading;
						 	when mov_b_from_a =>
						 		-- todo
						 		state_next <= reading; 
						 	when add_a_to_b =>
						 		opcode <= CSNT_ADD_A_TO_B;
						 		state_next <= loadResult;
						 	when sub_a_to_b =>
						 		opcode <= CSNT_SUB_A_TO_B;
						 		state_next <= loadResult;
						 	when and_a_b =>
						 		opcode <= CSNT_AND_A_B;
						 		state_next <= loadResult;
						 	when or_a_b =>
						 		opcode <= CSNT_OR_A_B;
						 		state_next <= loadResult;
						 	when xor_a_b =>
						 		opcode <= CSNT_XOR_A_B;
						 		state_next <= loadResult;
						 	when not_a =>
						 		opcode <= CSNT_NOT_A;
						 		state_next <= loadResult;
						 	when nand_a_b =>
						 		opcode <= CSNT_NAND_A_B;
						 		state_next <= loadResult;
						 	when jz_end =>
						 		-- todo
						 		state_next <= reading;
						 	when jn_end =>
						 		-- todo
						 		state_next <= reading;
						 	when halt =>
						 		-- todo
						 		state_next <= halt;
						 end case;
					when halt =>
						-- todo
						state_next <= reading;
					when loadResult =>
						-- todo
						state_next <= reading;
					when others =>
						state_next <= reading;
				end case;
			end if;
		end if;
	end process update;
-- update: process (CLK)
-- 	begin
-- 		if falling_edge(CLK) then
-- 			if slow_clk_tick = '1' then
-- 				le_endereco <= '0';
-- 				case state_reg is
-- 					when start =>
-- 						PC <= 0;
-- 						RegistradorA <= "00000";
-- 						RegistradorB <= "00000";
-- 						displayZeroSig <= '0';
-- 						displayNegativeSig <= '0';
-- 						state_next <= leitura;

-- 					when leitura =>
-- 						RegistradorIns <= ram(PC);
-- 						state_next <= interpreta_instrucao;

-- 					when interpreta_instrucao =>
-- 						state_next <= instruction_array(to_integer(unsigned(RegistradorIns)));

-- 					when mov_a_from_end =>
-- 						if le_endereco = '0' then
-- 							le_endereco <= '1';
-- 						else
-- 							RegistradorA <= ram(to_integer(unsigned(RegistradorEnd)));
-- 							state_next <= leitura;
-- 						end if;
-- 						PC <= PC + 1;

-- 					when mov_end_from_a =>
-- 						if le_endereco = '0' then
-- 							le_endereco <= '1';
-- 						else
-- 							ram(to_integer(unsigned(RegistradorEnd))) <= RegistradorA;
-- 							state_next <= leitura;
-- 						end if;
-- 						PC <= PC + 1;

-- 					when mov_a_from_b =>
-- 						RegistradorA <= RegistradorB;
-- 						state_next <= leitura;
-- 						PC <= PC + 1;

-- 					when mov_b_from_a =>
-- 						RegistradorB <= RegistradorA;
-- 						state_next <= leitura;
-- 						PC <= PC + 1;

-- 					when add_a_to_b =>
-- 						OpCodeSig <= "000";
-- 						state_next <= load_result;

-- 					when sub_a_to_b =>
-- 						OpCodeSig <= "001";
-- 						state_next <= load_result;

-- 					when and_a_b =>
-- 						OpCodeSig <= "010";
-- 						state_next <= load_result;

-- 					when or_a_b =>
-- 						OpCodeSig <= "011";
-- 						state_next <= load_result;

-- 					when xor_a_b =>
-- 						OpCodeSig <= "100";
-- 						state_next <= load_result;

-- 					when not_a =>
-- 						OpCodeSig <= "101";
-- 						state_next <= load_result;

-- 					when nand_a_b =>
-- 						OpCodeSig <= "110";
-- 						state_next <= load_result;

-- 					when load_result =>
-- 						RegistradorA <= resultSig;
-- 						displayZeroSig <= zeroSig;
-- 						displayNegativeSig <= negativeSig;
-- 						state_next <= leitura;
-- 						PC <= PC + 1;

-- 					when jz_end =>
-- 						if le_endereco = '0' then
-- 							le_endereco <= '1';
-- 							PC <= PC + 1;
-- 						else
-- 							if zeroSig = '1' then
-- 								PC <= to_integer(unsigned(RegistradorEnd));
-- 							else
-- 								PC <= PC + 1;
-- 							end if;
-- 							state_next <= leitura;
-- 						end if;

-- 					when jn_end =>
-- 						if le_endereco = '0' then
-- 							le_endereco <= '1';
-- 							PC <= PC + 1;
-- 						else
-- 							if negativeSig = '1' then
-- 								PC <= to_integer(unsigned(RegistradorEnd));
-- 							else
-- 								PC <= PC + 1;
-- 							end if;
-- 							state_next <= leitura;
-- 						end if;

-- 					when halt =>
-- 						state_next <= halt;

-- 					when others =>
-- 						state_next <= start;
-- 				end case;
-- 			end if;
-- 		end if;

-- 	end process update;

end Behavioral;

