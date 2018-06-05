LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tbmux2 IS
END tbmux2;
 
ARCHITECTURE behavior OF tbmux2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux2
    PORT(
         Entrada : IN  std_logic_vector(31 downto 0);
         sumador : IN  std_logic_vector(31 downto 0);
         Cuentrada : IN  std_logic;
         posicion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada : std_logic_vector(31 downto 0) := (others => '0');
   signal sumador : std_logic_vector(31 downto 0) := (others => '0');
   signal Cuentrada : std_logic := '0';

 	--Outputs
   signal posicion : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux2 PORT MAP (
          Entrada => Entrada,
          sumador => sumador,
          Cuentrada => Cuentrada,
          posicion => posicion
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 100 ns;
		Entrada <= "00000000000000000000000000000001";
      sumador <= "00000000000000000000000000000000";
      Cuentrada <= '0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Entrada <= "00000000000000000000000000000001";
      sumador <= "00000000000000000000000000000000";
      Cuentrada <= '1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
