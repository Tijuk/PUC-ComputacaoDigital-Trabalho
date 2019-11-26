library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU2 is
	generic(
		CLOCK_COUNT_BUFFER_SIZE : integer := 25
	);
	port(CLK : in std_logic; -- clock do programa
		LCD_E : out std_logic; -- Enable do LCD
		LCD_RW : out std_logic; -- read or write
		LCD_RS : out std_logic; -- data manipulation or addressing
		DISABLE_STRATA_FLASH: out std_logic; -- desabilita a StrataFlash por conflito com LCD
		SF_D: out std_logic_vector(3 downto 0); -- led que indica zero
		ZERO: out std_logic; -- led que indica zero
		NEGATIVE: out std_logic; -- led que indica negativo
		RESET: in std_logic; -- reset
		LEDS: out std_logic_vector(4 downto 0) -- leds data is mirror of data in ram position 30
	);
end CPU2;

architecture Behavioral of CPU2 is

	type cpuState is (start, fetch, decode, execute);
	signal state_reg : cpuState := start;
	
	--codigos/intruções aceitos pela CPU
	constant mov_a_from_end 		: std_logic_vector(4 downto 0) := "00001";
	constant mov_end_from_a			: std_logic_vector(4 downto 0) := "00010";
	constant mov_a_from_b			: std_logic_vector(4 downto 0) := "00011";
	constant mov_b_from_a			: std_logic_vector(4 downto 0) := "00100";
	constant add_a_to_b 				: std_logic_vector(4 downto 0) := "00101";
	constant sub_a_to_b 				: std_logic_vector(4 downto 0) := "00110";
	constant and_a_b 					: std_logic_vector(4 downto 0) := "00111";
	constant or_a_b 					: std_logic_vector(4 downto 0) := "01000";
	constant xor_a_b 					: std_logic_vector(4 downto 0) := "01001";
	constant not_a 					: std_logic_vector(4 downto 0) := "01010";
	constant nand_a_b 				: std_logic_vector(4 downto 0) := "01011";
	constant jz_end 					: std_logic_vector(4 downto 0) := "01100";
	constant jn_end 					: std_logic_vector(4 downto 0) := "01101";
	constant halt 						: std_logic_vector(4 downto 0) := "01110";
	constant jmp_end 					: std_logic_vector(4 downto 0) := "01111";
	constant inc_a 					: std_logic_vector(4 downto 0) := "10000";
	constant inc_b 					: std_logic_vector(4 downto 0) := "10001";
	constant dec_a 					: std_logic_vector(4 downto 0) := "10010";
	constant dec_b 					: std_logic_vector(4 downto 0) := "10011";

	signal slow_clk : std_logic := '0';
	signal slow_clk_counter : unsigned( (CLOCK_COUNT_BUFFER_SIZE - 1) downto 0) := (others => '0');

	signal programCounter : integer range 0 to 31 := 0;
	signal reg_end : integer range 0 to 31 := 0; --guarda o endereço para manuseio
	signal reg_IR : std_logic_vector(4 downto 0) := (others => '0'); --guarda instrução

	-- ALU Signals
	signal reg_A, reg_B, result: std_logic_vector(4 downto 0) := (others => '0');
	signal opcode: std_logic_vector(4 downto 0) := (others => '0');
	
	-- LCD Signals
	signal INSTRUCTION : integer range 0 to 31 := 0;

	-- RAM Signals
	signal we: std_logic := '0'; -- write enable na ram
	signal address: integer range 0 to 31 := 0; --endereço da ram
	signal dataIn: std_logic_vector(4 downto 0) := (others => '0'); --data da ram
	signal dataOut: std_logic_vector(4 downto 0):= (others => '0');
	signal dataAt30: std_logic_vector(4 downto 0):= (others => '0');

	signal zero_read: std_logic :='0';
	signal negative_read: std_logic :='0';
	signal readingAddress: std_logic := '0';

	component RAM2
		port(
			clk: in std_logic; -- Clk to bv
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
			opcode: in std_logic_vector(4 downto 0);
			zero: out std_logic;
			negative: out std_logic;
			result: out std_logic_vector(4 downto 0)
		);
	end component;

	component LCD
		port (
			CLK : in std_logic; -- clk for display
			LCD_E : out std_logic; -- Enable do LCD
			LCD_RW : out std_logic; -- read or write
			LCD_RS : out std_logic; -- data manipulation or addressing
			DISABLE_STRATA_FLASH: out std_logic; -- Disable StrataFlash for display
			SF_D: out std_logic_vector(3 downto 0); -- Data sent to display
			INSTRUCTION: in integer range 0 to 31 --Current Intruction to be displayed
		);
	end component;
	
begin

	u_RAM : RAM2 port map (
		clk => slow_clk,
		reset => RESET,
		address => address,
		dataOut => dataOut,
		dataIn => dataIn,
		dataAt30 => dataAt30, -- LEDS,
		we => we
	);
	LEDS <= dataAt30;

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
		INSTRUCTION => INSTRUCTION
	);

	slowClockUpdate: process (CLK)
	begin
		if rising_edge(CLK) then
			slow_clk_counter <= slow_clk_counter + 1;
		end if;
	end process slowClockUpdate;
	slow_clk <= slow_clk_counter(CLOCK_COUNT_BUFFER_SIZE - 1);

	update: process (slow_clk)
	begin
		if rising_edge(slow_clk) then
			case state_reg is
				when start =>
					we <= '0';
					address <= 0;
					state_reg <= fetch;
				when fetch =>
					reg_IR <= dataOut;
					programCounter <= programCounter + 1;
					address <= address + 1;
					state_reg <= decode;
					INSTRUCTION <= to_integer(unsigned(dataOut));
				when decode =>
					case reg_IR is
						when mov_a_from_end =>
							reg_end <= to_integer(unsigned(dataOut));
							address <= to_integer(unsigned(dataOut));
							
						when mov_end_from_a =>
							we <= '1';
							address <= to_integer(unsigned(dataOut));
							dataIn <= reg_A;
						
						when mov_a_from_b =>
							NULL;
						
						when mov_b_from_a =>
							NULL;
							
						when add_a_to_b | sub_a_to_b | and_a_b | or_a_b | xor_a_b | not_a | nand_a_b | inc_a | inc_b | dec_a | dec_b =>
							opcode <= reg_IR;
						
						when jz_end =>
							reg_end <= to_integer(unsigned(dataOut));
						
						when jn_end =>
							reg_end <= to_integer(unsigned(dataOut));
							
						when jmp_end =>
							reg_end <= to_integer(unsigned(dataOut));
						
						when halt =>
							NULL;
							
						when others =>
							NULL;
					end case;

					state_reg <= execute;
				
				when execute =>
					case reg_IR is
						when mov_a_from_end =>
							reg_A <= dataOut;
							address <= programCounter + 1;
							programCounter <= programCounter + 1;
							
						when mov_end_from_a =>
							we <= '0';
							address <= programCounter + 1;
							programCounter <= programCounter + 1;
						
						when mov_a_from_b =>
							reg_A <= reg_B;
						
						when mov_b_from_a =>
							reg_B <= reg_A;

						when add_a_to_b | sub_a_to_b | and_a_b | or_a_b | xor_a_b | not_a | nand_a_b | inc_a | dec_a =>
							reg_A <= result;
							
						when inc_b | dec_b =>
							reg_B <= result;
						
						when jz_end =>
							if ZERO_READ = '1' then
								address <= reg_end;
								programCounter <= reg_end;
							else
								address <= programCounter + 1;
								programCounter <= programCounter + 1;
							end if;
						
						when jn_end =>
							if NEGATIVE_READ = '1' then
								address <= reg_end;
								programCounter <= reg_end;
							else
								address <= programCounter + 1;
								programCounter <= programCounter + 1;
							end if;

						when jmp_end =>
							address <= reg_end;
							programCounter <= reg_end;

						when halt =>
							NULL;
							
						when others =>
							NULL;						
					end case;

					if reg_IR /= halt then
						state_reg <= fetch;
					else
						state_reg <= execute;
					end if;
			end case;
		end if;
	end process update;
		
	ZERO     <= ZERO_READ;
	NEGATIVE <= NEGATIVE_READ;

end Behavioral;

