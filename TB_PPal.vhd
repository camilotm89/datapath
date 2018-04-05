LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_ppal IS
END TB_ppal;
 
ARCHITECTURE behavior OF TB_ppal IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ppal
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         out_ppal : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal out_ppal : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ppal PORT MAP (
          rst => rst,
          clk => clk,
          out_ppal => out_ppal
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <='1';
      wait for 100 ns;	

		rst <='0';
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
