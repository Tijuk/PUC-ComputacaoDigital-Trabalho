library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
	generic(
		opN: integer := 5
	);
	port(
		reset: in std_logic;
		reg_A: in std_logic_vector(opN-1 downto 0); -- registrador A
		reg_B: in std_logic_vector(opN-1 downto 0); -- registrador B
		opcode: in integer range 0 to 31;
		zero: out std_logic;
		negative: out std_logic;
		result: out std_logic_vector(opN-1 downto 0)
	);
end ALU;

architecture Behavioral of ALU is
	signal inResult : std_logic_vector(opN-1 downto 0) := (others => '0');
	signal opcode_logic : std_logic_vector(4 downto 0) := (others => '0');
begin
	opcode_logic <= std_logic_vector(to_unsigned(opcode, opcode_logic'length));

	-- Result
	with opcode_logic select inResult <=
		std_logic_vector(signed(reg_A) + signed(reg_B)) when "00101",
		std_logic_vector(signed(reg_A) - signed(reg_B)) when "00110",
		std_logic_vector(signed(reg_A) + 1) when "10000",
		std_logic_vector(signed(reg_A) - 1) when "10010",
		reg_A and reg_B when "00111",
		reg_A or reg_B when "01000",
		reg_A nand reg_B when "01011",
		reg_A xor reg_B when "01001",
		not reg_A when "01010",
		"00000" when others;
		
	-- Zero
	zero <=
		'0' when reset = '1' else
		'1' when inResult = std_logic_vector(to_unsigned(0, inResult'length))
		else '0';
	
	-- Negative
	negative <=
		'0' when reset = '1'
		else inResult(inResult'high);
	
	result <= inResult;
end Behavioral;

