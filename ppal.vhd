
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppal is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
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
	signal aux_outppal: std_logic_vector(31 downto 0);
	
	
	
begin

out_ppal <= aux_outppal;

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
		PCout => aux_outppal
		);
			
	
	inst_adder: adder PORT MAP(
		A=>"00000000000000000000000000000100",
		B=>aux_outppal,
		C=>C1
		);
		
end Behavioral;
