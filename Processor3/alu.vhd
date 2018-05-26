library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           mux_out : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
			  c : in STD_LOGIC;
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

signal alu_r : std_logic_vector (31 downto 0):=(others=>'0');

begin
	process(crs1, mux_out, alu_op)
	begin
		case (alu_op) is
			when "000000" => ------> Add
				alu_r <= crs1 + mux_out;
				
			when "000001" => ------> Sub
				alu_r <= crs1 - mux_out;
				
			when "000010" => ------> And
				alu_r <= crs1 and mux_out;
				
			when "000011" => ------> Or
				alu_r <= crs1 or mux_out;
			
			when "000100" => ------> Nand
				alu_r <= crs1 and not mux_out;
				
			when "000101" => ------> Nor
				alu_r <= crs1 or not mux_out;
				
			when "000110" => ------> Xor
				alu_r <= crs1 xor mux_out;
				
			when "000111" => ------> Xnor
				alu_r <= crs1 xor not mux_out;
			
			when "001000" => ------> Addcc
				alu_r <= crs1 + mux_out;
			
			when "001001" => ------> AddX
				alu_r <= crs1 + mux_out + c;
			
			when "001010" => ------> AddXcc
				alu_r <= crs1 + mux_out + c;
				
			when "001011" => ------> Subcc
				alu_r <= crs1 - mux_out;
			
			when "001100" => ------> SubX
				alu_r <= crs1 - mux_out + c;
			
			when "001101" => ------> SubXcc
				alu_r <= crs1 - mux_out + c;
			
			when "001110" => ------> Andcc
				alu_r <= crs1 and mux_out;
			
			when "001111" => ------> andncc
				alu_r <= crs1 and not mux_out;
			
			when "010000" => ------> Orcc
				alu_r <= crs1 or mux_out;
				
			when "010001" => ------> Orncc
				alu_r <= crs1 or not mux_out;
			
			when "010010" => ------> Xorcc
				alu_r <= crs1 xor mux_out;
				
			when "010011" => ------> Xnorcc
				alu_r <= crs1 xor not mux_out;
			
			when others => --nop
				alu_r <= (others=>'0');
				
		end case;
		
	end process;
	
alu_out <= alu_r;
		
end Behavioral;