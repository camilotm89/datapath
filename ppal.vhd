
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

	component instructionMemory
	port( address : in  STD_LOGIC_VECTOR (5 downto 0);
          reset : in  STD_LOGIC;
          outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component seu
   port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
          out_seu : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component register_file
   port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
          RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
          RD : in  STD_LOGIC_VECTOR (4 downto 0);
          DWR : in  STD_LOGIC_VECTOR (31 downto 0);
          RST : in  STD_LOGIC;
          CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
          CRS2 : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component unidadControl
   port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
          op3 : in  STD_LOGIC_VECTOR (5 downto 0);
          aluop : out  STD_LOGIC_VECTOR (5 downto 0)
			);
	end component;
	
	component mux
   Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
          b : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC;
          out_mux : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component ALU
   port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
          mux_out : in  STD_LOGIC_VECTOR (31 downto 0);
          alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
          alu_out : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	--señales datapath
	signal C1: std_logic_vector(31 downto 0);	
	signal NPCout1: std_logic_vector(31 downto 0);
	signal PCout1: std_logic_vector(31 downto 0);
	signal aux_PCout: std_logic_vector(31 downto 0);
	signal aux_outppal: std_logic_vector(31 downto 0);
	-- señales instruction memory
	signal aux_outIm: std_logic_vector(31 downto 0);
	-- señales SEU
	signal aux_outseu: std_logic_vector(31 downto 0);
	-- señales RF
	signal aux_crs1: std_logic_vector(31 downto 0);
	signal aux_crs2: std_logic_vector(31 downto 0);
	--señales UC
	signal aux_aluop: std_logic_vector(5 downto 0);
	-- señales MUX
	signal aux_outmux: std_logic_vector(31 downto 0);
	-- señales ALU
	signal aux_outalu: std_logic_vector(31 downto 0);
	
begin

--out_ppal <= aux_outppal;
out_ppal <= aux_outalu;

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
		PCout => aux_PCout
		);
			
	
	inst_adder: adder PORT MAP(
		A=>"00000000000000000000000000000100",
		B=>aux_outppal,
		C=>C1
		);
		
	inst_instructionMemory: instructionMemory PORT MAP(
		address => aux_PCout(5 downto 0),
		reset => rst,
		outInstruction => aux_outIm
		);
		
	inst_seu: seu PORT MAP(
		imm13 => aux_outIm(12 downto 0),
		out_seu => aux_outseu
		);
		
	inst_register_file: register_file PORT MAP(
		RS1 => aux_outIm(18 downto 14),
		RS2 => aux_outIm(4 downto 0),
		RD => aux_outIm(29 downto 25),
		DWR => aux_outalu,
		RST => rst,
		CRS1 => aux_crs1,
		CRS2 => aux_crs2
		);
	
	inst_unidadControl: unidadControl PORT MAP(
		op => aux_outIm(31 downto 30),
		op3 => aux_outIm(24 downto 19),
		aluop => aux_aluop
		);
	
	inst_mux: mux PORT MAP(
		a => aux_crs2,
		b => aux_outseu,
		sel => aux_outIm(13),
		out_mux => aux_outmux
		);
		
	inst_ALU: ALU PORT MAP(
		crs1 => aux_crs1,
		mux_out => aux_outmux,
		alu_op => aux_aluop,
		alu_out => aux_outalu
		);
	
		
end Behavioral;
