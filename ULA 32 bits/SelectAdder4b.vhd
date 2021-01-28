library IEEE;
use IEEE.std_logic_1164.all;

entity SelectAdder4b is

port(a,b: in bit_vector(3 downto 0);
     s: out bit_vector(3 downto 0);
	  cin: in bit;
	  cout: out bit);

end SelectAdder4b;

architecture selectsoma of SelectAdder4b is

component RippleCarryAdder is 
port(a,b: in bit_vector(3 downto 0);
     s: out bit_vector(3 downto 0);
	  cin: in bit;
	  cout: out bit);
end component;

signal s0,s1:bit_vector(3 downto 0);
signal cout0,cout1:bit;


begin

s4b0: RippleCarryAdder port map(a,b,s0,'0',cout0);
s4b1: RippleCarryAdder port map(a,b,s1,'1',cout1);

s <= s0 when cin = '0' else
     s1;

cout <= cout0 when cin = '0' else
        cout1;

end selectsoma;