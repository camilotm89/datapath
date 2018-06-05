
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( OPER1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  c: in  STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0));
end ALU;

architecture ARQALU of ALU is

begin
	process(OPER1,OPER2,ALUOP)
	begin
	case (ALUOP) is
                  when "000000" => -- add 
								ALURESULT <= OPER1 + OPER2;
                  when "000001" =>--AND
								ALURESULT <= OPER1 and OPER2;
						when "000010" =>--OR
								ALURESULT <= OPER1 or OPER2;
						when "000011" =>--xor
								ALURESULT <= OPER1 xor OPER2;
						when "000111" =>--xnor
								ALURESULT <= OPER1 xnor OPER2;
						when  "000100"=>--Sub
								ALURESULT <= OPER1 - OPER2;
						when "000101"=>--and not
								ALURESULT<=OPER1 and not OPER2;
						when "000110"=>--nor
								ALURESULT<= OPER1 or not OPER2;
								
						when "010000"=>--addcc
								ALURESULT <= OPER1 + OPER2;
						when "010100"=>--subcc
								ALURESULT <= OPER1 - OPER2;
						when "010001" =>--andcc
								ALURESULT<= OPER1 and OPER2;
						when "010101" =>--andncc
								ALURESULT<= OPER1 and not OPER2;
						when "010010" => --orcc
								ALURESULT <= OPER1 or OPER2;
						when "010110" =>--orncc
								ALURESULT <= OPER1 or not OPER2;
						when "001000"=>--addx
								ALURESULT <= OPER1 + OPER2 + c;
						when "011000" =>--addxcc
								ALURESULT <= OPER1 + OPER2 + c;
						when "001100" => --subx
								ALURESULT <= OPER1- OPER2 - c;
						when "011100" => --subxcc
								ALURESULT <= OPER1 - OPER2 - c;
								
						when "010011" => --xorcc
								ALURESULT <=  OPER1 xor OPER2;
							when "010111" => --xnorcc
								ALURESULT <=  OPER1 xor OPER2;		
						when "100101" => --sll
								ALURESULT <= to_stdlogicvector(to_bitvector(OPER1) sll conv_integer(OPER2));
						
						when "100110" => --srl
								ALURESULT <= to_stdlogicvector(to_bitvector(OPER1) srl conv_integer(OPER2));		
						
						when "111100" => --save
								ALURESULT <= OPER1 + OPER2;
						
						when "111101" => --restore
								ALURESULT <= OPER1 + OPER2;
						when "011011" => -- jmpl
							ALURESULT <=OPER1 + OPER2;
							
						when "111110" => --st y --ld
							ALURESULT <= OPER1 + OPER2;
						when others => --nops
				          ALURESULT<= x"00000000";
	
				end case;	
	  end process; 
end ARQALU;

