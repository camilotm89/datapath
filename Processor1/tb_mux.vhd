LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_mux IS
END tb_mux;
 
ARCHITECTURE behavior OF tb_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic;
         out_mux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal out_mux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          a => a,
          b => b,
          sel => sel,
          out_mux => out_mux
        );


   -- Stimulus process
   stim_proc: process
   begin		
		a <= x"00000011";
		b <= x"00000010";
		sel <= '0';
      wait for 20 ns;
		
		sel <= '1';
      wait for 20 ns;

      wait;
   end process;

END;
