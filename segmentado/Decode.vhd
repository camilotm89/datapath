library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decode is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
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
			  
			  RD : in STD_LOGIC_VECTOR (5 downto 0);
			  RDout : out  STD_LOGIC_VECTOR (5 downto 0);	
			  
			  
			  
			  
           pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
			  Cuentrada : out  STD_LOGIC_VECTOR (1 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  a18 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs1out : out  STD_LOGIC_VECTOR (31 downto 0);
           op2out : out  STD_LOGIC_VECTOR (31 downto 0));
end Decode;

architecture Behavioral of Decode is

	COMPONENT Sumador32bit
	PORT(
			  Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;

COMPONENT UnidadControl
	PORT(
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  Reset : in  STD_LOGIC;
           rfDest : out  STD_LOGIC;
			  rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC;	
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0)
           	
		);
	END COMPONENT;	
	
COMPONENT SEU
	PORT(
			  Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTSEU : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	
COMPONENT MUX32
	PORT(
			  SEUIMM : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;			

COMPONENT RF
	PORT(
			  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  wre : in STD_LOGIC;
			  cRd : out STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
COMPONENT MuxRF
	PORT(
			  Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           O7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0)
           	
		);
	END COMPONENT;		
	
COMPONENT Windowsmanager
	PORT(
			  cwp : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwpout : out  STD_LOGIC;
           rs1out : out  STD_LOGIC_VECTOR (5 downto 0);
           rs2out : out  STD_LOGIC_VECTOR (5 downto 0);
           rdout : out  STD_LOGIC_VECTOR (5 downto 0):=(others=>'0')
           	
		);
	END COMPONENT;


COMPONENT SEU_22
	PORT(
			  Imm_22 : in  STD_LOGIC_VECTOR (21 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT SEU_30
	PORT(
			  Imm_30 : in  STD_LOGIC_VECTOR (29 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	

signal a10,a20,a21,a31: std_logic_vector(31 downto 0);


--nrs1,
signal a8,a9,a26,a27: std_logic_vector(5 downto 0);

signal a1: std_logic_vector(1 downto 0);
signal a11,a12: STD_LOGIC;


begin

	
	ints_windowsmanager: Windowsmanager PORT MAP(
		
			  cwp =>cwpin,
			  rs1 =>Instruction(18 downto 14),
           rs2 =>Instruction(4 downto 0),
           rd =>Instruction(29 downto 25),
           op =>Instruction(31 downto 30),
           op3 =>Instruction(24 downto 19),
           
           cwpout=> ncwpout,
           rs1out=>a9,
           rs2out=> a26,
           rdout=> a8
         
	);
	ints_rf: RF PORT MAP(
	
			  rs1 => a9,
           rs2 => a26,
           rd => RD,
           dwr => Regtomemin,
           rst => Resetext,
			  wre => a11,
			  cRd => a18,
           crs1 => crs1out,
           crs2 => a20
         
	);
	
	ints_muxrf: MuxRF PORT MAP(
	
			  Rd => a8,
           O7 => "001111",
           RFDEST => a12,
           nRD => a27
         
	);
	
	RDout <=a27;
	
	
	ints_CU: UnidadControl PORT MAP(
			  op =>Instruction(31 downto 30),
           op3 =>Instruction(24 downto 19),
           op2 =>Instruction(24 downto 22),
           cond =>Instruction(28 downto 25),
           icc =>iccin,
			  Reset =>Resetext,
           rfDest  =>a12,
			  rfSource =>rfsourceout,
			  wrEnMem =>wrenmen,
           wrEnRF =>a11,	
			  pcSource =>a1,
           AluOp =>aluop
			  
          
	);
	Cuentrada<=a1;
	pcsource<=a1;
	
	
	ints_seu: SEU PORT MAP(
	
			  Instruction =>Instruction,
           OUTSEU =>a21
         
	);
	
	ints_mux32: MUX32 PORT MAP(
	
			  SEUIMM => a21, 
           CRS2 => a20,
           OPER2 => op2out,
           Instruction => Instruction
         
	);
	ints_seu22: SEU_22 PORT MAP(
	
			  Imm_22 => Instruction(21 downto 0),
           Imm_32 => a10
         
	);
	ints_sumdisp22: Sumador32bit PORT MAP(
	
			  Oper1 => a10,
			  Reset => Resetext,
			  Oper2 => posicionin,
           Result => ifout
          
	);
	ints_seu30: SEU_30 PORT MAP(
	
			  Imm_30 => Instruction(29 downto 0),
           Imm_32 => a31
         
	);
	
	ints_sumdisp30: Sumador32bit PORT MAP(
	
			  Oper1 => a31,
			  Reset => Resetext,
			  Oper2 => posicionin,
           Result => callout
          
	);
	
	
	
	


end Behavioral;

