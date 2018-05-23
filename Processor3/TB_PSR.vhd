LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_PSR IS
END TB_PSR;
 
ARCHITECTURE behavior OF TB_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         nCWP : IN  std_logic_vector(1 downto 0);
         CWP : OUT  std_logic_vector(1 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal nCWP : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal CWP : std_logic_vector(1 downto 0);
   signal c : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clock => clock,
          reset => reset,
          nzvc => nzvc,
          nCWP => nCWP,
          CWP => CWP,
          c => c
        );

   -- Clock process definitions
   clk_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      wait for 30 ns;		
		reset <= '0';
		nzvc <= "0000";
		nCWP <= "01";
      wait for 30 ns;
		nzvc <= "1111";
		nCWP <= "00";
      wait ;
   end process;

END;