library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barra4 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           datatomenout : out  STD_LOGIC_VECTOR (31 downto 0);
           aluresultout : out  STD_LOGIC_VECTOR (31 downto 0);
           datatomenin : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           pcin : in  STD_LOGIC_VECTOR (31 downto 0);
			  
			  RD : in STD_LOGIC_VECTOR (5 downto 0);
			  RDout : out  STD_LOGIC_VECTOR (5 downto 0);
			  
           rfsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           rfsource : out  STD_LOGIC_VECTOR (1 downto 0);
           pcout : out  STD_LOGIC_VECTOR (31 downto 0));
end Barra4;

architecture Behavioral of Barra4 is

begin
	process(Clk,Reset,datatomenin,aluresultin,pcin,rfsourcein,RD)
	begin
		if reset='1' then
			 datatomenout  <= "00000000000000000000000000000000";
			 aluresultout <= "00000000000000000000000000000000";
			 rfsource <= "00";
			 pcout <= "00000000000000000000000000000000";
			 RDout <= "000000";
		elsif(rising_edge(Clk)) then
			 RDout <= RD;	
			 datatomenout  <= datatomenin;
			 aluresultout <= aluresultin;
			 rfsource <= rfsourcein;
			 pcout <= pcin;
		end if;
	end process;
end Behavioral;

