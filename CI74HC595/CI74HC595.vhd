--os clocks são na borda de descida
--as portas tri-state só devem funcionar quando o sinal for '0'
-- o registrador tem 8 bits;

-- OE_barrado = sinal pras portas tri-state

-- RCLK = clock da segunda coluna de FF-D, borda de descida

-- SRCLR_barrado = sinal de reset da primeira coluna de FF-D, borda de descida

-- SRCLK = clock da primeira coluna de FF-D, borda de descida 

-- SER = entrada de dados

-- q = saída final do registrador

-- qh_linha = última tri-state

library IEEE;
use IEEE.std_logic_1164.all;

entity CI74HC595 is

port( oe_barra, rclk, srclr_barra, srclk, ser: in std_logic;
      q: out std_logic_vector(7 downto 0);
      qh_linha: out std_logic);

end CI74HC595;

architecture por_dentro of CI74HC595 is

--Sinal pra guardar os dados da primeira coluna
 signal dados_coluna1: std_logic_vector(7 downto 0) := (others => '0');
 
--Sinal pra guardar os dados da segunda coluna
 signal dados_coluna2: std_logic_vector(7 downto 0) := (others => '0');

begin

-- primeira coluna

  process(srclk,srclr_barra)
  begin
  
  if(srclr_barra = '0') then
   dados_coluna1 <=(others => '0'); --others 0 é diferente de 00000000
  elsif(srclk'event and srclk='0') then
   dados_coluna1(7 downto 1) <= dados_coluna1(6 downto 0);
   dados_coluna1(0)<= ser;
  end if;
  
  end process;
  
-- segunda coluna 

  process(rclk)
  begin
  
  if(rclk'event and rclk = '0') then
  dados_coluna2 <= dados_coluna1;
  end if;
  
  end process;
  
-- terceira coluna 

q <= dados_coluna2 when oe_barra = '0' else
     (others => 'Z');
                    
  qh_linha<= dados_coluna1(7);


end por_dentro;
