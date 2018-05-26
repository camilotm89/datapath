library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity seu30 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           out_disp30 : out  STD_LOGIC_VECTOR (31 downto 0));
end seu30;

architecture Behavioral of seu30 is

signal out_disp30_s : STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');

begin
		process(disp30)
			begin
				if (disp30(29) = '1')then
					out_disp30_s(31 downto 30) <= (others=>'1');
					else
					out_disp30_s(31 downto 30) <= (others=>'0');
				end if;
				out_disp30_s(29 downto 0) <= disp30;
		end process;
		
out_disp30 <= out_disp30_s;


end Behavioral;
