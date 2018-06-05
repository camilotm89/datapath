library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTSEU : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arqSEU of SEU is
begin
	process(Instruction)
	begin 
		if(Instruction(12) = '1')then
			OUTSEU<= "1111111111111111111" & Instruction(12 downto 0);
		elsif(Instruction(12) = '0')then
			OUTSEU<= "0000000000000000000" & Instruction(12 downto 0);
		end if;
	end process;	
end arqSEU;

