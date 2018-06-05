LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tbexecute IS
END tbexecute;
 
ARCHITECTURE behavior OF tbexecute IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Execute
    PORT(
         callin : IN  std_logic_vector(31 downto 0);
         ifin : IN  std_logic_vector(31 downto 0);
         pcsourcein : IN  std_logic_vector(1 downto 0);
         aluopin : IN  std_logic_vector(5 downto 0);
         op1in : IN  std_logic_vector(31 downto 0);
         op2in : IN  std_logic_vector(31 downto 0);
         cwp : OUT  std_logic;
         ncwp : IN  std_logic;
         icc : OUT  std_logic_vector(3 downto 0);
         nextpc : OUT  std_logic_vector(31 downto 0);
         aluresult : OUT  std_logic_vector(31 downto 0);
         Clkinext : IN  std_logic;
         Resetext : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal callin : std_logic_vector(31 downto 0) := (others => '0');
   signal ifin : std_logic_vector(31 downto 0) := (others => '0');
   signal pcsourcein : std_logic_vector(1 downto 0) := (others => '0');
   signal aluopin : std_logic_vector(5 downto 0) := (others => '0');
   signal op1in : std_logic_vector(31 downto 0) := (others => '0');
   signal op2in : std_logic_vector(31 downto 0) := (others => '0');
   signal ncwp : std_logic := '0';
   signal Clkinext : std_logic := '0';
   signal Resetext : std_logic := '0';

 	--Outputs
   signal cwp : std_logic;
   signal icc : std_logic_vector(3 downto 0);
   signal nextpc : std_logic_vector(31 downto 0);
   signal aluresult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clkinext_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Execute PORT MAP (
          callin => callin,
          ifin => ifin,
          pcsourcein => pcsourcein,
          aluopin => aluopin,
          op1in => op1in,
          op2in => op2in,
          cwp => cwp,
          ncwp => ncwp,
          icc => icc,
          nextpc => nextpc,
          aluresult => aluresult,
          Clkinext => Clkinext,
          Resetext => Resetext
        );

   -- Clock process definitions
   Clkinext_process :process
   begin
		Clkinext <= '0';
		wait for Clkinext_period/2;
		Clkinext <= '1';
		wait for Clkinext_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
			callin <= "00000000000000000000000000000101";
         ifin <= "00000000000000000000000000000101";
         pcsourcein <= "01";
         aluopin <= "000010";
         op1in <= "00000000000000000000000000000101";
         op2in <= "00000000000000000000000000000101";
         ncwp <= '0';
         Resetext <= '1';
      wait for 100 ns;	
			callin <= "00000000000000000000000000000101";
         ifin <= "00000000000000000000000000000101";
         pcsourcein <= "01";
         aluopin <= "000010";
         op1in <= "00000000000000000000000000000101";
         op2in <= "00000000000000000000000000000101";
         ncwp <= '0';
         Resetext <= '0';
      wait for 100 ns;
			callin <= "00000000000000000000000000000101";
         ifin <= "00000000000000000000000000000101";
         pcsourcein <= "00";
         aluopin <= "000000";
         op1in <= "00000000000000000000000000000101";
         op2in <= "00000000000000000000000000000101";
         ncwp <= '0';
         Resetext <= '0';
      wait for 100 ns;

      

      -- insert stimulus here 

      wait;
   end process;

END;
