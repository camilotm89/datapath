library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_Modifier is
    Port ( aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : in  STD_LOGIC;
           crs2 : in  STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
			);
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

signal nzvc_s : STD_LOGIC_VECTOR(3 downto 0):= "0000";

begin
		process(aluop, out_ppal, crs1, crs2)
			begin
				if (aluop = "001000" or aluop = "001010")then -- Addcc y AddXcc
					nzvc_s(3) <= out_ppal(31); --N
					if(out_ppal = x"00000000")then -- Z
						nzvc_s(2) <= '1';
					else
						nzvc_s(2) <= '0';
					end if;
					if ((crs1='1' and crs2='1' and  out_ppal(31)='0') or (crs1='0' and crs2='0' and out_ppal(31)='1'))then -- V
							nzvc_s(1) <='1';
							else
							nzvc_s(1) <='0';
					end if; 
					if ((crs1='1' and crs2='1') or (out_ppal(31)='0' and (crs1='1' or crs2='1')))then --C
						nzvc_s(0) <='1';
						else
						nzvc_s(0) <='0';
					end if;
				end if;
				
					if (aluop = "001011" or aluop = "001110")then -- Subcc y SubXcc
						nzvc_s(3) <= out_ppal(31); --N
						if(out_ppal = x"00000000")then --Z
							nzvc_s(2) <= '1';
						else
							nzvc_s(2) <= '0';
						end if;
						if ((crs1='1' and crs2='0' and  out_ppal(31)='0') or (crs1='0' and crs2='1' and out_ppal(31)='1'))then --V
							nzvc_s(1) <= '1';
							else
							nzvc_s(1) <= '0';
						end if;
						if ((crs1='0' and crs2='1') or (out_ppal(31)='1' and (crs1='0' or crs2='1')))then --C
							nzvc_s(0) <= '1';
							else
							nzvc_s(0) <= '0';
						end if;
					end if;
				
					if (aluop = "001110" or aluop = "001111" or aluop = "010000" or aluop = "010001" or aluop = "010010" or aluop = "010011")then -- Andcc, Andncc, Orcc, Orncc, Xorcc y Xnorcc
						nzvc_s(3) <= out_ppal(31); --N
						if(out_ppal = x"00000000")then --Z
							nzvc_s(2) <= '1';
						else
							nzvc_S(2) <= '0';
						end if;
						nzvc_s(1) <= '0'; --V
						nzvc_s(0) <= '0'; --C
					end if;
				
end process;

nzvc <= nzvc_s;

end Behavioral;