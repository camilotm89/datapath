LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_seu IS
END tb_seu;
 
ARCHITECTURE behavior OF tb_seu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seu
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         out_seu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal out_seu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seu PORT MAP (
          imm13 => imm13,
          out_seu => out_seu
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      imm13<="0000000001111";
      wait for 100 ns;	

		imm13<="1000000001111";
      wait for 100 ns;
		
      wait;
   end process;

END;
