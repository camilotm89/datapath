library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
				if 

end Behavioral;

