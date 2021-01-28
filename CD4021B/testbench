-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


entity testbench is
end testbench;

architecture test of testbench is

component CD4021B is

  port(presset: in std_logic_vector(0 to 7);
       serial, clock, ps_control: in std_logic;
       saida: out std_logic_vector(0 to 2));

end component;


signal serial, clock, ps_control: std_logic;

signal saida: std_logic_vector(0 to 2);

--Vetor de bits para os testes 

signal presset: std_logic_vector(0 to 7) := "11101001";

signal dados: std_logic_vector(0 to 7) := "10101111";

begin

dut: CD4021B port map(presset, serial, clock, ps_control, saida);
            
 
 process
   begin 
   
     ps_control <= '1',
                   '0' after 5 ns;
   
     for i in 0 to 7 loop
       clock <= '1';
       serial <= dados(7-i);
     wait for 10 ns;
       clock <='0';
     wait for 10 ns;
   end loop;
   wait;
   end process;           

end test;