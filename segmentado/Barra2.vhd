library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barra2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  
			  ncwpin : in  STD_LOGIC;
           callin : in  STD_LOGIC_VECTOR (31 downto 0);
           ifin : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           wrenmenin : in  STD_LOGIC;
           pcsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
			  
           aluopin : in  STD_LOGIC_VECTOR (5 downto 0);
			  a18in : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1outin : in  STD_LOGIC_VECTOR (31 downto 0);
           op2outin : in  STD_LOGIC_VECTOR (31 downto 0);
			  
			  PCC : in  STD_LOGIC_VECTOR (31 downto 0);
			  PCCout : out  STD_LOGIC_VECTOR (31 downto 0);	
	        
			  RD : in STD_LOGIC_VECTOR (5 downto 0);
			  RDout : out  STD_LOGIC_VECTOR (5 downto 0);		

			  Cuentradain : in  STD_LOGIC_VECTOR (1 downto 0);	 
			  Cuentradaout : out  STD_LOGIC_VECTOR (1 downto 0);	
			  
			  ncwpout : out  STD_LOGIC;
           callout : out  STD_LOGIC_VECTOR (31 downto 0);
           ifout : out  STD_LOGIC_VECTOR (31 downto 0);
           rfsourceout : out  STD_LOGIC_VECTOR (1 downto 0);
           wrenmen : out  STD_LOGIC;
           pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
			 
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  a18 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs1out : out  STD_LOGIC_VECTOR (31 downto 0);
           op2out : out  STD_LOGIC_VECTOR (31 downto 0));
end Barra2;

architecture Behavioral of Barra2 is

begin
	process(Clk,Reset,ncwpin ,callin ,ifin,rfsourcein ,wrenmenin ,pcsourcein ,
			   aluopin,a18in ,crs1outin ,op2outin,PCC,RD,Cuentradain ) 
	begin
		if reset='1' then
			 ncwpout <= '0';
			 callout <= "00000000000000000000000000000000";
			 ifout<= "00000000000000000000000000000000";
			 rfsourceout <= "00";
			 wrenmen <= '0';
			 pcsource <= "00";
			 Cuentradaout<= "00";
			 aluop<= "000000";
			 a18 <= "00000000000000000000000000000000";
			 crs1out <= "00000000000000000000000000000000";
			 op2out<= "00000000000000000000000000000000";
			 PCCout<= "00000000000000000000000000000000";
			 RDout <= "000000";
		elsif(rising_edge(Clk)) then
			 ncwpout <= ncwpin;
			 callout <= callin;
			 ifout<= ifin;
			 rfsourceout <= rfsourcein;
			 wrenmen <= wrenmenin;
			 pcsource <= pcsourcein;
			 RDout<= RD;
			 Cuentradaout<= Cuentradain ;
			 aluop<=aluopin;
			 a18 <= a18in;
			 crs1out <= crs1outin;
			 op2out<= op2outin;
			 PCCout<=PCC;
		end if;
	
	end process;


end Behavioral;

