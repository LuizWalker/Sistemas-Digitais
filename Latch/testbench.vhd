
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component decoder is

port(LT,BL,LE: in bit;
       D: in bit_vector(3 downto 0);
       S: out bit_vector(6 downto 0));
end component;


signal X: bit_vector(3 downto 0);
signal Y: bit_vector(6 downto 0);
signal LT2, BL2, LE2: bit;

begin

dut: decoder port map(LT2, BL2, LE2, X, Y);

X <= "0000",
     "0001" after 10 ns,
     "0010" after 20 ns,
     "0011" after 30 ns,
     "0100" after 40 ns,
     "0101" after 50 ns,
     "0110" after 60 ns,
     "0111" after 70 ns,
     "1000" after 80 ns,
     "1001" after 90 ns,
     "0000" after 100 ns;
     
LT2 <='1',
      '0' after 90 ns; 

BL2 <='1',
      '0' after 70 ns;

LE2 <='0',
      '1' after 50 ns;



end test;