-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component gerador is

port(clock: in std_logic;
     saida_1,saida_2: out std_logic);

end component;

signal clock: std_logic := '0';
signal saida_1,saida_2: std_logic := '0';

begin

dut: gerador port map(clock,saida_1,saida_2);

  process
   begin
  

      for i in 0 to 32 loop
	     clock <= '0';
	     wait for 5 ns;
	     clock <= '1';
	     wait for 5 ns;
      end loop;

    wait;

 end process;


end test;