-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity testbench is
end testbench;

architecture test of testbench is

component doubledabble is

port(binary: in std_logic_vector(7 downto 0);
     clock,reset: in std_logic;
     centena,dezena,unidade: out std_logic_vector(3 downto 0);
     done: out std_logic);
     
end component;

signal binary: std_logic_vector(7 downto 0);
signal clock, reset: std_logic :='0';
signal centena,dezena,unidade : std_logic_vector(3 downto 0):=(others=>'0');
signal done: std_logic :='0';

-- data test

type matriz is array(0 to 9) of std_logic_vector(0 to 7);

signal data_test: matriz :=("00101010",
                            "00001000",
                            "11111111",
                            "00001111",
                            "00000001",
                            "00000110",
                            "00001010",
                            "00000111",
                            "11110000",
                            "11110011");

begin

dut: doubledabble port map(binary,clock,reset,centena,dezena,unidade,done);

  process 
    begin
   
   for j in 0 to 9 loop
   
    binary<=data_test(j);
    reset<='1'; 
    wait for 1 ns;
    reset<='0';
    wait for 1 ns;
    
    for i in 0 to 30 loop
       
       clock<='1';      
       wait for 1 ns;
       clock<= '0';
       wait for 1 ns;    
       
            
    end loop;
   end loop; 
    
    
  
   wait;
  end process;

end test;
