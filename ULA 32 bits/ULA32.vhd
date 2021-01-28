-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity SelectAdder32b is

port(a,b: in bit_vector(31 downto 0);
     s: out bit_vector(31 downto 0);
	  cin: in bit;
	  cout: out bit);

end SelectAdder32b;

architecture soma32b of SelectAdder32b is

component SelectAdder4b is

port(a,b: in bit_vector(3 downto 0);
     s: out bit_vector(3 downto 0);
	  cin: in bit;
	  cout: out bit);
      

end component;

signal carry: bit_vector(8 downto 0);
signal opr: bit_vector(31 downto 0);

begin

opr(0) <= cin xor b(0);
opr(1) <= cin xor b(1);
opr(2) <= cin xor b(2);
opr(3) <= cin xor b(3);
opr(4) <= cin xor b(4);
opr(5) <= cin xor b(5);
opr(6) <= cin xor b(6);
opr(7) <= cin xor b(7);
opr(8) <= cin xor b(8);
opr(9) <= cin xor b(9);
opr(10) <= cin xor b(10);
opr(11) <= cin xor b(11);
opr(12) <= cin xor b(12);
opr(13) <= cin xor b(13);
opr(14) <= cin xor b(14);
opr(15) <= cin xor b(15);
opr(16) <= cin xor b(16);
opr(17) <= cin xor b(17);
opr(18) <= cin xor b(18);
opr(19) <= cin xor b(19);
opr(20) <= cin xor b(20);
opr(21) <= cin xor b(21);
opr(22) <= cin xor b(22);
opr(23) <= cin xor b(23);
opr(24) <= cin xor b(24);
opr(25) <= cin xor b(25);
opr(26) <= cin xor b(26);
opr(27) <= cin xor b(27);
opr(28) <= cin xor b(28);
opr(29) <= cin xor b(29);
opr(30) <= cin xor b(30);
opr(31) <= cin xor b(31);

carry(0) <= cin;
cout <= carry(8);

selectadder0:  SelectAdder4b port map(a(3 downto 0), opr(3 downto 0), s(3 downto 0), cin, carry(1));

selectadder1:  SelectAdder4b port map(a(7 downto 4), opr(7 downto 4), s(7 downto 4), carry(1), carry(2));

selectadder2:  SelectAdder4b port map(a(11 downto 8), opr(11 downto 8), s(11 downto 8), carry(2), carry(3));

selectadder3:  SelectAdder4b port map(a(15 downto 12), opr(15 downto 12), s(15 downto 12), carry(3), carry(4));

selectadder4:  SelectAdder4b port map(a(19 downto 16), opr(19 downto 16), s(19 downto 16), carry(4), carry(5));

selectadder5:  SelectAdder4b port map(a(23 downto 20), opr(23 downto 20), s(23 downto 20), carry(5), carry(6));

selectadder6:  SelectAdder4b port map(a(27 downto 24), opr(27 downto 24), s(27 downto 24), carry(6), carry(7));

selectadder7:  SelectAdder4b port map(a(31 downto 28), opr(31 downto 28), s(31 downto 28), carry(7), carry(8));

end soma32b;