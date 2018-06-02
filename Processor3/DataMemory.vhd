library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( reset: in STD_LOGIC;
			  out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           CRD : in  STD_LOGIC_VECTOR (31 downto 0);
           WRMEM : in  STD_LOGIC;
           DATOMEM : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
		
		type ram_type is array (0 to 63) of STD_LOGIC_VECTOR (31 downto 0);
		signal ram : ram_type := (others => x"00000000");
		signal DATOMEM_s : std_logic_vector (31 downto 0) := x"00000000";

begin
	process(reset, out_ppal, CRD, WRMEM)
		begin
		if (reset = '1')then
			ram <= (others => x"00000000");
			
			elsif(WRMEM = '0')then
				DATOMEM_s <= ram(conv_integer(out_ppal(5 downto 0)));
			else
				ram(conv_integer(out_ppal(5 downto 0))) <= CRD;
		end if;
	end process;

DATOMEM <= DATOMEM_s;

end Behavioral;