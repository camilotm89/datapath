library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Windows_Manager is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nCWP : in  STD_LOGIC_VECTOR (4 downto 0);
           CWP : out  STD_LOGIC_VECTOR (4 downto 0));
           
end Windows_Manager;

architecture Behavioral of Windows_Manager is

begin


end Behavioral;

