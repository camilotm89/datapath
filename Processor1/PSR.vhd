library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( clock : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  nCWP : in STD_LOGIC_VECTOR (4 downto 0);
			  icc : out STD_LOGIC_VECTOR (3 downto 0);
			  CWP : out STD_LOGIC_VECTOR (4 downto 0);
			  c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal Registro: STD_LOGIC_VECTOR (31 downto 0):= (others=>'0');

begin
		process(clock)
		begin
		if (rising_edge(clock))then
			if (reset = '1')then
				CWP <= "00000";
				c <= '0';
				icc <= "0000";
			else
				Registro(23 downto 20) <= nzvc;
				Registro(4 downto 0) <= nCWP;
				c <= Registro(20);
				icc <= Registro(23 downto 20);
				nCWP <= Registro(4 downto 0);
			end if;
		end if;
		end process;

end Behavioral;

