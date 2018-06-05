library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    Port ( Entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           sumador : in  STD_LOGIC_VECTOR (31 downto 0);
           Cuentrada : in  STD_LOGIC_VECTOR (1 downto 0);
           posicion : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux2;

architecture Behavioral of Mux2 is

begin
	process(Entrada,sumador,Cuentrada)
	begin

		if (Cuentrada="10") then
			posicion<=sumador;
		elsif (Cuentrada="00" or Cuentrada="01" or Cuentrada="11") then
			posicion<=Entrada;
		end if;
			
	end process;
	
end Behavioral;

