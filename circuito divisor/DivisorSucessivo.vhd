library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
-- http://userweb.eng.gla.ac.uk/scott.roy/DCD3/05_Arithmetic.pdf

entity divisor_sucessivo is

port(a,b: in std_logic_vector(7 downto 0);
     reset,clock: in std_logic;
     resto,resultado: out std_logic_vector(7 downto 0));

end divisor_sucessivo;

architecture por_dentro of divisor_sucessivo is

--W é o numerador e X o denominador
signal w,x: std_logic_vector(7 downto 0);
--acc é o resultado
signal acc: std_logic_vector (7 downto 0);

begin

  process(reset,clock)
  
  begin
  
  if(reset='1') then
    w <= a;
    x <= b;
    resto <= (others =>'0');
    resultado <= (others =>'0');
    acc <= (others =>'0');
    
  elsif (rising_edge(clock)) then
     
     if(w >= x) then
        w <= w - x;
        acc<= acc + 1;
        
      elsif(x="00000000") then
  
    resultado <= (others =>'0');
    resto <= (others =>'0');
       
      elsif(w < x) then
  
    resultado <= acc;
    resto <= w;
  
      end if;
          
  end if;  
  
    resultado <= acc;
    resto <= w;

  end process;

end por_dentro;