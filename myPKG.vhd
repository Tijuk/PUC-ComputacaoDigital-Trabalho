library IEEE;
use IEEE.STD_LOGIC_1164.all;

package myPKG is

	-- -- Characters
	-- constant alpha_a_uc : std_logic_vector(7 downto 0) := "01000001";
	-- constant alpha_b_uc : std_logic_vector(7 downto 0) := "01000010";
	-- constant alpha_c_uc : std_logic_vector(7 downto 0) := "01000011";
	-- constant alpha_d_uc : std_logic_vector(7 downto 0) := "01000100";
	-- constant alpha_d_lc : std_logic_vector(7 downto 0) := "01100100";
	-- constant alpha_e_uc : std_logic_vector(7 downto 0) := "01000101";
	-- constant alpha_e_lc : std_logic_vector(7 downto 0) := "01100101";
	-- constant alpha_h_uc : std_logic_vector(7 downto 0) := "01001000";
	-- constant alpha_i_uc : std_logic_vector(7 downto 0) := "01001001";
	-- constant alpha_j_uc : std_logic_vector(7 downto 0) := "01001010";
	-- constant alpha_l_uc : std_logic_vector(7 downto 0) := "01001100";
	-- constant alpha_m_uc : std_logic_vector(7 downto 0) := "01001101";
	-- constant alpha_n_uc : std_logic_vector(7 downto 0) := "01001110";
	-- constant alpha_n_lc : std_logic_vector(7 downto 0) := "01101110";
	-- constant alpha_o_uc : std_logic_vector(7 downto 0) := "01001111";
	-- constant alpha_p_uc : std_logic_vector(7 downto 0) := "01010000";
	-- constant alpha_r_uc : std_logic_vector(7 downto 0) := "01010010";
	-- constant alpha_s_uc : std_logic_vector(7 downto 0) := "01010011";
	-- constant alpha_t_uc : std_logic_vector(7 downto 0) := "01010100";
	-- constant alpha_u_uc : std_logic_vector(7 downto 0) := "01010101";
	-- constant alpha_v_uc : std_logic_vector(7 downto 0) := "01010110";
	-- constant alpha_x_uc : std_logic_vector(7 downto 0) := "01011000";
	-- constant alpha_z_uc : std_logic_vector(7 downto 0) := "01011010";


-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end myPKG;

package body myPKG is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end myPKG;
