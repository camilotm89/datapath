library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Memory is
    Port ( a18in : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           datatomenout : out  STD_LOGIC_VECTOR (31 downto 0);
           wrenmenin : in  STD_LOGIC;
			  Resetext : in STD_LOGIC;
           aluresultout : out  STD_LOGIC_VECTOR (31 downto 0));
end Memory;

architecture Behavioral of Memory is

COMPONENT DataMemory
	PORT(
			  cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WRENMEM : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           DataMem : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	


begin ints_datamemmory: DataMemory PORT MAP(
	
			  cRD => a18in,
           AluResult => aluresultin,
           WRENMEM => wrenmenin,
			  Reset => Resetext,
           DataMem => datatomenout
         
	);
	aluresultout<=aluresultin;


end Behavioral;

