library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Execute is
    Port ( callin : in  STD_LOGIC_VECTOR (31 downto 0);
           ifin : in  STD_LOGIC_VECTOR (31 downto 0);
           pcsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           aluopin : in  STD_LOGIC_VECTOR (5 downto 0);
           op1in : in  STD_LOGIC_VECTOR (31 downto 0);
           op2in : in  STD_LOGIC_VECTOR (31 downto 0);
           cwp : out  STD_LOGIC;
           ncwp : in  STD_LOGIC;
			  
			  
           icc : out  STD_LOGIC_VECTOR (3 downto 0);
           nextpc : out  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : out  STD_LOGIC_VECTOR (31 downto 0);
           Clkinext : in  STD_LOGIC;
           Resetext : in  STD_LOGIC);
end Execute;

architecture Behavioral of Execute is

COMPONENT ALU
	PORT(
			  OPER1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  c :in  STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0)
           	
		);
	END COMPONENT;		
	
COMPONENT PSR
	PORT(
			  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC ;
			  cwp : out  STD_LOGIC;
			  ncwp : in  STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR (3 downto 0);
			  rest : in  STD_LOGIC;
           c : out  STD_LOGIC
           	
		);
	END COMPONENT;	
	
COMPONENT PSR_Modifier
	PORT(
			  oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           conditionalCodes : out  STD_LOGIC_VECTOR (3 downto 0)
           	
		);
	END COMPONENT;

COMPONENT MuxPC
	PORT(
			  Disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
			  Direccion_Out : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
	
	
signal a23: std_logic_vector(31 downto 0);
signal a29: STD_LOGIC;
signal a28: std_logic_vector(3 downto 0);
begin

ints_alu: ALU PORT MAP(
	
			  OPER1 => op1in,
           OPER2 => op2in,
			  c =>a29,
           ALURESULT => a23,
           ALUOP => aluopin
         
	);
	aluresult<= a23;
	ints_psr: PSR PORT MAP(
	
			  nzvc => a28,
			  clk => Clkinext,
			  cwp => cwp,
			  rest => Resetext,
			  ncwp => ncwp,
			  icc => icc,
           c => a29
         
	);
	ints_psrmodifier: PSR_Modifier PORT MAP(
	
			  oper1 => op1in,
           oper2 => op2in,
           aluop => aluopin,
           aluResult => a23,
           conditionalCodes => a28
         
	);
	
	ints_muxPC: MuxPC PORT MAP(
	
			  Disp30 => callin,
           Disp22 => ifin,
           PC1 => "00000000000000000000000000000000",
           Direccion => a23,
           Selector => pcsourcein,
			  Direccion_Out => nextpc
         
	);
	


end Behavioral;

