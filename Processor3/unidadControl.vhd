library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in STD_LOGIC_VECTOR (3 downto 0);
			  cond : in STD_LOGIC_VECTOR (3 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  WR_dm : out STD_LOGIC;
			  WE_rf : out STD_LOGIC;
			  rf_s: out STD_LOGIC
			);
end unidadControl;

architecture Behavioral of unidadControl is

signal salida_aluop : std_logic_vector (5 downto 0) := "000000";

begin
	process(op, op3, nzvc)
	begin
		if(op = "10")then
			case op3 is
				when "000000" => ------> Add
					salida_aluop <= "000000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000100" => ------> Sub
					salida_aluop <= "000001";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000001" => ------> And
					salida_aluop <= "000010";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000010" => ------> Or
					salida_aluop <= "000011";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000101" => ------> Andn
					salida_aluop <= "000100";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000110" => ------> Orn
					salida_aluop <= "000101";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000011" => ------> Xor
					salida_aluop <= "000110";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "000111" => ------> Xnor
					salida_aluop <= "000111";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010000" => ------> Addcc
					salida_aluop <= "001000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "001000" => ------> AddX
					salida_aluop <= "001001";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "011000" => ------> AddXcc
					salida_aluop <= "001010";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010100" => ------> Subcc
					salida_aluop <= "001011";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "001100" => ------> SubX
					salida_aluop <= "001100";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "011100" => ------> SubXcc
					salida_aluop <= "001101";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010001" => ------> Andcc
					salida_aluop <= "001110";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010101" => ------> Andncc
					salida_aluop <= "001111";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010010" => ------> Orcc
					salida_aluop <= "010000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010110" => ------> Orncc
					salida_aluop <= "010001";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010011" => ------> Xorcc
					salida_aluop <= "010010";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "010111" => ------> Xnorcc
					salida_aluop <= "010011";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "111100" => ------> Save
					salida_aluop <= "000000"; -- Modifica CWP
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when "111101" => ------> Restore
					salida_aluop <= "000000"; -- Modifica CWP
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= '1';
				when others =>
					salida_aluop <= "111111";
					WR_dm <= '0';
					WE_rf <= '0';
					rf_s <= '1';
			end case;
			else if(op = "11")then
				case op3 is
					when "000000" => ------> Load
						salida_aluop <= "000000";
						WR_dm <= '0';
						WE_rf <= '1';
						rf_s <= '1';----?????selector del mux 4 a 1
					when "000100" => ------> Store word
						salida_aluop <= "000000";
						WR_dm <= '0';
						WE_rf <= '1';
						rf_s <= '1';----?????selector del mux 4 a 1
					when others =>
						salida_aluop <= "111111";
						WR_dm <= '0';
						WE_rf <= '0';
						rf_s <= '1';
					end case;			
				end if;
			
			end if;
			
	end process;
			
aluop <= salida_aluop;
				
end Behavioral;