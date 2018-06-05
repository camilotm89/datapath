library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UnidadControl is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  Op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  icc: in STD_LOGIC_VECTOR (3 downto 0);
			  cond: in STD_LOGIC_VECTOR (3 downto 0);		  
			  rfDest : out  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC;	
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
			  
end UnidadControl;

architecture Behavioral of UnidadControl is

begin
process(Op, Op2, Op3, icc, cond,Reset)
	begin	
	wrEnMem <= '0';
	rfDest <= '0';
	
	if(Reset = '1')then 
		rfDest <= '0';
		rfSource <= "00";
		wrEnRF <= '0';
		pcSource <= "10";
		AluOp <= "111111";
	
	elsif(op = "01")then --CALL
		rfDest <= '1';
		rfSource <= "10";
		wrEnRF <= '1';
		pcSource <= "00";
		AluOp <= "111111";
	else
		if(Op = "00")then
			if(Op2 = "010")then
				case cond is
					when "1000" => --ba
						rfSource <= "01";
						wrEnRF <= '0';
						pcSource <="01";
						AluOp <= "111111";
					when "1001" => --bne
						if(not(icc(2)) = '1')then --sacado de manual
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="01";
							AluOp <= "111111";
						else
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <= "111111";
						end if;
					when "0001" => --be
						if(icc(2) = '1')then --sacado de manual
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="01";
							AluOp <= "111111";
						else
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <= "111111";
						end if;
					when "1010" => --bg
						if((not(icc(2) or (icc(3) xor icc(1)))) = '1')then --sacado de manual
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="01";
							AluOp <= "111111";
						else
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <= "111111";
						end if;
					when "0010" => --ble
						if((icc(2) or (icc(3) xor icc(1))) = '1')then  --sacado de manual
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <="111111";
						else
							rfSource <="01";
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <= "111111";
						end if;
					when "1011" => --bge
						if((not(icc(3) xor icc(1))) = '1')then --sacado de manual
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="01";
							AluOp <= "111111";
						else
							rfSource <= "01";
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <= "111111";
						end if;
					when "0011" => --bl
						if((icc(3) xor icc(1)) = '1')then --sacado de manual
							rfSource <="01";
							wrEnRF <= '0';
							pcSource <="01";
							AluOp <= "111111";
						else
							rfSource <="01" ;
							wrEnRF <= '0';
							pcSource <="10";
							AluOp <= "111111";
						end if;
					when others =>
						rfSource <= "01";
						wrEnRF <= '0';
						pcSource <="10";
						AluOp <= "111111";
				end case;
			else
				if(Op2 = "100")then -- NOP
					rfSource <= "01";
					wrEnRF <= '1';--oleacaloquesabe
					pcSource <="10";
					AluOp <= "111111";
				end if;
			end if;
			
		else
			if(Op = "10")then
				case Op3 is
					when "000000" => --Add
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000000";
					when "010000" => --Addcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010000";
					when "001000" => --Addx
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "001000";
					when "011000" => --Addxcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "011000";			
					when "000100" => --Sub
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000100";
					when "010100" => --Subcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010100";
					when "001100" => --Subx
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "001100";
					when "011100" => --Subxcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "011100";
						
					when "000001" => --And
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000001";				
					when "010001" => --Andcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010001";		
						
					when "000101" => --AndN
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000101";
					when "010101" => --AndNcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010101";				
					when "000010" => --Or
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000010";
						rfDest <= '0';
					when "010010" => --Orcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010010";
					
					when "000110" => --OrN
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000110";
					when "010110" => --OrNcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010110";							
					when "000011" => --Xor
						rfSource <= "01";
						wrEnRF <='1' ;
						pcSource <="10";
						AluOp <= "000011";
					when "010011" => --Xorcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010011";
					when "111000" => -- JMPL
						rfSource <= "10";
						wrEnRF <= '1';
						pcSource <="11";
						AluOp <= "000000";
						
						
					when "000111" => --XorN
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000111";
					when "010111" => --XnorNcc
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "010111";
						
					when "111100" => -- SAVE
						rfSource <= "01";
						wrEnRF <= '1';
						pcSource <="10";
						AluOp <= "000000";
							
					when "111101" => -- RESTORE
						rfSource <= "01";
						wrEnRF <='1';
						pcSource <="10";
						AluOp <= "000000";
						
						
					when others =>
						rfSource <= "01";
						wrEnRF <= '0';
						pcSource <="10";
						AluOp <= "111111";						
				end case;
				else
				
					if(op = "11")then
							case op3 is
								when "000100" => -- STORE
									rfSource <= "01"; -- leer
									wrEnMem <= '1';
									wrEnRF <= '0';
									pcSource <="10";
									AluOp <= "000000";
											
								when "000000" => -- LOAD
									rfSource <= "00"; --guardar
									wrEnRF <= '1';
									pcSource <="10";
									AluOp <= "000000";
									
								when others =>
									rfSource <= "01";
									wrEnRF <= '0';
									pcSource <="10";
									AluOp <= "111111";	
							end case;
						end if;			
			end if;
		end if;
	end if;	

end process;
end Behavioral;
