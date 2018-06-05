library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU_30 is
    Port ( Imm_30 : in  STD_LOGIC_VECTOR (29 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_30;

architecture Behavioral of SEU_30 is
begin
	process (Imm_30 ) begin
		if(Imm_30(29) = '1')then
			Imm_32<= "11" & Imm_30;
		elsif(Imm_30(29) = '0')then
			Imm_32<= "00" & Imm_30;
		end if;
	end process;	

end Behavioral;
