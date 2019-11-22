library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

use work.myPKG.ALL;

entity MapChar is
	port(
		CLK: in std_logic;
		INSTRUCTION: in integer range 0 to 31;
		CHAR_AT: in unsigned(4 downto 0);
		OUTPUT_BUFFER: out std_logic_vector(7 downto 0)
	);

end MapChar;

architecture Behavioral of MapChar is

	type string is array (0 to 11) of std_logic_vector(7 downto 0);

	-- Characters
	constant alpha_a_uc : std_logic_vector(7 downto 0) := "01000001"; -- A
	constant alpha_b_uc : std_logic_vector(7 downto 0) := "01000010"; -- B
	constant alpha_c_uc : std_logic_vector(7 downto 0) := "01000011"; -- C
	constant alpha_d_uc : std_logic_vector(7 downto 0) := "01000100"; -- D
	constant alpha_d_lc : std_logic_vector(7 downto 0) := "01100100"; -- d
	constant alpha_e_uc : std_logic_vector(7 downto 0) := "01000101"; -- E
	constant alpha_e_lc : std_logic_vector(7 downto 0) := "01100101"; -- e
	constant alpha_h_uc : std_logic_vector(7 downto 0) := "01001000"; -- H
	constant alpha_i_uc : std_logic_vector(7 downto 0) := "01001001"; -- I
	constant alpha_j_uc : std_logic_vector(7 downto 0) := "01001010"; -- J
	constant alpha_l_uc : std_logic_vector(7 downto 0) := "01001100"; -- L
	constant alpha_m_uc : std_logic_vector(7 downto 0) := "01001101"; -- M
	constant alpha_n_uc : std_logic_vector(7 downto 0) := "01001110"; -- N
	constant alpha_n_lc : std_logic_vector(7 downto 0) := "01101110"; -- n
	constant alpha_o_uc : std_logic_vector(7 downto 0) := "01001111"; -- O
	constant alpha_p_uc : std_logic_vector(7 downto 0) := "01010000"; -- P
	constant alpha_r_uc : std_logic_vector(7 downto 0) := "01010010"; -- R
	constant alpha_s_uc : std_logic_vector(7 downto 0) := "01010011"; -- S
	constant alpha_t_uc : std_logic_vector(7 downto 0) := "01010100"; -- T
	constant alpha_u_uc : std_logic_vector(7 downto 0) := "01010101"; -- U
	constant alpha_v_uc : std_logic_vector(7 downto 0) := "01010110"; -- V
	constant alpha_x_uc : std_logic_vector(7 downto 0) := "01011000"; -- X
	constant alpha_z_uc : std_logic_vector(7 downto 0) := "01011010"; -- Z

	-- Symbols
	constant symbol_comma			:std_logic_vector(7 downto 0) := "00101100"; -- ,
	constant symbol_bracket_open	:std_logic_vector(7 downto 0) := "01011011"; -- [
	constant symbol_bracket_close	:std_logic_vector(7 downto 0) := "01011101"; -- ]
	constant symbol_space			:std_logic_vector(7 downto 0) := "00100000"; -- (space)

	constant mov_a_from_end : string := (
		0 => alpha_m_uc(7 downto 0),
		1 => alpha_o_uc(7 downto 0),
		2 => alpha_v_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_bracket_open(7 downto 0),
		8 => alpha_e_lc(7 downto 0),
		9 => alpha_n_lc(7 downto 0),
		10 => alpha_d_lc(7 downto 0),
		11 => symbol_bracket_close(7 downto 0)
	);


	constant mov_end_from_a : string := (
		0 => alpha_m_uc(7 downto 0),
		1 => alpha_o_uc(7 downto 0),
		2 => alpha_v_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => symbol_bracket_open(7 downto 0),
		5 => alpha_e_lc(7 downto 0),
		6 => alpha_n_lc(7 downto 0),
		7 => alpha_d_lc(7 downto 0),
		8 => symbol_bracket_close(7 downto 0),
		9 => symbol_comma(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => alpha_a_uc(7 downto 0)
	);


	constant mov_a_from_b : string := (
		0 => alpha_m_uc(7 downto 0),
		1 => alpha_o_uc(7 downto 0),
		2 => alpha_v_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => alpha_b_uc(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant mov_b_from_a : string := (
		0 => alpha_m_uc(7 downto 0),
		1 => alpha_o_uc(7 downto 0),
		2 => alpha_v_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_b_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => alpha_a_uc(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant ADD_A_TO_B : string := (
		0 => alpha_a_uc(7 downto 0),
		1 => alpha_d_uc(7 downto 0),
		2 => alpha_d_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => alpha_b_uc(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant SUB_A_TO_B : string := (
		0 => alpha_s_uc(7 downto 0),
		1 => alpha_u_uc(7 downto 0),
		2 => alpha_b_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => alpha_b_uc(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant AND_A_TO_B : string := (
		0 => alpha_a_uc(7 downto 0),
		1 => alpha_n_uc(7 downto 0),
		2 => alpha_d_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => alpha_b_uc(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant OR_A_TO_B : string := (
		0 => alpha_o_uc(7 downto 0),
		1 => alpha_r_uc(7 downto 0),
		2 => symbol_space(7 downto 0),
		3 => alpha_a_uc(7 downto 0),
		4 => symbol_comma(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => alpha_b_uc(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant XOR_A_TO_B : string := (
		0 => alpha_x_uc(7 downto 0),
		1 => alpha_o_uc(7 downto 0),
		2 => alpha_r_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_comma(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => alpha_b_uc(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant NOT_A : string := (
		0 => alpha_n_uc(7 downto 0),
		1 => alpha_o_uc(7 downto 0),
		2 => alpha_t_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant NAND_A_TO_B : string := (
		0 => alpha_n_uc(7 downto 0),
		1 => alpha_a_uc(7 downto 0),
		2 => alpha_n_uc(7 downto 0),
		3 => alpha_d_uc(7 downto 0),
		4 => symbol_space(7 downto 0),
		5 => alpha_a_uc(7 downto 0),
		6 => symbol_comma(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => alpha_b_uc(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant JZ_END : string := (
		0 => alpha_j_uc(7 downto 0),
		1 => alpha_z_uc(7 downto 0),
		2 => symbol_space(7 downto 0),
		3 => symbol_bracket_open(7 downto 0),
		4 => alpha_e_lc(7 downto 0),
		5 => alpha_n_lc(7 downto 0),
		6 => alpha_d_lc(7 downto 0),
		7 => symbol_bracket_close(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant JN_END : string := (
		0 => alpha_j_uc(7 downto 0),
		1 => alpha_n_uc(7 downto 0),
		2 => symbol_space(7 downto 0),
		3 => symbol_bracket_open(7 downto 0),
		4 => alpha_e_lc(7 downto 0),
		5 => alpha_n_lc(7 downto 0),
		6 => alpha_d_lc(7 downto 0),
		7 => symbol_bracket_close(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant HALT : string := (
		0 => alpha_h_uc(7 downto 0),
		1 => alpha_a_uc(7 downto 0),
		2 => alpha_l_uc(7 downto 0),
		3 => alpha_t_uc(7 downto 0),
		4 => symbol_space(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant JMP_END : string := (
		0 => alpha_j_uc(7 downto 0),
		1 => alpha_m_uc(7 downto 0),
		2 => alpha_p_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => symbol_bracket_open(7 downto 0),
		5 => alpha_e_lc(7 downto 0),
		6 => alpha_n_lc(7 downto 0),
		7 => alpha_d_lc(7 downto 0),
		8 => symbol_bracket_close(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant INC_A : string := (
		0 => alpha_i_uc(7 downto 0),
		1 => alpha_n_uc(7 downto 0),
		2 => alpha_c_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant INC_B : string := (
		0 => alpha_i_uc(7 downto 0),
		1 => alpha_n_uc(7 downto 0),
		2 => alpha_c_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_b_uc(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant DEC_A : string := (
		0 => alpha_d_uc(7 downto 0),
		1 => alpha_e_uc(7 downto 0),
		2 => alpha_c_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_a_uc(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);


	constant DEC_B : string := (
		0 => alpha_d_uc(7 downto 0),
		1 => alpha_e_uc(7 downto 0),
		2 => alpha_c_uc(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => alpha_b_uc(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_space(7 downto 0)
	);

	constant EMPTY_STRING: string := (
		0 => symbol_bracket_open(7 downto 0),
		1 => symbol_space(7 downto 0),
		2 => symbol_space(7 downto 0),
		3 => symbol_space(7 downto 0),
		4 => symbol_space(7 downto 0),
		5 => symbol_space(7 downto 0),
		6 => symbol_space(7 downto 0),
		7 => symbol_space(7 downto 0),
		8 => symbol_space(7 downto 0),
		9 => symbol_space(7 downto 0),
		10 => symbol_space(7 downto 0),
		11 => symbol_bracket_close(7 downto 0)
	);

	type char_table_type is array (0 to 19) of string;

	constant CHAR_TABLE : char_table_type := (
		0 => EMPTY_STRING,
		1 => mov_a_from_end,
		2 => mov_end_from_a,
		3 => mov_a_from_b,
		4 => mov_b_from_a,
		5 => ADD_A_TO_B,
		6 => SUB_A_TO_B,
		7 => AND_A_TO_B,
		8 => OR_A_TO_B,
		9 => XOR_A_TO_B,
		10 => NOT_A,
		11 => NAND_A_TO_B,
		12 => JZ_END,
		13 => JN_END,
		14 => HALT,
		15 => JMP_END,
		16 => INC_A,
		17 => INC_B,
		18 => DEC_A,
		19 => DEC_B
	);

begin
	OUTPUT_BUFFER <= CHAR_TABLE(INSTRUCTION)(to_integer(CHAR_AT));

end Behavioral;
