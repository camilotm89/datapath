library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
	   c : in  STD_LOGIC_VECTOR (31 downto 0);
           d : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           out_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end mux;

architecture Behavioral of mux is

begin
	process(a,b,sel)
	begin
		if (sel = "00")then
			out_mux <= a;
			else if (sel= "01")then
				out_mux <= b;
				else if (sel= "10")then
					out_mux <= c;
					else if (sel= "01")then
						out_mux <= d;							
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
