-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


entity testbench is
end testbench;

architecture test of testbench is

component gerador_sinais is

port(clock,stop,go: in std_logic;
     up,down: out std_logic);

end component;

signal clock,stop, go: std_logic:='0';
signal up, down: std_logic:='0';

begin

dut: gerador_sinais port map(clock,stop,go,up,down);


stop <= '1',
        '0' after 20 ms,
        '1' after 100 ms,
        '0' after 140 ms;
        
go <= '0',
      '1' after 50 ms,
      '0' after 80 ms,
      '1' after 170 ms,
      '0' after 200 ms;
 
  process
   begin
  

      for i in 0 to 100 loop
	     clock <= '0';
	     wait for 1 ms;
	     clock <= '1';
	     wait for 1 ms;
      end loop;

    wait;

 end process; 
 

end test;