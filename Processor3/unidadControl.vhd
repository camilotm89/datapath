library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in STD_LOGIC_VECTOR (3 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  WR_dm : out STD_LOGIC;
			  WE_rf : out STD_LOGIC;
			  rf_s: out STD_LOGIC
			 );
end unidadControl;

architecture Behavioral of unidadControl is

begin
	process(op, op3, nzvc)
	begin
		if(op = "10")then
			case op3 is
				when "000000" => ------> Add
					aluop <= "000000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000100" => ------> Sub
					aluop <= "000001";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000001" => ------> And
					aluop <= "000010";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000010" => ------> Or
					aluop <= "000011";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000101" => ------> Andn
					aluop <= "000100";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000110" => ------> Orn
					aluop <= "000101";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000011" => ------> Xor
					aluop <= "000110";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000111" => ------> Xnor
					aluop <= "000111";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010000" => ------> Addcc
					aluop <= "001000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "001000" => ------> AddX
					aluop <= "001001";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "011000" => ------> AddXcc
					aluop <= "001010";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010100" => ------> Subcc
					aluop <= "001011";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "001100" => ------> SubX
					aluop <= "001100";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "011100" => ------> SubXcc
					aluop <= "001101";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010001" => ------> Andcc
					aluop <= "001110";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010101" => ------> Andncc
					aluop <= "001111";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010010" => ------> Orcc
					aluop <= "010000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010110" => ------> Orncc
					aluop <= "010001";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010011" => ------> Xorcc
					aluop <= "010010";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010111" => ------> Xnorcc
					aluop <= "010011";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "111100" => ------> Save
					aluop <= "000000"; -- Modifica CWP
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "111101" => ------> Restore
					aluop <= "000000"; -- Modifica CWP
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when others =>
					aluop <= "111111";
					WR_dm <= '0';
					WE_rf <= '0';
					rf_s <= '1';
			end case;
		end if;
			
	end process;
end Behavioral;
