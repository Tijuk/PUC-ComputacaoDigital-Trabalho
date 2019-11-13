library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MapChar is
	port(
		INSTRUCTION: in std_logic_vector(4 downto 0);
		CHAR_AT: in unsigned(4 downto 0);
		LEFT: in std_logic;
		OUTPUT_BUFFER: out std_logic_vector(7 downto 0)
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
	update_out: process(CLK)
	begin
		if ( INSTRUCTIONS = 1) then -- MOV A, [end]
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- M
					OUTPUT_BUFFER <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
				when 1 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 2 => -- V
					OUTPUT_BUFFER <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- [
					OUTPUT_BUFFER <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
				when 8 => -- e
					OUTPUT_BUFFER <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
				when 9 => -- n
					OUTPUT_BUFFER <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
				when 10 => -- d
					OUTPUT_BUFFER <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
				when 11 => -- ]
					OUTPUT_BUFFER <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 2) then -- MOV [end], A
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- M
					OUTPUT_BUFFER <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
				when 1 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 2 => -- V
					OUTPUT_BUFFER <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- [
					OUTPUT_BUFFER <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
				when 5 => -- e
					OUTPUT_BUFFER <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
				when 6 => -- n
					OUTPUT_BUFFER <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
				when 7 => -- d
					OUTPUT_BUFFER <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
				when 8 => -- ]
					OUTPUT_BUFFER <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
				when 9 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 3) then -- MOV A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- M
					OUTPUT_BUFFER <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
				when 1 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 2 => -- V
					OUTPUT_BUFFER <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 4) then -- MOV B, A
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- M
					OUTPUT_BUFFER <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
				when 1 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 2 => -- V
					OUTPUT_BUFFER <= alpha_v_uc(7 downto 4) when LEFT = '0' else alpha_v_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 5) then -- ADD A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 1 => -- D
					OUTPUT_BUFFER <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
				when 2 => -- D
					OUTPUT_BUFFER <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 6) then -- SUB A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- S
					OUTPUT_BUFFER <= alpha_s_uc(7 downto 4) when LEFT = '0' else alpha_s_uc(3 downto 0);
				when 1 => -- U
					OUTPUT_BUFFER <= alpha_u_uc(7 downto 4) when LEFT = '0' else alpha_u_uc(3 downto 0);
				when 2 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 7) then -- AND A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 1 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 2 => -- D
					OUTPUT_BUFFER <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 8) then -- OR A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 1 => -- R
					OUTPUT_BUFFER <= alpha_r_uc(7 downto 4) when LEFT = '0' else alpha_r_uc(3 downto 0);
				when 2 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 3 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 4 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 9) then -- XOR A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- X
					OUTPUT_BUFFER <= alpha_x_uc(7 downto 4) when LEFT = '0' else alpha_x_uc(3 downto 0);
				when 1 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 2 => -- R
					OUTPUT_BUFFER <= alpha_r_uc(7 downto 4) when LEFT = '0' else alpha_r_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 10) then -- NOT A
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 1 => -- O
					OUTPUT_BUFFER <= alpha_o_uc(7 downto 4) when LEFT = '0' else alpha_o_uc(3 downto 0);
				when 2 => -- T
					OUTPUT_BUFFER <= alpha_t_uc(7 downto 4) when LEFT = '0' else alpha_t_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 11) then -- NAND A, B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 1 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 2 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 3 => -- D
					OUTPUT_BUFFER <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
				when 4 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 5 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 6 => -- ,
					OUTPUT_BUFFER <= symbol_comma(7 downto 4) when LEFT = '0' else symbol_comma(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 12 ) then -- JZ [end]
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- J
					OUTPUT_BUFFER <= alpha_j_uc(7 downto 4) when LEFT = '0' else alpha_j_uc(3 downto 0);
				when 1 => -- Z
					OUTPUT_BUFFER <= alpha_z_uc(7 downto 4) when LEFT = '0' else alpha_z_uc(3 downto 0);
				when 2 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 3 => -- [
					OUTPUT_BUFFER <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
				when 4 => -- e
					OUTPUT_BUFFER <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
				when 5 => -- n
					OUTPUT_BUFFER <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
				when 6 => -- d
					OUTPUT_BUFFER <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
				when 7 => -- ]
					OUTPUT_BUFFER <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 13) then -- JN [end]
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- J
					OUTPUT_BUFFER <= alpha_j_uc(7 downto 4) when LEFT = '0' else alpha_j_uc(3 downto 0);
				when 1 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 2 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 3 => -- [
					OUTPUT_BUFFER <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
				when 4 => -- e
					OUTPUT_BUFFER <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
				when 5 => -- n
					OUTPUT_BUFFER <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
				when 6 => -- d
					OUTPUT_BUFFER <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
				when 7 => -- ]
					OUTPUT_BUFFER <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 14) then -- HALT
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- H
					OUTPUT_BUFFER <= alpha_h_uc(7 downto 4) when LEFT = '0' else alpha_h_uc(3 downto 0);
				when 1 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 2 => -- L
					OUTPUT_BUFFER <= alpha_l_uc(7 downto 4) when LEFT = '0' else alpha_l_uc(3 downto 0);
				when 3 => -- T
					OUTPUT_BUFFER <= alpha_t_uc(7 downto 4) when LEFT = '0' else alpha_t_uc(3 downto 0);
				when 4 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 15) then -- JMP [end]
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- J
					OUTPUT_BUFFER <= alpha_j_uc(7 downto 4) when LEFT = '0' else alpha_j_uc(3 downto 0);
				when 1 => -- M
					OUTPUT_BUFFER <= alpha_m_uc(7 downto 4) when LEFT = '0' else alpha_m_uc(3 downto 0);
				when 2 => -- P
					OUTPUT_BUFFER <= alpha_p_uc(7 downto 4) when LEFT = '0' else alpha_p_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- [
					OUTPUT_BUFFER <= symbol_bracket_open(7 downto 4) when LEFT = '0' else symbol_bracket_open(3 downto 0);
				when 5 => -- e
					OUTPUT_BUFFER <= alpha_e_lc(7 downto 4) when LEFT = '0' else alpha_e_lc(3 downto 0);
				when 6 => -- n
					OUTPUT_BUFFER <= alpha_n_lc(7 downto 4) when LEFT = '0' else alpha_n_lc(3 downto 0);
				when 7 => -- d
					OUTPUT_BUFFER <= alpha_d_lc(7 downto 4) when LEFT = '0' else alpha_d_lc(3 downto 0);
				when 8 => -- ]
					OUTPUT_BUFFER <= symbol_bracket_close(7 downto 4) when LEFT = '0' else symbol_bracket_close(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 16) then -- INC A
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- I
					OUTPUT_BUFFER <= alpha_i_uc(7 downto 4) when LEFT = '0' else alpha_i_uc(3 downto 0);
				when 1 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 2 => -- C
					OUTPUT_BUFFER <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 17) then -- INC B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- I
					OUTPUT_BUFFER <= alpha_i_uc(7 downto 4) when LEFT = '0' else alpha_i_uc(3 downto 0);
				when 1 => -- N
					OUTPUT_BUFFER <= alpha_n_uc(7 downto 4) when LEFT = '0' else alpha_n_uc(3 downto 0);
				when 2 => -- C
					OUTPUT_BUFFER <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 18) then -- DEC A
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- D
					OUTPUT_BUFFER <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
				when 1 => -- E
					OUTPUT_BUFFER <= alpha_e_uc(7 downto 4) when LEFT = '0' else alpha_e_uc(3 downto 0);
				when 2 => -- C
					OUTPUT_BUFFER <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- A
					OUTPUT_BUFFER <= alpha_a_uc(7 downto 4) when LEFT = '0' else alpha_a_uc(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;
		if ( INSTRUCTIONS = 19) then -- DEC B
			case to_unsigned(CHAR_AT, 4) is
				when 0 => -- D
					OUTPUT_BUFFER <= alpha_d_uc(7 downto 4) when LEFT = '0' else alpha_d_uc(3 downto 0);
				when 1 => -- E
					OUTPUT_BUFFER <= alpha_e_uc(7 downto 4) when LEFT = '0' else alpha_e_uc(3 downto 0);
				when 2 => -- C
					OUTPUT_BUFFER <= alpha_c_uc(7 downto 4) when LEFT = '0' else alpha_c_uc(3 downto 0);
				when 3 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 4 => -- B
					OUTPUT_BUFFER <= alpha_b_uc(7 downto 4) when LEFT = '0' else alpha_b_uc(3 downto 0);
				when 5 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 6 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 7 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 8 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 9 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 10 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				when 11 => -- ' '
					OUTPUT_BUFFER <= symbol_space(7 downto 4) when LEFT = '0' else symbol_space(3 downto 0);
				-- when others =>;
			end case;
		end if;

	end process update_out;

end Behavioral;

-- begin
-- 	update_out: process(CLK)
-- 	begin
-- 		case INSTRUCTION is
-- 			when "00001" => -- MOV A, [end]
-- 				OUTPUT_BUFFER(0) <= "01001101"; -- M
-- 				OUTPUT_BUFFER(1) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(2) <= "01010110"; -- V
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01011011"; -- [
-- 				OUTPUT_BUFFER(8) <= "01100101"; -- e
-- 				OUTPUT_BUFFER(9) <= "01101110"; -- n
-- 				OUTPUT_BUFFER(10) <= "01100100"; -- d
-- 				OUTPUT_BUFFER(11) <= "01011101"; -- ]
-- 			when "00010" => -- MOV [end], A
-- 				OUTPUT_BUFFER(0) <= "01001101"; -- M
-- 				OUTPUT_BUFFER(1) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(2) <= "01010110"; -- V
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01011011"; -- [
-- 				OUTPUT_BUFFER(5) <= "01100101"; -- e
-- 				OUTPUT_BUFFER(6) <= "01101110"; -- n
-- 				OUTPUT_BUFFER(7) <= "01100100"; -- d
-- 				OUTPUT_BUFFER(8) <= "01011101"; -- ]
-- 				OUTPUT_BUFFER(9) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "01000001"; -- A
-- 			when "00011" => -- MOV A, B
-- 				OUTPUT_BUFFER(0) <= "01001101"; -- M
-- 				OUTPUT_BUFFER(1) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(2) <= "01010110"; -- V
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "00100" => -- MOV B, A
-- 				OUTPUT_BUFFER(0) <= "01001101"; -- M
-- 				OUTPUT_BUFFER(1) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(2) <= "01010110"; -- V
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "00101" => -- ADD A, B
-- 				OUTPUT_BUFFER(0) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(1) <= "01000100"; -- D
-- 				OUTPUT_BUFFER(2) <= "01000100"; -- D
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "00110" => -- SUB A, B
-- 				OUTPUT_BUFFER(0) <= "01010011"; -- S
-- 				OUTPUT_BUFFER(1) <= "01010101"; -- U
-- 				OUTPUT_BUFFER(2) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "00111" => -- AND A, B
-- 				OUTPUT_BUFFER(0) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(1) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(2) <= "01000100"; -- D
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01000" => -- OR A, B
-- 				OUTPUT_BUFFER(0) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(1) <= "01010010"; -- R
-- 				OUTPUT_BUFFER(2) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(3) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(4) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01001" => -- XOR A, B
-- 				OUTPUT_BUFFER(0) <= "01011000"; -- X
-- 				OUTPUT_BUFFER(1) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(2) <= "01010010"; -- R
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01010" => -- NOT A
-- 				OUTPUT_BUFFER(0) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(1) <= "01001111"; -- O
-- 				OUTPUT_BUFFER(2) <= "01010100"; -- T
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01011" => -- NAND A, B
-- 				OUTPUT_BUFFER(0) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(1) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(2) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(3) <= "01000100"; -- D
-- 				OUTPUT_BUFFER(4) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(5) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(6) <= "00101100"; -- ,
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01100" => -- JZ [end]
-- 				OUTPUT_BUFFER(0) <= "01001010"; -- J
-- 				OUTPUT_BUFFER(1) <= "01011010"; -- Z
-- 				OUTPUT_BUFFER(2) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(3) <= "01011011"; -- [
-- 				OUTPUT_BUFFER(4) <= "01100101"; -- e
-- 				OUTPUT_BUFFER(5) <= "01101110"; -- n
-- 				OUTPUT_BUFFER(6) <= "01100100"; -- d
-- 				OUTPUT_BUFFER(7) <= "01011101"; -- ]
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01101" => -- JN [end]
-- 				OUTPUT_BUFFER(0) <= "01001010"; -- J
-- 				OUTPUT_BUFFER(1) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(2) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(3) <= "01011011"; -- [
-- 				OUTPUT_BUFFER(4) <= "01100101"; -- e
-- 				OUTPUT_BUFFER(5) <= "01101110"; -- n
-- 				OUTPUT_BUFFER(6) <= "01100100"; -- d
-- 				OUTPUT_BUFFER(7) <= "01011101"; -- ]
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01110" => -- HALT
-- 				OUTPUT_BUFFER(0) <= "01001000"; -- H
-- 				OUTPUT_BUFFER(1) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(2) <= "01001100"; -- L
-- 				OUTPUT_BUFFER(3) <= "01010100"; -- T
-- 				OUTPUT_BUFFER(4) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "01111" => -- JMP [end]
-- 				OUTPUT_BUFFER(0) <= "01001010"; -- J
-- 				OUTPUT_BUFFER(1) <= "01001101"; -- M
-- 				OUTPUT_BUFFER(2) <= "01010000"; -- P
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01011011"; -- [
-- 				OUTPUT_BUFFER(5) <= "01100101"; -- e
-- 				OUTPUT_BUFFER(6) <= "01101110"; -- n
-- 				OUTPUT_BUFFER(7) <= "01100100"; -- d
-- 				OUTPUT_BUFFER(8) <= "01011101"; -- ]
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "10000" => -- INC A
-- 				OUTPUT_BUFFER(0) <= "01001001"; -- I
-- 				OUTPUT_BUFFER(1) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(2) <= "01000011"; -- C
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "10001" => -- INC B
-- 				OUTPUT_BUFFER(0) <= "01001001"; -- I
-- 				OUTPUT_BUFFER(1) <= "01001110"; -- N
-- 				OUTPUT_BUFFER(2) <= "01000011"; -- C
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "10010" => -- DEC A
-- 				OUTPUT_BUFFER(0) <= "01000100"; -- D
-- 				OUTPUT_BUFFER(1) <= "01000101"; -- E
-- 				OUTPUT_BUFFER(2) <= "01000011"; -- C
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000001"; -- A
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			when "10011" => -- DEC B
-- 				OUTPUT_BUFFER(0) <= "01000100"; -- D
-- 				OUTPUT_BUFFER(1) <= "01000101"; -- E
-- 				OUTPUT_BUFFER(2) <= "01000011"; -- C
-- 				OUTPUT_BUFFER(3) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(4) <= "01000010"; -- B
-- 				OUTPUT_BUFFER(5) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(6) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(7) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(8) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(9) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(10) <= "00100000"; -- ' '
-- 				OUTPUT_BUFFER(11) <= "00100000"; -- ' '
-- 			-- when others =>;
-- 				OUTPUT_BUFFER <= (others => "00100000");
-- 		end case;
-- 	end process update_out;

-- end Behavioral;

