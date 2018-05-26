library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;



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
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           o7: out STD_LOGIC_VECTOR(5 downto 0));
end windowsmanager;

architecture Behavioral of windowsmanager is
	signal nrs1_s : STD_LOGIC_VECTOR(5 downto 0):=(others=>'0');
	signal nrs2_s : STD_LOGIC_VECTOR(5 downto 0):=(others=>'0');
	signal ncwp_s : STD_LOGIC_VECTOR(1 downto 0):=(others=>'0');
	signal nrd_s  : STD_LOGIC_VECTOR(5 downto 0):=(others=>'0');
   signal o7_s   : STD_LOGIC_VECTOR(6 downto 0):=(others=>'0');

begin
	o7_s <= cwp*"10000";
	o7 <= o7_s(5 downto 0)+"001111";

process(op, op3,cwp,rs1,rs2,rd)
begin

if(op = "10" and op3 = "111100")then--save 
	ncwp_s <= (cwp-1);

else 
	if(op = "10" and op3 = "111101")then-- restore
		ncwp_s <= cwp+1;
	end if;
end if;

if(rs1>="00000" and rs1<="00111") then--valores globales
		nrs1_s(4 downto 0)<= rs1;
	else
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
end if;

if(rs2>="00000" and rs2<="00111") then--valores globales
		nrs2_s(4 downto 0)<= rs2;
	else
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
end if;

if(rd>="00000" and rd<="00111") then--valores globales
			nrd_s(4 downto 0)<= rd;
		else
			if (rd>="11000" and rd<= "11111")then 
				nrd_s<= '0'&rd-(conv_integer(cwp)*16);
			else 
				if (rd>="10000" and rd<= "10111")then
					nrd_s<= '0'&rd+(conv_integer(cwp)*16);
				else 
					if (rd>="01000" and rd<= "01111")then
						nrd_s<= '0'&rd+(conv_integer(cwp)*16);
					end if;
				end if;	
			end if;
end if;

end process;

nrs1 <= nrs1_s;
nrs2 <= nrs2_s;
nrd  <= nrd_s;
ncwp <= ncwp_s;

end Behavioral;

