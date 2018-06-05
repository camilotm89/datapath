LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY unionntb IS
END unionntb;
 
ARCHITECTURE behavior OF unionntb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Union
    PORT(
         Clk : IN  std_logic;
         reset : IN  std_logic;
         Salidaunion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Salidaunion : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Union PORT MAP (
          Clk => Clk,
          reset => reset,
          Salidaunion => Salidaunion
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
		wait for 15 ns;
		reset <= '0';
		wait for 15 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
