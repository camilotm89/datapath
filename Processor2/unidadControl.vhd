library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end unidadControl;

architecture Behavioral of unidadControl is

signal salida_aluop : std_logic_vector (5 downto 0) := "000000";

begin
	process(op, op3)
	begin
			if (op = "10")then
			
			case op3 is
				when "000000" => ------> Add
					salida_aluop <= "000000";
				when "000100" => ------> Sub
					salida_aluop  <= "000001";
				when "000001" => ------> And
					salida_aluop <= "000010";
				when "000010" => ------> Or
					salida_aluop <= "000011";
				when "000101" => ------> Andn
					salida_aluop <= "000100";
				when "000110" => ------> Orn
					salida_aluop <= "000101";
				when "000011" => ------> Xor
					salida_aluop <= "000110";
				when "000111" => ------> Xnor
					salida_aluop <= "000111";
				when "010000" => ------> Addcc
					salida_aluop <= "001000";
				when "001000" => ------> AddX
					salida_aluop <= "001001";
				when "011000" => ------> AddXcc
					salida_aluop <= "001010";
				when "010100" => ------> Subcc
					salida_aluop <= "001011";
				when "001100" => ------> SubX
					salida_aluop <= "001100";
				when "011100" => ------> SubXcc
					salida_aluop <= "001101";
				when "010001" => ------> Andcc
					salida_aluop <= "001110";
				when "010101" => ------> Andncc
					salida_aluop <= "001111";
				when "010010" => ------> Orcc
					salida_aluop <= "010000";
				when "010110" => ------> Orncc
					salida_aluop <= "010001";
				when "010011" => ------> Xorcc
					salida_aluop <= "010010";
				when "010111" => ------> Xnorcc
					salida_aluop <= "010011";
				when "111100" => ------> Save
					salida_aluop <= "000000"; -- Modifica CWP
				when "111101" => ------> Restore
					salida_aluop <= "000000"; -- Modifica CWP
				when others =>
					salida_aluop <= "111111";
			end case;
		end if;
			
	end process;
	
aluop <= salida_aluop;
end Behavioral;
