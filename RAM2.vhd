library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity RAM2 is
  port (
    clk      : in  std_logic;-- clk from CPU
	reset    : in  std_logic;-- reset
    we       : in  std_logic;  -- write enable
    address  : in  integer range 0 to 31; -- adress for current instruction
    datain   : in  std_logic_vector(4 downto 0);-- data to be written
    dataout  : out std_logic_vector(4 downto 0); --data read from ram
	 dataAt30 : out std_logic_vector(4 downto 0) -- data at position 30 of ram
  );
end entity RAM2;

architecture RTL of RAM2 is

   type ram_type is array (0 to 31) of std_logic_vector(datain'range);
   signal ram : ram_type := (
		0 => 	"00001", -- MOV A, [END]
		1 => 		"10011", -- 19
		2 => 		"00100", -- MOV B, A
		3 => 		"00001", -- MOV A, [END]
		4 => 		"10010", -- 18
		5 => 		"00110", -- SUB A, B
		6 => 		"00010", -- MOV end, A
		7 => 		"10010", -- 18
		8 => 		"01101", -- JN
		9 => 		"10001", -- 17
		10 => 	"00001", -- MOV A, [END] 
		11 => 	"11110", -- 30
		12 => 	"10000",	--	INC A					
		13 => 	"00010", -- MOV end, A
		14 => 	"11110", -- 30
		15 => 	"01111", -- JMP
		16 => 	"00011", -- 3
		17 => 	"01110", -- HALT
		18 => 	"01010",	-- 10						
		19 => 	"00010", -- 2
		others=> (others => '0')
	);
   signal read_address : integer range 0 to 31 := 0;

begin

  RamProc: process(clk) is
  begin
    if falling_edge(clk) then
      if we = '1' then
        ram(address) <= datain;
      end if;
      read_address <= address;
    end if;
  end process RamProc;

  dataout <= ram(read_address);
  dataAt30 <= ram(30);

end architecture RTL;