library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Sumador32bit is
Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
		 Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
		 Reset : in  STD_LOGIC;
       Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador32bit;

architecture arq_Sumador32bit of Sumador32bit is

begin
	process(Oper1,Oper2,Reset)
	begin
		if reset='1' then
			Result<= "00000000000000000000000000000000";
		else 	
			Result<= Oper1 + Oper2;
		end if;
	end process;
end arq_Sumador32bit;

