-- Code your design here

-- O arquivo de Testbench deve mostrar o bom funcionamento do dispositivo gerando e verificando o CRC de, pelo menos, 5 pacotes de dados de 32 bits.
-- Adicione Asserts no testbench para mostrar os dados (Data+CRC) e o status (íntegro ou corrompido) no console



library IEEE;
use IEEE.std_logic_1164.all;

entity CRC_16_USB is
port(
      CLK: in std_logic;          -- Sinal de Clock. Para esse projeto, trabalhando em borda de subida.
      DATA_IN: in std_logic;      -- Serial Input.
      CLR: in std_logic;          -- Sinal assíncrono para limpar todos os FFs. Active High
      CRC_OUT: out std_logic_vector(15 downto 0);    -- Saída paralela dos FFs
      CRC_STATUS: out std_logic   -- ‘1’ quando CRC_OUT for igual à 0, ‘0’ caso contrário.
     );
end CRC_16_USB;

architecture por_dentro of CRC_16_USB is

--signal para os dados dos ffd
signal dados_ffd: std_logic_vector(15 downto 0):= (others => '0');


begin

--Comportamento do CRC
      process(CLK,CLR)
       begin
       
        if(CLR = '1') then
          dados_ffd <= (others => '0');
        elsif rising_edge(CLK) then
        dados_ffd(0) <= dados_ffd(15) xor DATA_IN;
        dados_ffd(1) <= dados_ffd(0);
        dados_ffd(2) <= dados_ffd(15) xor dados_ffd(1); 
        dados_ffd(3) <= dados_ffd(2);
        dados_ffd(4) <= dados_ffd(3);
        dados_ffd(5) <= dados_ffd(4);
        dados_ffd(6) <= dados_ffd(5);
        dados_ffd(7) <= dados_ffd(6);
        dados_ffd(8) <= dados_ffd(7);
        dados_ffd(9) <= dados_ffd(8);
        dados_ffd(10) <= dados_ffd(9);
        dados_ffd(11) <= dados_ffd(10);
        dados_ffd(12) <= dados_ffd(11);
        dados_ffd(13) <= dados_ffd(12);
        dados_ffd(14) <= dados_ffd(13);
        dados_ffd(15) <= dados_ffd(15) xor dados_ffd(14);
        end if;

      end process;

--Saídas
CRC_OUT<=dados_ffd;

CRC_STATUS<= '1' when CRC_OUT ="0000000000000000"else
             '0';

end por_dentro;