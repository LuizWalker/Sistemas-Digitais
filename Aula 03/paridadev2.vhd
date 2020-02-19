-- Simulação 02, Aula de Sistemas Digitais 19/02/2020

entity paridadev2 is
generic(size: integer := 24);
port(input: in bit_vector(size - 1 downto 0);
     bp: out bit);
end paridadev2;

architecture complicada of paridadev2 is
signal s: bit_vector(size downto 0);
begin
s(0) <= '0';
tie: for i in 0 to size-1 generate
   s(i+1) <= s(i) xor input(i);
end generate;
bp <= s(size);

end complicada;