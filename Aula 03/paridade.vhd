--Aula de Sistemas Digitais 19/02/2020

entity paridade is
port(a,b,c,d: in bit;
     bp: out bit);
end paridade;

architecture piseiro of paridade is
begin

bp <= a xor b xor c xor d;

end piseiro;