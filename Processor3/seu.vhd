library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seu is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           out_seu : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture Behavioral of seu is

signal out_seu_s : STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');

begin
	process(imm13)
	begin
		if(imm13(12) = '1')then
			out_seu_s(31 downto 13) <= (others=>'1');
		else
			out_seu_s(31 downto 13) <= (others=>'0');
		end if;
		
	out_seu_s(12 downto 0) <= imm13;

	end process;

out_seu <= out_seu_s;

end Behavioral;

