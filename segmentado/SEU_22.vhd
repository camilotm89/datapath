library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU_22 is
    Port ( Imm_22 : in  STD_LOGIC_VECTOR (21 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_22;

architecture Behavioral of SEU_22 is
begin
	process (Imm_22 ) begin
		if(Imm_22(21) = '1')then
			Imm_32<= "1111111111" & Imm_22;
		elsif(Imm_22(21) = '0')then
			Imm_32<= "0000000000" & Imm_22;
		end if;
	end process;	

end Behavioral;


