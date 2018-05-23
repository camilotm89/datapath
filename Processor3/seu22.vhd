library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity seu22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           out_disp22 : out  STD_LOGIC_VECTOR (31 downto 0));
end seu22;

architecture Behavioral of seu22 is

signal out_disp22_s : STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');

begin
		process(disp22)
			begin
				if (disp22(21) = '1')then
					out_disp22_s(31 downto 22) <= (others=>'1');
					out_disp22_s(21 downto 0)  <= disp22;
				else
					out_disp22_s(31 downto 22) <= (others=>'0');
					out_disp22_s(21 downto 0)  <= disp22;
				end if;

		end process;
		
out_disp22 <= out_disp22_s;


end Behavioral;

