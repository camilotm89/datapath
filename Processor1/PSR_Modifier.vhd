library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PSR_Modifier is
    Port ( aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

begin
		process(aluop, out_ppal, crs1, crs2)
			begin
				if (aluop = "010000" or aluop = "011000")then -- Addcc y AddXcc
					nzvc(0) <= (crs1(31) and crs2(31)) or (not(out_ppal(31)) and (crs1(31) or crs2(31)));
					nzvc(1) <= (crs1(31) and crs2(31) and (not out_ppal(31))) or (crs1(31) and (not crs2(31)) and out_ppal(31));
			
				end if;
				
				if (aluop = "010100" or aluop = "011100")then -- Subcc y SubXcc
					nzvc(0) <= (((not crs1(31)) and crs2(31)) or (out_ppal(31) and ((not crs1(31)) or crs2(31))));
					nzvc(1) <= ((not crs1(31) and crs2(31)) or (out_ppal(31) and (not crs1(31)) and crs2(31)));
				end if;
				
				if (aluop = "010001" or aluop = "010101" or aluop = "010010" or aluop = "010110" or aluop = "010011" or aluop = "010111")then
					nzvc(1) <= '0';
					nzvc(0) <= '0';				
				end if;
		end process;

end Behavioral;
