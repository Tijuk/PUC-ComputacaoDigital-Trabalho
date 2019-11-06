library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MapChar is
	port(
		INSTRUCTION: in std_logic_vector(4 downto 0);
		CHAR_AT: in unsigned(4 downto 0);
		LEFT: in std_logic;
		OUTPUT: out std_logic_vector(7 downto 0)
	);

end MapChar;

architecture Behavioral of MapChar is

	type string is array (0 to 11) of std_logic_vector(7 downto 0);

	-- Characters
	constant alpha_a_uc : std_logic_vector(7 downto 0) := "01000001";
	constant alpha_b_uc : std_logic_vector(7 downto 0) := "01000010";
	constant alpha_c_uc : std_logic_vector(7 downto 0) := "01000011";
	constant alpha_d_uc : std_logic_vector(7 downto 0) := "01000100";
	constant alpha_d_lc : std_logic_vector(7 downto 0) := "01100100";
	constant alpha_e_uc : std_logic_vector(7 downto 0) := "01000101";
	constant alpha_e_lc : std_logic_vector(7 downto 0) := "01100101";
	constant alpha_h_uc : std_logic_vector(7 downto 0) := "01001000";
	constant alpha_i_uc : std_logic_vector(7 downto 0) := "01001001";
	constant alpha_j_uc : std_logic_vector(7 downto 0) := "01001010";
	constant alpha_l_uc : std_logic_vector(7 downto 0) := "01001100";
	constant alpha_m_uc : std_logic_vector(7 downto 0) := "01001101";
	constant alpha_n_uc : std_logic_vector(7 downto 0) := "01001110";
	constant alpha_n_lc : std_logic_vector(7 downto 0) := "01101110";
	constant alpha_o_uc : std_logic_vector(7 downto 0) := "01001111";
	constant alpha_p_uc : std_logic_vector(7 downto 0) := "01010000";
	constant alpha_r_uc : std_logic_vector(7 downto 0) := "01010010";
	constant alpha_s_uc : std_logic_vector(7 downto 0) := "01010011";
	constant alpha_t_uc : std_logic_vector(7 downto 0) := "01010100";
	constant alpha_u_uc : std_logic_vector(7 downto 0) := "01010101";
	constant alpha_v_uc : std_logic_vector(7 downto 0) := "01010110";
	constant alpha_x_uc : std_logic_vector(7 downto 0) := "01011000";
	constant alpha_z_uc : std_logic_vector(7 downto 0) := "01011010";

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
		11 => symbol_bracket_close(7 downto 0),
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
		11 => alpha_a_uc(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
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
		11 => symbol_space(7 downto 0),
	);



begin
	-- update_out: process(CLK)
	-- begin
	-- 	if ( INSTRUCTIONS = "00001") then -- MOV A, [end]
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- M
	-- 				OUTPUT <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
	-- 			when 1 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 2 => -- V
	-- 				OUTPUT <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- [
	-- 				OUTPUT <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
	-- 			when 8 => -- e
	-- 				OUTPUT <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
	-- 			when 9 => -- n
	-- 				OUTPUT <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
	-- 			when 10 => -- d
	-- 				OUTPUT <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
	-- 			when 11 => -- ]
	-- 				OUTPUT <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "00010") then -- MOV [end], A
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- M
	-- 				OUTPUT <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
	-- 			when 1 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 2 => -- V
	-- 				OUTPUT <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- [
	-- 				OUTPUT <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
	-- 			when 5 => -- e
	-- 				OUTPUT <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
	-- 			when 6 => -- n
	-- 				OUTPUT <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
	-- 			when 7 => -- d
	-- 				OUTPUT <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
	-- 			when 8 => -- ]
	-- 				OUTPUT <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
	-- 			when 9 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "00011") then -- MOV A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- M
	-- 				OUTPUT <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
	-- 			when 1 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 2 => -- V
	-- 				OUTPUT <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "00100") then -- MOV B, A
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- M
	-- 				OUTPUT <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
	-- 			when 1 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 2 => -- V
	-- 				OUTPUT <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "00101") then -- ADD A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 1 => -- D
	-- 				OUTPUT <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
	-- 			when 2 => -- D
	-- 				OUTPUT <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "00110") then -- SUB A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- S
	-- 				OUTPUT <= alpha_s_uc(7 downto 4) when LEFT = '0' else alpha_s_uc(3 downto 0);
	-- 			when 1 => -- U
	-- 				OUTPUT <= alpha_u_uc(7 downto 4) when LEFT = '0' else alpha_u_uc(3 downto 0);
	-- 			when 2 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "00111") then -- AND A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 1 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 2 => -- D
	-- 				OUTPUT <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01000") then -- OR A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 1 => -- R
	-- 				OUTPUT <= alpha_r_uc(7 downto 4) when LEFT = '0' else alpha_r_uc(3 downto 0);
	-- 			when 2 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 3 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 4 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01001") then -- XOR A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- X
	-- 				OUTPUT <= alpha_x_uc(7 downto 4) when LEFT = '0' else alpha_x_uc(3 downto 0);
	-- 			when 1 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 2 => -- R
	-- 				OUTPUT <= alpha_r_uc(7 downto 4) when LEFT = '0' else alpha_r_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01010") then -- NOT A
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 1 => -- O
	-- 				OUTPUT <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
	-- 			when 2 => -- T
	-- 				OUTPUT <= alpha_t_uc(7 downto 4) when LEFT = '0' else alpha_t_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01011") then -- NAND A, B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 1 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 2 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 3 => -- D
	-- 				OUTPUT <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
	-- 			when 4 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 5 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 6 => -- ,
	-- 				OUTPUT <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01100") then -- JZ [end]
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- J
	-- 				OUTPUT <= alpha_j_uc(7 downto 4) when LEFT = '0' else alpha_j_uc(3 downto 0);
	-- 			when 1 => -- Z
	-- 				OUTPUT <= alpha_z_uc(7 downto 4) when LEFT = '0' else alpha_z_uc(3 downto 0);
	-- 			when 2 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 3 => -- [
	-- 				OUTPUT <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
	-- 			when 4 => -- e
	-- 				OUTPUT <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
	-- 			when 5 => -- n
	-- 				OUTPUT <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
	-- 			when 6 => -- d
	-- 				OUTPUT <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
	-- 			when 7 => -- ]
	-- 				OUTPUT <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01101") then -- JN [end]
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- J
	-- 				OUTPUT <= alpha_j_uc(7 downto 4) when LEFT = '0' else alpha_j_uc(3 downto 0);
	-- 			when 1 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 2 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 3 => -- [
	-- 				OUTPUT <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
	-- 			when 4 => -- e
	-- 				OUTPUT <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
	-- 			when 5 => -- n
	-- 				OUTPUT <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
	-- 			when 6 => -- d
	-- 				OUTPUT <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
	-- 			when 7 => -- ]
	-- 				OUTPUT <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01110") then -- HALT
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- H
	-- 				OUTPUT <= alpha_h_uc(7 downto 4) when LEFT = '0' else alpha_h_uc(3 downto 0);
	-- 			when 1 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 2 => -- L
	-- 				OUTPUT <= alpha_l_uc(7 downto 4) when LEFT = '0' else alpha_l_uc(3 downto 0);
	-- 			when 3 => -- T
	-- 				OUTPUT <= alpha_t_uc(7 downto 4) when LEFT = '0' else alpha_t_uc(3 downto 0);
	-- 			when 4 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "01111") then -- JMP [end]
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- J
	-- 				OUTPUT <= alpha_j_uc(7 downto 4) when LEFT = '0' else alpha_j_uc(3 downto 0);
	-- 			when 1 => -- M
	-- 				OUTPUT <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
	-- 			when 2 => -- P
	-- 				OUTPUT <= alpha_p_uc(7 downto 4) when LEFT = '0' else alpha_p_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- [
	-- 				OUTPUT <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
	-- 			when 5 => -- e
	-- 				OUTPUT <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
	-- 			when 6 => -- n
	-- 				OUTPUT <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
	-- 			when 7 => -- d
	-- 				OUTPUT <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
	-- 			when 8 => -- ]
	-- 				OUTPUT <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "10000") then -- INC A
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- I
	-- 				OUTPUT <= alpha_i_uc(7 downto 4) when LEFT = '0' else alpha_i_uc(3 downto 0);
	-- 			when 1 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 2 => -- C
	-- 				OUTPUT <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "10001") then -- INC B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- I
	-- 				OUTPUT <= alpha_i_uc(7 downto 4) when LEFT = '0' else alpha_i_uc(3 downto 0);
	-- 			when 1 => -- N
	-- 				OUTPUT <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
	-- 			when 2 => -- C
	-- 				OUTPUT <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "10010") then -- DEC A
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- D
	-- 				OUTPUT <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
	-- 			when 1 => -- E
	-- 				OUTPUT <= alpha_e_uc(7 downto 4) when LEFT = '0' else alpha_e_uc(3 downto 0);
	-- 			when 2 => -- C
	-- 				OUTPUT <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- A
	-- 				OUTPUT <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;
	-- 	if ( INSTRUCTIONS = "10011") then -- DEC B
	-- 		case to_unsigned(CHAR_AT, 4) is
	-- 			when 0 => -- D
	-- 				OUTPUT <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
	-- 			when 1 => -- E
	-- 				OUTPUT <= alpha_e_uc(7 downto 4) when LEFT = '0' else alpha_e_uc(3 downto 0);
	-- 			when 2 => -- C
	-- 				OUTPUT <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
	-- 			when 3 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 4 => -- B
	-- 				OUTPUT <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
	-- 			when 5 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 6 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 7 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 8 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 9 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 10 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when 11 => -- ' '
	-- 				OUTPUT <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
	-- 			when others =>;
	-- 		end case;
	-- 	end if;

	-- end process update_out;

end Behavioral;

-- begin
-- 	update_out: process(CLK)
-- 	begin
-- 		case INSTRUCTION is
-- 			when "00001" => -- MOV A, [end]
-- 				OUTPUT(0) <= "01001101"; -- M
-- 				OUTPUT(1) <= "01001111"; -- O
-- 				OUTPUT(2) <= "01010110"; -- V
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01011011"; -- [
-- 				OUTPUT(8) <= "01100101"; -- e
-- 				OUTPUT(9) <= "01101110"; -- n
-- 				OUTPUT(10) <= "01100100"; -- d
-- 				OUTPUT(11) <= "01011101"; -- ]
-- 			when "00010" => -- MOV [end], A
-- 				OUTPUT(0) <= "01001101"; -- M
-- 				OUTPUT(1) <= "01001111"; -- O
-- 				OUTPUT(2) <= "01010110"; -- V
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01011011"; -- [
-- 				OUTPUT(5) <= "01100101"; -- e
-- 				OUTPUT(6) <= "01101110"; -- n
-- 				OUTPUT(7) <= "01100100"; -- d
-- 				OUTPUT(8) <= "01011101"; -- ]
-- 				OUTPUT(9) <= "00101100"; -- ,
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "01000001"; -- A
-- 			when "00011" => -- MOV A, B
-- 				OUTPUT(0) <= "01001101"; -- M
-- 				OUTPUT(1) <= "01001111"; -- O
-- 				OUTPUT(2) <= "01010110"; -- V
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01000010"; -- B
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "00100" => -- MOV B, A
-- 				OUTPUT(0) <= "01001101"; -- M
-- 				OUTPUT(1) <= "01001111"; -- O
-- 				OUTPUT(2) <= "01010110"; -- V
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000010"; -- B
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01000001"; -- A
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "00101" => -- ADD A, B
-- 				OUTPUT(0) <= "01000001"; -- A
-- 				OUTPUT(1) <= "01000100"; -- D
-- 				OUTPUT(2) <= "01000100"; -- D
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01000010"; -- B
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "00110" => -- SUB A, B
-- 				OUTPUT(0) <= "01010011"; -- S
-- 				OUTPUT(1) <= "01010101"; -- U
-- 				OUTPUT(2) <= "01000010"; -- B
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01000010"; -- B
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "00111" => -- AND A, B
-- 				OUTPUT(0) <= "01000001"; -- A
-- 				OUTPUT(1) <= "01001110"; -- N
-- 				OUTPUT(2) <= "01000100"; -- D
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01000010"; -- B
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01000" => -- OR A, B
-- 				OUTPUT(0) <= "01001111"; -- O
-- 				OUTPUT(1) <= "01010010"; -- R
-- 				OUTPUT(2) <= "00100000"; -- ' '
-- 				OUTPUT(3) <= "01000001"; -- A
-- 				OUTPUT(4) <= "00101100"; -- ,
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "01000010"; -- B
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01001" => -- XOR A, B
-- 				OUTPUT(0) <= "01011000"; -- X
-- 				OUTPUT(1) <= "01001111"; -- O
-- 				OUTPUT(2) <= "01010010"; -- R
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00101100"; -- ,
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "01000010"; -- B
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01010" => -- NOT A
-- 				OUTPUT(0) <= "01001110"; -- N
-- 				OUTPUT(1) <= "01001111"; -- O
-- 				OUTPUT(2) <= "01010100"; -- T
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01011" => -- NAND A, B
-- 				OUTPUT(0) <= "01001110"; -- N
-- 				OUTPUT(1) <= "01000001"; -- A
-- 				OUTPUT(2) <= "01001110"; -- N
-- 				OUTPUT(3) <= "01000100"; -- D
-- 				OUTPUT(4) <= "00100000"; -- ' '
-- 				OUTPUT(5) <= "01000001"; -- A
-- 				OUTPUT(6) <= "00101100"; -- ,
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "01000010"; -- B
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01100" => -- JZ [end]
-- 				OUTPUT(0) <= "01001010"; -- J
-- 				OUTPUT(1) <= "01011010"; -- Z
-- 				OUTPUT(2) <= "00100000"; -- ' '
-- 				OUTPUT(3) <= "01011011"; -- [
-- 				OUTPUT(4) <= "01100101"; -- e
-- 				OUTPUT(5) <= "01101110"; -- n
-- 				OUTPUT(6) <= "01100100"; -- d
-- 				OUTPUT(7) <= "01011101"; -- ]
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01101" => -- JN [end]
-- 				OUTPUT(0) <= "01001010"; -- J
-- 				OUTPUT(1) <= "01001110"; -- N
-- 				OUTPUT(2) <= "00100000"; -- ' '
-- 				OUTPUT(3) <= "01011011"; -- [
-- 				OUTPUT(4) <= "01100101"; -- e
-- 				OUTPUT(5) <= "01101110"; -- n
-- 				OUTPUT(6) <= "01100100"; -- d
-- 				OUTPUT(7) <= "01011101"; -- ]
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01110" => -- HALT
-- 				OUTPUT(0) <= "01001000"; -- H
-- 				OUTPUT(1) <= "01000001"; -- A
-- 				OUTPUT(2) <= "01001100"; -- L
-- 				OUTPUT(3) <= "01010100"; -- T
-- 				OUTPUT(4) <= "00100000"; -- ' '
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "01111" => -- JMP [end]
-- 				OUTPUT(0) <= "01001010"; -- J
-- 				OUTPUT(1) <= "01001101"; -- M
-- 				OUTPUT(2) <= "01010000"; -- P
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01011011"; -- [
-- 				OUTPUT(5) <= "01100101"; -- e
-- 				OUTPUT(6) <= "01101110"; -- n
-- 				OUTPUT(7) <= "01100100"; -- d
-- 				OUTPUT(8) <= "01011101"; -- ]
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "10000" => -- INC A
-- 				OUTPUT(0) <= "01001001"; -- I
-- 				OUTPUT(1) <= "01001110"; -- N
-- 				OUTPUT(2) <= "01000011"; -- C
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "10001" => -- INC B
-- 				OUTPUT(0) <= "01001001"; -- I
-- 				OUTPUT(1) <= "01001110"; -- N
-- 				OUTPUT(2) <= "01000011"; -- C
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000010"; -- B
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "10010" => -- DEC A
-- 				OUTPUT(0) <= "01000100"; -- D
-- 				OUTPUT(1) <= "01000101"; -- E
-- 				OUTPUT(2) <= "01000011"; -- C
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000001"; -- A
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when "10011" => -- DEC B
-- 				OUTPUT(0) <= "01000100"; -- D
-- 				OUTPUT(1) <= "01000101"; -- E
-- 				OUTPUT(2) <= "01000011"; -- C
-- 				OUTPUT(3) <= "00100000"; -- ' '
-- 				OUTPUT(4) <= "01000010"; -- B
-- 				OUTPUT(5) <= "00100000"; -- ' '
-- 				OUTPUT(6) <= "00100000"; -- ' '
-- 				OUTPUT(7) <= "00100000"; -- ' '
-- 				OUTPUT(8) <= "00100000"; -- ' '
-- 				OUTPUT(9) <= "00100000"; -- ' '
-- 				OUTPUT(10) <= "00100000"; -- ' '
-- 				OUTPUT(11) <= "00100000"; -- ' '
-- 			when others =>;
-- 				OUTPUT <= (others => "00100000");
-- 		end case;
-- 	end process update_out;

-- end Behavioral;

