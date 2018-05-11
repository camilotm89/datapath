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
			address : in  STD_LOGIC_VECTOR (5 downto 0);
			rst : in  STD_LOGIC;
			outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
	end component;
	
	component seu
   port (imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
         out_seu : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component windowsmanager
	port ( op : in STD_LOGIC_VECTOR (1 downto 0);
			  op3 : in STD_LOGIC_VECTOR (5 downto 0);
			  cwp : in STD_LOGIC_VECTOR (1 downto 0);
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  ncwp : out STD_LOGIC_VECTOR (1 downto 0):="00";
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0)
			);
	end component;
	
	component register_file
   port ( nRS1 : in  STD_LOGIC_VECTOR (5 downto 0);
          nRS2 : in  STD_LOGIC_VECTOR (5 downto 0);
          nRD : in  STD_LOGIC_VECTOR (5 downto 0);
          DWR : in  STD_LOGIC_VECTOR (31 downto 0);
          RST : in  STD_LOGIC;
          CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
          CRS2 : out  STD_LOGIC_VECTOR (31 downto 0);
			 CRD : out STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component unidadControl
   port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
          op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			 WR_dm : out STD_LOGIC;
			 WE_rf : out STD_LOGIC;
          aluop : out  STD_LOGIC_VECTOR (5 downto 0)
			);
	end component;

	component PSR_Modifier
	port ( aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
			);
	end component;
	
	component PSR
	port ( clock : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			 nCWP : in STD_LOGIC_VECTOR (1 downto 0);
			 CWP : out STD_LOGIC_VECTOR (1 downto 0);
			 c : out  STD_LOGIC
			);
	end component;
	
	component mux
   port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
          b : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC;
          out_mux : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component DataMemory
	port ( reset: in STD_LOGIC;
			 out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
          CRD : in  STD_LOGIC_VECTOR (31 downto 0);
          WRMEM : in  STD_LOGIC;
          DMCS1 : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component ALU
   port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
          mux_out : in  STD_LOGIC_VECTOR (31 downto 0);
          alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
			 c : in STD_LOGIC;
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
	signal aux_CRD: std_logic_vector(31 downto 0):=(others=>'0');
	-- uc signals
	signal aux_aluop: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_WRMEM: std_logic;
	signal aux_WERF: std_logic;
	-- mux signals
	signal aux_muxout: std_logic_vector(31 downto 0):=(others=>'0');
	-- alu signals
	signal aux_aluout: std_logic_vector(31 downto 0):=(others=>'0');
	-- PSR y PSR_Modifier signals
	signal aux_nzvc: std_logic_vector(3 downto 0):=(others=>'0');
	signal aux_c: std_logic;
	signal aux_CWP: std_logic_vector(1 downto 0):=(others=>'0');
	-- Windows Manager signals
	signal aux_nCWP: std_logic_vector(1 downto 0):=(others=>'0');
	signal aux_nrs1: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_nrs2: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_nrd: std_logic_vector(5 downto 0):=(others=>'0');
	
	-- DataMemory signals
	signal aux_DMCS1: std_logic_vector(31 downto 0):=(others=>'0');
	
begin

	inst_adder: adder PORT MAP(
		A => "00000000000000000000000000000001",
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
		address => aux_pcout (5 downto 0),
		outInstruction => im_out
	);
	
	inst_seu: seu PORT MAP(
		imm13 => im_out(12 downto 0),
		out_seu => aux_seuout
		);
		
	inst_windowsmanger: windowsmanager PORT MAP(
		op => im_out(31 downto 30),
		op3 => im_out(24 downto 19),
		cwp => aux_CWP,
		rs1 => im_out(18 downto 14),
		rs2 => im_out(4 downto 0),
		rd => im_out(29 downto 25),
		ncwp => aux_nCWP,
		nrs1 => aux_nrs1,
		nrs2 => aux_nrs2,
		nrd => aux_nrd
		);
		
		
	inst_rf: register_file PORT MAP(
	   nRS1 => aux_nrs1,
		nRS2 => aux_nrs2,
		nRD => aux_nrd,
		DWR => aux_aluout,
		RST => reset,
		CRS1 => aux_crs1,
		CRS2 => aux_crs2,
		CRD => aux_CRD
		);
	
	inst_uc: unidadControl PORT MAP(
		op => im_out(31 downto 30),
		op3 => im_out(24 downto 19),
		WR_dm => aux_WRMEM,
		WE_rf => aux_WERF,
		aluop => aux_aluop
		);
	
	inst_PSR_Modifier: PSR_Modifier PORT MAP(
		aluop => aux_aluop,
		out_ppal => aux_aluout,
		crs1 => aux_crs1,
		crs2 => aux_crs2,
		nzvc => aux_nzvc
		);
	
	inst_PSR: PSR PORT MAP(
		clock => clock,
		reset => reset,
		nzvc => aux_nzvc,
		nCWP => aux_nCWP,
		CWP => aux_CWP,
		c => aux_c
		);
	
	inst_mux: mux PORT MAP(
		a => aux_crs2,
		b => aux_seuout,
		sel => im_out(13),
		out_mux => aux_muxout
		);
		
	inst_DM: DataMemory PORT MAP(
		reset => reset,
		out_ppal => aux_aluout,
		CRD => aux_CRD,
		WRMEM => aux_WRMEM,
		DMCS1 => aux_DMCS1
		);
		
	inst_alu: ALU PORT MAP(
		crs1 => aux_crs1,
		mux_out => aux_muxout,
		alu_op => aux_aluop,
		c => aux_c,
		alu_out => aux_aluout
		);
	
	out_ppal <= aux_aluout;
	
end Behavioral;
