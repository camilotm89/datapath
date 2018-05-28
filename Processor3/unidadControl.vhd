library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
			  op2 : in STD_LOGIC_VECTOR (2 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in STD_LOGIC_VECTOR (3 downto 0);
			  cond : in STD_LOGIC_VECTOR (3 downto 0);
			  pc_src: out  STD_LOGIC_VECTOR (1 downto 0); 
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  WR_dm : out STD_LOGIC;
			  WE_rf : out STD_LOGIC;
			  rf_s: out STD_LOGIC_VECTOR (1 downto 0);
			  rf_d: out STD_LOGIC
			);
end unidadControl;

architecture Behavioral of unidadControl is

signal salida_aluop : std_logic_vector (5 downto 0) := "000000";

begin
	process(op, op2, op3, cond, nzvc)
	begin
		if (op = "01") then -- CALL
			salida_aluop <= "111111";
			pc_src <= "01";  --pc + disp30
			WR_dm <= '0';
			WE_rf <= '1';
			rf_s <= "10";
			rf_d <= '1';
			else
		if(op = "00") then
			if(op2 ="010") then
					case cond is
						
						when "1000" => --BA
							salida_aluop <= "111111";
							pc_src <= "10";  --pc + disp22
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "1001" => --BNE
							salida_aluop <= "111111";
							if(not(nzvc(2) = '1')) then  --not z
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
						
						when "0001" => --BE
							salida_aluop <= "111111";
							if(nzvc(2) = '1') then  --z
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
						
						when "1010" => --BG
							salida_aluop <= "111111";
							if((not(nzvc(2) or (nzvc(3) xor nzvc(1)))) = '1') then  --not(Z or (N xor V))
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
						
						when "0010" => --BLE
							salida_aluop <= "111111";
							if((nzvc(2) or (nzvc(3) xor nzvc(1))) = '1') then  --Z or (N xor V)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "1011" => --BGE
							salida_aluop <= "111111";
							if((not(nzvc(3) xor nzvc(1))) = '1') then  --not (N xor V)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "0011" => --BL
							salida_aluop <= "111111";
							if((nzvc(3) xor nzvc(1)) = '1') then  --(N xor V)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "1100" => --BGU
							salida_aluop <= "111111";
							if((not(nzvc(0) or nzvc(2))) = '1') then  -- not(C or Z)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "0100" => --BLEU
							salida_aluop <= "111111";
							if((nzvc(0) or nzvc(2)) = '1') then  -- (C or Z)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "1101" => --BCC
							salida_aluop <= "111111";
							if(not(nzvc(0)) = '1') then  --(not c)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "0101" => --BCS
							salida_aluop <= "111111";
							if(nzvc(0) = '1') then  --c
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "1110" => --BPOS
							salida_aluop <= "111111";
							if(not(nzvc(3)) = '1') then  --(not n)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "0110" => --BNEG
							salida_aluop <= "111111";
							if(nzvc(3) = '1') then  --n
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "1111" => --BVC
							salida_aluop <= "111111";
							if(not(nzvc(1)) = '1') then  --(not v)
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
							
						when "0111" => --BVS
							salida_aluop <= "111111";
							if(nzvc(1) = '1') then  --v
								pc_src <= "10";  --pc + disp22
							else
								pc_src <= "11";  --pc
							end if;
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
						
						when others =>
							salida_aluop <= "111111";
							pc_src <= "00";  --pc
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "00";
							rf_d <= '0';
							
					
					end case;
			else 
					if(op2 = "100")then -- NOP
						salida_aluop <= "111111";
							pc_src <= "11";  --pc
							WR_dm <= '0';
							WE_rf <= '0';
							rf_s <= "01";
							rf_d <= '0';
							
					end if;
					
				end if;
				
		else if(op = "10") then
			case op3 is
				when "000000" => ------> Add
					salida_aluop <= "000000";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000100" => ------> Sub
					salida_aluop <= "000001";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000001" => ------> And
					salida_aluop <= "000010";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000010" => ------> Or
					salida_aluop <= "000011";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000101" => ------> Andn
					salida_aluop <= "000100";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000110" => ------> Orn
					salida_aluop <= "000101";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000011" => ------> Xor
					salida_aluop <= "000110";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "000111" => ------> Xnor
					salida_aluop <= "000111";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010000" => ------> Addcc
					salida_aluop <= "001000";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "001000" => ------> AddX
					salida_aluop <= "001001";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "011000" => ------> AddXcc
					salida_aluop <= "001010";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010100" => ------> Subcc
					salida_aluop <= "001011";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "001100" => ------> SubX
					salida_aluop <= "001100";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "011100" => ------> SubXcc
					salida_aluop <= "001101";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010001" => ------> Andcc
					salida_aluop <= "001110";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010101" => ------> Andncc
					salida_aluop <= "001111";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010010" => ------> Orcc
					salida_aluop <= "010000";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010110" => ------> Orncc
					salida_aluop <= "010001";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010011" => ------> Xorcc
					salida_aluop <= "010010";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "010111" => ------> Xnorcc
					salida_aluop <= "010011";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
				
				when "100101" =>
					salida_aluop <= "010100";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "100110" =>
					salida_aluop <= "010101";
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "111100" => ------> Save
					salida_aluop <= "000000"; -- Modifica CWP
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "111101" => ------> Restore
					salida_aluop <= "000000"; -- Modifica CWP
					pc_src <= "11";
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";
					rf_d <= '0';
					
				when "111000" => ------> JMPL
					salida_aluop <= "000000";
					pc_src <= "00"; --pc
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "10";
					rf_d <= '0';
					
				when others =>
					salida_aluop <= "111111";
					pc_src <= "11"; --pc
					WR_dm <= '0';
					WE_rf <= '0';
					rf_s <= "01";
					rf_d <= '0';
					
					
			end case;
		else if(op = "11")then
			case op3 is
				when "000000" => ------> Load
					salida_aluop <= "000000";
					pc_src <= "11"; --pc
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "00";----?????selector del mux 4 a 1
					rf_d <= '0';
					
					
				when "000100" => ------> Store word
					salida_aluop <= "000000";
					pc_src <= "11"; --pc
					WR_dm <= '0';
					WE_rf <= '1';
					rf_s <= "01";----?????selector del mux 4 a 1
					rf_d <= '0';
					
					
				when others =>
					salida_aluop <= "111111";
					pc_src <= "11"; --pc
					WR_dm <= '0';
					WE_rf <= '0';
					rf_s <= "01";
					rf_d <= '0';
					
					
			end case;			
		end if;
		end if;
		end if;
		end if;
			
	end process;
			
aluop <= salida_aluop;
				
end Behavioral;