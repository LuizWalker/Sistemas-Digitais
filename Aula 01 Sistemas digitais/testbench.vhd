entity testbench is
end testbench;

architecture teste of testbench is

component CI7404 is
port(A1,A2,A3,A4,A5,A6: in bit;
     Y1,Y2,Y3,Y4,Y5,Y6: out bit);
end component;

signal A1,A2,A3,A4,A5,A6: bit; 
signal Y1,Y2,Y3,Y4,Y5,Y6: bit;

begin

dut:CI7404 port map(A1,A2,A3,A4,A5,A6
                   ,Y1,Y2,Y3,Y4,Y5,Y6);

A1 <= '0', 
      '1' after 10 ns,
      '0' after 20 ns;	
	
A2 <= '0', 
      '1' after 30 ns,
      '0' after 40 ns;	
	
A3 <= '0', 
      '1' after 50 ns,
      '0' after 60 ns;	
	
A4 <= '0', 
      '1' after 70 ns,
      '0' after 80 ns;	
	
A5 <= '0', 
      '1' after 90 ns,
      '0' after 100 ns;	
	
A6 <= '0', 
      '1' after 110 ns,
      '0' after 120 ns;		

end teste;