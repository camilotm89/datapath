library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Union is
    Port ( Clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  Salidaunion :out STD_LOGIC_VECTOR(31 downto 0)
			  );
end Union;

architecture Behavioral of Union is


COMPONENT fetch
	PORT(
			  Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CUentrada : in  STD_LOGIC_VECTOR(1 downto 0);
           Entradain : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruccionout : out  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	


COMPONENT Barra1
	PORT(
			  Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           instrutin : in  STD_LOGIC_VECTOR (31 downto 0);
           PCin : in  STD_LOGIC_VECTOR (31 downto 0);
           instrutout : out  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT Decode
	PORT(
			  Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           posicionin : in  STD_LOGIC_VECTOR (31 downto 0);
           Regtomemin : in  STD_LOGIC_VECTOR (31 downto 0);
			  
           cwpin : in  STD_LOGIC;
			  iccin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Resetext : in  STD_LOGIC;
           ncwpout : out  STD_LOGIC;
           callout : out  STD_LOGIC_VECTOR (31 downto 0);
           ifout : out  STD_LOGIC_VECTOR (31 downto 0);
           rfsourceout : out  STD_LOGIC_VECTOR (1 downto 0);
           wrenmen : out  STD_LOGIC;
           pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
			  Cuentrada : out  STD_LOGIC_VECTOR (1 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  a18 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs1out : out  STD_LOGIC_VECTOR (31 downto 0);
			  
			  RD : in  STD_LOGIC_VECTOR (5 downto 0);
			  RDout : out  STD_LOGIC_VECTOR (5 downto 0);
			  
           op2out : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
	
COMPONENT Barra2
	PORT(
			  Clk : in  STD_LOGIC;
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

			  RD : in  STD_LOGIC_VECTOR (5 downto 0);
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
           op2out : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	
	
	
COMPONENT Execute
	PORT(
			  callin : in  STD_LOGIC_VECTOR (31 downto 0);
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
           Resetext : in  STD_LOGIC
           	
		);
	END COMPONENT;	



COMPONENT Barra3
	PORT(
			  Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           
           a18in : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           wrenmenin : in  STD_LOGIC;
			  
			  PCCin : in  STD_LOGIC_VECTOR (31 downto 0);
			  PCCout : out  STD_LOGIC_VECTOR (31 downto 0);
			  RD : in  STD_LOGIC_VECTOR (5 downto 0);
			  RDout : out  STD_LOGIC_VECTOR (5 downto 0);
			  
           rfsource : in  STD_LOGIC_VECTOR (1 downto 0);
           a18inout : out  STD_LOGIC_VECTOR (31 downto 0);
           aluresultout : out  STD_LOGIC_VECTOR (31 downto 0);
           wrenmeninout : out  STD_LOGIC;
           rfsourceout : out  STD_LOGIC_VECTOR (1 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT Memory
	PORT(
			  a18in : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           datatomenout : out  STD_LOGIC_VECTOR (31 downto 0);
           wrenmenin : in  STD_LOGIC;
			  Resetext : in STD_LOGIC;
			  
           aluresultout : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;

COMPONENT Barra4
	PORT(
			  Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           
           datatomenin : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           pcin : in  STD_LOGIC_VECTOR (31 downto 0);
			  RD : in  STD_LOGIC_VECTOR (5 downto 0);
			  RDout : out  STD_LOGIC_VECTOR (5 downto 0);
           rfsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           rfsource : out  STD_LOGIC_VECTOR (1 downto 0);
			  datatomenout : out  STD_LOGIC_VECTOR (31 downto 0);
           aluresultout : out  STD_LOGIC_VECTOR (31 downto 0);
           pcout : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	


COMPONENT Writeback
	PORT(
			  datatomenin : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;

signal a1,a2,a5,a9,a10,a18n,a16,a17,a20,a21,a22,a23,a60: std_logic_vector(31 downto 0);
signal a4,a13,a15, a117,a118,a130,a139,a140a,a555: std_logic_vector(1 downto 0);
signal a8: std_logic_vector(3 downto 0);
signal a11,a126,a183,a184,a185,a186: std_logic_vector(5 downto 0);
signal a6,a7,a14,a115,a116,a129: std_logic;

signal a111,a112,a120,a121,a122,a123,a124,a125,a127,a128: std_logic_vector(31 downto 0);

signal a131,a132,a133,a138,a160,a180,a181,a182,a191,a668: std_logic_vector(31 downto 0);

begin ints_fetch: fetch PORT MAP(
	
			  Clk =>Clk,
           Reset =>reset,
           CUentrada =>a555,
           Entradain =>a60,
           Instruccionout =>a2,
           PCout =>a1
         
	);
	
ints_barra1: Barra1 PORT MAP(
	
			  Clk =>Clk,
           Reset =>reset,
           instrutin =>a2,
           PCin =>a1,
           instrutout =>a112,
           PCout =>a111
         
	);	

ints_decode: Decode PORT MAP(
	
			  Instruction =>a112,
           posicionin =>a111,
           Regtomemin =>a23,
           cwpin =>a6,
			  iccin =>a8,
			  Resetext =>reset,
           ncwpout =>a7,
           callout =>a17, 
           ifout =>a16,
           rfsourceout =>a15,
           wrenmen =>a14,
           pcsource =>a13,
			  Cuentrada =>a4,
           aluop =>a11,
			  a18 =>a18n,
           crs1out =>a10,
			  
			  RD =>a186,
			  RDout =>a183,
			  
           op2out =>a9
	);
	
ints_barra2: Barra2 PORT MAP(
	
			  Clk =>Clk,
           Reset =>reset,
           
			  ncwpin =>a7,
           callin =>a17, 
           ifin =>a16,
           rfsourcein =>a15,
           wrenmenin =>a14,
           pcsourcein =>a13,
			  
           aluopin =>a11,
			  a18in =>a18n,
           crs1outin =>a10,
           op2outin =>a9,
			  
			  PCC =>a111,
			  PCCout =>a180,
				
           RD =>a183,
			  RDout =>a184,
			  
			  Cuentradain =>a13, 
			  Cuentradaout =>a555,	

			  ncwpout =>a115,
           callout =>a120,
           ifout =>a121,
           rfsourceout =>a117,
           wrenmen =>a116,
           pcsource =>a118,
			  
           aluop =>a126,
			  a18 =>a122,
           crs1out =>a123,
           op2out =>a124
           	
         
	);		
	
ints_execute: Execute PORT MAP(
	
			  callin =>a120,
           ifin =>a121,
           pcsourcein =>a118,
           aluopin =>a126,
           op1in =>a123,
           op2in =>a124,
           cwp =>a6,
           ncwp =>a7,
           icc =>a8,
           nextpc =>a60,
           aluresult =>a20,
           Clkinext =>Clk,
           Resetext =>reset        
	);


ints_Barra3: Barra3 PORT MAP(
	
			  Clk =>Clk,
           Reset =>reset,
			  
           
           a18in=> a122,
           aluresultin =>a20,
           wrenmenin =>a116,
           rfsource =>a117,
			  
			  PCCin =>a180,
			  PCCout =>a181,
			  
           RD =>a184,
			  RDout =>a185,
			  
           a18inout =>a127,
           aluresultout =>a668,
           wrenmeninout =>a129,
           rfsourceout =>a130     
	);

ints_memory: Memory PORT MAP(
			  Resetext  =>reset,
			  
			  
			  a18in=>a127,
           aluresultin =>a668,
           wrenmenin =>a129,
			  
			  datatomenout =>a21,
           aluresultout =>a128
	);


ints_Barra4: Barra4 PORT MAP(
	
			  Clk =>Clk,
           Reset =>reset,
           
           datatomenin =>a21,
           aluresultin =>a128,
           pcin =>a181,
           rfsourcein =>a130,  
           
			  
			  RD =>a185,
			  RDout =>a186,
			  
			  datatomenout =>a191,
			  aluresultout =>a133,
           pcout=>a132,
			  rfsource =>a139
	);
	
ints_writeback: Writeback PORT MAP(
				pc =>a132,
			  datatomenin =>a191,
           aluresultin =>a133,
           
           rfsourcein =>a139,
           datatoreg =>a23
			  
	);
	
	Salidaunion<=a23;
	
end Behavioral;

