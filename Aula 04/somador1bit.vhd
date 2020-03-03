--AULA 03/03/2020: somador de 1 bit

entity somador1bit is
port(a,b,cin: in bit;
     s,cout: out bit);
end somador1bit;

architecture cumbuca of somador1bit is
signal valor: bit;
begin

valor <= a xor b;
s <= cin xor valor;
cout <= (a and b) or (cin and valor);


end cumbuca;