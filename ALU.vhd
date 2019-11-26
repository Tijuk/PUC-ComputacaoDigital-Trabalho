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
		opcode: in std_logic_vector(4 downto 0); -- codigo da instrução
		zero: out std_logic; -- flag de que operação resultou em zero
		negative: out std_logic;-- flag de que operação resultou em negativo
		result: out std_logic_vector(opN-1 downto 0) -- resultado da operação da ALU
	);
end ALU;

architecture Behavioral of ALU is
	signal inResult : std_logic_vector(opN-1 downto 0) := (others => '0');
begin
	--Retorna resultado de operação dependendo do codigo desta
	with opcode select inResult <=
		std_logic_vector(signed(reg_A) + signed(reg_B)) when "00101",
		std_logic_vector(signed(reg_A) - signed(reg_B)) when "00110",
		std_logic_vector(signed(reg_A) + 1) when "10000",
		std_logic_vector(signed(reg_A) - 1) when "10010",
		std_logic_vector(signed(reg_B) + 1) when "10001",
		std_logic_vector(signed(reg_B) - 1) when "10011",
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
	
	-- Negativo
	negative <=
		'0' when reset = '1'
		else inResult(inResult'high);
	
	result <= inResult;
end Behavioral;

