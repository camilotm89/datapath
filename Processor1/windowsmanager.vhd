library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



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
	signal nrs1_s : STD_LOGIC_VECTOR(5 downto 0):=(others=>'0');
	signal nrs2_s : STD_LOGIC_VECTOR(5 downto 0):=(others=>'0');

begin
process(op, op3,cwp,rs1,rs2,rd)
begin

if(op = "10" and op3 = "111100")then--save 
	ncwp <= (cwp-"01");

else 
	if(op = "10" and op3 = "111101")then-- restore
		ncwp<= cwp+"01";
	end if;
end if;

if (rs1>="11000" and rs1<= "11111")then 
	nrs1_s<= '0'&rs1-(conv_integer(cwp)*16);
else 
	if (rs1>="10000" and rs1<= "10111")then 
		nrs1_s<= '0'&rs1+(conv_integer(cwp)*16);
	else 
		if (rs1>="01000" and rs1<= "01111")then
			nrs1_s<= '0'&rs1+(conv_integer(cwp)*16);
		end if;
	end if;	
end if;


if (rs2>="11000" and rs2<= "11111")then 
	nrs2_s<= '0'&rs2-(conv_integer(cwp)*16);
else 
	if (rs2>="10000" and rs2<= "10111")then
		nrs2_s<= '0'&rs2+(conv_integer(cwp)*16);
	else 
		if (rs2>="01000" and rs2<= "01111")then
			nrs2_s<= '0'&rs2+(conv_integer(cwp)*16);
		end if;
	end if;	
end if;

if (rd>="11000" and rd<= "11111")then 
	nrd<= '0'&rd-(conv_integer(cwp)*16);
else 
	if (rd>="10000" and rd<= "10111")then
		nrd<= '0'&rd+(conv_integer(cwp)*16);
	else 
		if (rd>="01000" and rd<= "01111")then
			nrd<= '0'&rd+(conv_integer(cwp)*16);
		end if;
	end if;	
end if;

end process;

nrs1 <= nrs1_s;
nrs2 <= nrs2_s;

end Behavioral;

