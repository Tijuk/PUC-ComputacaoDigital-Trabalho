library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CPU is
	generic( N: integer := 9 );
end CPU;
architecture Behavioral of CPU is
constant MOV_A_FROM_END : std_logic_vector(4 downto 0) := "00001";
constant MOV_END_FROM_A : std_logic_vector(4 downto 0) := "00010";
constant MOV_A_FROM_B	: std_logic_vector(4 downto 0) := "00011";
constant MOV_B_FROM_A	: std_logic_vector(4 downto 0) := "00100";
constant ADD_A_B 		: std_logic_vector(4 downto 0) := "00101";
constant SUB_A_B 		: std_logic_vector(4 downto 0) := "00110";
constant AND_A_B 		: std_logic_vector(4 downto 0) := "00111";
constant OR_A_B 		: std_logic_vector(4 downto 0) := "01000";
constant XOR_A_B 		: std_logic_vector(4 downto 0) := "01001";
constant NOT_A 			: std_logic_vector(4 downto 0) := "01010";
constant NAND_A_B 		: std_logic_vector(4 downto 0) := "01011";
constant JZ_END 		: std_logic_vector(4 downto 0) := "01100";
constant JN_END 		: std_logic_vector(4 downto 0) := "01101";
constant HALT 			: std_logic_vector(4 downto 0) := "01110";
constant JMP_END 		: std_logic_vector(4 downto 0) := "01111";
constant INC_A 			: std_logic_vector(4 downto 0) := "10000";
constant INC_B 			: std_logic_vector(4 downto 0) := "10001";
constant DEC_A 			: std_logic_vector(4 downto 0) := "10010";
constant DEC_B 			: std_logic_vector(4 downto 0) := "10011";



	type state is (
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
	type instruction_array_type is array (1 to 14) of state;
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

	signal state_reg, state_next : state := mov_a_from_end;
	signal count: unsigned((N-1) downto 0) := to_unsigned(0, N);
	signal count_next, count_reg : unsigned ((N-1) downto 0) := to_unsigned(0,N);
	signal count_tick : std_logic := '0';

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

	update_state: process(CLK)
	begin
		if(rising_edge(CLK)) then
			if(count_tick = '1') then
				case state_reg is
					when mov_a_from_end =>
						state_next <= mov_end_from_a;
					when mov_end_from_a =>
						state_next <= mov_a_from_b;
					when mov_a_from_b =>
						state_next <= mov_a_from_end;
				end case;
			end if;
		end if;
	end process update_state;
	
	count_next <= to_unsigned(0,N) when count_reg = (count - 1) else count_reg + 1;
	count_tick <='1' when count_reg = (count - 1) else '0';

end Behavioral;

