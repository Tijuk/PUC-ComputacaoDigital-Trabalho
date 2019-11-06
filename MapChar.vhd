----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:17:47 11/04/2019 
-- Design Name: 
-- Module Name:    MapChar - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MapChar is
	port(
		INSTRUCTION: in std_logic_vector(4 downto 0);
		CHAR_AT: in unsigned(4 downto 0);
		LEFT: in std_logic;
		OUTPUT: out std_logic_vector(7 downto 0));

end MapChar;

architecture Behavioral of MapChar is

begin
	update_out: process(CLK)
	begin
		case INSTRUCTION is
			when "00001" => -- MOV A, [end]
				OUTPUT(0) <= "01001101"; -- M
				OUTPUT(1) <= "01001111"; -- O
				OUTPUT(2) <= "01010110"; -- V
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01011011"; -- [
				OUTPUT(8) <= "01100101"; -- e
				OUTPUT(9) <= "01101110"; -- n
				OUTPUT(10) <= "01100100"; -- d
				OUTPUT(11) <= "01011101"; -- ]
			when "00010" => -- MOV [end], A
				OUTPUT(0) <= "01001101"; -- M
				OUTPUT(1) <= "01001111"; -- O
				OUTPUT(2) <= "01010110"; -- V
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01011011"; -- [
				OUTPUT(5) <= "01100101"; -- e
				OUTPUT(6) <= "01101110"; -- n
				OUTPUT(7) <= "01100100"; -- d
				OUTPUT(8) <= "01011101"; -- ]
				OUTPUT(9) <= "00101100"; -- ,
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "01000001"; -- A
			when "00011" => -- MOV A, B
				OUTPUT(0) <= "01001101"; -- M
				OUTPUT(1) <= "01001111"; -- O
				OUTPUT(2) <= "01010110"; -- V
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01000010"; -- B
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "00100" => -- MOV B, A
				OUTPUT(0) <= "01001101"; -- M
				OUTPUT(1) <= "01001111"; -- O
				OUTPUT(2) <= "01010110"; -- V
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000010"; -- B
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01000001"; -- A
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "00101" => -- ADD A, B
				OUTPUT(0) <= "01000001"; -- A
				OUTPUT(1) <= "01000100"; -- D
				OUTPUT(2) <= "01000100"; -- D
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01000010"; -- B
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "00110" => -- SUB A, B
				OUTPUT(0) <= "01010011"; -- S
				OUTPUT(1) <= "01010101"; -- U
				OUTPUT(2) <= "01000010"; -- B
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01000010"; -- B
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "00111" => -- AND A, B
				OUTPUT(0) <= "01000001"; -- A
				OUTPUT(1) <= "01001110"; -- N
				OUTPUT(2) <= "01000100"; -- D
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01000010"; -- B
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01000" => -- OR A, B
				OUTPUT(0) <= "01001111"; -- O
				OUTPUT(1) <= "01010010"; -- R
				OUTPUT(2) <= "00100000"; -- ' '
				OUTPUT(3) <= "01000001"; -- A
				OUTPUT(4) <= "00101100"; -- ,
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "01000010"; -- B
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01001" => -- XOR A, B
				OUTPUT(0) <= "01011000"; -- X
				OUTPUT(1) <= "01001111"; -- O
				OUTPUT(2) <= "01010010"; -- R
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00101100"; -- ,
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "01000010"; -- B
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01010" => -- NOT A
				OUTPUT(0) <= "01001110"; -- N
				OUTPUT(1) <= "01001111"; -- O
				OUTPUT(2) <= "01010100"; -- T
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01011" => -- NAND A, B
				OUTPUT(0) <= "01001110"; -- N
				OUTPUT(1) <= "01000001"; -- A
				OUTPUT(2) <= "01001110"; -- N
				OUTPUT(3) <= "01000100"; -- D
				OUTPUT(4) <= "00100000"; -- ' '
				OUTPUT(5) <= "01000001"; -- A
				OUTPUT(6) <= "00101100"; -- ,
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "01000010"; -- B
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01100" => -- JZ [end]
				OUTPUT(0) <= "01001010"; -- J
				OUTPUT(1) <= "01011010"; -- Z
				OUTPUT(2) <= "00100000"; -- ' '
				OUTPUT(3) <= "01011011"; -- [
				OUTPUT(4) <= "01100101"; -- e
				OUTPUT(5) <= "01101110"; -- n
				OUTPUT(6) <= "01100100"; -- d
				OUTPUT(7) <= "01011101"; -- ]
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01101" => -- JN [end]
				OUTPUT(0) <= "01001010"; -- J
				OUTPUT(1) <= "01001110"; -- N
				OUTPUT(2) <= "00100000"; -- ' '
				OUTPUT(3) <= "01011011"; -- [
				OUTPUT(4) <= "01100101"; -- e
				OUTPUT(5) <= "01101110"; -- n
				OUTPUT(6) <= "01100100"; -- d
				OUTPUT(7) <= "01011101"; -- ]
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01110" => -- HALT
				OUTPUT(0) <= "01001000"; -- H
				OUTPUT(1) <= "01000001"; -- A
				OUTPUT(2) <= "01001100"; -- L
				OUTPUT(3) <= "01010100"; -- T
				OUTPUT(4) <= "00100000"; -- ' '
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "01111" => -- JMP [end]
				OUTPUT(0) <= "01001010"; -- J
				OUTPUT(1) <= "01001101"; -- M
				OUTPUT(2) <= "01010000"; -- P
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01011011"; -- [
				OUTPUT(5) <= "01100101"; -- e
				OUTPUT(6) <= "01101110"; -- n
				OUTPUT(7) <= "01100100"; -- d
				OUTPUT(8) <= "01011101"; -- ]
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "10000" => -- INC A
				OUTPUT(0) <= "01001001"; -- I
				OUTPUT(1) <= "01001110"; -- N
				OUTPUT(2) <= "01000011"; -- C
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "10001" => -- INC B
				OUTPUT(0) <= "01001001"; -- I
				OUTPUT(1) <= "01001110"; -- N
				OUTPUT(2) <= "01000011"; -- C
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000010"; -- B
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "10010" => -- DEC A
				OUTPUT(0) <= "01000100"; -- D
				OUTPUT(1) <= "01000101"; -- E
				OUTPUT(2) <= "01000011"; -- C
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000001"; -- A
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when "10011" => -- DEC B
				OUTPUT(0) <= "01000100"; -- D
				OUTPUT(1) <= "01000101"; -- E
				OUTPUT(2) <= "01000011"; -- C
				OUTPUT(3) <= "00100000"; -- ' '
				OUTPUT(4) <= "01000010"; -- B
				OUTPUT(5) <= "00100000"; -- ' '
				OUTPUT(6) <= "00100000"; -- ' '
				OUTPUT(7) <= "00100000"; -- ' '
				OUTPUT(8) <= "00100000"; -- ' '
				OUTPUT(9) <= "00100000"; -- ' '
				OUTPUT(10) <= "00100000"; -- ' '
				OUTPUT(11) <= "00100000"; -- ' '
			when others =>
				OUTPUT <= (others => "00100000");
		end case;
	end process update_out;

end Behavioral;

