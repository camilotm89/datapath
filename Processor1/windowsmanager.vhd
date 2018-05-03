-------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity windowsmanager is
    Port ( op : in STD_LOGIC_VECTOR (1 downto 0);
			  op3 : in STD_LOGIC_VECTOR (5 downto 0);
			  cwp : in STD_LOGIC_VECTOR (1 downto 0);
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  ncwp : out STD_LOGIC_VECTOR (1 downto 0):="00";
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end windowsmanager;

architecture Behavioral of windowsmanager is
	signal rs1Integer,rs2Integer,rdInteger: integer range 0 to 39:=0;

begin
process(op, op3,cwp,rs1,rs2,rd)
begin

if(op = "10" and op3 = "111100")then--

else if(op = "10" and op3 = "111101")then--

end process;


end Behavioral;

