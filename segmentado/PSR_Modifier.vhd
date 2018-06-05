library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity PSR_Modifier is
    Port ( oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           conditionalCodes : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

begin
process(aluop,oper1,oper2,aluResult) 
	begin
	if (aluop="010001" or aluop="010101" or aluop="010010" or aluop="010110" or aluop="010011" or aluop="010111") then -- ANDcc,ANDNcc,ORcc,ORNcc,XORcc,XNORcc
		conditionalCodes(3)<= aluResult(31); --N
		if aluResult="00000000000000000000000000000000" then --Z
			conditionalCodes(2)<='1';
		else
			conditionalCodes(2)<='0';
		end if;
		conditionalCodes(1)<= '0'; --V
		conditionalCodes(0)<= '0'; --C
	elsif (aluop="010000" or aluop="011000") then --ADDcc, ADDXcc
		conditionalCodes(3)<= aluResult(31); --N
		if aluResult="00000000000000000000000000000000" then --Z
			conditionalCodes(2)<='1';
		else
			conditionalCodes(2)<='0';
		end if;
		conditionalCodes(1)<=(oper1(31) and oper2(31) and (not aluResult(31))) or ((not oper1(31)) and (not oper2(31)) and aluResult(31));
		conditionalCodes(0)<=(oper1(31) and oper2(31)) or ((not aluResult(31)) and (oper1(31) or oper2(31)));
	elsif (aluop="010100" or aluop="011100") then --SUBcc, SUBXcc
		conditionalCodes(3)<= aluResult(31); --N
		if aluResult="00000000000000000000000000000000" then --Z
			conditionalCodes(2)<='1';
		else
			conditionalCodes(2)<='0';
		end if;
		conditionalCodes(1)<=(oper1(31) and (not oper2(31)) and (not aluResult(31))) or ((not oper1(31)) and oper2(31) and aluResult(31));
		conditionalCodes(0)<=((not oper1(31)) and oper2(31)) or (aluResult(31) and ((not oper1(31)) or oper2(31)));
		
	end if;
end process;
end Behavioral;