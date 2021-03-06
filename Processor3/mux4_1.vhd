library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
			  c : in  STD_LOGIC_VECTOR (31 downto 0);
           d : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           out_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end mux4_1;

architecture Behavioral of mux4_1 is

begin
	process(a,b,c,d,sel)
	begin
		if (sel = "00")then
			out_mux <= d;
			else if (sel= "01")then
				out_mux <= a;
				else if (sel= "10")then
					out_mux <= b;
					else if (sel= "11")then
						out_mux <= c;							
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
