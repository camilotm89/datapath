LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_PSR_Modifier IS
END TB_PSR_Modifier;
 
ARCHITECTURE behavior OF TB_PSR_Modifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Modifier
    PORT(
         aluop : IN  std_logic_vector(5 downto 0);
         out_ppal : IN  std_logic_vector(31 downto 0);
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal out_ppal : std_logic_vector(31 downto 0) := (others => '0');
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Modifier PORT MAP (
          aluop => aluop,
          out_ppal => out_ppal,
          crs1 => crs1,
          crs2 => crs2,
          nzvc => nzvc
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      aluop<="010000";
		out_ppal<="00000000000000000000000000000000";
		crs1    <="10000000000000000001111111111111";
		crs2    <="10000000000000000000011111111111";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
