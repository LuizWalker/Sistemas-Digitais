library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity divisor_otimizado is

port(a,b: in std_logic_vector(7 downto 0);
     reset,clock: in std_logic;
     resto,resultado: out std_logic_vector(7 downto 0));

end divisor_otimizado;

architecture por_dentro of divisor_otimizado is

--Para entrar em a
signal numerador: std_logic_vector(15 downto 0):= (others =>'0');
--Para entrar em b
signal denominador: std_logic_vector(15 downto 0):= (others =>'0');
--Para ser a saida
signal res: std_logic_vector(7 downto 0):= (others =>'0');

begin

 process(reset, clock)
 
 variable passos: integer :=0;
 
 begin
 
  if(reset = '1') then
 
   numerador(7 downto 0)<= a;
   numerador(15 downto 8)<= (others =>'0');
 
   denominador(7 downto 0)<= (others =>'0');
   denominador(15 downto 8)<= b;
 
   resto<=(others =>'0');
   resultado<=(others =>'0');
   res<=(others =>'0');
 
   passos := 0;
  
  elsif (rising_edge(clock)) then
  
    if(passos <= 8) then
      
         
      denominador(15)<= '0';
      denominador(14 downto 0)<=denominador(15 downto 1);
      
      passos := passos + 1;
      
      res(7 downto 1) <= res(6 downto 0);
        
        if(numerador >= denominador) then
        
          numerador <= numerador - denominador;
          res(0)<='1';
          
        else
           
          res(0)<='0';
          
        end if;
     end if;
   end if;
   
   resto <= numerador(7 downto 0);
   resultado <= res;
 
 end process;

end por_dentro;