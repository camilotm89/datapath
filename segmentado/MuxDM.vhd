library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MuxDM is
Port ( DataMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSC : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxDM;

architecture Behavioral of MuxDM is

begin
process (DataMem,AluResult,PC,RFSC) begin
		case (RFSC) is 
		when "00" => 
		DWR <= DataMem;
		when "01" =>
		DWR <= AluResult;
		when "10" =>
		DWR <= PC;
		when others => 
			DWR <= AluResult;
	end case;
end process;
end Behavioral;

