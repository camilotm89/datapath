library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( reset: in STD_LOGIC;
			  out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           CRD : in  STD_LOGIC_VECTOR (31 downto 0);
           WRMEM : in  STD_LOGIC;
           DMCS1 : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
		
		type ram_type is array (0 to 63) of STD_LOGIC_VECTOR (31 downto 0);
		signal ram : ram_type := (others => x"00000000");

begin
	process(reset, out_ppal, CRD, WRMEM)
		begin
			if(WRMEM = '0')then
				DMCS1 <= ram(conv_integer(out_ppal(5 downto 0)));
			else
				ram(conv_integer(out_ppal(5 downto 0))) <= CRD;
			end if;
	end process;
				

end Behavioral;

