LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tbdecode IS
END tbdecode;
 
ARCHITECTURE behavior OF tbdecode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decode
    PORT(
         Instruction : IN  std_logic_vector(31 downto 0);
         posicionin : IN  std_logic_vector(31 downto 0);
         Regtomemin : IN  std_logic_vector(31 downto 0);
         cwpin : IN  std_logic;
         iccin : IN  std_logic_vector(3 downto 0);
         Resetext : IN  std_logic;
         ncwpout : OUT  std_logic;
         callout : OUT  std_logic_vector(31 downto 0);
         ifout : OUT  std_logic_vector(31 downto 0);
         rfdestout : OUT  std_logic;
         rfsourceout : OUT  std_logic_vector(1 downto 0);
         wrenmen : OUT  std_logic;
         pcsource : OUT  std_logic_vector(1 downto 0);
         aluop : OUT  std_logic_vector(5 downto 0);
         a18 : OUT  std_logic_vector(31 downto 0);
         crs1out : OUT  std_logic_vector(31 downto 0);
         op2out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal posicionin : std_logic_vector(31 downto 0) := (others => '0');
   signal Regtomemin : std_logic_vector(31 downto 0) := (others => '0');
   signal cwpin : std_logic := '0';
   signal iccin : std_logic_vector(3 downto 0) := (others => '0');
   signal Resetext : std_logic := '0';

 	--Outputs
   signal ncwpout : std_logic;
   signal callout : std_logic_vector(31 downto 0);
   signal ifout : std_logic_vector(31 downto 0);
   signal rfdestout : std_logic;
   signal rfsourceout : std_logic_vector(1 downto 0);
   signal wrenmen : std_logic;
   signal pcsource : std_logic_vector(1 downto 0);
   signal aluop : std_logic_vector(5 downto 0);
   signal a18 : std_logic_vector(31 downto 0);
   signal crs1out : std_logic_vector(31 downto 0);
   signal op2out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decode PORT MAP (
          Instruction => Instruction,
          posicionin => posicionin,
          Regtomemin => Regtomemin,
          cwpin => cwpin,
          iccin => iccin,
          Resetext => Resetext,
          ncwpout => ncwpout,
          callout => callout,
          ifout => ifout,
          rfdestout => rfdestout,
          rfsourceout => rfsourceout,
          wrenmen => wrenmen,
          pcsource => pcsource,
          aluop => aluop,
          a18 => a18,
          crs1out => crs1out,
          op2out => op2out
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	
		Instruction <= "10100100000100000010000000000101";
		posicionin <= "00000000000000000000000000000001";
		Regtomemin <= "00000000000000000000000000111111";
		cwpin <= '0';
		iccin <= "0000";
		Resetext <= '1';

      wait for 100 ns;	
		Instruction <= "10100100000100000010000000000101";
		posicionin <= "00000000000000000000000000000001";
		Regtomemin <= "00000000000000000000000000111111";
		cwpin <= '0';
		iccin <= "0000";
		Resetext <= '0';

		wait for 100 ns;	
		Instruction <= "10100100000100000010000000001111";
		posicionin <= "00000000000000000000000000000010";
		Regtomemin <= "00000000000000000000000000001111";
		cwpin <= '0';
		iccin <= "0000";
		Resetext <= '0';

      -- insert stimulus here  
		
      wait;
   end process;

END;
