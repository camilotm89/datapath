library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in STD_LOGIC_VECTOR (3 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end unidadControl;

architecture Behavioral of unidadControl is

begin
	process(op, op3)
	begin
		if(op = "10")then
			case op3 is
				when "000000" => ------> Add
				aluop <= "000000";
				when "000100" => ------> Sub
				aluop <= "000001";
				when "000001" => ------> And
				aluop <= "000010";
				when "000010" => ------> Or
				aluop <= "000011";
				when "000101" => ------> Andn
				aluop <= "000100";
				when "000110" => ------> Orn
				aluop <= "000101";
				when "000011" => ------> Xor
				aluop <= "000110";
				when "000111" => ------> Xnor
				aluop <= "000111";
				when "010000" => ------> Addcc
				aluop <= "001000";
				--when "001000" => ------> AddX
				--aluop <= "001001";
				when "011000" => ------> AddXcc
				aluop <= "001010";
				when "010100" => ------> Subcc
				aluop <= "001011";
				--when "001100" => ------> SubX
				--aluop <= "001100";
				when "011100" => ------> SubXcc
				aluop <= "001101";
				when "010001" => ------> Andcc
				aluop <= "001110";
				when "010101" => ------> Andncc
				aluop <= "001111";
				when "010010" => ------> Orcc
				aluop "010000";
				when "010110" => ------> Orncc
				aluop "010001";
				when "010011" => ------> Xorcc
				aluop "010010";
				when "010111" => ------> Xnorcc
				aluop "010011";
				when "111100" => ------> Save
				aluop <= "000000"; -- Modifica CWP
				when "111101" => ------> Restore
				aluop <= "000000"; -- Modifica CWP
				when others =>
				aluop <= "111111";
			end case;
		end if;

	end process;
end Behavioral;
