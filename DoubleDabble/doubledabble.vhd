
--O reset deve ser assíncrono e active-high.
--O pino done vai para high quando o resultado está pronto e só volta para low depois de um reset.


library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity doubledabble is

port(binary: in std_logic_vector(7 downto 0);
     clock,reset: in std_logic;
     centena,dezena,unidade: out std_logic_vector(3 downto 0);
     done: out std_logic);
     
end doubledabble;

architecture por_dentro of doubledabble is

  signal binary_2 : std_logic_vector(19 downto 0);
  
  type states is (idle,check,shift,finish);
  signal state : states := idle;

begin

centena <= binary_2(19 downto 16);
dezena <= binary_2(15 downto 12);
unidade <= binary_2(11 downto 8);	

-------------------------------------------------------------------
 process(reset,clock)
 
    variable contador : integer := 0;
 
  begin
  
   if(reset = '1') then
   
      binary_2 <= x"000" & binary;  
      state <= idle;      
      done <= '0';
      contador := 0;
      
   elsif(falling_edge(clock))then
       
       if(state = idle) then
          
          state <= check;
          
       elsif(state = shift) then
        
        binary_2 <= binary_2(18 downto 0) & '0';
        contador := contador + 1;
        state<=check;
        
       elsif(state = check) then
       
        if(contador = 8) then
        
          state <= finish;
        
        else
          
           if(binary_2(11 downto 8) >= x"5") then
              
              binary_2(11 downto 8) <= binary_2(11 downto 8) + x"3";
           
           end if;  
           
           if(binary_2(15 downto 12) >= x"5") then
              
              binary_2(15 downto 12) <= binary_2(15 downto 12) + x"3";
           
           end if; 
           
           state <= shift;
           
         end if;
       
       elsif(state = finish) then
       
         done <= '1';
         
       end if;
    end if;   
    
    
 end process;
-------------------------------------------------------------------

end por_dentro;
