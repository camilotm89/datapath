library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( clock : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  nCWP : in STD_LOGIC_VECTOR (1 downto 0);
			  CWP : out STD_LOGIC_VECTOR (1 downto 0);
			  c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal s_cwp: STD_LOGIC_VECTOR (1 downto 0):= (others=>'0');
signal s_carry: STD_LOGIC :='0';

begin
	process(clock, reset, nzvc)
		begin
			if (reset = '1')then
				s_cwp<= "00";
				s_carry <= '0';
			else
				if(rising_edge(clock)) then
				s_carry <= nzvc(0);
				s_cwp <= nCWP;
			end if;
		end if;
	end process;

CWP <= s_cwp;
c <= s_carry;

end Behavioral;
