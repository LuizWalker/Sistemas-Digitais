-- P = presset, dados pré-definidos, é barrado
-- Clock na borda de subida
-- clk <= (clock OR PSControl)
-- entrada serial barrada
-- saida <= Q7,Q6,Q5


library IEEE;
use IEEE.std_logic_1164.all;

entity CD4021B is

  port(presset: in std_logic_vector(0 to 7);
       serial, clock, ps_control: in std_logic;
       saida: out std_logic_vector(0 to 2));

end CD4021B;

architecture por_dentro of CD4021B is

--signal para a passagem dos bits nos flip-flops D
signal dados_ffd: std_logic_vector(0 to 7) := (others => '0');

begin

--Flip-Flops

   process(ps_control, clock)
   begin
   
   if(ps_control = '1') then
     dados_ffd <= presset;   
   elsif rising_edge(clock) then
     dados_ffd(1 to 7) <= dados_ffd(0 to 6);
     dados_ffd(0) <= serial;
    
    --dados_ffd <= serial & presset(1 to 7); --concatenar os vetores
     
   end if;
   
   saida(0) <= dados_ffd(5);
   saida(1) <= dados_ffd(6);
   saida(2) <= dados_ffd(7);
   
   end process;
 
end por_dentro;