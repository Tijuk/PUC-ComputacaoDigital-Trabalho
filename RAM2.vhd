library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity RAM2 is
  port (
    clk      : in  std_logic;
	 reset    : in  std_logic;
    we       : in  std_logic;
    address  : in  integer range 0 to 31;
    datain   : in  std_logic_vector(4 downto 0);
    dataout  : out std_logic_vector(4 downto 0);
	 dataAt30 : out std_logic_vector(4 downto 0)
  );
end entity RAM2;

architecture RTL of RAM2 is

   type ram_type is array (0 to 31) of std_logic_vector(datain'range);
   signal ram : ram_type := (
		0=> "00001", -- MOV A, [end]
		1=> "11101", -- [end] 29
		2=> "00010", -- MOV [end], A  
		3=> "11110", -- end 30  -- 3
		4=> "00100", -- MOV B, A
		5=> "00101", -- ADD A,B -- 6
		6=> "00010", -- MOV [end], A 
		7=> "11110", -- end 30 -- 6
		8=> "00110", -- SUB A,B -- 2 (A = 6, B = 3, A-B = 3)
		9=> "00010", -- MOV [end], A
		10=> "11110", -- [end] 30 -- 3
		11=> "00110", -- SUB A,B       (A = 3, B = 3, A-B =0)
		12=> "00010", -- MOV [end], A                                                                                                                                 
		13=> "11110", -- [end] 30 -- 0   
		14=> "00110", -- SUB A,B       (A = 0, B = 3, A-B =-3)   	
		15=> "00010", -- MOV [end], A                                                                                                                                 
		16=> "11110", -- [end] 30 -- -3                                                                                                                            
		17=> "01110", -- HALT                                                                                                                                 
		18=> "00000",                                                                                                                                 
		19=> "00000",                                                                                                                                  
		20=> "00000",                                                                                                                                  
		21=> "00000",                                                                                                                                  
		22=> "00000",                                                                                                                                  
		23=> "00000",                                                                                                                                  
		24=> "00000",                                                                                                                                  
		25=> "00000",                                                                                                                                  
		26=> "00000",                                                                                                                                  
		27=> "00000",                                                                                                                                  
		28=> "00000",                                                                                                                                  
		29=> "00011",                                                                                                                                  
		30=> "11111",                                                                                                                                  
		31=> "10101",
		others=> "00000"
	);
   signal read_address : integer range 0 to 31 := 0; --std_logic_vector(address'range);

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