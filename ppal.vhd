library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppal is
    port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
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
	port(
			--clk : in std_logic;
			address : in  STD_LOGIC_VECTOR (31 downto 0);
			rst : in  STD_LOGIC;
			outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
	end component;
	
	component seu
   port (imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
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
   port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
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
	
	-- datapath signals
	signal out_adder: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_npcout: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_pcout: std_logic_vector(31 downto 0):=(others=>'0');
	-- im signals
	signal im_out: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
	-- seu signals
	signal aux_seuout: std_logic_vector(31 downto 0):=(others=>'0');
	-- rf signals
	signal aux_crs1: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_crs2: std_logic_vector(31 downto 0):=(others=>'0');
	-- uc signals
	signal aux_aluop: std_logic_vector(5 downto 0):=(others=>'0');
	-- mux signals
	signal aux_muxout: std_logic_vector(31 downto 0):=(others=>'0');
	-- alu signals
	signal aux_aluout: std_logic_vector(31 downto 0):=(others=>'0');
	
begin

	inst_adder: adder PORT MAP(
		A => "00000000000000000000000000000100",
		B => aux_pcout,
		C => out_adder
		);
		
	inst_npc: pc PORT MAP(
		pcadder => out_adder,
		rst => reset,
		clk => clock,
		PCout => aux_npcout
		);
		
	inst_pc: pc PORT MAP(
		pcadder => aux_npcout,
		rst => reset,
		clk => clock,
		PCout => aux_pcout
		);
	
	inst_im: instructionMemory PORT MAP(
		--clk => clock,
		rst => reset,
		address => aux_pcout,
		outInstruction => im_out
	);
	
	inst_seu: seu PORT MAP(
		imm13 => im_out(12 downto 0),
		out_seu => aux_seuout
		);
		
	inst_rf: register_file PORT MAP(
		RS1 => im_out(18 downto 14),
		RS2 => im_out(4 downto 0),
		RD => im_out(29 downto 25),
		DWR => aux_aluout,
		RST => reset,
		CRS1 => aux_crs1,
		CRS2 => aux_crs2
		);
	
	inst_uc: unidadControl PORT MAP(
		op => im_out(31 downto 30),
		op3 => im_out(24 downto 19),
		aluop => aux_aluop
		);
	
	inst_mux: mux PORT MAP(
		a => aux_crs2,
		b => aux_seuout,
		sel => im_out(13),
		out_mux => aux_muxout
		);
		
	inst_alu: ALU PORT MAP(
		crs1 => aux_crs1,
		mux_out => aux_muxout,
		alu_op => aux_aluop,
		alu_out => aux_aluout
		);
	
	out_ppal <= aux_aluout;
	
end Behavioral;
