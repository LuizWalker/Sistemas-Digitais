--Luiz Walker e Danúbio Edgar
library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is

port(LT,BL,LE: in bit;
       D: in bit_vector(3 downto 0);
       S: out bit_vector(6 downto 0));
end decoder;

architecture decoder_esqueleto of decoder is

signal latch : bit_vector(3 downto 0);
signal saida : bit_vector(6 downto 0);
signal teste : bit_vector (6 downto 0);

begin

latch <= D when LE = '0' else
         latch;
         
saida <= "0000000" when BL = '0' else
         "1111110" when latch = "0000" else
         "0110000" when latch = "0001" else
         "1101101" when latch = "0010" else
         "1111001" when latch = "0011" else
         "0110011" when latch = "0100" else
         "1011011" when latch = "0101" else
         "1011111" when latch = "0110" else
         "1110000" when latch = "0111" else
         "1111111" when latch = "1000" else
         "1110011" when latch = "1001" else
         "0000000" when latch = "1010" else
         "0000000" when latch = "1011" else
         "0000000" when latch = "1100" else
         "0000000" when latch = "1101" else
         "0000000" when latch = "1110" else
         "0000000" when latch = "1111";
         
teste <="1111111" when LT ='0' else
         saida;
         

S <= teste;


end decoder_esqueleto;