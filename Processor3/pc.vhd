library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pc is
    Port ( pcadder : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is

begin
	process(clk, rst)
	begin
		if (rising_edge(clk)) then
			if (rst = '0') then
				PCout <= pcadder;
			else
				PCout <= "00000000000000000000000000000000";
			end if;
		end if;
				
end process;
end Behavioral;

