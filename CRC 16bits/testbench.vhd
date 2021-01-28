-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component CRC_16_USB is
port(
      CLK: in std_logic;          
      DATA_IN: in std_logic;      
      CLR: in std_logic;          
      CRC_OUT: out std_logic_vector(15 downto 0);    
      CRC_STATUS: out std_logic   
     );
end component;

signal CLK,DATA_IN,CLR: std_logic;
signal CRC_OUT: std_logic_vector(15 downto 0);
signal CRC_STATUS: std_logic;

--Data test

type matriz is array(0 to 4) of std_logic_vector(0 to 31);

signal data_test : matriz :=("11110011001111010000000000000000",
                             "11111111001111010000000000000000",
                             "11110011001111110000000000000000",
                             "11111111111111110000000000000000",
                             "11110111001111010000000000000000");

begin

dut: CRC_16_USB port map(CLK, DATA_IN, CLR, CRC_OUT, CRC_STATUS); 

--Fazer os loops
    process
    begin
    --1° passagem de dados
    
    CLR<= '0';
    
    for i in 0 to 4 loop
       for j in 0 to 31 loop
       CLK<='1';
       DATA_IN <= data_test(i)(j);
       wait for 1 ns;
       CLK<= '0';
       wait for 1 ns;       
       end loop;
     data_test(i)(16 to 31)<=CRC_OUT;
     --DATA_IN+CRC
     wait for 1 ns;
      report "data_in+crc="& to_string(data_test(i)) severity note;
     
     CLR <= '1',
       	    '0' after 1 ns;             
    end loop;
    
    --2°  passagem de dados
    for i in 0 to 4 loop
      
       for j in 0 to 31 loop
       CLK<='1';
       DATA_IN <= data_test(i)(j);
       wait for 1 ns;
       CLK<= '0';
       wait for 1 ns;       
       end loop;
      wait for 1 ns;
      assert CRC_STATUS='0' report "pacote de dados integros" severity note;
      assert CRC_STATUS='1' report "pacote de dados corrompidos" severity note;
      
      CLR <= '1',
       	     '0' after 1 ns;  
                    
      
    end loop;    
      
    
    wait;   
              
    end process;
    
      
end test;