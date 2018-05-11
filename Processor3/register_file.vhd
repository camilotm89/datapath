library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file is
    Port ( nRS1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRS2 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRD : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           RST : in  STD_LOGIC;
			  WE : in STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  CRD : out STD_LOGIC_VECTOR (31 downto 0)
			  );
end register_file;

architecture Behavioral of register_file is

	type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
	signal registers : ram_type :=(others => x"00000000");
	signal temporal : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

begin

	process(nRS1, nRS2, nRD, DWR, RST, registers)
	begin
	
	if( RST = '1')then
		CRS1 <= (others=> '0');
		CRS2 <= (others => '0');
		CRD <= (others => '0');
		registers <= (others => x"00000000");
		
	else
		CRS1 <= registers(conv_integer(nRS1));
		CRS2 <= registers(conv_integer(nRS2));
		if (WE = '1' and nRD /= "000000") then
			registers(conv_integer(nRD))<= DWR;
		end if;
		

	end if;
	
	temporal <= registers(conv_integer(nRD));
	
	if nRD = nRS1 then
		CRS1 <= temporal;
		CRS2 <= registers(conv_integer(nRS2));
		CRD  <= registers(conv_integer(nRD));
		elsif nRD = nRS2 then
			CRS1 <= registers(conv_integer(nRS1));
			CRS2 <= temporal;
			CRD  <= registers(conv_integer(nRD));
		else
			CRS1 <= registers(conv_integer(nRS1));
			CRS2 <= registers(conv_integer(nRS2));
			CRD  <= registers(conv_integer(nRD));
		end if;
	
end process;


end Behavioral;