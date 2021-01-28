-- 1- divisor otimizado
-- 2- divisor sucessivo

end circuito_divisor;

architecture por_dentro of circuito_divisor is

-----------------------------------------

component divisor_otimizado is

port(a,b: in std_logic_vector(7 downto 0);
     reset,clock: in std_logic;
     resto,resultado: out std_logic_vector(7 downto 0));

end component;

-----------------------------------------

component divisor_sucessivo is

port(a,b: in std_logic_vector(7 downto 0);
     reset,clock: in std_logic;
     resto,resultado: out std_logic_vector(7 downto 0));

end component; 

------------------------------------------

signal res_1,res_2: std_logic_vector(7 downto 0);
signal sobra_1, sobra_2: std_logic_vector(7 downto 0);

------------------------------------------

begin

div_otimizado: divisor_otimizado port map(a,b,reset,clock,sobra_1,res_1);

div_sucessivo: divisor_sucessivo port map(a,b,reset,clock,sobra_2,res_2);

resultado_1 <= res_1;
resto_1 <= sobra_1;

resultado_2 <= res_2;
resto_2 <= sobra_2;


end por_dentro;