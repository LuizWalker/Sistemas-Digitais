--CI7404 utilizando vetores


entity testevetores is

port(a: in bit_vector(5 downto 0);
     y: out bit_vector(5 downto 0));
	  
end testevetores;

architecture yaya of testevetores is
begin

 y <= not a;

end yaya;