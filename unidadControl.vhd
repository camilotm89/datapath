library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           out_uc : out  STD_LOGIC_VECTOR (5 downto 0));
end unidadControl;

architecture Behavioral of unidadControl is

begin
	process(op, op3)
	begin
		if(op = "10")then
			


end Behavioral;





--add 10 000000
--sub 10 000100
--and 10 000001
--or 10 000010
--andn 10 000101
--orn 10 000110
--xor 10 000011
--xnor 10 000111