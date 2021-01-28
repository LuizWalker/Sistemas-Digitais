-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity gerador_sinais is

port(clock,stop,go: in std_logic;
     up,down: out std_logic);

end gerador_sinais;

architecture por_dentro of gerador_sinais is

type states is (state_stop, state_down, state_go);

signal atual_state: states;

begin

-----------------------------------------------------------------------
  process(clock,stop,go)
  
  variable counter: integer := 0;
  
    begin
    
       if((falling_edge(stop)) or (falling_edge(go)) or (rising_edge(go))) then
       counter:=0;
       end if;
       
       if(stop = '1') then
       
         atual_state<=state_stop;
         counter:=0;
       
       elsif((go='0')and(stop='0')) then
         
         if(counter >= 11) then
          atual_state <= state_down;
         
         else
          atual_state<=state_stop;
          counter:=counter+1;
         end if;
         
       elsif((go='1')and(stop='0')) then  
       
         if(counter >= 11) then
          atual_state <= state_go;
          
         else
         atual_state<=state_stop;
         counter:=counter+1;
         end if;       
                    
        --counter:=counter+1;
        
        end if; 
                  

    
  end process;
------------------------------------------------------------------------

  process(atual_state)
    begin
    
    if((atual_state = state_stop)) then
    

     up<='0';
     down<='0';
    
    
     
    elsif ((atual_state = state_down)) then    
     

     up<='0';
   
     down<='1';
    
   
     
    elsif ((atual_state = state_go)) then 
    

     down<='0';
     
     up<='1';
     
  
    
    end if;    
  
  end process;
-----------------------------------------------------------------------
end por_dentro;