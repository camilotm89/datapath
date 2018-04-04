
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppal is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  aux : out STD_LOGIC_VECTOR (31 downto 0);
           out_ppal : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end ppal;

architecture Behavioral of ppal is

	component adder
	port(A : IN std_logic_vector(31 downto 0);
		  B : IN std_logic_vector(31 downto 0);
		  C : OUT std_logic_vector(31 downto 0)
		  );		  
	end component;
	
	component pc
	port(pcadder : IN std_logic_vector(31 downto 0);
		  clk : IN std_logic;
		  rst : IN std_logic;		  
		  PCout : OUT std_logic_vector(31 downto 0)
		  );		  
	end component;
	
	signal C1: std_logic_vector(31 downto 0);	
	signal NPCout1: std_logic_vector(31 downto 0);
	signal PCout1: std_logic_vector(31 downto 0);
	
	
	
begin
	
	inst_npc: pc PORT MAP(
		pcadder => C1,
		rst => rst,
		clk => clk,
		PCout => NPCout1
		);
		
	inst_pc: pc PORT MAP(
		pcadder =>NPCout1,
		rst => rst,
		clk => clk,
		PCout => out_ppal
		);
			
	
	inst_adder: adder PORT MAP(
		A=>"00000000000000000000000000000100",
		B=>PCout1,
		C=>C1
		);
		
	--aux <= out_ppal;
		
end Behavioral;