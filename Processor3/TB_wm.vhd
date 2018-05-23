LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_wm IS
END TB_wm;
 
ARCHITECTURE behavior OF TB_wm IS 

 
    COMPONENT windowsmanager
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic_vector(1 downto 0);
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         ncwp : OUT  std_logic_vector(1 downto 0);
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         nrd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic_vector(1 downto 0) := (others => '0');
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ncwp : std_logic_vector(1 downto 0);
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal nrd : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: windowsmanager PORT MAP (
          op => op,
          op3 => op3,
          cwp => cwp,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          ncwp => ncwp,
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      
		cwp <="00";
      wait for 50 ns;
		rs1 <="10000";--L0
		rs2 <="10001";--L1
		rd <= "10010";--L2
		op <="10";
		op3 <="000000";
		
		wait for 50 ns;
		cwp <=nCwp;
		
		wait for 50 ns;
		rs1 <="01000";
		rs2 <="11101";
		rd <= "01001";
		op <="10";
		op3 <="000000";
		
		cwp <=nCwp;
		
      wait for 50 ns; ---- RESTORE
		rs1 <="10000";--L0
		rs2 <="10001";--L1
		rd <= "10010";--L2
		op <="10";
		op3 <="111101";
		
	
		wait for 50 ns;
		rs1 <="01000";
		rs2 <="11101";
		rd <= "01001";
		op <="10";
		op3 <="000000";
		
		cwp <=nCwp;
		
		 wait for 50 ns; ---- LOAD
		rs1 <="10000";--L0
		rs2 <="10001";--L1
		rd <= "10010";--L2
		op <="10";
		op3 <="111100";
		
		
		cwp <=nCwp;
		
		wait for 50 ns;
		rs1 <="01000";
		rs2 <="11101";
		rd <= "01001";
		op <="10";
		op3 <="000000";
		
		cwp <=nCwp;
		      
   end process;
END;