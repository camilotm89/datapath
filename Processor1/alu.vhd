library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           mux_out : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
			  c : in STD_LOGIC;
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(crs1, mux_out, alu_op)
	begin
		case (alu_op) is
			when "000000" => ------> Add
				alu_out <= crs1 + mux_out;
				
			when "000001" => ------> Sub
				alu_out <= crs1 - mux_out;
				
			when "000010" => ------> And
				alu_out <= crs1 and mux_out;
				
			when "000011" => ------> Or
				alu_out <= crs1 or mux_out;
			
			when "000100" => ------> Nand
				alu_out <= crs1 nand mux_out;
				
			when "000101" => ------> Nor
				alu_out <= crs1 nor mux_out;
				
			when "000110" => ------> Xor
				alu_out <= crs1 xor mux_out;
				
			when "000111" => ------> Xnor
				alu_out <= crs1 xnor mux_out;
			
			when "001000" => ------> Addcc
				alu_out <= crs1 + mux_out;
			
			when "001001" => ------> AddX
				alu_out <= crs1 + mux_out + c;
			
			when "001010" => ------> AddXcc
				alu_out <= crs1 + mux_out + c;
				
			when "001011" => ------> Subcc
				alu_out <= crs1 - mux_out;
			
			when "001100" => ------> SubX
				alu_out <= crs1 - mux_out + c;
			
			when "001101" => ------> SubXcc
				alu_out <= crs1 - mux_out + c;
			
			when "001110" => ------> Andcc
				alu_out <= crs1 and mux_out;
			
			when "001111" => ------> andncc
				alu_out <= crs1 nand mux_out;
			
			when "010000" => ------> Orcc
				alu_out <= crs1 or mux_out;
				
			when "010001" => ------> Orncc
				alu_out <= crs1 nor mux_out;
			
			when "010010" => ------> Xorcc
				alu_out <= crs1 xor mux_out;
				
			when "010011" => ------> Xnorcc
				alu_out <= crs1 xnor mux_out;
			
			when others => 
				alu_out <= "11111111111111111111111111111111";
				
		end case;
		
	end process;
		
end Behavioral;