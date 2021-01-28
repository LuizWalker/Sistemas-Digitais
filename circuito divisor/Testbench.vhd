
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture test of testbench is

component circuito_divisor is

port(a,b: in std_logic_vector(7 downto 0);
     reset, clock: in std_logic;
     resultado_1,resultado_2: out std_logic_vector(7 downto 0);
     resto_1, resto_2: out std_logic_vector(7 downto 0));

-- 1- divisor otimizado
-- 2- divisor sucessivo

end component;

signal a: std_logic_vector(7 downto 0):= "11111111";
signal b: std_logic_vector(7 downto 0):= "00000101";

signal reset,clock: std_logic :='0';
signal resultado_1,resultado_2,resto_1,resto_2: std_logic_vector(7 downto 0);

begin

dut: circuito_divisor port map(a,b,reset,clock,resultado_1,resultado_2,resto_1,resto_2);

process
  begin
  
  reset<='1';
  wait for 1 ns;
  reset<='0';
  wait for 1 ns;
  
  
  for i in 0 to 60 loop
   clock<='0';
   wait for 5 ns;
   clock<='1';
   wait for 5 ns;
   
   report "parcial do div_otimizado="& to_string(resultado_1) severity note;
   report "parcial do div_sucessivo="& to_string(resultado_2) severity note;
        
  end loop; 
  
  wait;
 end process;

end test;
