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
	
	component seu22
	port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
          out_disp22 : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
	end component;
	
	component seu30 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           out_disp30 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component seu
   port (imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
         out_seu : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component mux4_1
	port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
          b : in  STD_LOGIC_VECTOR (31 downto 0);
		    c : in  STD_LOGIC_VECTOR (31 downto 0);
          d : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC_VECTOR (1 downto 0);
          out_mux : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
	end component;
	
	component windowsmanager
	port ( op : in STD_LOGIC_VECTOR (1 downto 0);
			  op3 : in STD_LOGIC_VECTOR (5 downto 0);
			  cwp : in STD_LOGIC_VECTOR (1 downto 0);
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  ncwp : out STD_LOGIC_VECTOR (1 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           o7 : out STD_LOGIC_VECTOR (5 downto 0)
			);
	end component;
	
	component register_file
   port ( nRS1 : in  STD_LOGIC_VECTOR (5 downto 0);
          nRS2 : in  STD_LOGIC_VECTOR (5 downto 0);
          nRD : in  STD_LOGIC_VECTOR (5 downto 0);
          DWR : in  STD_LOGIC_VECTOR (31 downto 0);
          RST : in  STD_LOGIC;
			 WE : in STD_LOGIC;
          CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
          CRS2 : out  STD_LOGIC_VECTOR (31 downto 0);
			 CRD : out STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component unidadControl
   port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
			  op2 : in STD_LOGIC_VECTOR (2 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in STD_LOGIC_VECTOR (3 downto 0);
			  cond : in STD_LOGIC_VECTOR (3 downto 0);
			  pc_src: out  STD_LOGIC_VECTOR (1 downto 0); 
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  WR_dm : out STD_LOGIC;
			  WE_rf : out STD_LOGIC;
			  rf_s: out STD_LOGIC_VECTOR (1 downto 0);
			  rf_d: out STD_LOGIC
			);
	end component;

	component PSR_Modifier
	port (  aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : in  STD_LOGIC;
           crs2 : in  STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
			);
	end component;
	
	component DataMemory
	port (  reset: in STD_LOGIC;
			  out_ppal : in  STD_LOGIC_VECTOR (31 downto 0);
           CRD : in  STD_LOGIC_VECTOR (31 downto 0);
           WRMEM : in  STD_LOGIC;
           DATOMEM : out  STD_LOGIC_VECTOR (31 downto 0)
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
	
	component mux_3_1 is
    port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           c : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           out_mux : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
   component mux_wm_rf
   port ( a : in  STD_LOGIC_VECTOR (5 downto 0);
          b : in  STD_LOGIC_VECTOR (5 downto 0);
          sel : in  STD_LOGIC;
          out_mux : out  STD_LOGIC_VECTOR (5 downto 0)
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
	
	signal out_adder: std_logic_vector(31 downto 0):=(others=>'0');
	signal out_adder22: std_logic_vector(31 downto 0):=(others=>'0');
	signal out_adder30: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_npcout: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_pcout: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_out_mux4_1: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_A: std_logic_vector(31 downto 0):=(others=>'0');
	-- im signals
	signal im_out: std_logic_vector(31 downto 0):=(others=>'0');
	-- seu signals
	signal aux_seuout: std_logic_vector(31 downto 0):=(others=>'0');
	-- rf signals
   signal aux_mux_nrd: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_crs1: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_crs2: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_crd: std_logic_vector(31 downto 0):=(others=>'0');
	-- uc signals
	signal aux_aluop: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_WRMEM: std_logic;
	signal aux_WERF: std_logic;
	signal aux_rfs: std_logic_vector(1 downto 0):=(others=>'0');
	signal aux_pc_src: std_logic_vector(1 downto 0):=(others=>'0');
   signal aux_rf_d: std_logic;
	-- windows manager signals
	signal aux_ncwp: std_logic_vector(1 downto 0):=(others=>'0');
	signal aux_nrs1: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_nrs2: std_logic_vector(5 downto 0):=(others=>'0');
	signal aux_nrd: std_logic_vector(5 downto 0):=(others=>'0');
   signal aux_o7: std_logic_vector(5 downto 0):=(others=>'0');
	-- PSR signals
	signal aux_CWP: std_logic_vector(1 downto 0):=(others=>'0');
	signal aux_c: std_logic;
	-- PSR Modifier signals
	signal aux_nzvc: std_logic_vector(3 downto 0):=(others=>'0');
	-- mux signals
	signal aux_muxout: std_logic_vector(31 downto 0):=(others=>'0');
	-- alu signals
	signal aux_aluout: std_logic_vector(31 downto 0):=(others=>'0');
	-- DataMemory signals
	signal aux_DATOMEM: std_logic_vector(31 downto 0):=(others=>'0');
	-- out mux 3-1 signals
	signal aux_datatoreg: std_logic_vector(31 downto 0):= (others=>'0');
	-- Seu22 signals
	signal aux_out_disp22: std_logic_vector(31 downto 0):=(others=>'0');
	-- Seu30 signals
	signal aux_out_disp30: std_logic_vector(31 downto 0):=(others=>'0');
	-- Mux4_1 signals
	signal aux_empty_signal: std_logic_vector(31 downto 0):=(others=>'0');
	
begin


	inst_adder: adder PORT MAP(
		A => x"00000001",
		B => aux_npcout,
		C => out_adder
		);
	
	inst_adder_disp22: adder PORT MAP(
		A => aux_pcout,
		B => aux_out_disp22,
		C => out_adder22
		);
	
	inst_adder_disp30: adder PORT MAP(
		A => aux_out_disp30,
		B => aux_pcout,
		C => out_adder30
		);
		
	inst_npc: pc PORT MAP(
		pcadder => aux_out_mux4_1,
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
	
	inst_wm: windowsmanager PORT MAP(
		op => im_out(31 downto 30),
 	   op3 => im_out(24 downto 19),
		cwp => aux_CWP(1 downto 0),
		rs1 => im_out(18 downto 14),
      rs2 => im_out(4 downto 0),
      rd => im_out(29 downto 25),
		ncwp => aux_ncwp,
      nrs1 => aux_nrs1,
      nrs2 => aux_nrs2,
      nrd => aux_nrd,
      o7 => aux_o7
		);
		
	inst_rf: register_file PORT MAP(
		nRS1 => aux_nrs1,
		nRS2 => aux_nrs2,
		nRD => aux_mux_nrd,
		DWR => aux_datatoreg,
		RST => reset,
		WE => aux_WERF,
		CRS1 => aux_crs1,
		CRS2 => aux_crs2,
		CRD => aux_CRD
		);	
		
	inst_mux_toRF: mux_wm_rf PORT MAP(
		a => aux_nrd,
		b => aux_o7, --15 ?
		sel => aux_rf_d,
		out_mux => aux_mux_nrd
		);
		
	inst_uc: unidadControl PORT MAP(
		op => im_out(31 downto 30),
      op2 => im_out(24 downto 22),
		op3 => im_out(24 downto 19),
		nzvc => aux_nzvc,
      cond => im_out(28 downto 25),
      pc_src => aux_pc_src,
		WR_dm => aux_WRMEM,
		WE_rf => aux_WERF,
		aluop => aux_aluop,
		rf_s => aux_rfs,
      rf_d => aux_rf_d
		);
		
	inst_mux: mux PORT MAP(
		a => aux_crs2,
		b => aux_seuout,
		sel => im_out(13),
		out_mux => aux_muxout
		);
    
	inst_seu: seu PORT MAP(
		imm13 => im_out(12 downto 0),
		out_seu => aux_seuout
		);
		
	inst_alu: ALU PORT MAP(
		crs1 => aux_crs1,
		mux_out => aux_muxout,
		c => aux_c,
		alu_op => aux_aluop,
		alu_out => aux_aluout
		);
		
	inst_psrm: PSR_Modifier PORT MAP(
	   aluop => aux_aluop,
      out_ppal => aux_aluout,
      crs1 => aux_crs1(31),
      crs2 => aux_muxout(31),
      nzvc => aux_nzvc
		);
		
	inst_psr: PSR PORT MAP(
	   clock => clock,
		reset => reset,
		nzvc => aux_nzvc,
		nCWP => aux_ncwp,
		CWP => aux_CWP,
		c => aux_c
		);
		
	inst_DM: DataMemory PORT MAP(
		reset => reset,
		out_ppal => aux_aluout,
		CRD => aux_crd,
		WRMEM => aux_WRMEM,
		DATOMEM => aux_DATOMEM
		);
		
	inst_mux4_1: mux4_1 PORT MAP(
		a => out_adder30,
		b => out_adder22,
		c => out_adder,
		d => aux_aluout,
		sel => aux_pc_src,
		out_mux => aux_out_mux4_1
		);

	inst_seu_disp22: seu22 PORT MAP(
		disp22 => im_out(21 downto 0),
		out_disp22 => aux_out_disp22
		);
		
	inst_seu_disp30: seu30 PORT MAP(
		disp30 => im_out(29 downto 0),
      out_disp30 => aux_out_disp30
		);
	
	inst_mux3_1_DMtoRF: mux_3_1 PORT MAP(
		a => aux_DATOMEM,
		b => aux_aluout,
		c => aux_pcout,
		sel => aux_rfs, 
		out_mux => aux_datatoreg
		);
	
	out_ppal <= aux_datatoreg;
	
end Behavioral;