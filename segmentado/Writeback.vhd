library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Writeback is
    Port ( datatomenin : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0));
end Writeback;


architecture Behavioral of Writeback is
COMPONENT MuxDM
	PORT(
			  DataMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSC : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;		

signal a999: std_logic_vector(31 downto 0);


begin ints_muxdatamemory: MuxDM PORT MAP(
	
			  DataMem => datatomenin,
           AluResult => aluresultin,
           PC => pc,
           RFSC => rfsourcein,
           DWR => a999
         
	);
	
	datatoreg<=a999;

end Behavioral;

