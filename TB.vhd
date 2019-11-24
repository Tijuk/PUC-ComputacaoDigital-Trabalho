--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:45:13 11/24/2019
-- Design Name:   
-- Module Name:   /home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho/TB.vhd
-- Project Name:  trabalho
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         CLK : IN  std_logic;
         LCD_E : OUT  std_logic;
         LCD_RW : OUT  std_logic;
         LCD_RS : OUT  std_logic;
         DISABLE_STRATA_FLASH : OUT  std_logic;
         SF_D : OUT  std_logic_vector(3 downto 0);
         ZERO : OUT  std_logic;
         NEGATIVE : OUT  std_logic;
         CLK_OUT : OUT  std_logic;
         RESET : IN  std_logic;
         LEDS : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal LCD_E : std_logic;
   signal LCD_RW : std_logic;
   signal LCD_RS : std_logic;
   signal DISABLE_STRATA_FLASH : std_logic;
   signal SF_D : std_logic_vector(3 downto 0);
   signal ZERO : std_logic;
   signal NEGATIVE : std_logic;
   signal CLK_OUT : std_logic;
   signal LEDS : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant CLK_OUT_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          CLK => CLK,
          LCD_E => LCD_E,
          LCD_RW => LCD_RW,
          LCD_RS => LCD_RS,
          DISABLE_STRATA_FLASH => DISABLE_STRATA_FLASH,
          SF_D => SF_D,
          ZERO => ZERO,
          NEGATIVE => NEGATIVE,
          CLK_OUT => CLK_OUT,
          RESET => RESET,
          LEDS => LEDS
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   CLK_OUT_process :process
   begin
		CLK_OUT <= '0';
		wait for CLK_OUT_period/2;
		CLK_OUT <= '1';
		wait for CLK_OUT_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
