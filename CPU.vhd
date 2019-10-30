----------------------------------------------------------------------------------
--
--
--
--
--
--
--
-- 						BOTAR ESTE COMO ARQUIVO PRINCIPAL
--
--
--
--
--
--
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CPU is
end CPU;

architecture Behavioral of CPU is

begin

-- Mapeamento de codigo de instrução para estados correspondentes
type instruction_array_type is array (1 to 14) of estado;
signal instruction_array : instruction_array_type := (
	 1=> mov_a_from_end, 
	 2=> mov_end_from_a, 
	 3=> mov_a_from_b, 
	 4=> mov_b_from_a, 
	 5=> add_a_to_b, 
	 6=> sub_a_to_b, 
	 7=> and_a_b, 
	 8=> or_a_b, 
	 9=> xor_a_b,
	10=> not_a, 
	11=> nand_a_b, 
	12=> jz_end, 
	13=> jn_end, 
	14=> halt
);
end Behavioral;

