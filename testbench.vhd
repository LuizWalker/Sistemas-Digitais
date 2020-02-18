entity testbench is
end testbench;

architecture test of testbench is

component testevetores is

port(a: in bit_vector(5 downto 0);
     y: out bit_vector(5 downto 0));
	  
end component;

signal entrada: bit_vector(5 downto 0);
signal saida: bit_vector(5 downto 0);

begin

dut: testevetores port map(entrada,saida);

entrada <= "000000",
           "001010" after 10 ns,
			  "110100" after 20 ns,
           "111001" after 30 ns,
           "000000" after 40 ns;
			  
end test;