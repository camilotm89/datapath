library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity PC is
    Port ( inPC : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           outPC : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture arqPC of PC is
begin
	process(Clk,Reset,inPC)
	begin
		if(Reset = '1')then
			outPC<="00000000000000000000000000000000";	
		elsif(rising_edge(Clk)) then
				outPC<=inPC;
		end if;
		
	end process;
end arqPC;

