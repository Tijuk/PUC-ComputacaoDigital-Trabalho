library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
end ALU;

architecture Behavioral of ALU is

begin


end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity ALU is
	generic(
		opN: integer := 5
	);
	port(
		opA: in std_logic_vector(opN-1 downto 0); -- operandA
		opB: in std_logic_vector(opN-1 downto 0); -- operandB
		opcode: in std_logic_vector(4 downto 0);
		zero: out std_logic;
		negative: out std_logic;
		result: out std_logic_vector(opN-1 downto 0)
	);
end ALU;

architecture Behavioral of ALU is
	signal inResult : std_logic_vector(opN-1 downto 0) := (others => '0');
begin
	-- Result
	with opcode select inResult <=
		std_logic_vector(signed(opA) + signed(opB)) when "00101",
		std_logic_vector(signed(opA) - signed(opB)) when "00110",
		std_logic_vector(signed(opA) + 1) when "10000",
		std_logic_vector(signed(opA) - 1) when "10010",
		opA and opB when "00111",
		opA or opB when "01000",
		opA nand opB when "01011",
		opA xor opB when "01001",
		not opA when "01010",
		"00000" when others;
		
	-- Zero
	zero <= '1' when inResult = std_logic_vector(to_unsigned(0, inResult'length)) else '0';
	
	-- Negative
	negative <= inResult(inResult'high);
	
	result <= inResult;
end Behavioral;

