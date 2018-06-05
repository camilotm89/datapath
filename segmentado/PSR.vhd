library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC;
			  cwp : out  STD_LOGIC;
			  ncwp : in  STD_LOGIC;
			  rest : in  STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is
begin
process(clk,nzvc,ncwp,rest)
	begin
		if(rest = '1') then
				cwp  <='0';
				c <= '0';
				icc <= "0000";
		elsif rising_edge(clk)  then
			c<=nzvc(0);
			cwp<=ncwp;
			icc <= nzvc;
		end if;	
	
end process;
end Behavioral;

