--	Aula de sistemas digitais 10/03/2020
-- Componente; meio somador; ADDERS; 

entity meiosomador is

port(a,b: in bit;
     p,g: out bit);
	  
end meiosomador;

architecture pelametade of meiosomador is

begin

g <= a and b;
p <= a xor b;

end pelametade;