library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           out_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end mux;

architecture Behavioral of mux is

begin
	process(a,b,sel)
	begin
		if (sel = '0')then
			out_mux <= a;
		else
			out_mux <= b;
		end if;
	end process;

end Behavioral;

