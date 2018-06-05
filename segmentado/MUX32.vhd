library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX32 is
    Port ( SEUIMM : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0)
			  );
end MUX32;

architecture arqMUX32 of MUX32 is

begin
	process(Instruction,CRS2,SEUIMM)
	begin 
		if(Instruction(13) = '1')then
			OPER2<=SEUIMM;
		elsif(Instruction(13) = '0')then
			OPER2<=CRS2;
		end if;
	end process;		
end arqMUX32;

