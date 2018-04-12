-------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           mux_out : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(crs1, mux_out, alu_op)
	begin
		case (alu_op) is
			when "000000" =>
				alu_out <= crs1 + mux_out;
				
			when "000001" =>
				alu_out <= crs1 - mux_out;
				
			when "000010" =>
				alu_out <= crs1 and mux_out;
				
			when "000011" =>
				alu_out <= crs1 or mux_out;
			
			when "000100" =>
				alu_out <= crs1 nand mux_out;
				
			when "000101" =>
				alu_out <= crs1 nor mux_out;
				
			when "000110" =>
				alu_out <= crs1 xor mux_out;
				
			when "000111" =>
				alu_out <= crs1 xnor mux_out;
			
			when others => 
				alu_out <= "11111111111111111111111111111111";
				
		end case;
		
	end process;
		
end Behavioral;