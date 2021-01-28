-- Luiz Walker e Danúbio Edgar
library IEEE;
use IEEE.std_logic_1164.all;


entity testbench is
end testbench;

architecture test of testbench is

component CI74HC595 is

port( oe_barra, rclk, srclr_barra, srclk, ser: in std_logic;
      q: out std_logic_vector( 7 downto 0);
      qh_linha: out std_logic);

end component;

signal oe_barra, rclk, srclr_barra, srclk, ser: std_logic;

signal q: std_logic_vector(7 downto 0);

signal qh_linha: std_logic; 

--Vetor de bits para os testes

signal dados: std_logic_vector(7 downto 0) := "11011011";


begin

dut: CI74HC595 port map(oe_barra, rclk, srclr_barra, srclk, ser, q, qh_linha);


srclr_barra<= '1',
              '0' after 40 ns,
              '1' after 70 ns;

oe_barra <= '0',
            '1' after 50 ns;
            
rclk <= '1',
        '0' after 5 ns,
        '1' after 10 ns,
        '0' after 15 ns,
        '1' after 20 ns,
        '0' after 25 ns,
        '1' after 30 ns,
        '0' after 35 ns,
        '1' after 40 ns,
        '0' after 45 ns,
        '1' after 50 ns,
        '0' after 55 ns,
        '1' after 60 ns,
        '0' after 65 ns,
        '1' after 70 ns,
        '0' after 75 ns,
        '1' after 80 ns,
        '0' after 85 ns;
        
   process
   begin
   
   for i in 7 downto 0 loop
     srclk <= '1';
     ser <= dados(i);
     wait for 10 ns;
     srclk <='0';
     wait for 10 ns;
   end loop;
   wait;
   end process;  
      
end test;