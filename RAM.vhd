library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity RAM is
end RAM;

architecture Behavioral of RAM is
----Memória RAM com os endereços e suas infos---------
type memory_type is array (0 to 31) of std_logic_vector(4 downto 0); 
signal ram : memory_type := (
	 0=> "00001", -- MOV A, [end]                                                                                                                                
	 1=> "11101", -- [end] 29                                                                                                                                  
	 2=> "00100", -- MOV B, A                                                                                                                                 
	 3=> "00001", -- MOV A, [end]                                                                                                                                
	 4=> "11100", -- [end] 30                                                                                                                            
	 5=> "00101", -- ADD A,B -- 4
	 6=> "00010", -- MOV [end], A
	 7=> "11110", -- [end] 30
	 8=> "00110", -- SUB A,B -- 2
	 9=> "00010", -- MOV [end], A                                                                                                                               
	10=> "11110", -- end 30                                                                                                                              
	11=> "00110", -- SUB A,B -- 0                                                                                                                             
	12=> "00010", -- MOV [end], A                                                                                                                                
	13=> "11110", -- [end] 30
	14=> "00110", -- SUB A,B -- -2                                                                                                                                 
	15=> "00010", -- MOV [end], A                                                                                                                                 
	16=> "11110", -- [end] 30                                                                                                                                
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
	28=> "00010",                                                                                                                                  
	29=> "00010",                                                                                                                                  
	30=> "00010",                                                                                                                                  
	31=> "10101",
	others=> "00000"
	);
begin


end Behavioral;

