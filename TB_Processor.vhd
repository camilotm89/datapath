LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_Processor IS
END TB_Processor;
 
ARCHITECTURE behavior OF TB_Processor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ppal
    PORT(
         reset : IN  std_logic;
         clock : IN  std_logic;
         out_ppal : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal out_ppal : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ppal PORT MAP (
          reset => reset,
          clock => clock,
          out_ppal => out_ppal
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;
		reset <= '1';
		wait for 10 ns;
		reset <= '0';

      --wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
