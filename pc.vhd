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
	process(clk)
	begin
		if (rst = '1')then
			PCout <= "00000000000000000000000000000000";
			
		else
			if (rising_edge(clk))then
				PCout <= pcadder;
			end if;
		end if;
				

end process;
end Behavioral;

