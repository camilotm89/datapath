library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity DataMemory is
    Port ( cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WRENMEM : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           DataMem : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type reg is array (0 to 31) of std_logic_vector (31 downto 0);
signal myReg : reg := (others => x"00000000");

begin

process(cRD,AluResult,Reset,WRENMEM)
begin
	if (Reset='1') then
		DataMem <= x"00000000";
	else
		if (WRENMEM='1') then
			myReg(conv_integer(AluResult(4 downto 0))) <= cRD;
		else
			DataMem <= myReg(conv_integer(AluResult(4 downto 0)));
		end if;
	end if;
end process;



end Behavioral;
