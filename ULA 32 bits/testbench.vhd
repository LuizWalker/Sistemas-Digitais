-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component SelectAdder32b is

port(a,b: in bit_vector(31 downto 0);
     s: out bit_vector(31 downto 0);
	  cin: in bit;
	  cout: out bit);

end component;

signal a,b,s: bit_vector(31 downto 0);
signal cin,cout: bit;

begin

dut: SelectAdder32b port map(a,b,s,cin,cout);

a <= "00000000000000000000000000000111",
	 "00000000000000000000000000001000" after 10 ns,
	 "00000000000000000000000000000011" after 20 ns,
	 "00000000000000000000000000000000" after 30 ns,
	 "00000000000000000000000000000010" after 40 ns;
	  
b <= "00000000000000000000000000000001",
	 "00000000000000000000000000001000" after 10 ns,
	 "00000000000000000000000000000001" after 20 ns,
	 "00000000000000000000000000001111" after 30 ns,
	 "00000000000000000000000000000011" after 40 ns;

cin <= '0';-- 0 para adição
           -- 1 para subtração  

end test;