library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

use work.myPKG.ALL;

entity MapChar is
	port(
		CLK: in std_logic;
		INSTRUCTION: in integer range 0 to 31;
		CHAR_AT: in unsigned(4 downto 0);
		LEFT: in std_logic;
		OUTPUT_BUFFER: out std_logic_vector(7 downto 0)
	);

end MapChar;

architecture Behavioral of MapChar is

	type string is array (0 to 11) of std_logic_vector(7 downto 0);



--	-- Characters
--	constant alpha_a_uc : std_logic_vector(7 downto 0) := "01000001";
--	constant alpha_b_uc : std_logic_vector(7 downto 0) := "01000010";
--	constant alpha_c_uc : std_logic_vector(7 downto 0) := "01000011";
--	constant alpha_d_uc : std_logic_vector(7 downto 0) := "01000100";
--	constant alpha_d_lc : std_logic_vector(7 downto 0) := "01100100";
--	constant alpha_e_uc : std_logic_vector(7 downto 0) := "01000101";
--	constant alpha_e_lc : std_logic_vector(7 downto 0) := "01100101";
--	constant alpha_h_uc : std_logic_vector(7 downto 0) := "01001000";
--	constant alpha_i_uc : std_logic_vector(7 downto 0) := "01001001";
--	constant alpha_j_uc : std_logic_vector(7 downto 0) := "01001010";
--	constant alpha_l_uc : std_logic_vector(7 downto 0) := "01001100";
--	constant alpha_m_uc : std_logic_vector(7 downto 0) := "01001101";
--	constant alpha_n_uc : std_logic_vector(7 downto 0) := "01001110";
--	constant alpha_n_lc : std_logic_vector(7 downto 0) := "01101110";
--	constant alpha_o_uc : std_logic_vector(7 downto 0) := "01001111";
--	constant alpha_p_uc : std_logic_vector(7 downto 0) := "01010000";
--	constant alpha_r_uc : std_logic_vector(7 downto 0) := "01010010";
--	constant alpha_s_uc : std_logic_vector(7 downto 0) := "01010011";
--	constant alpha_t_uc : std_logic_vector(7 downto 0) := "01010100";
--	constant alpha_u_uc : std_logic_vector(7 downto 0) := "01010101";
--	constant alpha_v_uc : std_logic_vector(7 downto 0) := "01010110";
--	constant alpha_x_uc : std_logic_vector(7 downto 0) := "01011000";
--	constant alpha_z_uc : std_logic_vector(7 downto 0) := "01011010";

	-- Symbols
	constant symbol_comma			:std_logic_vector(7 downto 0) := "00101100";
	constant symbol_bracket_open	:std_logic_vector(7 downto 0) := "01011011";
	constant symbol_bracket_close	:std_logic_vector(7 downto 0) := "01011101";
	constant symbol_space			:std_logic_vector(7 downto 0) := "00100000";

	constant MOV_A_TO_END : string := (
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


	constant MOV_END_TO_A : string := (
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


	constant MOV_A_TO_B : string := (
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


	constant MOV_B_TO_A : string := (
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

begin

	OUTPUT_BUFFER <=
		alpha_m_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 0) else
		alpha_o_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 1) else
		alpha_v_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 2) else
		symbol_space when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 3) else
		alpha_a_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 4) else
		alpha_a_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 5) else
		alpha_a_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 6) else
		alpha_a_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 7) else
		alpha_a_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 8) else
		alpha_a_uc when (INSTRUCTION = 0 and to_integer(CHAR_AT) = 9) else
		
		alpha_m_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 0) else
		alpha_o_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 1) else
		alpha_v_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 2) else
		symbol_space when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 3) else
		alpha_b_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 4) else
		alpha_b_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 5) else
		alpha_b_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 6) else
		alpha_b_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 7) else
		alpha_b_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 8) else
		alpha_b_uc when (INSTRUCTION = 1 and to_integer(CHAR_AT) = 9) else
		symbol_bracket_close;

	-- update_out: process(CLK)
	-- begin
	-- 	if (falling_edge(CLK)) then
			-- if ( INSTRUCTION = 1) then -- MOV A, [end]
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- M
			-- 			OUTPUT_BUFFER <= alpha_m_uc;
			-- 		when 1 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 2 => -- V
			-- 			OUTPUT_BUFFER <= alpha_v_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- [
			-- 			OUTPUT_BUFFER <= symbol_bracket_open;
			-- 		when 8 => -- e
			-- 			OUTPUT_BUFFER <= alpha_e_lc;
			-- 		when 9 => -- n
			-- 			OUTPUT_BUFFER <= alpha_n_lc;
			-- 		when 10 => -- d
			-- 			OUTPUT_BUFFER <= alpha_d_lc;
			-- 		when 11 => -- ]
			-- 			OUTPUT_BUFFER <= symbol_bracket_close;
			-- 		when others =>
					
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 2) then -- MOV [end], A
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- M
			-- 			OUTPUT_BUFFER <= alpha_m_uc;
			-- 		when 1 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 2 => -- V
			-- 			OUTPUT_BUFFER <= alpha_v_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- [
			-- 			OUTPUT_BUFFER <= symbol_bracket_open;
			-- 		when 5 => -- e
			-- 			OUTPUT_BUFFER <= alpha_e_lc;
			-- 		when 6 => -- n
			-- 			OUTPUT_BUFFER <= alpha_n_lc;
			-- 		when 7 => -- d
			-- 			OUTPUT_BUFFER <= alpha_d_lc;
			-- 		when 8 => -- ]
			-- 			OUTPUT_BUFFER <= symbol_bracket_close;
			-- 		when 9 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 3) then -- MOV A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- M
			-- 			OUTPUT_BUFFER <= alpha_m_uc;
			-- 		when 1 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 2 => -- V
			-- 			OUTPUT_BUFFER <= alpha_v_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 4) then -- MOV B, A
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- M
			-- 			OUTPUT_BUFFER <= alpha_m_uc;
			-- 		when 1 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 2 => -- V
			-- 			OUTPUT_BUFFER <= alpha_v_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 5) then -- ADD A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 1 => -- D
			-- 			OUTPUT_BUFFER <= alpha_d_uc;
			-- 		when 2 => -- D
			-- 			OUTPUT_BUFFER <= alpha_d_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 6) then -- SUB A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- S
			-- 			OUTPUT_BUFFER <= alpha_s_uc;
			-- 		when 1 => -- U
			-- 			OUTPUT_BUFFER <= alpha_u_uc;
			-- 		when 2 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 7) then -- AND A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 1 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 2 => -- D
			-- 			OUTPUT_BUFFER <= alpha_d_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 8) then -- OR A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 1 => -- R
			-- 			OUTPUT_BUFFER <= alpha_r_uc;
			-- 		when 2 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 3 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 4 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 9) then -- XOR A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- X
			-- 			OUTPUT_BUFFER <= alpha_x_uc;
			-- 		when 1 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 2 => -- R
			-- 			OUTPUT_BUFFER <= alpha_r_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 10) then -- NOT A
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 1 => -- O
			-- 			OUTPUT_BUFFER <= alpha_o_uc;
			-- 		when 2 => -- T
			-- 			OUTPUT_BUFFER <= alpha_t_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 11) then -- NAND A, B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 1 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 2 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 3 => -- D
			-- 			OUTPUT_BUFFER <= alpha_d_uc;
			-- 		when 4 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 5 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 6 => -- ,
			-- 			OUTPUT_BUFFER <= symbol_comma;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 12 ) then -- JZ [end]
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- J
			-- 			OUTPUT_BUFFER <= alpha_j_uc;
			-- 		when 1 => -- Z
			-- 			OUTPUT_BUFFER <= alpha_z_uc;
			-- 		when 2 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 3 => -- [
			-- 			OUTPUT_BUFFER <= symbol_bracket_open;
			-- 		when 4 => -- e
			-- 			OUTPUT_BUFFER <= alpha_e_lc;
			-- 		when 5 => -- n
			-- 			OUTPUT_BUFFER <= alpha_n_lc;
			-- 		when 6 => -- d
			-- 			OUTPUT_BUFFER <= alpha_d_lc;
			-- 		when 7 => -- ]
			-- 			OUTPUT_BUFFER <= symbol_bracket_close;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 13) then -- JN [end]
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- J
			-- 			OUTPUT_BUFFER <= alpha_j_uc;
			-- 		when 1 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 2 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 3 => -- [
			-- 			OUTPUT_BUFFER <= symbol_bracket_open;
			-- 		when 4 => -- e
			-- 			OUTPUT_BUFFER <= alpha_e_lc;
			-- 		when 5 => -- n
			-- 			OUTPUT_BUFFER <= alpha_n_lc;
			-- 		when 6 => -- d
			-- 			OUTPUT_BUFFER <= alpha_d_lc;
			-- 		when 7 => -- ]
			-- 			OUTPUT_BUFFER <= symbol_bracket_close;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 14) then -- HALT
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- H
			-- 			OUTPUT_BUFFER <= alpha_h_uc;
			-- 		when 1 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 2 => -- L
			-- 			OUTPUT_BUFFER <= alpha_l_uc;
			-- 		when 3 => -- T
			-- 			OUTPUT_BUFFER <= alpha_t_uc;
			-- 		when 4 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 15) then -- JMP [end]
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- J
			-- 			OUTPUT_BUFFER <= alpha_j_uc;
			-- 		when 1 => -- M
			-- 			OUTPUT_BUFFER <= alpha_m_uc;
			-- 		when 2 => -- P
			-- 			OUTPUT_BUFFER <= alpha_p_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- [
			-- 			OUTPUT_BUFFER <= symbol_bracket_open;
			-- 		when 5 => -- e
			-- 			OUTPUT_BUFFER <= alpha_e_lc;
			-- 		when 6 => -- n
			-- 			OUTPUT_BUFFER <= alpha_n_lc;
			-- 		when 7 => -- d
			-- 			OUTPUT_BUFFER <= alpha_d_lc;
			-- 		when 8 => -- ]
			-- 			OUTPUT_BUFFER <= symbol_bracket_close;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 16) then -- INC A
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- I
			-- 			OUTPUT_BUFFER <= alpha_i_uc;
			-- 		when 1 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 2 => -- C
			-- 			OUTPUT_BUFFER <= alpha_c_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 17) then -- INC B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- I
			-- 			OUTPUT_BUFFER <= alpha_i_uc;
			-- 		when 1 => -- N
			-- 			OUTPUT_BUFFER <= alpha_n_uc;
			-- 		when 2 => -- C
			-- 			OUTPUT_BUFFER <= alpha_c_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 18) then -- DEC A
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- D
			-- 			OUTPUT_BUFFER <= alpha_d_uc;
			-- 		when 1 => -- E
			-- 			OUTPUT_BUFFER <= alpha_e_uc;
			-- 		when 2 => -- C
			-- 			OUTPUT_BUFFER <= alpha_c_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- A
			-- 			OUTPUT_BUFFER <= alpha_a_uc;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
			-- if ( INSTRUCTION = 19 ) then -- DEC B
			-- 	case to_integer(CHAR_AT) is
			-- 		when 0 => -- D
			-- 			OUTPUT_BUFFER <= alpha_d_uc;
			-- 		when 1 => -- E
			-- 			OUTPUT_BUFFER <= alpha_e_uc;
			-- 		when 2 => -- C
			-- 			OUTPUT_BUFFER <= alpha_c_uc;
			-- 		when 3 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 4 => -- B
			-- 			OUTPUT_BUFFER <= alpha_b_uc;
			-- 		when 5 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 6 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 7 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 8 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 9 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 10 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when 11 => -- ' '
			-- 			OUTPUT_BUFFER <= symbol_space;
			-- 		when others =>
			-- 	end case;
			-- end if;
	-- 	end if;
	-- end process update_out;

end Behavioral;
