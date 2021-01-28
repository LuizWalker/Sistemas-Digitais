-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity gerador is

port(clock: in std_logic;
     saida_1,saida_2: out std_logic);

end gerador;

architecture por_dentro of gerador is

type state is (one,two,three,four,five,six,seven,eight);

signal atual_state1, next_state1: state;
signal atual_state2, next_state2: state;

begin
--------------------------------------------------------------------------------
 process(clock)

    begin
   
     if(clock'event and clock ='1')then
      atual_state1<= next_state1;
     end if;

 end process;
------------------------------------------------------------------------------- 
 process(clock)

   begin
   
    if((clock'event and clock ='1') or (clock'event and clock ='0'))then
      atual_state2<= next_state2;
    end if;

 end process;
--------------------------------------------------------------------------------
 process(atual_state1)
 
 begin
 
   if(atual_state1 = one) then
    saida_1<='0';
    next_state1<= two;
   elsif(atual_state1 = two)then
    saida_1<='1';
    next_state1<=three;
   elsif(atual_state1 = three)then
    saida_1<='0';
    next_state1<=four;
   elsif(atual_state1 = four)then
   saida_1<='0';
    next_state1<=one;
   end if; 
 
 end process;
 
---------------------------------------------------------------------------------

 process(atual_state2)
 
 begin
 
   if(atual_state2 = one) then
    saida_2<='0';
    next_state2<= two;
   elsif(atual_state2 = two)then
    saida_2<='1';
    next_state2<=three;
   elsif(atual_state2 = three)then
    saida_2<='1';
    next_state2<=four;
   elsif(atual_state2 = four)then
    saida_2<='0';
    next_state2<=five;
   elsif(atual_state2 = five)then
    saida_2<='1';
    next_state2<=six;    
   elsif(atual_state2 = six)then
    saida_2<='0';
    next_state2<=seven;    
   elsif(atual_state2 = seven)then
    saida_2<='0';
    next_state2<=eight;
   elsif(atual_state2 = eight)then
    saida_2<='0';
    next_state2<=one;
   end if;           
 
 end process;
 

---------------------------------------------------------------------------------

end por_dentro;